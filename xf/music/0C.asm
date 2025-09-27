asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FD,$48,$B8,$02,$7A
  db $19,$FF,$E3,$B8,$0B,$FD
  db $1A,$FF,$F2,$B8,$07,$E0
  db $1B,$FF,$E0,$B8,$04,$F4
  db $1C,$DD,$E0,$B8,$04,$F4
  db $1D,$DB,$E0,$B8,$04,$F4
  db $1E,$FF,$E0,$B8,$04,$F4
  db $1F,$FE,$E7,$B8,$04,$F4
  db $20,$FD,$48,$B8,$02,$7A
  db $21,$FF,$F2,$B8,$03,$40
  db $22,$FF,$E0,$B8,$03,$40
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+18
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+441
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C+1143
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E
  dw Sample1F,Sample1F
  dw Sample20,Sample20+765
  dw Sample21_22,Sample21_22
  dw Sample21_22,Sample21_22
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample19: skip filesize("Sample_153af0a14dfa01b26538333fd4f5e4c1.brr")
  Sample1A: skip filesize("Sample_7da9d5ac86382b33e38c59e7bbc02397.brr")
  Sample1B: skip filesize("Sample_ff8b37e06639ca6f4c8983178b73c75f.brr")
  Sample1C: skip filesize("Sample_06fd166d0071d3476bebf3ce0d1a39ea.brr")
  Sample1D: skip filesize("Sample_9b3e33be9ebdd07b2922da92c7899ad8.brr")
  Sample1E: skip filesize("Sample_ae8e1de965071e6c9210ea1074e4ae53.brr")
  Sample1F: skip filesize("Sample_1c61c1d2173db51733ec9ee9638cd11f.brr")
  Sample20: skip filesize("Sample_8946233beaf2ee2126e98ae1b12a6be5.brr")
  Sample21_22: skip filesize("Sample_2822bad39b87fb8c53e54a49b8a625f0.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5836
-
  dw Pattern5846
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track5B59, Track5D99, Track5DB5, Track5DC6, Track60F7, 0, 0
Pattern5856: dw Track5A59, Track5C92, Track5FAE, Track6184, 0, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,49
  !musicVolume,192
  !echo,%00001100,32,32
  !echoParameters,4,8,0
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !echo,%00001100,32,32
  !echoParameters,4,8,0
  !instr,$18
  !volume,176
  !dynamicVolume,160,208
  db 96
  !f4
  db 84
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  !volume,176
  db 24
  !b4
  !dynamicVolume,128,208
  db 96
  !as4
  db 72
  !tie
  db 24
  !gs4
  db 120
  !a4
  db 24
  !f4
  !volume,240
  !d4
  !dynamicVolume,24,16
  !tie
  !volume,240
  db 96
  !rest
  db 72
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !volume,176
  !dynamicVolume,160,208
  db 72
  !a3
  db 96
  !as3
  db 48
  !tie
  db 96
  !f4
  db 36
  !tie
  !rest
  db 72
  !a4
  db 96
  !as4
  db 48
  !tie
  db 96
  !f5
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  !loop : dw Sub59B1 : db 1
  db 96
  !c5
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 96
  !b4
  db 72
  !tie
  db 48
  !rest
  db 96
  !a4
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 96
  !gs4
  db 72
  !tie
  db 48
  !rest
  db 96
  !c5
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 96
  !b4
  db 72
  !tie
  db 24
  !rest
  db 12
  !a4
  !gs4
  db 96
  !c5
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 96
  !cs5
  db 72
  !tie
  db 24
  !rest
  db 12
  !a4
  !gs4
  db 96
  !c5
  db 60
  !tie
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 96
  !b4
  db 72
  !tie
  db 12
  !rest
  !gs4
  !g4
  !f4
  db 24
  !d4
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,176
  db 120
  !rest
  db 96
  !rest
  !tie
  !volume,176
  !instr,$20
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !cs5
  db 6
  !rest
  db 18
  !cs5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !b4
  db 6
  !rest
  db 18
  !b4
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !cs5
  db 6
  !rest
  db 18
  !cs5
  db 54
  !rest
  !volume,208
  !instr,$18
  !loop : dw Sub59B1 : db 1
  !loop : dw Sub5A3D : db 1
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !end

Sub59B1:
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 120
  !rest
  db 12
  !ds4
  !dynamicVolume,12,16
  !tie
  !volume,176
  !ds4
  !dynamicVolume,12,16
  !tie
  !volume,176
  !ds4
  !dynamicVolume,12,16
  !tie
  !volume,176
  db 48
  !ds4
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 120
  !rest
  db 24
  !f4
  db 12
  !ds4
  !rest
  db 72
  !ds4
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !d4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 48
  !rest
  db 12
  !ds4
  !rest
  !ds4
  !rest
  db 72
  !ds4
  db 12
  !f4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !f4
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,176
  db 12
  !f4
  !dynamicVolume,12,16
  !tie
  !volume,176
  db 96
  !fs4
  db 72
  !tie
  db 48
  !rest
  !end

Sub5A3D:
  db 96
  !d5
  db 36
  !tie
  db 30
  !a4
  !as4
  db 96
  !c5
  !d5
  !as4
  db 36
  !tie
  db 30
  !f5
  !ds5
  db 96
  !gs4
  db 72
  !as4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,208
  !end

Track5A59:
  db 127,$7F
  !transpose,0
  !echo,%00001100,32,32
  !echoParameters,4,8,0
  !instr,$18
  !volume,208
  !loop : dw Sub5A3D : db 1
  db 96
  !b4
  db 36
  !tie
  db 30
  !as4
  !a4
  db 24
  !b4
  db 120
  !as4
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  db 96
  !cs5
  db 36
  !tie
  db 30
  !c5
  !b4
  db 24
  !cs5
  db 120
  !c5
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  db 120
  !ds5
  db 36
  !d5
  db 12
  !rest
  !cs5
  !dynamicVolume,12,16
  !tie
  !volume,208
  db 120
  !e5
  db 24
  !ds5
  !rest
  db 12
  !d5
  !dynamicVolume,12,16
  !tie
  !volume,208
  db 24
  !f5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  db 30
  !e5
  db 18
  !ds5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  db 24
  !fs5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  db 30
  !f5
  db 18
  !e5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  db 24
  !f5
  db 12
  !rest
  db 24
  !e5
  db 6
  !rest
  db 24
  !ds5
  db 6
  !rest
  db 24
  !fs5
  db 12
  !rest
  db 24
  !f5
  db 6
  !rest
  db 24
  !e5
  db 6
  !rest
  db 96
  !d6
  db 36
  !tie
  db 30
  !cs6
  !c6
  db 96
  !b5
  db 36
  !tie
  db 30
  !as5
  !a5
  !dynamicVolume,192,208
  db 96
  !gs5
  db 36
  !tie
  db 12
  !g5
  !dynamicVolume,18,16
  db 18
  !tie
  !volume,208
  !fs5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  !dynamicVolume,192,176
  db 96
  !f5
  db 36
  !tie
  db 12
  !e5
  !dynamicVolume,18,16
  db 18
  !tie
  !volume,208
  !ds5
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,208
  !loop : dw Sub5B4E : db 1
  db 36
  !c4
  !c4
  !c4
  db 12
  !rest
  !instr,$19
  !volume,192
  db 72
  !ds2
  !loop : dw Sub5B4E : db 1
  db 36
  !c4
  !c4
  !c4
  db 12
  !rest
  !instr,$19
  !volume,192
  db 72
  !f2
  !loop : dw Sub5B4E : db 4
  !end

Sub5B4E:
  !instr,$1F
  !volume,144
  db 36
  !c4
  !c4
  !c4
  db 84
  !rest
  !end

Track5B59:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,176
  !loop : dw Sub5C56 : db 4
  db 96
  !d2
  !tie
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  !dynamicVolume,47,240
  db 60
  !f2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  !volume,176
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,176
  !instr,$18
  !volume,224
  db 72
  !rest
  db 12
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  db 48
  !ds3
  !instr,$19
  !volume,160
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,160
  !instr,$18
  !volume,224
  db 72
  !rest
  db 24
  !f3
  db 6
  !ds3
  db 18
  !rest
  db 72
  !ds3
  !instr,$19
  !volume,160
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,160
  !instr,$18
  !volume,224
  db 72
  !rest
  db 12
  !ds3
  !rest
  !ds3
  !rest
  db 72
  !ds3
  !instr,$19
  !volume,160
  db 48
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  db 48
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  !volume,240
  !d2
  !volume,160
  db 96
  !d2
  db 72
  !tie
  db 48
  !rest
  !loop : dw Sub5C63 : db 5
  !loop : dw Sub5C56 : db 4
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,160
  db 72
  !rest
  !instr,$18
  db 12
  !ds3
  !rest
  !ds3
  !rest
  !ds3
  !rest
  db 48
  !ds3
  !instr,$19
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,160
  db 72
  !rest
  !instr,$18
  db 12
  !f3
  !rest
  db 6
  !ds3
  db 18
  !rest
  db 72
  !ds3
  !instr,$19
  db 96
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,160
  db 72
  !rest
  !instr,$18
  db 6
  !ds3
  db 18
  !rest
  db 6
  !ds3
  db 18
  !rest
  db 72
  !ds3
  !instr,$19
  db 60
  !d2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,160
  db 60
  !d2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,160
  db 24
  !d2
  db 96
  !d2
  db 72
  !tie
  db 48
  !rest
  !loop : dw Sub5C56 : db 4
  !end

Sub5C56:
  db 96
  !d2
  !tie
  !tie
  db 48
  !tie
  !dynamicVolume,48,16
  !tie
  !volume,176
  !end

Sub5C63:
  db 24
  !d2
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !d2
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !d2
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !d2
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !d2
  !d2
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  !end

Track5C92:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,176
  db 48
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !ds2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !ds2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !ds2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !ds2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !e2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !e2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !f2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 60
  !f2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 36
  !f2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 48
  !fs2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 96
  !fs2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 48
  !g2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 60
  !g2
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,176
  db 48
  !g2
  db 24
  !a2
  !a2
  !rest
  !a2
  !rest
  !a2
  !rest
  !a2
  !as2
  !as2
  !rest
  !as2
  !rest
  !as2
  !rest
  !as2
  !b2
  !b2
  !rest
  !b2
  !c3
  !c3
  !rest
  !c3
  !instr,$18
  !volume,224
  !f4
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,224
  db 24
  !e4
  !dynamicVolume,6,16
  db 6
  !tie
  !volume,224
  db 24
  !ds4
  !dynamicVolume,6,16
  db 6
  !tie
  !volume,224
  db 24
  !fs4
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,224
  db 24
  !f4
  !dynamicVolume,6,16
  db 6
  !tie
  !volume,224
  db 24
  !e4
  !dynamicVolume,6,16
  db 6
  !tie
  !volume,224
  !instr,$19
  !volume,160
  db 96
  !d3
  !tie
  !gs2
  !tie
  !d2
  !tie
  !gs2
  !tie
  !loop : dw Sub5C56 : db 4
  !end

Track5D99:
  db 127,$7F
  !transpose,0
  !volume,176
  !instr,$1A
  !pan,8
  !loop : dw Sub5DA8 : db 255
  !end

Sub5DA8:
  !volume,192
  db 36
  !d3
  !volume,144
  !d3
  !volume,160
  !d3
  db 84
  !rest
  !end

Track5DB5:
  db 127,$7F
  !transpose,0
  !volume,176
  !instr,$1A
  !pan,12
  db 5
  !rest
  !loop : dw Sub5DA8 : db 255
  !end

Track5DC6:
  db 127,$7F
  !transpose,0
  !loop : dw Sub5F32 : db 5
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F72 : db 1
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !instr,$1C
  !volume,96
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1C
  !volume,96
  db 48
  !c4
  !instr,$1B
  !volume,128
  db 12
  !c4
  !c4
  !c4
  !rest
  !instr,$1D
  !volume,80
  !fs4
  db 96
  !rest
  db 36
  !tie
  db 12
  !fs4
  !rest
  !instr,$1C
  !volume,96
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !instr,$1B
  !volume,176
  db 12
  !c4
  db 60
  !rest
  !instr,$1D
  !volume,96
  db 12
  !fs4
  !fs4
  !fs4
  db 6
  !fs4
  !fs4
  !instr,$1B
  !volume,176
  db 12
  !c4
  !rest
  db 24
  !c4
  db 120
  !rest
  !instr,$1E
  db 24
  !c4
  !c4
  db 96
  !rest
  db 48
  !tie
  db 24
  !c4
  !c4
  db 96
  !rest
  db 72
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  db 48
  !tie
  db 12
  !c4
  !c4
  !c4
  db 6
  !c4
  !c4
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  db 96
  !rest
  db 24
  !c4
  !c4
  !instr,$1C
  !volume,80
  db 60
  !c4
  !instr,$1E
  !volume,176
  db 12
  !c4
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !instr,$1B
  db 72
  !c4
  !instr,$1E
  !volume,160
  db 66
  !rest
  !volume,144
  db 18
  !c4
  db 12
  !c4
  !c4
  db 6
  !c4
  db 12
  !c4
  db 6
  !c4
  !rest
  !c4
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  db 84
  !rest
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1C
  !volume,96
  db 24
  !c4
  !instr,$1B
  !volume,176
  !c4
  !volume,128
  db 12
  !c4
  !c4
  !instr,$1D
  !volume,80
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  db 84
  !rest
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !c4
  !instr,$1C
  !volume,96
  db 24
  !c4
  !instr,$1D
  !volume,80
  !c4
  !volume,64
  db 12
  !c4
  !c4
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !end

Sub5F32:
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !instr,$1C
  !volume,96
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1C
  !volume,96
  db 24
  !c4
  !instr,$1B
  !volume,176
  !c4
  !volume,128
  db 12
  !c4
  !c4
  !end

Sub5F72:
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !instr,$1C
  !volume,96
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !rest
  !fs4
  !c4
  !instr,$1C
  !volume,96
  db 24
  !c4
  !instr,$1D
  !volume,80
  !c4
  !volume,64
  db 12
  !c4
  !c4
  !end

Track5FAE:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub60C6 : db 1
  !instr,$1D
  !volume,80
  db 24
  !fs4
  !instr,$1B
  !volume,176
  db 12
  !c4
  !instr,$1D
  !volume,80
  !fs4
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1D
  !volume,80
  db 24
  !fs4
  db 12
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1D
  !volume,80
  db 24
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1D
  !volume,80
  !fs4
  !loop : dw Sub60C6 : db 3
  !instr,$1D
  !volume,80
  db 24
  !fs4
  !instr,$1B
  !volume,176
  db 12
  !c4
  !instr,$1D
  !volume,80
  !fs4
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1D
  !volume,80
  db 24
  !fs4
  db 12
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !instr,$1D
  !volume,80
  db 24
  !fs4
  !instr,$1B
  !volume,176
  !c4
  !c4
  !loop : dw Sub60C6 : db 2
  !instr,$1B
  !volume,160
  db 24
  !c4
  db 36
  !c4
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !instr,$1B
  !volume,160
  db 24
  !c4
  !c4
  db 48
  !c4
  db 12
  !c4
  !instr,$1D
  !volume,80
  !fs4
  !instr,$1B
  !volume,160
  db 24
  !c4
  db 12
  !d4
  !instr,$1D
  !volume,80
  !fs4
  db 24
  !fs4
  !instr,$1B
  !volume,160
  !c4
  !c4
  db 48
  !c4
  db 24
  !c4
  !c4
  db 36
  !c4
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !instr,$1B
  !volume,160
  db 24
  !c4
  !c4
  !instr,$1C
  !volume,96
  db 48
  !c4
  !instr,$1B
  !volume,160
  db 12
  !c4
  !instr,$1D
  !volume,80
  !fs4
  db 96
  !rest
  !tie
  !instr,$1C
  !volume,96
  db 72
  !c4
  db 96
  !c4
  db 24
  !rest
  !instr,$1C
  !volume,96
  db 72
  !c4
  !instr,$1B
  !volume,160
  db 48
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  db 6
  !c4
  !c4
  !instr,$1C
  !volume,96
  db 96
  !c4
  !instr,$1E
  !volume,144
  db 24
  !d4
  db 12
  !rest
  db 18
  !d4
  db 12
  !rest
  db 24
  !c4
  db 96
  !rest
  !instr,$1C
  !volume,96
  !c4
  !loop : dw Sub60E8 : db 4
  !loop : dw Sub5F72 : db 1
  !loop : dw Sub5F32 : db 1
  !end

Sub60C6:
  !instr,$1D
  !volume,80
  db 24
  !fs4
  !instr,$1B
  !volume,176
  !c4
  db 12
  !c4
  !instr,$1D
  !volume,80
  !fs4
  db 24
  !fs4
  !fs4
  !instr,$1C
  !volume,96
  db 60
  !c4
  !instr,$1D
  !volume,80
  db 12
  !fs4
  !end

Sub60E8:
  !instr,$1B
  !volume,176
  db 36
  !c4
  !volume,128
  !c4
  !volume,144
  !c4
  db 84
  !rest
  !end

Track60F7:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$18
  !volume,208
  !rest
  db 48
  !tie
  db 96
  !gs3
  !tie
  db 12
  !tie
  db 96
  !rest
  db 84
  !tie
  db 96
  !gs4
  !tie
  db 48
  !tie
  !loop : dw Sub617C : db 9
  !instr,$20
  !volume,176
  db 30
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !b4
  db 6
  !rest
  db 18
  !b4
  db 96
  !rest
  !tie
  !tie
  db 54
  !tie
  db 18
  !b4
  db 6
  !rest
  db 18
  !b4
  db 54
  !rest
  db 12
  !c5
  db 60
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !c5
  db 54
  !rest
  db 18
  !b4
  db 6
  !rest
  db 18
  !b4
  db 96
  !rest
  !tie
  db 78
  !tie
  db 18
  !c5
  db 54
  !rest
  db 18
  !cs5
  db 6
  !rest
  db 18
  !cs5
  db 96
  !rest
  !tie
  db 78
  !tie
  db 18
  !c5
  db 54
  !rest
  db 18
  !b4
  db 6
  !rest
  db 18
  !b4
  db 54
  !rest
  !loop : dw Sub6180 : db 255
  !end

Sub617C:
  db 96
  !rest
  !tie
  !end

Sub6180:
  db 96
  !rest
  !tie
  !end

Track6184:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$20
  !volume,160
  db 96
  !f4
  !tie
  !tie
  !tie
  !ds4
  !tie
  !tie
  db 72
  !tie
  db 24
  !rest
  db 48
  !e4
  db 24
  !rest
  db 96
  !e4
  db 24
  !rest
  db 48
  !f4
  db 24
  !rest
  db 66
  !f4
  db 6
  !rest
  db 42
  !f4
  db 6
  !rest
  db 48
  !fs4
  db 24
  !rest
  db 96
  !fs4
  db 24
  !rest
  db 48
  !g4
  db 24
  !rest
  db 60
  !g4
  db 12
  !rest
  db 48
  !g4
  db 12
  !c5
  !rest
  !c5
  db 36
  !rest
  db 12
  !c5
  db 36
  !rest
  db 12
  !c5
  db 36
  !rest
  db 24
  !c5
  db 12
  !cs5
  !rest
  !cs5
  db 36
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 12
  !cs5
  db 36
  !rest
  db 24
  !cs5
  db 12
  !d5
  db 18
  !rest
  db 6
  !d5
  db 36
  !rest
  db 12
  !d5
  !rest
  !ds5
  db 18
  !rest
  db 6
  !ds5
  db 36
  !rest
  db 12
  !ds5
  !rest
  !loop : dw Sub61FA : db 255
  !end

Sub61FA:
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
