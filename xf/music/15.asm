asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Sector 3 depths

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$05,$FE
  db $19,$FF,$E0,$B8,$02,$B8
  db $1A,$FF,$E0,$B8,$05,$70
  db $1B,$FF,$E0,$B8,$02,$7A
  db $1C,$FF,$E0,$B8,$01,$4C
  db $1D,$FF,$E0,$B8,$02,$99
  db $1E,$FA,$EA,$B8,$04,$F4
  db $1F,$FF,$E0,$B8,$05,$70
  db $20,$FF,$E0,$B8,$05,$70
  db $21,$FF,$F2,$B8,$05,$70
  db $22,$FF,$F2,$B8,$03,$40
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19_1A_1F_20_21,Sample19_1A_1F_20_21
  dw Sample19_1A_1F_20_21,Sample19_1A_1F_20_21
  dw Sample1B_1E,Sample1B_1E+45
  dw Sample1C,Sample1C+27
  dw Sample1D,Sample1D+3717
  dw Sample1B_1E,Sample1B_1E+45
  dw Sample19_1A_1F_20_21,Sample19_1A_1F_20_21
  dw Sample19_1A_1F_20_21,Sample19_1A_1F_20_21
  dw Sample19_1A_1F_20_21,Sample19_1A_1F_20_21
  dw Sample22,Sample22
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_153af0a14dfa01b26538333fd4f5e4c1.brr")
  Sample19_1A_1F_20_21: skip filesize("Sample_0b39d7122c124a818f41f92a03061323.brr")
  Sample1B_1E: skip filesize("Sample_70088be2c42db8f26aa5a6014a2e9398.brr")
  Sample1C: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1D: skip filesize("Sample_b649c95c8307da16268e475b83060216.brr")
  Sample22: skip filesize("Sample_2822bad39b87fb8c53e54a49b8a625f0.brr")
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
Pattern5846: dw Track5881, Track5AD1, Track5C27, Track597F, Track5A46, 0, 0, 0
Pattern5856: dw Track5D49, Track5F33, Track58A6, Track5AEF, Track5C46, Track59BF, Track5A7A, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,51
  !musicVolume,192
  !echo,%00011011,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !end

Track5881:
  db 127,$7F
  !transpose,0
  !instr,$18
  !loop : dw Sub588C : db 2
  !end

Sub588C:
  !pan,6
  !dynamicPan,192,9
  !volume,48
  !dynamicVolume,192,112
  db 96
  !c4
  !tie
  db 24
  !cs4
  !dynamicVolume,24,16
  !tie
  !volume,48
  db 96
  !rest
  db 48
  !tie
  !end

Track58A6:
  db 127,$7F
  !transpose,0
  !instr,$18
  !loop : dw Sub588C : db 4
  !loop : dw Sub5945 : db 4
  !loop : dw Sub5962 : db 4
  !volume,112
  !endVibrato
  !pan,6
  !dynamicPan,192,9
  db 96
  !a3
  !tie
  !pan,14
  !dynamicPan,192,11
  !as3
  !tie
  !pan,6
  !dynamicPan,192,9
  !a3
  !tie
  !pan,14
  !dynamicPan,192,11
  !as3
  !c4
  !pan,6
  !dynamicPan,192,9
  !a3
  !tie
  !pan,14
  !dynamicPan,192,11
  !as3
  !tie
  !pan,6
  !dynamicPan,192,9
  !a3
  !tie
  !pan,14
  !dynamicPan,192,11
  !as3
  !tie
  !pan,6
  !dynamicPan,192,9
  !c4
  !tie
  !pan,14
  !dynamicPan,192,11
  !cs4
  !tie
  !pan,6
  !dynamicPan,192,9
  !c4
  !tie
  !pan,14
  !dynamicPan,192,11
  !cs4
  !tie
  !pan,6
  !dynamicPan,192,9
  !ds4
  !tie
  !pan,14
  !dynamicPan,192,11
  !e4
  !tie
  !pan,6
  !dynamicPan,192,9
  !ds4
  !tie
  !pan,14
  !dynamicPan,192,11
  !e4
  !tie
  !pan,14
  !dynamicPan,192,11
  !volume,48
  !dynamicVolume,192,112
  !c4
  !tie
  db 24
  !cs4
  !dynamicVolume,24,16
  !tie
  !volume,48
  db 96
  !rest
  db 48
  !tie
  !end

