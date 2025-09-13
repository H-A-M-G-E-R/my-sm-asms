# Modified from https://patrickjohnston.org/ASM/ROM%20data/Super%20Metroid/print%20transition%20table.py

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

samusPoses = {
    0: 'Facing forward - power suit',
    1: 'Facing right - normal',
    2: 'Facing left  - normal',
    3: 'Facing right - aiming up',
    4: 'Facing left  - aiming up',
    5: 'Facing right - aiming up-right',
    6: 'Facing left  - aiming up-left',
    7: 'Facing right - aiming down-right',
    8: 'Facing left  - aiming down-left',
    9: 'Moving right - not aiming',
    0xA: 'Moving left  - not aiming',
    0xB: 'Moving right - gun extended',
    0xC: 'Moving left  - gun extended',
    0xD: 'Moving right - aiming up (unused)',
    0xE: 'Moving left  - aiming up (unused)',
    0xF: 'Moving right - aiming up-right',
    0x10: 'Moving left  - aiming up-left',
    0x11: 'Moving right - aiming down-right',
    0x12: 'Moving left  - aiming down-left',
    0x13: 'Facing right - normal jump - not aiming - not moving - gun extended',
    0x14: 'Facing left  - normal jump - not aiming - not moving - gun extended',
    0x15: 'Facing right - normal jump - aiming up',
    0x16: 'Facing left  - normal jump - aiming up',
    0x17: 'Facing right - normal jump - aiming down',
    0x18: 'Facing left  - normal jump - aiming down',
    0x19: 'Facing right - spin jump',
    0x1A: 'Facing left  - spin jump',
    0x1B: 'Facing right - space jump',
    0x1C: 'Facing left  - space jump',
    0x1D: 'Facing right - morph ball - no springball - on ground',
    0x1E: 'Moving right - morph ball - no springball - on ground',
    0x1F: 'Moving left  - morph ball - no springball - on ground',
    0x20: 'Unused',
    0x21: 'Unused',
    0x22: 'Unused',
    0x23: 'Unused',
    0x24: 'Unused',
    0x25: 'Facing right - turning - standing',
    0x26: 'Facing left  - turning - standing',
    0x27: 'Facing right - crouching',
    0x28: 'Facing left  - crouching',
    0x29: 'Facing right - falling',
    0x2A: 'Facing left  - falling',
    0x2B: 'Facing right - falling - aiming up',
    0x2C: 'Facing left  - falling - aiming up',
    0x2D: 'Facing right - falling - aiming down',
    0x2E: 'Facing left  - falling - aiming down',
    0x2F: 'Facing right - turning - jumping',
    0x30: 'Facing left  - turning - jumping',
    0x31: 'Facing right - morph ball - no springball - in air',
    0x32: 'Facing left  - morph ball - no springball - in air',
    0x33: 'Unused',
    0x34: 'Unused',
    0x35: 'Facing right - crouching transition',
    0x36: 'Facing left  - crouching transition',
    0x37: 'Facing right - morphing transition',
    0x38: 'Facing left  - morphing transition',
    0x39: 'Unused',
    0x3A: 'Unused',
    0x3B: 'Facing right - standing transition',
    0x3C: 'Facing left  - standing transition',
    0x3D: 'Facing right - unmorphing transition',
    0x3E: 'Facing left  - unmorphing transition',
    0x3F: 'Unused',
    0x40: 'Unused',
    0x41: 'Facing left  - morph ball - no springball - on ground',
    0x42: 'Unused',
    0x43: 'Facing right - turning - crouching',
    0x44: 'Facing left  - turning - crouching',
    0x45: 'Unused',
    0x46: 'Unused',
    0x47: 'Unused',
    0x48: 'Unused',
    0x49: 'Facing left  - moonwalk',
    0x4A: 'Facing right - moonwalk',
    0x4B: 'Facing right - normal jump transition',
    0x4C: 'Facing left  - normal jump transition',
    0x4D: 'Facing right - normal jump - not aiming - not moving - gun not extended',
    0x4E: 'Facing left  - normal jump - not aiming - not moving - gun not extended',
    0x4F: 'Facing left  - damage boost',
    0x50: 'Facing right - damage boost',
    0x51: 'Facing right - normal jump - not aiming - moving forward',
    0x52: 'Facing left  - normal jump - not aiming - moving forward',
    0x53: 'Facing right - knockback',
    0x54: 'Facing left  - knockback',
    0x55: 'Facing right - normal jump transition - aiming up',
    0x56: 'Facing left  - normal jump transition - aiming up',
    0x57: 'Facing right - normal jump transition - aiming up-right',
    0x58: 'Facing left  - normal jump transition - aiming up-left',
    0x59: 'Facing right - normal jump transition - aiming down-right',
    0x5A: 'Facing left  - normal jump transition - aiming down-left',
    0x5B: 'Unused',
    0x5C: 'Unused',
    0x5D: 'Unused',
    0x5E: 'Unused',
    0x5F: 'Unused',
    0x60: 'Unused',
    0x61: 'Unused',
    0x62: 'Unused',
    0x63: 'Unused',
    0x64: 'Unused',
    0x65: 'Unused',
    0x66: 'Unused',
    0x67: 'Facing right - falling - gun extended',
    0x68: 'Facing left  - falling - gun extended',
    0x69: 'Facing right - normal jump - aiming up-right',
    0x6A: 'Facing left  - normal jump - aiming up-left',
    0x6B: 'Facing right - normal jump - aiming down-right',
    0x6C: 'Facing left  - normal jump - aiming down-left',
    0x6D: 'Facing right - falling - aiming up-right',
    0x6E: 'Facing left  - falling - aiming up-left',
    0x6F: 'Facing right - falling - aiming down-right',
    0x70: 'Facing left  - falling - aiming down-left',
    0x71: 'Facing right - crouching - aiming up-right',
    0x72: 'Facing left  - crouching - aiming up-left',
    0x73: 'Facing right - crouching - aiming down-right',
    0x74: 'Facing left  - crouching - aiming down-left',
    0x75: 'Facing left  - moonwalk - aiming up-left',
    0x76: 'Facing right - moonwalk - aiming up-right',
    0x77: 'Facing left  - moonwalk - aiming down-left',
    0x78: 'Facing right - moonwalk - aiming down-right',
    0x79: 'Facing right - morph ball - spring ball - on ground',
    0x7A: 'Facing left  - morph ball - spring ball - on ground',
    0x7B: 'Moving right - morph ball - spring ball - on ground',
    0x7C: 'Moving left  - morph ball - spring ball - on ground',
    0x7D: 'Facing right - morph ball - spring ball - falling',
    0x7E: 'Facing left  - morph ball - spring ball - falling',
    0x7F: 'Facing right - morph ball - spring ball - in air',
    0x80: 'Facing left  - morph ball - spring ball - in air',
    0x81: 'Facing right - screw attack',
    0x82: 'Facing left  - screw attack',
    0x83: 'Facing right - wall jump',
    0x84: 'Facing left  - wall jump',
    0x85: 'Facing right - crouching - aiming up',
    0x86: 'Facing left  - crouching - aiming up',
    0x87: 'Facing right - turning - falling',
    0x88: 'Facing left  - turning - falling',
    0x89: 'Facing right - ran into a wall',
    0x8A: 'Facing left  - ran into a wall',
    0x8B: 'Facing right - turning - standing - aiming up',
    0x8C: 'Facing left  - turning - standing - aiming up',
    0x8D: 'Facing right - turning - standing - aiming down-right',
    0x8E: 'Facing left  - turning - standing - aiming down-left',
    0x8F: 'Facing right - turning - in air - aiming up',
    0x90: 'Facing left  - turning - in air - aiming up',
    0x91: 'Facing right - turning - in air - aiming down/down-right',
    0x92: 'Facing left  - turning - in air - aiming down/down-left',
    0x93: 'Facing right - turning - falling - aiming up',
    0x94: 'Facing left  - turning - falling - aiming up',
    0x95: 'Facing right - turning - falling - aiming down/down-right',
    0x96: 'Facing left  - turning - falling - aiming down/down-left',
    0x97: 'Facing right - turning - crouching - aiming up',
    0x98: 'Facing left  - turning - crouching - aiming up',
    0x99: 'Facing right - turning - crouching - aiming down/down-right',
    0x9A: 'Facing left  - turning - crouching - aiming down/down-left',
    0x9B: 'Facing forward - varia/gravity suit',
    0x9C: 'Facing right - turning - standing - aiming up-right',
    0x9D: 'Facing left  - turning - standing - aiming up-left',
    0x9E: 'Facing right - turning - in air - aiming up-right',
    0x9F: 'Facing left  - turning - in air - aiming up-left',
    0xA0: 'Facing right - turning - falling - aiming up-right',
    0xA1: 'Facing left  - turning - falling - aiming up-left',
    0xA2: 'Facing right - turning - crouching - aiming up-right',
    0xA3: 'Facing left  - turning - crouching - aiming up-left',
    0xA4: 'Facing right - landing from normal jump',
    0xA5: 'Facing left  - landing from normal jump',
    0xA6: 'Facing right - landing from spin jump',
    0xA7: 'Facing left  - landing from spin jump',
    0xA8: 'Facing right - grappling',
    0xA9: 'Facing left  - grappling',
    0xAA: 'Facing right - grappling - aiming down-right',
    0xAB: 'Facing left  - grappling - aiming down-left',
    0xAC: 'Unused. Facing right - grappling - in air',
    0xAD: 'Unused. Facing left  - grappling - in air',
    0xAE: 'Unused. Facing right - grappling - in air - aiming down',
    0xAF: 'Unused. Facing left  - grappling - in air - aiming down',
    0xB0: 'Unused. Facing right - grappling - in air - aiming down-right',
    0xB1: 'Unused. Facing left  - grappling - in air - aiming down-left',
    0xB2: 'Facing clockwise     - grapple swinging',
    0xB3: 'Facing anticlockwise - grapple swinging',
    0xB4: 'Facing right - grappling - crouching',
    0xB5: 'Facing left  - grappling - crouching',
    0xB6: 'Facing right - grappling - crouching - aiming down-right',
    0xB7: 'Facing left  - grappling - crouching - aiming down-left',
    0xB8: 'Facing left  - grapple wall jump pose',
    0xB9: 'Facing right - grapple wall jump pose',
    0xBA: 'Facing left  - grabbed by Draygon - not moving - not aiming',
    0xBB: 'Facing left  - grabbed by Draygon - not moving - aiming up-left',
    0xBC: 'Facing left  - grabbed by Draygon - firing',
    0xBD: 'Facing left  - grabbed by Draygon - not moving - aiming down-left',
    0xBE: 'Facing left  - grabbed by Draygon - moving',
    0xBF: 'Facing right - moonwalking - turn/jump left',
    0xC0: 'Facing left  - moonwalking - turn/jump right',
    0xC1: 'Facing right - moonwalking - turn/jump left  - aiming up-right',
    0xC2: 'Facing left  - moonwalking - turn/jump right - aiming up-left',
    0xC3: 'Facing right - moonwalking - turn/jump left  - aiming down-right',
    0xC4: 'Facing left  - moonwalking - turn/jump right - aiming down-left',
    0xC5: 'Unused',
    0xC6: 'Unused',
    0xC7: 'Facing right - vertical shinespark windup',
    0xC8: 'Facing left  - vertical shinespark windup',
    0xC9: 'Facing right - shinespark - horizontal',
    0xCA: 'Facing left  - shinespark - horizontal',
    0xCB: 'Facing right - shinespark - vertical',
    0xCC: 'Facing left  - shinespark - vertical',
    0xCD: 'Facing right - shinespark - diagonal',
    0xCE: 'Facing left  - shinespark - diagonal',
    0xCF: 'Facing right - ran into a wall - aiming up-right',
    0xD0: 'Facing left  - ran into a wall - aiming up-left',
    0xD1: 'Facing right - ran into a wall - aiming down-right',
    0xD2: 'Facing left  - ran into a wall - aiming down-left',
    0xD3: 'Facing right - crystal flash',
    0xD4: 'Facing left  - crystal flash',
    0xD5: 'Facing right - x-ray - standing',
    0xD6: 'Facing left  - x-ray - standing',
    0xD7: 'Facing right - crystal flash ending',
    0xD8: 'Facing left  - crystal flash ending',
    0xD9: 'Facing right - x-ray - crouching',
    0xDA: 'Facing left  - x-ray - crouching',
    0xDB: 'Unused',
    0xDC: 'Unused',
    0xDD: 'Unused',
    0xDE: 'Unused',
    0xDF: 'Unused',
    0xE0: 'Facing right - landing from normal jump - aiming up',
    0xE1: 'Facing left  - landing from normal jump - aiming up',
    0xE2: 'Facing right - landing from normal jump - aiming up-right',
    0xE3: 'Facing left  - landing from normal jump - aiming up-left',
    0xE4: 'Facing right - landing from normal jump - aiming down-right',
    0xE5: 'Facing left  - landing from normal jump - aiming down-left',
    0xE6: 'Facing right - landing from normal jump - firing',
    0xE7: 'Facing left  - landing from normal jump - firing',
    0xE8: 'Facing right - Samus drained - crouching/falling',
    0xE9: 'Facing left  - Samus drained - crouching/falling',
    0xEA: 'Facing right - Samus drained - standing',
    0xEB: 'Facing left  - Samus drained - standing',
    0xEC: 'Facing right - grabbed by Draygon - not moving - not aiming',
    0xED: 'Facing right - grabbed by Draygon - not moving - aiming up-right',
    0xEE: 'Facing right - grabbed by Draygon - firing',
    0xEF: 'Facing right - grabbed by Draygon - not moving - aiming down-right',
    0xF0: 'Facing right - grabbed by Draygon - moving',
    0xF1: 'Facing right - crouching transition - aiming up',
    0xF2: 'Facing left  - crouching transition - aiming up',
    0xF3: 'Facing right - crouching transition - aiming up-right',
    0xF4: 'Facing left  - crouching transition - aiming up-left',
    0xF5: 'Facing right - crouching transition - aiming down-right',
    0xF6: 'Facing left  - crouching transition - aiming down-left',
    0xF7: 'Facing right - standing transition - aiming up',
    0xF8: 'Facing left  - standing transition - aiming up',
    0xF9: 'Facing right - standing transition - aiming up-right',
    0xFA: 'Facing left  - standing transition - aiming up-left',
    0xFB: 'Facing right - standing transition - aiming down-right',
    0xFC: 'Facing left  - standing transition - aiming down-left'
}

