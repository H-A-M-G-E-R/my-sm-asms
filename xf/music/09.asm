asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F7,$B8,$02,$98
  db $19,$FF,$F1,$B8,$02,$98
  db $1A,$FF,$E9,$B8,$02,$99
  db $1B,$FF,$F5,$B8,$02,$7B
  db $1C,$FF,$E0,$B8,$0A,$66
  db $1D,$FF,$E1,$B8,$03,$30
  db $1E,$FF,$F8,$B8,$05,$32
  db $1F,$FF,$E0,$B8,$03,$78
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19_1A_1E,Sample18_19_1A_1E+27
  dw Sample18_19_1A_1E,Sample18_19_1A_1E+27
  dw Sample18_19_1A_1E,Sample18_19_1A_1E+27
  dw Sample1B,Sample1B+1062
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D+1584
  dw Sample18_19_1A_1E,Sample18_19_1A_1E+27
  dw Sample1F,Sample1F+27
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18_19_1A_1E: incbin "Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"
  Sample1B: incbin "Sample_002b224c6729825252e7f39a13633f64.brr"
  Sample1C: incbin "Sample_e252324e422454908ea0de0565f41e0d.brr"
  Sample1D: incbin "Sample_91eb0ad40cbb8edb59d1a8eb274bb61a.brr"
  Sample1F: incbin "Sample_923155b9c5895807692728099ebe975a.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track5881, Track58A1, Track5B76, 0, 0, 0, 0, 0
Pattern5856: dw Track58C2, Track5A03, Track5B98, Track5CB7, Track5ECB, Track5D69, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,52
  !musicVolume,175
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !dynamicEcho,128,52,52
  !end

Track5881:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,8
  !volume,144
  db 16
  !e5
  !e5
  !e5
  !d5
  !e5
  !f5
  db 96
  !rest
  db 16
  !e5
  !e5
  !e5
  !d5
  !e5
  !f5
  !a5
  !gs5
  !rest
  db 48
  !rest
  !end

Track58A1:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,12
  !volume,80
  db 16
  !rest
  !e5
  !e5
  !e5
  !d5
  !e5
  !f5
  db 96
  !rest
  db 16
  !e5
  !e5
  !e5
  !d5
  !e5
  !f5
  !a5
  !gs5
  !rest
  db 48
  !rest
  !end

Track58C2:
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !dynamicEcho,128,52,52
  !instr,$19
  !pan,9
  !volume,120
  db 48
  !rest
  db 24
  !e6
  !ds6
  db 96
  !rest
  db 48
  !tie
  db 24
  !g5
  !f5
  db 96
  !rest
  db 48
  !tie
  db 24
  !e6
  !ds6
  db 48
  !rest
  db 24
  !g5
  !f5
  db 48
  !rest
  !pan,10
  db 24
  !c5
  !b4
  db 16
  !as4
  !b4
  !c5
  !f4
  !g4
  !gs4
  !b4
  !c5
  !d5
  !instr,$1A
  db 48
  !gs5
  !instr,$19
  db 16
  !rest
  !f5
  !gs5
  !b5
  !c6
  !d6
  !instr,$1A
  db 48
  !c6
  !instr,$19
  db 16
  !rest
  !a5
  !c6
  db 24
  !d6
  !rest
  db 16
  !d6
  !a5
  !d6
  !b5
  !c6
  !d6
  !instr,$1A
  db 48
  !gs6
  !instr,$19
  db 16
  !rest
  !f6
  !gs6
  !b6
  !c7
  !d7
  !instr,$1A
  db 48
  !c7
  !instr,$19
  db 16
  !rest
  !a6
  !c7
  !d7
  db 32
  !rest
  db 16
  !d7
  !a6
  !d7
  !instr,$1A
  db 96
  !e7
  !tie
  !rest
  !tie
  !instr,$19
  !pan,9
  !volume,112
  db 24
  !g5
  !rest
  !c5
  !rest
  !instr,$1A
  db 64
  !cs5
  !instr,$19
  db 16
  !fs5
  !gs5
  !g5
  !c5
  !g5
  !f5
  !cs5
  !gs4
  !cs5
  !f5
  !gs5
  !cs6
  !f6
  !gs6
  !instr,$1A
  !volume,96
  db 96
  !as6
  !tie
  !volume,112
  !instr,$19
  db 16
  !ds6
  !b5
  !ds6
  !instr,$1A
  db 72
  !d6
  db 24
  !rest
  !d6
  !ds6
  db 48
  !rest
  db 96
  !e6
  db 48
  !b5
  !instr,$19
  db 24
  !as5
  !rest
  !instr,$1A
  db 72
  !fs6
  db 24
  !rest
  !instr,$19
  db 16
  !fs5
  !rest
  !gs5
  !instr,$1A
  db 96
  !a5
  !fs5
  db 24
  !gs5
  !rest
  db 72
  !e6
  db 24
  !rest
  !instr,$18
  db 16
  !b5
  !b5
  !instr,$19
  !b5
  !instr,$1A
  db 120
  !c6
  db 24
  !rest
  !instr,$19
  db 16
  !c6
  !a5
  !c6
  !instr,$1A
  db 96
  !d6
  db 48
  !rest
  !instr,$19
  db 12
  !a5
  db 24
  !rest
  db 12
  !b5
  !instr,$1A
  db 90
  !c6
  db 6
  !rest
  db 24
  !c6
  !rest
  !instr,$19
  db 16
  !c6
  !gs5
  !c6
  !instr,$1A
  db 96
  !d6
  !instr,$18
  db 32
  !rest
  db 16
  !d6
  !instr,$19
  !d6
  !c6
  !d6
  !instr,$1A
  db 96
  !e6
  !tie
  !fs5
  db 48
  !rest
  !instr,$19
  db 16
  !fs5
  !fs5
  !fs5
  !instr,$1A
  db 96
  !g5
  db 48
  !rest
  !instr,$19
  !volume,96
  db 16
  !g5
  !g5
  !g5
  !a5
  !loop : dw Sub59FF : db 255
  !end

