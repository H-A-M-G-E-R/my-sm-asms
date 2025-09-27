import collections, contextlib

apply = lambda t, f: f(*t)

snes2hex = lambda address: address >> 1 & 0x3F8000 | address & 0x7FFF
hex2snes = lambda address: address << 1 & 0xFF0000 | address & 0xFFFF | 0x808000

# Format a non-address value
formatValue = lambda v: f'{v:X}' + ('h' if v >= 0xA or v <= -0xA else '')

# Format a 24-bit address as $pp:pppp
formatAddress = lambda address: f'${address >> 0x10:02X}:{address & 0xFFFF:04X}'

def romRead(n = 1):
    return int.from_bytes(rom.read(n), 'little')

def romPeek(n = 1):
    # Don't use `rom.seek(n)`, that's a useless function that ignores the size parameter
    with romSeek(rom.tell()):
        return romRead(n)

@contextlib.contextmanager
def romSeek(to):
    old = rom.tell()
    rom.seek(to)
    yield
    rom.seek(old)

def analyze_nspc(p_nspc):
    rom.seek(snes2hex(p_nspc))
    while True:
        block_addr = rom.tell()
        size = romRead(2)
        addr = romRead(2)
        if size == 0:
            print(f'    End address: ${hex2snes(block_addr):06X} (snes), ${block_addr:06X} (hex)\n')
            break
        romRead(size)
        print(f'    ROM address: ${hex2snes(block_addr):06X}-{hex2snes(block_addr+size):06X} (snes), ${block_addr:06X}..{block_addr+size:06X} (hex)')
        print(f'    SPC address: ${addr:04X}..{addr+size:04X}')
        print(f'    Size: ${size:04X}')
        if addr >= 0x6D00 and addr < 0x6E00:
            print(f'    Samples ${(addr-0x6D00)//4:02X}..{(addr+size-0x6D00)//4-1:02X}')
        if addr >= 0x6C00 and addr < 0x6D00:
            print(f'    Instruments ${(addr-0x6C00)//6:02X}..{(addr+size-0x6C00)//6-1:02X}')
        print()

    print(f'    Overall address: ${p_nspc:06X}-{hex2snes(rom.tell()):06X} (snes), ${snes2hex(p_nspc):06X}..{rom.tell():06X} (hex)\n')

rom = open('xf_v1.2_gba-eng-fre-jap-ger.sfc', 'rb')

# music pointer table is at $FFF52F
# swappable sample pointer table is at $FFF5DA

unique_song_sets = {}
for i_songSet in range(0, 0xAB, 3):
    rom.seek(snes2hex(0xFF_F52F+i_songSet))
    p_songSet = romRead(3)
    if p_songSet in unique_song_sets:
        print(f'Song set ${i_songSet:02X} (duplicate of ${unique_song_sets[p_songSet]:02X})\n')
        break
    else:
        unique_song_sets[p_songSet] = i_songSet
        print(f'Song set ${i_songSet:02X}:')
    analyze_nspc(p_songSet)

    nspc_file = open(f'test/xf/songs/{i_songSet:02X}.nspc', 'wb')
    romRead(2)
    p_end = rom.tell()
    rom.seek(snes2hex(p_songSet))
    nspc_file.write(rom.read(p_end - snes2hex(p_songSet)))

unique_swappable_samples = {}
for i_swappableSample in range(0x2A):
    rom.seek(snes2hex(0xFF_F5DA+i_swappableSample*3))
    p_nspc = romRead(3)
    if p_nspc != 0:
        if p_nspc in unique_swappable_samples:
            print(f'Swappable sample ${i_swappableSample:02X} (duplicate of ${unique_swappable_samples[p_nspc]:02X})\n')
            break
        else:
            unique_swappable_samples[p_nspc] = i_swappableSample
            print(f'Swappable sample ${i_swappableSample:02X}:')
        analyze_nspc(p_nspc)

        nspc_file = open(f'test/xf/swappable_samples/{i_swappableSample:02X}.nspc', 'wb')
        romRead(2)
        p_end = rom.tell()
        rom.seek(snes2hex(p_nspc))
        nspc_file.write(rom.read(p_end - snes2hex(p_nspc)))