def getTransitionTableLabels():
    with romSeek(snes2hex(0x91_9EE2)):
        transitionTablePointers = [romRead(2) for _ in range(len(samusPoses))]
    
    transitionTableLabels = collections.defaultdict(list)
    for (i_pose, p_transitionTable) in enumerate(transitionTablePointers):
        transitionTableLabels[p_transitionTable] += [(i_pose, f'{formatValue(i_pose)}: {samusPoses[i_pose]}')]
    
    return transitionTableLabels

inputNames = [
    ('!run',     0x8000),
    ('!cancel',  0x4000),
    ('!select',  0x2000),
    ('!start',   0x1000),
    ('!up',      0x0800),
    ('!down',    0x0400),
    ('!left',    0x0200),
    ('!right',   0x0100),
    ('!jump',    0x0080),
    ('!shoot',   0x0040),
    ('!aimUp',   0x0020),
    ('!aim',     0x0010)
]

def printTransitionTable():
    def makeInputString(inputs):
        ret = ''
        for (label, bitmask) in inputNames:
            if inputs & bitmask:
                ret += label + '|'
        return ret[:-1]
    
    for i_pose in range(len(samusPoses)):
        if i_pose % 0x10 == 0:
            print('dw ', end='')
        else:
            print(', ', end='')

        rom.seek(snes2hex(0x91_9EE2+2*i_pose))
        if romRead(2) == 0xAA5E: # blank transition table
            print('   0', end='')
        else:
            print(f'Tr{i_pose:02X}', end='')
        if i_pose % 0x10 == 0xF:
            print()

    print()
    print()

    transitionTableLabels = getTransitionTableLabels()
    rom.seek(snes2hex(0x91_A0DC))
    it_transitionTableLabels = iter(sorted(transitionTableLabels.items()))
    (p_transitionTable, labels) = next(it_transitionTableLabels)
    while labels is not None:
        if hex2snes(rom.tell()) & 0xFFFF < p_transitionTable:
            print(f'; Unused')
        else:
            for (i_pose, label) in labels:
                print(f'Tr{i_pose:02X}: ; {label}')
            
            (p_transitionTable, labels) = next(it_transitionTableLabels, (0xAFE4, None))
        
        while True:
            tapInput = romRead(2)
            if tapInput == 0xFFFF:
                print('db !end')
                break
            
            holdInput = romRead(2)
            i_pose = romRead(2)
            
            if tapInput:
                tapInputText = makeInputString(tapInput)
            else:
                tapInputText = '!none'
            
            if holdInput:
                holdInputText = makeInputString(holdInput)
            else:
                holdInputText = '!none'
            
            poseText = samusPoses[i_pose]
            poseText = poseText[0].lower() + poseText[1:]
            print(f'db {tapInputText}, {holdInputText}, ${i_pose:02X} ; {poseText}')

            if hex2snes(rom.tell()) & 0xFFFF in transitionTableLabels:
                break
        
        print()

def main():
    printTransitionTable()

rom = open('xf_v1.2_gba-eng-fre-jap-ger_original.sfc', 'rb')
main()