Sub59FF:
  db 96
  !rest
  !tie
  !end

Track5A03:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,10
  !volume,208
  db 16
  !e4
  !e4
  !e4
  db 96
  !rest
  db 48
  !tie
  db 16
  !e4
  !e4
  !e4
  db 96
  !rest
  db 48
  !tie
  db 16
  !e4
  !e4
  !e4
  db 48
  !rest
  db 16
  !e4
  !e4
  !e4
  db 48
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 32
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  db 24
  !e4
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !f4
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !e4
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !f4
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !a4
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  db 16
  !a4
  !a4
  !a4
  db 12
  !a5
  !rest
  !e5
  !rest
  db 18
  !a4
  db 6
  !rest
  db 24
  !a3
  db 48
  !rest
  db 16
  !c5
  db 32
  !rest
  db 16
  !c5
  !c5
  !c5
  db 12
  !c5
  !rest
  !c5
  db 36
  !rest
  db 12
  !c5
  !rest
  db 16
  !c5
  db 32
  !rest
  db 16
  !c5
  !c5
  !c5
  db 12
  !c5
  !rest
  !c5
  db 36
  !rest
  db 12
  !c5
  !rest
  db 16
  !ds4
  db 32
  !rest
  db 16
  !ds4
  !ds4
  !ds4
  db 12
  !ds4
  !rest
  !ds4
  db 60
  !rest
  db 16
  !ds4
  db 32
  !rest
  db 16
  !ds4
  !ds4
  !ds4
  db 12
  !ds4
  !rest
  !ds4
  !rest
  db 16
  !ds4
  !ds4
  !ds4
  db 12
  !e4
  !rest
  !e4
  db 36
  !rest
  db 12
  !e4
  db 36
  !rest
  db 12
  !e4
  db 36
  !rest
  db 12
  !e4
  !rest
  !e4
  !rest
  !e4
  db 36
  !rest
  db 12
  !e4
  db 36
  !rest
  db 12
  !e4
  db 36
  !rest
  db 12
  !e4
  !rest
  !ds4
  !rest
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  !rest
  !d4
  !rest
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  db 12
  !d4
  !rest
  !d4
  !rest
  !d4
  !rest
  !d4
  !rest
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !ds4
  !rest
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  db 36
  !rest
  db 12
  !ds4
  !rest
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !dynamicVolume,160,224
  !c4
  !rest
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Track5B76:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !pan,10
  db 96
  !rest
  !volume,128
  db 16
  !c4
  !c4
  !volume,160
  !c4
  !c4
  !c4
  !rest
  db 96
  !rest
  db 48
  !tie
  !volume,128
  db 16
  !c4
  !c4
  !volume,160
  !c4
  !end

