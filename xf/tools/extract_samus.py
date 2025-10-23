snes2hex = lambda address: address >> 1 & 0x3F8000 | address & 0x7FFF
hex2snes = lambda address: address << 1 & 0xFF0000 | address & 0xFFFF | 0x808000

def romRead(n = 1, address = None):
    if address is not None:
        prevAddress = rom.tell()
        rom.seek(snes2hex(address))

    ret = int.from_bytes(rom.read(n), 'little')
    if address is not None:
        rom.seek(prevAddress)
        
    return ret

def romSeek(address):
    return rom.seek(snes2hex(address))

def romTell():
    return hex2snes(rom.tell())

def print_pose_pointers(prefix):
    for i_pose in range(0xFD):
        if i_pose % 0x10 == 0:
            print('  dw ', end='')
        else:
            print(', ', end='')
        print(f'{prefix}{i_pose:02X}', end='')
        if i_pose % 0x10 == 0xF:
            print()
    print()

def print_oam_pose_pointers(prefix):
    for i_pose in range(0xFD):
        if i_pose % 0x10 == 0:
            print('  dw ', end='')
        else:
            print(', ', end='')
        print(f'({prefix}{i_pose:02X}-$808D)/2', end='')
        if i_pose % 0x10 == 0xF:
            print()
    print()

def extract_oam_pointers():
    romSeek(0x929263)
    top_indices = [romRead(2) for _ in range(0xFD)]
    romSeek(0x92945D)
    bottom_indices = [romRead(2) for _ in range(0xFD)]

    romSeek(0x92808D+2*0x198)
    print("org $92808D+2*$198")
    while romTell() < 0x92912D:
        if (romTell() - 0x92808D) // 2 in top_indices:
            print()
            for i_pose in range(0xFD):
                if top_indices[i_pose] == (romTell() - 0x92808D) // 2:
                    print(f"OA_T_{i_pose:02X}:")

        if (romTell() - 0x92808D) // 2 in bottom_indices:
            print()
            for i_pose in range(0xFD):
                if bottom_indices[i_pose] == (romTell() - 0x92808D) // 2:
                    print(f"OA_B_{i_pose:02X}:")

        p_oam = romRead(2)
        if p_oam <= 0x8000:
            print(f"  dw ${p_oam:04X}")
        else:
            print(f"  dw SamusOam_{p_oam:04X}")

    print("org $929263")
    print_oam_pose_pointers("OA_T_")
    print("org $92945D")
    print_oam_pose_pointers("OA_B_")

def extract_oam():
    romSeek(0x929657)
    print("org $929657")
    while romTell() < 0x92B1C7:
        print(f"\nSamusOam_{romTell() & 0xFFFF:04X}:")
        count = romRead(2)
        print(f"dw {count}")
        for _ in range(count):
            print("db $" + ",$".join(f"{romRead(1):02X}" for _ in range(5)))

def extract_tile_defs():
    romSeek(0x92D91E)
    p_top_defs = [romRead(2) for _ in range(0xD)]
    p_bottom_defs = [romRead(2) for _ in range(0xB)]

    p_tile_labels = {}
    romSeek(0x92CBEE)
    print("org $92CBEE")
    while romTell() < 0x92D246:
        if romTell() & 0xFFFF in p_top_defs:
            prefix = f"T_{p_top_defs.index(romTell() & 0xFFFF):X}"
            index = 0
            print(f"\nSamusTileDefs_Top_{p_top_defs.index(romTell() & 0xFFFF):X}:")
        if romTell() & 0xFFFF in p_bottom_defs:
            prefix = f"B_{p_bottom_defs.index(romTell() & 0xFFFF):X}"
            index = 0
            print(f"\nSamusTileDefs_Bottom_{p_bottom_defs.index(romTell() & 0xFFFF):X}:")

        p_tiles = romRead(3)
        upper_size = romRead(2)
        lower_size = romRead(2)
        p_tile_labels[p_tiles] = (f"{prefix}_{index:02X}", upper_size, lower_size)
        print(f'TD_{prefix}_{index:02X}: dl {f"{prefix}_{index:02X}"} : dw ${upper_size:04X}, ${lower_size:04X} ; ${p_tiles:06X}')
        index += 1

    return p_tile_labels

def extract_tile_anims():
    # using indices and sets instead of pointers are stupid
    romSeek(0x92D94E)
    p_pose_tile_defs = [romRead(2) for _ in range(0xFD)]

    print("org $92D94E")
    print_pose_pointers("TA_")

    while romTell() < 0x92E768:
        if romTell() & 0xFFFF in p_pose_tile_defs:
            print()
            for i_pose in range(0xFD):
                if p_pose_tile_defs[i_pose] == romTell() & 0xFFFF:
                    print(f"TA_{i_pose:02X}:")

        print(f"  dw TD_T_{romRead(1):X}_{romRead(1):02X}, TD_B_{romRead(1):X}_{romRead(1):02X}")

def extract_tiles(p_start, p_tile_labels):
    romSeek(p_start)
    print(f"org ${p_start:06X}")

    while romTell() & 0xFF0000 == p_start & 0xFF0000:
        (label, upper_size, lower_size) = p_tile_labels[romTell()]
        print(f'{label}: incbin "gfx_original/{label}.gfx" ; ${romTell():06X}')
        file = open(f"xf/samus/gfx_original/{label}.gfx", "wb")
        file.write(rom.read(upper_size+lower_size))

        if romTell() not in p_tile_labels:
            p_gfx = romTell()
            file = open(f"xf/samus/gfx_original/Unused_{p_gfx:06X}.gfx", "wb")
            while romTell() not in p_tile_labels:
                file.write(rom.read(0x20))
                if romTell() & 0xFF0000 != p_start & 0xFF0000:
                    break
            print(f'Unused_{p_gfx:06X}: incbin "gfx_original/Unused_{p_gfx:06X}.gfx"')

    print()

if __name__ == "__main__":
    rom = open("xf_v1.2_gba-eng-fre-jap-ger.sfc", "rb")

    extract_oam_pointers()
    extract_oam()
    p_tile_labels = extract_tile_defs()
    extract_tile_anims()
    extract_tiles(0x9BE300, p_tile_labels)
    extract_tiles(0x9C8000, p_tile_labels)
    extract_tiles(0x9D8000, p_tile_labels)