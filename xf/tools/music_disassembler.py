import hashlib, os.path

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

def extract_sample_table(block_size, p_aram):
    if block_size % 4 != 0:
        raise AssertionError("Sample table block size isn't a multiple of 4.")

    sample_table = [(romRead(2), romRead(2)) for _ in range(block_size // 4)]
    i_start = (p_aram - 0x6D00) // 4

    #out = f"spcblock ${p_aram:04X} nspc\n"
    out = f"spcblock 4*${i_start:02X}+!p_sampleTable nspc\n"

    sample_labels = {}
    for i_sample, (p_start, p_loop) in enumerate(sample_table):
        if p_start in sample_labels:
            sample_labels[p_start] += f"_{i_sample + i_start:02X}"
        else:
            sample_labels[p_start] = f"Sample{i_sample + i_start:02X}"

    for (p_start, p_loop) in sample_table:
        if p_loop == 0:
            out += f"  dw {sample_labels[p_start]},0\n"
        elif p_loop == p_start:
            out += f"  dw {sample_labels[p_start]},{sample_labels[p_start]}\n"
        else:
            out += f"  dw {sample_labels[p_start]},{sample_labels[p_start]}+{p_loop-p_start}\n"

    out += "endspcblock\n\n"

    return sample_labels, out

def extract_samples(block_size, p_aram, sample_labels, sample_path, p_sounds=[], print_unknown=True, music=False):
    p_block_start = rom.tell()
    def aram_tell():
        return rom.tell() - p_block_start + p_aram

    if music:
        out = f"spcblock ${p_aram:04X}-$9F80+!p_sampleDataEnd+$400 nspc\n"
    else:
        out = f"spcblock ${p_aram:04X} nspc\n"

    sound_command_lengths = {
        0xF5: 2,
        0xF8: 2,
        0xF9: 2,
        0xFB: 0,
        0xFC: 0,
        0xFD: 0,
        0xFE: 1
    }

    # starts at sound 72h
    sound_configurations = [
        0x01,
        0x01,
        0x11,
        0x11,
        0x11,
        0x02,
        0x02,
        0x02,
        0x12,
        0x12,
        0x12
    ]

    while rom.tell() - p_block_start < block_size:
        if aram_tell() in sample_labels:
            p_sample = aram_tell()
            sample = bytearray()
            while True:
                header = romRead(1)
                sample.append(header)
                sample.extend(rom.read(8))

                if header & 1: # end of sample
                    break
            fn = f"Sample_{hashlib.md5(sample).hexdigest()}.brr"
            out += f'  {sample_labels[p_sample]}: incbin "{fn}"\n'
            sample_file = open(os.path.join(sample_path, fn), "wb")
            sample_file.write(sample)
        else:
            while rom.tell() - p_block_start < block_size and aram_tell() not in sample_labels:
                if aram_tell() in p_sounds:
                    i_sound = p_sounds.index(aram_tell())
                    out += f"Sound{i_sound + 0x72:02X}:\n"
                    p_voices = []
                    for _ in range(sound_configurations[i_sound] & 0xF):
                        p_voices.append(romRead(2))
                    out += f"  db ${sound_configurations[i_sound]:02X} : dw {", ".join(f".voice{i}" for i in range(len(p_voices)))}\n"
                    for _ in range(len(p_voices)):
                        out += f".voice{p_voices.index(aram_tell())}\n"
                        i_current_instr = 0xFF
                        current_pan = 0x0A
                        while True:
                            command = romRead(1)
                            if command == 0xFF:
                                out += f"  db $FF\n\n"
                                break
                            elif command in sound_command_lengths:
                                params = [romRead(1) for _ in range(sound_command_lengths[command])]
                                out += f"  db ${",$".join(f"{b:02X}" for b in [command] + params)}\n"
                            else:
                                params = [romRead(1) for _ in range(4)]
                                if current_pan != params[1]:
                                    current_pan = params[1]
                                    out += f"  db $F6,${current_pan:02X}\n"
                                if i_current_instr != command:
                                    i_current_instr = command
                                    out += f"  db ${i_current_instr:02X}\n"
                                out += f"  db ${",$".join(f"{b:02X}" for b in (params[2], params[0], params[3]))}\n"
                else:
                    if print_unknown:
                        out += f"  db ${romRead(1):02X}\n"
                    else:
                        romRead(1)

    out += "endspcblock\n\n"
    return out

def extract_instrs(block_size, p_aram):
    if block_size % 6 != 0:
        raise AssertionError("Instrument block size isn't a multiple of 6.")

    i_start = (p_aram - 0x6C00) // 6

    #out = f"spcblock ${p_aram:04X} nspc\n"
    out = f"spcblock 6*${i_start:02X}+!p_instrumentTable nspc\n"
    for _ in range(block_size // 6):
        out += f"  db ${",$".join(f"{romRead(1):02X}" for _ in range(6))}\n"
    out += "endspcblock\n\n"
    return out

def extract_note_len_table(block_size, p_aram):
    if block_size != 0x18:
        raise AssertionError("Note length table size isn't 0x18.")

    out = f"spcblock ${p_aram:04X} nspc\n"
    out += f"  db ${",$".join(f"{romRead(1):02X}" for _ in range(8))}\n"
    out += f"  db ${",$".join(f"{romRead(1):02X}" for _ in range(0x10))}\n"
    out += "endspcblock\n\n"
    return out

keys = ['!c', '!cs', '!d', '!ds', '!e', '!f', '!fs', '!g', '!gs', '!a', '!as', '!b']

command_lengths = {
    0xE0: 1, # E0 ii       ; Select instrument i
    0xE1: 1, # E1 pp       ; Panning bias = (p & 1Fh) / 14h. If p & 80h, left side phase inversion is enabled. If p & 40h, right side phase inversion is enabled
    0xE2: 2, # E2 tt bb    ; Dynamic panning over t tics with target panning bias b / 14h
    0xE3: 3, # E3 dd rr ee ; Static vibrato after d tics at rate r with extent e
    0xE4: 0, # E4          ; End vibrato
    0xE5: 1, # E5 vv       ; Music volume multiplier = v / 100h
    0xE6: 2, # E6 tt vv    ; Dynamic music volume over t tics with target volume multiplier v / 100h
    0xE7: 1, # E7 tt       ; Music tempo = t / (0x100 * 0.002) tics per second
    0xE8: 2, # E8 tt TT    ; Dynamic music tempo over t tics with target tempo TT / (0x100 * 0.002) tics per second
    0xE9: 1, # E9 tt       ; Set music transpose of t semitones
    0xEA: 1, # EA tt       ; Set transpose of t semitones
    0xEB: 3, # EB dd rr ee ; Tremolo after d tics at rate r with extent e
    0xEC: 0, # EC          ; End tremolo
    0xED: 1, # ED vv       ; Volume multiplier = v / 100h
    0xEE: 2, # EE tt vv    ; Dynamic volume over t tics with target volume multiplier v / 100h
    0xEF: 3, # EF pppp cc  ; Play subsection p, c times
    0xF0: 1, # F0 ll       ; Dynamic vibrato over l tics with target extent 0
    0xF1: 3, # F1 dd ll ee ; Slide out after d tics for l tics by e semitones
    0xF2: 3, # F2 dd ll ee ; Slide in after d tics for l tics by e semitones
    0xF3: 0, # F3          ; End slide
    0xF4: 1, # F4 ss       ; Set subtranspose of s / 100h semitones
    0xF5: 3, # F5 vv ll rr ; Static echo on voices v with echo volume left = l and echo volume right = r
    0xF6: 0, # F6          ; End echo
    0xF7: 3, # F7 dd ff ii ; Set echo parameters: echo delay = d, echo feedback volume = f, echo FIR filter index = i (range 0..3)
    0xF8: 3, # F8 dd ll rr ; Dynamic echo volume after d tics with target echo volume left = l and target echo volume right = r
    0xF9: 3, # F9 dd ll nn ; Pitch slide after d tics over l tics to target note n
    0xFA: 1, # FA ii       ; Percussion instruments base index = i
    0xFB: 1  # FB pp       ; Clear RAM pp00..$FF00
}

command_names = {
    0xE0: '!instr',
    0xE1: '!pan',
    0xE2: '!dynamicPan',
    0xE3: '!vibrato',
    0xE4: '!endVibrato',
    0xE5: '!musicVolume',
    0xE6: '!dynamicMusicVolume',
    0xE7: '!tempo',
    0xE8: '!dynamicTempo',
    0xE9: '!musicTranspose',
    0xEA: '!transpose',
    0xEB: '!tremolo',
    0xEC: '!endTremolo',
    0xED: '!volume',
    0xEE: '!dynamicVolume',
    0xEF: '!loop',
    0xF0: '!dynamicVibrato',
    0xF1: '!slideOut',
    0xF2: '!slideIn',
    0xF3: '!endSlide',
    0xF4: '!subtranspose',
    0xF5: '!echo',
    0xF6: '!endEcho',
    0xF7: '!echoParameters',
    0xF8: '!dynamicEcho',
    0xF9: '!pitchSlide',
    0xFA: '!percBase',
    0xFB: '!echoBufferClear'
}

weird_fir_filter_translate = {
    8: 4,
    0x10: 5,
    0x1F: 6
}

def extract_trackers(block_size, p_aram):
    p_block_start = rom.tell()
    def aram_tell():
        return rom.tell() - p_block_start + p_aram

    out = f"spcblock ${p_aram:04X} nspc\n"
    out += "Trackers:\n"

    i_first_tracker = (p_aram - 0x5820) // 2 + 1
    p_trackers = []
    while aram_tell() not in p_trackers:
        p_trackers.append(romRead(2))
    out += f"  dw {", ".join(f"Tracker{n + i_first_tracker}" for n in range(len(p_trackers)))}\n\n"

    p_patterns = []
    p_tracks = []
    max_echo = 0
    while rom.tell() - p_block_start < block_size:
        tracker = []
        p_loops = []
        p_firstTracker = aram_tell()
        while aram_tell() not in p_patterns:
            command = romRead(2)
            if command == 0:
                tracker.append([command])
            elif command >= 0x100:
                tracker.append([command])
                p_patterns.append(command)
            else:
                p_loop = romRead(2)
                tracker.append([command, p_loop])
                p_loops.append(p_loop)

        p_tracker = p_firstTracker
        for params in tracker:
            if p_tracker in p_trackers:
                out += f"Tracker{p_trackers.index(p_tracker) + i_first_tracker:X}:\n"
            if p_tracker in p_loops:
                out += f"-\n"
            if params[0] == 0:
                out += "  dw $0000\n\n"
            elif params[0] >= 0x100:
                out += f"  dw Pattern{params[0]:04X}\n"
            else:
                out += f"  dw ${params[0]:04X},-\n"
            p_tracker += len(params) * 2

        while aram_tell() in p_patterns:
            out += f"Pattern{aram_tell():04X}: dw "
            for i in range(8):
                p_track = romRead(2)
                if p_track == 0:
                    out += "0"
                else:
                    p_tracks.append(p_track)
                    out += f"Track{p_track:04X}"
                if i < 7:
                    out += ", "
                else:
                    out += "\n"

        p_subs = []
        while rom.tell() - p_block_start < block_size and aram_tell() not in p_trackers and aram_tell() not in p_patterns:
            if aram_tell() in p_tracks:
                out += f"\nTrack{aram_tell():02X}:\n"
            if aram_tell() in p_subs:
                out += f"\nSub{aram_tell():02X}:\n"
            command = romRead(1)
            if command == 0: # terminator
                out += "  !end\n"
            elif command < 0x80: # note length
                next_byte = romRead(1)
                if next_byte < 0x80: # volume and ring length
                    out += f"  db {command},${next_byte:02X}\n"
                else:
                    rom.seek(rom.tell() - 1)
                    out += f"  db {command}\n"
            elif command < 0xE0: # note, tie, rest and percussion note
                if command < 0xC8: # note
                    out += f"  {keys[(command-0x80)%12]}{(command-0x80)//12+2}\n"
                elif command == 0xC8:
                    out += "  !tie\n"
                elif command == 0xC9:
                    out += "  !rest\n"
                elif command == 0xE0: # perc note (unused)
                    out += f"  db ${command:02X}\n"
            elif command == 0xEF: # play subsection command
                p_sub = romRead(2)
                if p_sub not in p_subs and p_sub < aram_tell():
                    raise NotImplementedError(f"Backtracking to label sub {p_sub:04X} unimplemented")
                p_subs.append(p_sub)
                repetitions = romRead(1)
                out += f"  {command_names[command]} : dw Sub{p_sub:04X} : db {repetitions}\n"
            else: # track command
                params = [romRead(1) for _ in range(command_lengths[command])]
                params_str = [f",{param}" for param in params]
                if command == 0xE0:
                    params_str[0] = f",${params[0]:02X}"
                elif command == 0xF5:
                    params_str[0] = f",%{params[0]:08b}"
                elif command == 0xF7:
                    if params[0] > max_echo:
                        max_echo = params[0]
                    i_fir = params[2] % 0x20
                    if i_fir in weird_fir_filter_translate:
                        i_fir = weird_fir_filter_translate[i_fir]
                    params_str[2] = f",{i_fir}"
                elif command == 0xF9:
                    params_str[2] = f" : {keys[(params[2]&0x7F)%12]}{(params[2]&0x7F)//12+2}"
                elif command == 0xFA:
                    params_str[0] = f",${params[0]:02X}"
                elif command == 0xFB:
                    #params_str[0] = f",${params[0]:02X}"
                    continue
                out += f"  {command_names[command]}{"".join(params_str)}\n"

    out += f"\nassert pc() <= $10000-({max_echo}*$800)\n"
    out += "endspcblock\n\n"
    out += "spcblock !p_extra nspc\n"
    out += "  dw Trackers-8 : db 0\n"
    out += "endspcblock\n\n"
    return out

def extract_p_sounds(block_size, p_aram):
    if block_size % 2 != 0:
        raise AssertionError("Sound table block size isn't a multiple of 2.")
    out = f"spcblock !p_sounds2Low+${(p_aram - 0x38F1) // 2:X}-1 nspc\n"
    p_sounds = [romRead(2) for _ in range(block_size // 2)]
    out += f"  db "
    for i, p_sound in enumerate(p_sounds):
        if p_sound == 0x2AC0:
            out += "!zero"
        else:
            out += f"Sound{p_sounds.index(p_sound) + 0x72:02X}"
        if i < block_size // 2 - 1:
            out += ", "
        else:
            out += "\n"
    out += "endspcblock\n\n"

    out += f"spcblock !p_sounds2High+${(p_aram - 0x38F1) // 2:X}-1 nspc\n"
    out += f"  db "
    for i, p_sound in enumerate(p_sounds):
        if p_sound == 0x2AC0:
            out += "!zero>>8"
        else:
            out += f"Sound{p_sounds.index(p_sound) + 0x72:02X}>>8"
        if i < block_size // 2 - 1:
            out += ", "
        else:
            out += "\n"
    out += "endspcblock\n\n"

    return p_sounds, out

if __name__ == "__main__":
    #for i_song_set in range(0, 0xAB, 3):
    for i_song_set in range(3, 0xAB, 3):
        rom = open(f'test/xf/songs/{i_song_set:02X}.nspc', 'rb')
        out = "asar 1.91\n"
        out += "norom : org 0\n"
        out += 'incsrc "../spc_defines.asm"\n\n'

        sample_labels = {}
        while True:
            size = romRead(2)
            if size == 0:
                break
            p_aram = romRead(2)
            p_next = rom.tell() + size
            if p_aram >= 0x6D00 and p_aram < 0x6E00:
                sample_labels, out1 = extract_sample_table(size, p_aram)
                out += out1
                if i_song_set == 0xA5:
                    sample_labels |= {
                        0x0C1A: "Sample11"
                    }
            elif p_aram >= 0x6E00 or (p_aram >= 0x0500 and p_aram < 0x1500):
                out += extract_samples(size, p_aram, sample_labels, "xf/music/", music=True)
            elif p_aram >= 0x6C00 and p_aram < 0x6D00:
                out += extract_instrs(size, p_aram)
            elif p_aram == 0x5800:
                #out += extract_note_len_table(size, p_aram)
                pass
            elif p_aram == 0x5828:
                out += extract_trackers(size, p_aram)
            rom.seek(p_next)

        if i_song_set == 0:
            rom.seek(0)
            while True:
                size = romRead(2)
                if size == 0:
                    break
                p_aram = romRead(2)
                p_next = rom.tell() + size
                if p_aram == 0x1500 or p_aram == 0x2FF0 or (p_aram >= 0x6800 and p_aram < 0x6C00):
                    out += extract_samples(size, p_aram, sample_labels, "xf/music/", print_unknown=False)
                rom.seek(p_next)

        out += "dw $0000\n"
        outfile = open(f"xf/music/{i_song_set:02X}.asm", "w")
        outfile.write(out)

    for i_swappable_sample in range(0, 0x2A):
        if i_swappable_sample == 0x21:
            continue

        rom = open(f'test/xf/swappable_samples/{i_swappable_sample:02X}.nspc', 'rb')
        out = "asar 1.91\n"
        out += "norom : org 0\n"
        out += 'incsrc "../spc_defines.asm"\n\n'

        sample_labels = {}
        p_sounds = []
        while True:
            size = romRead(2)
            if size == 0:
                break
            p_aram = romRead(2)
            p_next = rom.tell() + size
            if p_aram >= 0x6D00 and p_aram < 0x6E00:
                sample_labels, out1 = extract_sample_table(size, p_aram)
                out += out1
            elif p_aram >= 0x6C00 and p_aram < 0x6D00:
                out += extract_instrs(size, p_aram)
            elif p_aram == 0x5800:
                #out += extract_note_len_table(size, p_aram)
                pass
            elif p_aram == 0x5828:
                out += extract_trackers(size, p_aram)
            elif p_aram == 0x39D5:
                p_sounds, out1 = extract_p_sounds(size, p_aram)
                out += out1
            rom.seek(p_next)

        rom.seek(0)

        if i_swappable_sample <= 2: # spin jump
            sample_labels = {
                0x0500: "Sample0B"
            }

        if i_swappable_sample >= 3 and i_swappable_sample <= 8: # beam
            sample_labels = {
                0x4A90: "Sample04"
            }

        while True:
            size = romRead(2)
            if size == 0:
                break
            p_aram = romRead(2)
            p_next = rom.tell() + size
            if p_aram == 0x4A90 or p_aram >= 0x6E00 or (p_aram >= 0x0500 and p_aram < 0x1500):
                out += extract_samples(size, p_aram, sample_labels, "xf/swappable_samples/", p_sounds)
            rom.seek(p_next)

        out += "dw $0000\n"
        outfile = open(f"xf/swappable_samples/{i_swappable_sample:02X}.asm", "w")
        outfile.write(out)