Track5B98:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !pan,10
  db 96
  !rest
  db 48
  !tie
  !volume,128
  db 16
  !c4
  !c4
  !volume,160
  !c4
  db 96
  !rest
  !volume,128
  db 16
  !c4
  !c4
  !volume,160
  !c4
  !volume,128
  !c4
  !c4
  !volume,160
  !c4
  !volume,128
  !c4
  !c4
  !volume,160
  !c4
  db 48
  !rest
  !volume,128
  db 16
  !c4
  !c4
  !volume,160
  !c4
  !volume,128
  !c4
  !c4
  !rest
  !instr,$18
  !pan,8
  !volume,144
  db 48
  !rest
  db 12
  !a4
  !rest
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !rest
  !f4
  !f4
  !instr,$1D
  !volume,112
  !pan,10
  db 48
  !rest
  db 16
  !e4
  !gs4
  !b4
  db 96
  !d5
  !c5
  !rest
  !instr,$1A
  !volume,96
  !pan,12
  !e5
  !tie
  !pan,8
  !f5
  !tie
  !instr,$19
  !volume,128
  !pan,6
  !dynamicPan,192,12
  db 24
  !rest
  db 12
  !a4
  !b4
  !cs5
  !d5
  !e5
  !fs5
  !gs5
  !a5
  !b5
  !cs6
  !d6
  !e6
  !fs6
  !gs6
  !dynamicPan,48,8
  !instr,$1E
  !e6
  !ds6
  !cs6
  !instr,$18
  !b6
  !a6
  db 96
  !rest
  db 36
  !tie
  !instr,$1A
  !volume,208
  !pan,12
  db 96
  !c3
  !tie
  !pan,8
  !c3
  !tie
  !pan,10
  !instr,$19
  !volume,160
  db 24
  !as5
  !rest
  !ds5
  !rest
  !instr,$1A
  db 64
  !e5
  db 16
  !a5
  !b5
  !instr,$1D
  !volume,96
  !pan,10
  db 96
  !as5
  !b5
  !instr,$1A
  !volume,208
  !pan,12
  !e3
  !tie
  !pan,8
  !e3
  !tie
  !pan,12
  !ds3
  !tie
  !volume,160
  !pan,8
  !d3
  !tie
  db 48
  !rest
  !instr,$1D
  !volume,112
  !pan,10
  db 16
  !f5
  !c5
  !f5
  db 96
  !a5
  !g5
  db 72
  !tie
  db 24
  !rest
  db 96
  !ds5
  db 72
  !tie
  db 24
  !rest
  db 96
  !f5
  db 72
  !tie
  db 24
  !rest
  !volume,128
  db 120
  !g5
  db 24
  !rest
  db 16
  !g5
  !e5
  !c5
  db 120
  !a5
  db 24
  !rest
  db 16
  !a5
  !c5
  !a5
  db 120
  !as5
  db 24
  !rest
  db 16
  !as5
  !as5
  !rest
  db 24
  !c6
  !rest
  !instr,$18
  !dynamicVolume,127,160
  db 16
  !a6
  !a6
  !a6
  !a6
  !a6
  !a6
  !a6
  !a6
  !a6
  !end

Track5CB7:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,11
  !volume,80
  db 48
  !rest
  db 16
  !rest
  db 24
  !e6
  !ds6
  db 96
  !rest
  db 48
  !tie
  db 24
  !g5
  !f5
  db 96
  !rest
  db 48
  !tie
  db 24
  !e6
  !ds6
  db 48
  !rest
  db 24
  !g5
  !f5
  db 32
  !rest
  !pan,12
  !instr,$1A
  !volume,64
  !dynamicVolume,96,112
  db 96
  !b5
  db 48
  !tie
  !instr,$18
  !volume,96
  db 16
  !b5
  !e6
  !rest
  !b4
  !e5
  !rest
  db 96
  !rest
  db 16
  !c6
  !f6
  !rest
  !c5
  !f5
  !rest
  !c5
  !f5
  !rest
  !f5
  !f5
  !rest
  !instr,$19
  db 48
  !rest
  db 16
  !e5
  !gs5
  !b5
  !instr,$1A
  db 96
  !d6
  !instr,$19
  db 16
  !c6
  !f5
  !c6
  !f6
  !c6
  !f5
  !c5
  !f4
  !c5
  !f5
  !c6
  !f6
  !instr,$1A
  db 96
  !a5
  !tie
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,96
  !rest
  !instr,$1D
  !volume,96
  !pan,11
  db 96
  !g5
  !fs5
  !g5
  !gs5
  !as5
  !a5
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
  !instr,$1A
  !volume,208
  !pan,12
  !c3
  !tie
  !pan,8
  !c3
  !tie
  !pan,12
  !ds3
  !tie
  !pan,8
  !ds3
  !tie
  !pan,12
  !c3
  !tie
  !pan,8
  !c3
  !tie
  !pan,12
  !c3
  !tie
  !pan,8
  !c3
  !tie
  !end