Sub5945:
  !pan,14
  !dynamicPan,192,11
  !volume,48
  !dynamicVolume,192,112
  db 96
  !ds4
  !tie
  !pan,8
  !volume,208
  db 48
  !e3
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,208
  db 48
  !rest
  !end

Sub5962:
  !pan,6
  !dynamicPan,192,9
  !volume,48
  !dynamicVolume,192,112
  db 96
  !fs4
  !tie
  !pan,8
  !volume,208
  db 48
  !g3
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,208
  db 48
  !rest
  !end

Track597F:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !rest
  !tie
  !echo,%00011011,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !instr,$19
  !pan,10
  !loop : dw Sub599D : db 1
  !end

Sub599D:
  !volume,191
  !pan,8
  db 48
  !c4
  !volume,128
  !c4
  !volume,175
  !pan,12
  !c4
  !volume,112
  !c4
  !volume,191
  !pan,8
  !cs4
  !volume,128
  !cs4
  !volume,175
  !pan,12
  !cs4
  !volume,112
  !cs4
  !end

Track59BF:
  db 127,$7F
  !transpose,0
  !echo,%00101111,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !instr,$19
  !pan,10
  !loop : dw Sub599D : db 4
  !transpose,3
  !loop : dw Sub599D : db 4
  !transpose,6
  !loop : dw Sub599D : db 4
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !echo,%00101111,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !transpose,0
  !loop : dw Sub5A24 : db 2
  !echo,%00101111,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !loop : dw Sub5A24 : db 2
  !echo,%00101111,47,47
  !echoParameters,2,16,0
  !dynamicEcho,128,52,52
  !loop : dw Sub5A24 : db 2
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Sub5A24:
  !volume,159
  !pan,8
  db 48
  !f4
  !volume,128
  !f4
  !volume,175
  !pan,12
  !f4
  !volume,112
  !f4
  !volume,159
  !pan,8
  !fs4
  !volume,128
  !fs4
  !volume,175
  !pan,12
  !fs4
  !volume,112
  !fs4
  !end

Track5A46:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$19
  !pan,10
  !loop : dw Sub5A58 : db 1
  !end

Sub5A58:
  !volume,191
  !pan,8
  db 48
  !c3
  !volume,128
  !c3
  !volume,175
  !pan,12
  !c3
  !volume,112
  !c3
  !volume,191
  !pan,8
  !cs3
  !volume,128
  !cs3
  !volume,175
  !pan,12
  !cs3
  !volume,112
  !cs3
  !end

Track5A7A:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,10
  !loop : dw Sub5A58 : db 4
  !transpose,3
  !loop : dw Sub5A58 : db 4
  !transpose,6
  !loop : dw Sub5A58 : db 4
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !transpose,0
  !loop : dw Sub5AAF : db 2
  !loop : dw Sub5AAF : db 2
  !loop : dw Sub5AAF : db 2
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Sub5AAF:
  !volume,159
  !pan,8
  db 48
  !f3
  !volume,128
  !f3
  !volume,175
  !pan,12
  !f3
  !volume,112
  !f3
  !volume,159
  !pan,8
  !fs3
  !volume,128
  !fs3
  !volume,175
  !pan,12
  !fs3
  !volume,112
  !fs3
  !end

Track5AD1:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,12
  !volume,208
  !loop : dw Sub5AE0 : db 2
  !end

Sub5AE0:
  db 96
  !rest
  !tie
  db 48
  !cs3
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,208
  db 48
  !rest
  !end

