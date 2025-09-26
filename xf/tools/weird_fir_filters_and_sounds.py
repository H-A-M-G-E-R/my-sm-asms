# So Meta used FIR filters that aren't 0,1,2,3, pointing instead to the middle of code, but they somehow work. The same quirk also applies to Popful Mail but pointing to instruments instead.
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

config_types_1 = {
    0x2A5F: 0x04,
    0x2A63: 0x01,
    0x2A67: 0x11,
    0x2A6B: 0x02,
    0x2A6F: 0x13
}

config_types_2 = {
    0x38B7: 0x01,
    0x38BB: 0x11,
    0x38BF: 0x02,
    0x38C3: 0x12
}

config_types_3 = {
    0x46F6: 0x11,
    0x4706: 0x21,
    0x4711: 0x01,
    0x4715: 0x11,
    0x4719: 0x02,
    0x471D: 0x12
}

sound_command_lengths = {
    0xF5: 2,
    0xF8: 2,
    0xF9: 2,
    0xFB: 0,
    0xFC: 0,
    0xFD: 0,
    0xFE: 1
}

def extract_fir_filters_and_sounds(size, p_aram):
    p_block_start = rom.tell()
    def aram_seek(addr):
        rom.seek(p_block_start + addr - p_aram)

    # FIR filters
    for i_filter in (16, 32, 40, 48, 63, 64, 72):
        aram_seek(0x1E32 + (i_filter % 32) * 8)
        print(f"FIRFilter{i_filter}: db ${",$".join(f"{romRead(1):02X}" for _ in range(8))}")

    # Sound 1 configurations
    configurations = []
    for i_sound in range(1, 0x43):
        aram_seek(0x1F4B + i_sound * 2)
        configurations.append(romRead(2))
        #print(f"${configurations[i_sound - 1]:04X} ${config_types_1[configurations[i_sound - 1]]:02X}")

    # Sound 1s
    def extract_voice(p_voice):
        aram_seek(p_voice)
        i_current_instr = 0xFF
        current_pan = 0x0A
        while True:
            command = romRead(1)
            if command == 0xFF:
                print(f"db $FF\n")
                break
            elif command in sound_command_lengths:
                params = [romRead(1) for _ in range(sound_command_lengths[command])]
                print(f"db ${",$".join(f"{b:02X}" for b in [command] + params)}")
            else:
                params = [romRead(1) for _ in range(4)]
                if current_pan != params[1]:
                    current_pan = params[1]
                    print(f"db $F6,${current_pan:02X}")
                if i_current_instr != command:
                    i_current_instr = command
                    print(f"db ${i_current_instr:02X}")
                print(f"db ${",$".join(f"{b:02X}" for b in (params[2], params[0], params[3]))}")

    for i_sound in range(1, 0x43):
        print(f".sound{i_sound:X}")
        print(f"db ${config_types_1[configurations[i_sound - 1]]:02X} : dw {", ".join(f"..voice{i}" for i in range(config_types_1[configurations[i_sound - 1]] & 0xF))}")
        aram_seek(0x2AEB + i_sound * 2)
        aram_seek(romRead(2))
        p_voices = [romRead(2) for _ in range(config_types_1[configurations[i_sound - 1]] & 0xF)]
        for i_voice, p_voice in enumerate(p_voices):
            print(f"..voice{i_voice}")
            extract_voice(p_voice)
        print()

    # Sound 2 configurations
    configurations = []
    for i_sound in range(1, 0x80):
        aram_seek(0x31AF + i_sound * 2)
        configurations.append(romRead(2))
        #print(f"${configurations[i_sound - 1]:04X} ${config_types_2[configurations[i_sound - 1]]:02X}")

    # Sound 2s
    for i_sound in range(1, 0x80):
        print(f".sound{i_sound:X}")
        print(f"db ${config_types_2[configurations[i_sound - 1]]:02X} : dw {", ".join(f"..voice{i}" for i in range(config_types_2[configurations[i_sound - 1]] & 0xF))}")
        aram_seek(0x38F1 + i_sound * 2)
        aram_seek(romRead(2))
        p_voices = [romRead(2) for _ in range(config_types_2[configurations[i_sound - 1]] & 0xF)]
        for i_voice, p_voice in enumerate(p_voices):
            print(f"..voice{i_voice}")
            extract_voice(p_voice)
        print()

    # Sound 3 configurations
    configurations = []
    for i_sound in range(1, 0x30):
        aram_seek(0x409A + i_sound * 2)
        configurations.append(romRead(2))
        #print(f"${configurations[i_sound - 1]:04X} ${config_types_3[configurations[i_sound - 1]]:02X}")

    # Sound 3s
    for i_sound in range(1, 0x30):
        if i_sound == 0xB: # sound Bh is at $9F80
            continue
        print(f".sound{i_sound:X}")
        print(f"db ${config_types_3[configurations[i_sound - 1]]:02X} : dw {", ".join(f"..voice{i}" for i in range(config_types_3[configurations[i_sound - 1]] & 0xF))}")
        aram_seek(0x474B + i_sound * 2)
        aram_seek(romRead(2))
        p_voices = [romRead(2) for _ in range(config_types_3[configurations[i_sound - 1]] & 0xF)]
        for i_voice, p_voice in enumerate(p_voices):
            print(f"..voice{i_voice}")
            extract_voice(p_voice)
        print()

if __name__ == "__main__":
    rom = open(f'test/xf/songs/00.nspc', 'rb')
    while True:
        size = romRead(2)
        if size == 0:
            break
        p_aram = romRead(2)
        p_next = rom.tell() + size
        if p_aram == 0x1500 and p_aram < 0x6E00:
            extract_fir_filters_and_sounds(size, p_aram)
        rom.seek(p_next)