Track5D69:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$1C
  !pan,10
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !rest
  !c4
  !rest
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !rest
  !c4
  !rest
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !rest
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !rest
  db 24
  !rest
  db 12
  !c4
  !rest
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  !volume,111
  db 12
  !c4
  !rest
  !c4
  !rest
  !c4
  db 60
  !rest
  db 12
  !c4
  !rest
  !volume,111
  db 16
  !c4
  !c4
  !volume,159
  !c4
  db 96
  !rest
  !tie
  !instr,$19
  !volume,80
  !pan,11
  db 16
  !rest
  db 24
  !g5
  !rest
  !c5
  !rest
  !instr,$1A
  db 64
  !cs5
  !instr,$19
  db 16
  !fs5
  !gs5
  !g5
  !c5
  !g5
  !f5
  !cs5
  !gs4
  !cs5
  !f5
  !gs5
  !cs6
  !f6
  !gs6
  !instr,$1A
  !volume,64
  db 96
  !as6
  !tie
  !volume,80
  !instr,$19
  db 16
  !ds6
  !b5
  !ds6
  !instr,$1A
  db 72
  !d6
  db 24
  !rest
  !d6
  !ds6
  db 48
  !rest
  db 96
  !e6
  db 48
  !b5
  !instr,$19
  db 24
  !as5
  !rest
  !instr,$1A
  db 72
  !fs6
  db 24
  !rest
  !instr,$19
  db 16
  !fs5
  !rest
  !gs5
  !instr,$1A
  db 96
  !a5
  !fs5
  db 24
  !gs5
  !rest
  db 72
  !e6
  db 24
  !rest
  !instr,$18
  db 16
  !b5
  !b5
  !instr,$19
  !b5
  !instr,$1A
  db 120
  !c6
  db 24
  !rest
  !instr,$19
  db 16
  !c6
  !a5
  !c6
  !instr,$1A
  db 96
  !d6
  db 48
  !rest
  !instr,$19
  db 12
  !a5
  db 24
  !rest
  db 12
  !b5
  !instr,$1A
  db 90
  !c6
  db 6
  !rest
  db 24
  !c6
  !rest
  !instr,$19
  db 16
  !c6
  !gs5
  !c6
  !instr,$1A
  db 96
  !d6
  !instr,$18
  db 32
  !rest
  db 16
  !d6
  !instr,$19
  !d6
  !c6
  !d6
  !instr,$1A
  db 96
  !e6
  !tie
  !fs5
  db 48
  !rest
  !instr,$19
  db 16
  !fs5
  !fs5
  !fs5
  !instr,$1A
  db 96
  !g5
  db 48
  !rest
  !instr,$19
  db 16
  !g5
  !g5
  !g5
  !a5
  !loop : dw Sub59FF : db 255
  !end

Track5ECB:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !pan,10
  !volume,96
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !e4
  db 48
  !tie
  db 96
  !gs5
  !tie
  !a5
  !tie
  !rest
  !gs6
  !a5
  !tie
  !a5
  !tie
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
  !g5
  !tie
  !fs5
  db 48
  !tie
  !rest
  db 96
  !fs5
  !tie
  !gs5
  !tie
  !f5
  !tie
  !g5
  !tie
  db 90
  !ds5
  db 6
  !rest
  db 24
  !ds5
  !rest
  db 16
  !ds5
  !ds5
  !rest
  db 72
  !f5
  db 24
  !rest
  !f5
  !rest
  !f5
  !rest
  db 96
  !c6
  db 48
  !rest
  db 16
  !c6
  !c6
  !c6
  db 96
  !d6
  db 48
  !rest
  db 16
  !d6
  !d6
  !d6
  db 96
  !ds6
  db 48
  !rest
  db 16
  !ds6
  !ds6
  !ds6
  !volume,80
  db 18
  !f6
  db 30
  !rest
  db 16
  !f7
  !f7
  !f7
  !f7
  !f7
  !f7
  !f7
  !f7
  !f7
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