Track5AEF:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,12
  !volume,208
  !loop : dw Sub5AE0 : db 4
  !instr,$1B
  !pan,6
  !volume,128
  !loop : dw Sub5BFE : db 4
  !transpose,3
  !volume,144
  !loop : dw Sub5BFE : db 4
  !instr,$19
  !pan,10
  !transpose,0
  !pan,10
  !volume,191
  db 48
  !a4
  !rest
  !volume,128
  !pan,8
  !f4
  !pan,12
  !e4
  !pan,10
  !volume,191
  !f4
  !rest
  !volume,128
  !pan,8
  !d4
  !pan,12
  !e4
  !pan,10
  !volume,191
  !a4
  !rest
  !volume,128
  !pan,8
  !f4
  !pan,12
  !e4
  !pan,10
  !volume,191
  !f4
  !rest
  !volume,128
  !pan,8
  !d4
  !pan,12
  !e4
  !instr,$1E
  !transpose,0
  !volume,112
  !pan,10
  !cs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !as3
  db 48
  !a3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !as3
  db 48
  !d4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 120
  !rest
  db 48
  !cs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !as3
  db 48
  !a3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !as3
  db 48
  !a3
  !as3
  !c4
  !e4
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 120
  !rest
  db 48
  !f4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 120
  !rest
  db 48
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !cs4
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !cs4
  db 48
  !c4
  !cs4
  !ds4
  !g4
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !e4
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !e4
  db 48
  !gs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 120
  !rest
  db 48
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !e4
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  !e4
  db 48
  !ds4
  !e4
  !fs4
  !as4
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Sub5BFE:
  db 48
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !gs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !gs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  !end

Track5C27:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !pan,10
  !volume,160
  !loop : dw Sub5C36 : db 2
  !end

Sub5C36:
  db 96
  !c4
  !tie
  db 24
  !cs4
  !dynamicVolume,24,16
  !tie
  !volume,160
  db 96
  !rest
  db 48
  !tie
  !end

Track5C46:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !pan,10
  !volume,160
  !loop : dw Sub5C36 : db 4
  !instr,$1B
  !pan,14
  !volume,128
  !loop : dw Sub5D20 : db 4
  !transpose,3
  !volume,144
  !loop : dw Sub5D20 : db 4
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1E
  !transpose,252
  !volume,128
  !pan,10
  db 48
  !cs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !as3
  db 48
  !a3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !as3
  db 48
  !d4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  db 120
  !rest
  db 48
  !cs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !as3
  db 48
  !a3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !as3
  db 48
  !a3
  !as3
  !c4
  !e4
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  db 120
  !rest
  db 48
  !f4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  db 120
  !rest
  db 48
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !cs4
  db 48
  !c4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !cs4
  db 48
  !c4
  !cs4
  !ds4
  !g4
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !e4
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !e4
  db 48
  !gs4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  db 120
  !rest
  db 48
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !e4
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !e4
  db 48
  !ds4
  !e4
  !fs4
  !as4
  !dynamicVolume,48,16
  !tie
  !volume,128
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Sub5D20:
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !ds4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  db 48
  !e4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !rest
  !end

Track5D49:
  db 127,$7F
  !transpose,0
  !endVibrato
  !instr,$1C
  !pan,8
  !volume,128
  !vibrato,0,18,47
  !loop : dw Sub5EA2 : db 1
  !transpose,3
  !pan,12
  !volume,137
  !loop : dw Sub5EA2 : db 1
  !transpose,6
  !pan,8
  !loop : dw Sub5EA2 : db 1
  !transpose,0
  !dynamicVolume,176,96
  !pan,8
  db 24
  !a5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,12
  !g5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,6
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,14
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,8
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,12
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,6
  !d5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,14
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,8
  !a5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,12
  !g5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,6
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,14
  !g5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,8
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,12
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,6
  !d5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !pan,14
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,137
  !instr,$1D
  !volume,112
  db 96
  !rest
  !tie
  !pan,6
  db 36
  !a4
  db 12
  !rest
  !pan,14
  db 36
  !as4
  db 12
  !rest
  !pan,6
  db 36
  !c5
  db 12
  !rest
  !pan,14
  db 36
  !as4
  db 12
  !rest
  !pan,6
  !dynamicPan,192,9
  db 60
  !a4
  !dynamicVolume,60,16
  !tie
  !volume,112
  db 72
  !rest
  db 96
  !rest
  !tie
  !rest
  !tie
  !pan,6
  db 36
  !c5
  db 12
  !rest
  !pan,14
  db 36
  !cs5
  db 12
  !rest
  !pan,6
  db 36
  !e5
  db 12
  !rest
  !pan,14
  db 36
  !cs5
  db 12
  !rest
  !pan,6
  !dynamicPan,192,9
  db 60
  !c5
  !dynamicVolume,60,16
  !tie
  !volume,112
  db 72
  !rest
  db 96
  !rest
  !tie
  !rest
  !tie
  !pan,6
  db 36
  !ds5
  db 12
  !rest
  db 36
  !e5
  db 12
  !rest
  !pan,6
  db 36
  !fs5
  db 12
  !rest
  !pan,14
  db 36
  !e5
  db 12
  !rest
  !pan,6
  !dynamicPan,192,9
  db 60
  !ds5
  !dynamicVolume,60,16
  !tie
  !volume,112
  db 72
  !rest
  db 96
  !rest
  !tie
  !instr,$1D
  !pan,10
  !volume,160
  !transpose,0
  !c4
  !tie
  db 24
  !cs4
  !dynamicVolume,24,16
  !tie
  !volume,160
  db 96
  !rest
  db 48
  !tie
  !end

