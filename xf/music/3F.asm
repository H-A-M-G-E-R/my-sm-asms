asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; BSL ambience

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$04,$F4
  db $19,$FD,$E0,$B8,$04,$F4
  db $1A,$FF,$E0,$B8,$04,$F4
  db $1B,$FF,$E0,$B8,$04,$F4
  db $1C,$FF,$E0,$B8,$04,$F4
  db $1D,$FF,$EE,$B8,$02,$7A
  db $1E,$FF,$F3,$B8,$02,$7A
  db $1F,$FF,$E9,$B8,$02,$7A
  db $20,$FD,$E0,$B8,$00,$E0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+18
  dw Sample19,Sample19+18
  dw Sample1A,Sample1A+396
  dw Sample1B,Sample1B+27
  dw Sample1C,Sample1C+18
  dw Sample1D_1E_1F,Sample1D_1E_1F+45
  dw Sample1D_1E_1F,Sample1D_1E_1F+45
  dw Sample1D_1E_1F,Sample1D_1E_1F+45
  dw Sample20,Sample20+27
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_7cb606e75d0a3b2d32c0978334840e7f.brr")
  Sample19: skip filesize("Sample_3158d932e85680f2a75081475266fc07.brr")
  Sample1A: skip filesize("Sample_c9c2f52f918b7ab6174640d5c71dc49e.brr")
  Sample1B: skip filesize("Sample_a9ba72fbff7f59996d83162d02c4f923.brr")
  Sample1C: skip filesize("Sample_d7b6254dac45a1d7ada6e6833ead52ab.brr")
  Sample1D_1E_1F: skip filesize("Sample_b5e5cef7ca2abea97e422651e8512a7a.brr")
  Sample20: skip filesize("Sample_90e872822e8156c45348838e598067d6.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track586F, Track5935, Track59F4, Track5A94, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,24
  !musicVolume,176
  !echo,%00001111,31,31
  !echoParameters,3,16,0
  !dynamicEcho,128,52,52
  !end

Track586F:
  db 127,$7F
  !transpose,0
  !echo,%00001111,31,31
  !echoParameters,3,16,0
  !dynamicEcho,128,52,52
  !instr,$18
  !pan,10
  !vibrato,0,31,79
  !volume,80
  !dynamicVolume,96,176
  db 96
  !cs5
  !dynamicVolume,96,144
  !tie
  !dynamicVolume,48,176
  db 48
  !tie
  !dynamicVolume,96,144
  db 96
  !tie
  db 48
  !tie
  !dynamicVolume,96,80
  db 96
  !tie
  !instr,$19
  !dynamicVolume,64,128
  db 48
  !c5
  !dynamicVolume,192,48
  db 96
  !tie
  !tie
  !instr,$18
  !dynamicVolume,120,176
  !cs5
  db 60
  !tie
  !instr,$1C
  !dynamicVolume,120,96
  db 96
  !cs5
  db 60
  !tie
  !instr,$1A
  !dynamicVolume,48,128
  db 72
  !cs5
  !dynamicVolume,48,64
  db 48
  !tie
  !dynamicVolume,80,160
  db 96
  !tie
  !dynamicVolume,96,128
  !tie
  !dynamicVolume,128,80
  !tie
  db 48
  !tie
  !rest
  !instr,$1B
  !volume,144
  db 96
  !cs5
  !dynamicVolume,112,80
  !tie
  db 48
  !tie
  !instr,$1C
  !volume,128
  !cs5
  !dynamicVolume,96,80
  db 96
  !tie
  !dynamicVolume,48,128
  db 48
  !tie
  !dynamicVolume,48,64
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1D
  !endVibrato
  !volume,144
  !dynamicVolume,64,96
  db 60
  !a4
  db 96
  !rest
  db 60
  !a4
  !instr,$1C
  !vibrato,0,31,79
  !dynamicVolume,80,160
  db 96
  !cs5
  !dynamicVolume,80,96
  db 120
  !tie
  !instr,$18
  !volume,128
  !dynamicVolume,64,80
  db 84
  !cs5
  !instr,$1C
  !dynamicVolume,48,160
  db 72
  !cs5
  !dynamicVolume,64,64
  db 84
  !tie
  !end

Track5935:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !rest
  !tie
  db 36
  !rest
  !instr,$1A
  !pan,8
  !vibrato,0,31,79
  !volume,64
  !dynamicVolume,48,160
  db 84
  !cs5
  !dynamicVolume,48,80
  db 48
  !tie
  !instr,$18
  !dynamicVolume,80,160
  db 120
  !cs5
  !dynamicVolume,64,112
  db 96
  !tie
  !instr,$1D
  !endVibrato
  !volume,128
  !dynamicVolume,48,64
  db 48
  !c4
  db 84
  !rest
  !volume,128
  !dynamicVolume,48,64
  db 48
  !c4
  db 12
  !rest
  !instr,$18
  !vibrato,0,31,79
  !volume,144
  !dynamicVolume,96,96
  db 120
  !cs5
  !instr,$1B
  !dynamicVolume,48,112
  db 48
  !cs5
  !dynamicVolume,24,64
  db 24
  !tie
  !instr,$18
  !dynamicVolume,96,64
  db 84
  !cs5
  db 96
  !rest
  !tie
  !volume,128
  !dynamicVolume,96,80
  db 108
  !cs5
  db 72
  !rest
  !instr,$1A
  !dynamicVolume,48,160
  db 48
  !cs5
  !dynamicVolume,96,112
  db 96
  !tie
  !dynamicVolume,96,48
  db 108
  !tie
  db 60
  !rest
  !instr,$19
  !volume,80
  !dynamicVolume,64,128
  db 76
  !c5
  !dynamicVolume,64,80
  !c5
  db 2
  !rest
  !dynamicVolume,64,128
  db 76
  !c5
  !dynamicVolume,64,80
  !c5
  db 2
  !rest
  db 76
  !c5
  !dynamicVolume,144,128
  !c5
  !c5
  db 2
  !rest
  !dynamicVolume,192,64
  db 76
  !c5
  !c5
  db 2
  !rest
  db 76
  !c5
  !instr,$1A
  !volume,80
  db 120
  !rest
  !dynamicVolume,48,176
  db 72
  !cs5
  !dynamicVolume,48,64
  !tie
  db 96
  !rest
  !tie
  !end

Track59F4:
  db 127,$7F
  !transpose,0
  !instr,$20
  !volume,48
  !pan,10
  !dynamicVolume,192,80
  db 96
  !c5
  !tie
  !tie
  !tie
  !dynamicVolume,96,56
  !tie
  !tie
  !dynamicVolume,96,80
  !tie
  !tie
  !dynamicVolume,96,48
  !tie
  !tie
  db 60
  !rest
  !instr,$1D
  !endVibrato
  !pan,12
  !volume,128
  !dynamicVolume,48,64
  db 36
  !c4
  db 96
  !rest
  !tie
  !volume,128
  !dynamicVolume,48,64
  db 48
  !c4
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !instr,$1E
  !volume,192
  db 16
  !a4
  !volume,128
  !c4
  !gs4
  !volume,160
  db 12
  !cs5
  !volume,128
  !e4
  !instr,$1F
  !volume,192
  !dynamicPan,192,10
  db 24
  !a5
  db 96
  !tie
  !pitchSlide,0,96 : !fs4
  db 24
  !tie
  db 48
  !tie
  db 24
  !rest
  !instr,$19
  !pan,12
  !volume,80
  db 16
  !rest
  db 76
  !c5
  !c5
  db 2
  !rest
  db 76
  !c5
  !c5
  db 2
  !rest
  db 76
  !c5
  !c5
  !c5
  db 2
  !rest
  db 76
  !c5
  !dynamicVolume,128,48
  !c5
  db 2
  !rest
  db 76
  !c5
  !dynamicPan,240,8
  !dynamicVolume,128,80
  !rest
  !c5
  db 2
  !rest
  !dynamicVolume,128,48
  db 76
  !c5
  !c5
  !loop : dw Sub5A90 : db 255
  !end

Sub5A90:
  db 96
  !rest
  !tie
  !end

Track5A94:
  db 127,$7F
  !transpose,0
  !loop : dw Sub5ABA : db 8
  !instr,$1E
  !endVibrato
  !pan,8
  db 96
  !rest
  !volume,128
  db 8
  !rest
  db 16
  !b3
  !cs4
  !volume,160
  db 14
  !g4
  db 12
  !ds4
  !volume,128
  !f4
  db 18
  !rest
  !loop : dw Sub5ABE : db 255
  !end

Sub5ABA:
  db 96
  !rest
  !tie
  !end

Sub5ABE:
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(3*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