Sub5EA2:
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !cs6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !ds6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  !cs6
  db 4
  !rest
  db 12
  !as5
  db 4
  !rest
  db 12
  !cs6
  db 4
  !rest
  db 72
  !c6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  db 72
  !rest
  db 96
  !rest
  !tie
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !cs6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !ds6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  !ds6
  db 4
  !rest
  db 12
  !ds6
  db 4
  !rest
  db 12
  !f6
  db 4
  !rest
  db 72
  !c6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  db 72
  !rest
  db 96
  !rest
  !tie
  !end

Track5F33:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !pan,12
  !volume,128
  !transpose,251
  !vibrato,0,18,47
  !loop : dw Sub5FE6 : db 1
  !transpose,254
  !pan,8
  !volume,137
  !loop : dw Sub5FE6 : db 1
  !transpose,1
  !pan,12
  !loop : dw Sub5FE6 : db 1
  !transpose,0
  !pan,10
  !volume,80
  db 48
  !a6
  !g6
  !f6
  !e6
  !f6
  !e6
  !d6
  !e6
  !a6
  !g6
  !f6
  !g6
  !f6
  !e6
  !d6
  !e6
  !volume,144
  db 96
  !rest
  !tie
  db 36
  !a5
  db 12
  !rest
  db 36
  !as5
  db 12
  !rest
  db 36
  !c6
  db 12
  !rest
  db 36
  !as5
  db 12
  !rest
  db 36
  !a5
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,144
  db 96
  !rest
  !rest
  !tie
  !rest
  !tie
  db 36
  !c6
  db 12
  !rest
  db 36
  !cs6
  db 12
  !rest
  db 36
  !e6
  db 12
  !rest
  db 36
  !cs6
  db 12
  !rest
  db 36
  !c6
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,144
  db 96
  !rest
  !rest
  !tie
  !rest
  !tie
  db 36
  !ds6
  db 12
  !rest
  db 36
  !e6
  db 12
  !rest
  db 36
  !fs6
  db 12
  !rest
  db 36
  !e6
  db 12
  !rest
  db 36
  !ds6
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,144
  db 96
  !rest
  !rest
  !tie
  !instr,$18
  !pan,8
  !volume,208
  !transpose,0
  !rest
  !tie
  db 48
  !cs3
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,208
  db 48
  !rest
  !end

Sub5FE6:
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !cs6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !ds6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  !cs6
  db 4
  !rest
  db 12
  !as5
  db 4
  !rest
  db 12
  !cs6
  db 4
  !rest
  db 72
  !c6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  db 72
  !rest
  db 96
  !rest
  !tie
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,36,16
  !tie
  !volume,128
  db 24
  !as5
  db 36
  !c6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !cs6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  db 36
  !ds6
  !dynamicVolume,12,16
  db 12
  !tie
  !volume,128
  !ds6
  db 4
  !rest
  db 12
  !ds6
  db 4
  !rest
  db 12
  !f6
  db 4
  !rest
  db 72
  !c6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  db 72
  !rest
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 15: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
