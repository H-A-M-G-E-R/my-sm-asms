asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FE,$E7,$B8,$01,$3D
  db $19,$FF,$E0,$B8,$01,$3D
  db $1A,$FF,$E0,$B8,$01,$4C
  db $1B,$FF,$E5,$B8,$02,$7B
  db $1C,$FA,$E6,$B8,$01,$3D
  db $1D,$FD,$F2,$B8,$02,$00
  db $1E,$FF,$F0,$B8,$07,$80
  db $1F,$FF,$F0,$B8,$0A,$66
  db $20,$FF,$E0,$B8,$02,$7B
  db $21,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_1C,Sample18_1C+18
  dw Sample19,Sample19+81
  dw Sample1A,Sample1A+27
  dw Sample1B_20,Sample1B_20+1062
  dw Sample18_1C,Sample18_1C+18
  dw Sample1D,Sample1D+1809
  dw Sample1E,Sample1E+513
  dw Sample1F,Sample1F
  dw Sample1B_20,Sample1B_20+1062
  dw Sample21,Sample21+18
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18_1C: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample19: skip filesize("Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr")
  Sample1A: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1B_20: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1D: skip filesize("Sample_88532f336dd55c900a0a826201019b57.brr")
  Sample1E: skip filesize("Sample_441d4eac476cad49850f2c9cc81a9aec.brr")
  Sample1F: skip filesize("Sample_e252324e422454908ea0de0565f41e0d.brr")
  Sample21: skip filesize("Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track5952, Track5A30, Track5B03, Track5C88, Track5DE1, 0, 0
Pattern5856: dw Track5971, Track5895, Track5A46, Track5B19, Track5CB7, Track5DF4, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,44
  !musicVolume,176
  !echo,%00111111,47,47
  !echoParameters,2,0,6
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,130
  db 96
  !rest
  !e6
  db 48
  !b5
  db 30
  !as5
  db 18
  !rest
  db 96
  !fs6
  db 48
  !fs5
  !end

Track5895:
  !echo,%00111111,47,47
  !echoParameters,2,0,6
  !instr,$18
  !pan,10
  !volume,96
  !dynamicVolume,176,120
  db 96
  !b6
  !tie
  !dynamicVolume,144,96
  !as6
  db 48
  !tie
  !volume,146
  db 96
  !rest
  !e6
  !volume,146
  db 48
  !b5
  db 30
  !as5
  db 18
  !rest
  db 96
  !fs6
  db 48
  !fs5
  !volume,96
  !dynamicVolume,176,120
  db 96
  !b6
  !tie
  !dynamicVolume,144,96
  !cs7
  db 48
  !tie
  !volume,130
  db 96
  !rest
  !d6
  db 48
  !g5
  !volume,96
  !dynamicVolume,144,130
  db 96
  !cs6
  db 48
  !rest
  db 16
  !cs6
  !d6
  !e6
  db 96
  !d6
  !tie
  !volume,112
  !dynamicVolume,144,130
  db 120
  !e6
  db 24
  !rest
  db 16
  !e6
  !d6
  !e6
  !dynamicVolume,192,114
  db 96
  !fs6
  !tie
  !instr,$19
  !volume,128
  !b5
  !tie
  !dynamicVolume,176,112
  !b5
  !tie
  !b5
  !tie
  !instr,$18
  !ds6
  !tie
  !dynamicVolume,144,112
  !f6
  !tie
  !ds6
  !tie
  !cs6
  !tie
  !e5
  !tie
  !dynamicVolume,112,130
  !fs5
  db 90
  !tie
  db 6
  !rest
  db 96
  !gs5
  !tie
  !as5
  db 48
  !tie
  !rest
  !volume,112
  db 96
  !e6
  !tie
  !volume,144
  !fs6
  !tie
  !dynamicVolume,112,130
  !g6
  db 42
  !tie
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 120
  !a6
  db 24
  !rest
  db 36
  !a6
  db 60
  !rest
  !volume,130
  db 96
  !e6
  db 48
  !b5
  db 24
  !as5
  !rest
  db 96
  !fs6
  db 48
  !fs5
  !end

Track5952:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  db 48
  !rest
  !volume,80
  !dynamicVolume,160,176
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,80
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !end

Track5971:
  !instr,$18
  !pan,10
  !volume,128
  !dynamicVolume,160,176
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,80
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,176
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,80
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,176
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,80
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !instr,$1B
  !volume,224
  db 96
  !g4
  db 48
  !tie
  !rest
  db 96
  !g4
  db 48
  !tie
  !g4
  db 96
  !g4
  db 24
  !g4
  db 96
  !rest
  !tie
  db 72
  !tie
  !instr,$19
  !volume,112
  !pan,8
  db 96
  !fs6
  !tie
  !gs6
  !tie
  !fs6
  !tie
  !f6
  !tie
  !instr,$20
  !volume,224
  !pan,10
  !b4
  !tie
  !tie
  db 48
  !tie
  db 24
  !rest
  !fs4
  db 96
  !b3
  !tie
  !tie
  db 48
  !tie
  db 24
  !rest
  db 18
  !b4
  db 6
  !rest
  db 96
  !e4
  !volume,192
  !e5
  !tie
  !tie
  !volume,240
  db 24
  !e4
  db 48
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  db 24
  !e4
  db 18
  !e4
  !e4
  db 36
  !e4
  db 48
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !c4
  !c4
  !c4
  !instr,$18
  !volume,64
  !dynamicVolume,160,176
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,160,128
  db 96
  !e4
  db 90
  !tie
  db 6
  !rest
  !end

Track5A30:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,12
  !volume,64
  db 96
  !rest
  !tie
  db 48
  !tie
  !dynamicVolume,176,128
  db 96
  !cs6
  !tie
  !end

Track5A46:
  !instr,$1A
  !pan,12
  !volume,128
  !dynamicVolume,176,96
  db 96
  !b5
  !tie
  !dynamicVolume,176,64
  !as5
  !tie
  !rest
  !tie
  !dynamicVolume,176,128
  !cs6
  !tie
  !dynamicVolume,176,96
  !b5
  !tie
  !dynamicVolume,176,64
  !as5
  !tie
  !instr,$18
  !volume,130
  !pan,12
  db 48
  !rest
  db 96
  !b5
  db 48
  !d5
  db 96
  !as5
  db 42
  !tie
  db 6
  !rest
  db 48
  !as5
  db 96
  !b5
  !tie
  !instr,$1C
  !pan,10
  !cs6
  db 42
  !tie
  db 6
  !rest
  !volume,130
  db 48
  !cs6
  db 96
  !fs6
  db 90
  !tie
  db 6
  !rest
  db 96
  !fs6
  db 90
  !tie
  db 6
  !rest
  db 96
  !fs6
  db 90
  !tie
  db 6
  !rest
  db 96
  !fs6
  db 90
  !tie
  db 6
  !rest
  !instr,$19
  !volume,112
  !pan,12
  db 96
  !b5
  !tie
  !b5
  !tie
  !b5
  !tie
  !b5
  db 48
  !tie
  !instr,$18
  !volume,130
  db 96
  !rest
  db 48
  !tie
  db 96
  !b4
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  !volume,64
  !dynamicVolume,176,128
  db 96
  !b7
  !tie
  !dynamicVolume,128,64
  !tie
  db 48
  !tie
  !volume,130
  !rest
  db 96
  !c6
  !tie
  !c6
  !tie
  !e6
  db 42
  !tie
  db 6
  !rest
  db 18
  !e6
  db 6
  !rest
  db 18
  !e6
  db 6
  !rest
  db 120
  !fs6
  db 24
  !rest
  db 36
  !fs6
  db 12
  !rest
  !volume,130
  db 96
  !b6
  db 48
  !tie
  !instr,$1A
  !pan,12
  !volume,64
  !rest
  !dynamicVolume,176,128
  db 96
  !cs6
  !tie
  !end

Track5B03:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,8
  !volume,64
  db 96
  !rest
  !tie
  db 48
  !tie
  !dynamicVolume,176,128
  db 96
  !as5
  !tie
  !end

Track5B19:
  !instr,$1A
  !pan,8
  !volume,146
  !dynamicVolume,176,96
  db 96
  !gs5
  !tie
  !dynamicVolume,176,64
  !fs5
  !tie
  !rest
  !tie
  !dynamicVolume,176,128
  !as5
  !tie
  !dynamicVolume,176,96
  !gs5
  !tie
  !dynamicVolume,176,64
  !fs5
  !tie
  !instr,$18
  !volume,130
  !pan,8
  db 48
  !rest
  db 96
  !g5
  db 48
  !rest
  db 96
  !g5
  db 42
  !tie
  db 6
  !rest
  db 48
  !g5
  db 96
  !g5
  !tie
  !g5
  db 42
  !tie
  db 6
  !rest
  db 48
  !g5
  !instr,$19
  !volume,128
  !pan,10
  db 96
  !b5
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$1D
  !pan,10
  !volume,160
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !volume,96
  !dynamicVolume,96,160
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !volume,160
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !volume,96
  !dynamicVolume,96,160
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !volume,160
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !volume,96
  !dynamicVolume,96,160
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !volume,160
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !volume,96
  !dynamicVolume,96,160
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !instr,$18
  !volume,130
  !pan,12
  db 96
  !rest
  !tie
  !cs5
  !tie
  !e5
  !tie
  !e5
  db 48
  !tie
  !rest
  !instr,$1C
  db 96
  !c5
  !tie
  !c5
  !tie
  !c5
  !tie
  !c5
  !tie
  db 24
  !b5
  !dynamicVolume,120,16
  db 120
  !tie
  !volume,130
  !instr,$1A
  !pan,8
  !volume,64
  db 48
  !rest
  !dynamicVolume,176,128
  db 96
  !as5
  !tie
  !end

Track5C88:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,10
  !volume,224
  db 14
  !b4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 18
  !e4
  db 6
  !rest
  db 24
  !e4
  !dynamicVolume,24,16
  !tie
  !volume,224
  !instr,$1E
  !volume,96
  !rest
  db 72
  !c4
  db 96
  !rest
  !tie
  !tie
  !tie
  !end

Track5CB7:
  !instr,$1F
  !pan,10
  db 48
  !rest
  !volume,80
  !dynamicVolume,96,208
  db 16
  !c4
  !c4
  !c4
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 30
  !rest
  !dynamicVolume,96,96
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 30
  !rest
  db 18
  !c4
  db 30
  !rest
  db 18
  !c4
  db 30
  !rest
  db 18
  !c4
  db 6
  !rest
  !instr,$1B
  !volume,208
  db 18
  !e4
  db 6
  !rest
  db 24
  !e4
  !dynamicVolume,24,16
  !tie
  !volume,208
  !instr,$1E
  !volume,96
  !rest
  db 72
  !c4
  db 96
  !rest
  !tie
  db 72
  !tie
  !instr,$1F
  !pan,10
  !volume,80
  !dynamicVolume,96,208
  db 16
  !c4
  !c4
  !c4
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 30
  !rest
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 6
  !rest
  !instr,$1B
  !volume,224
  db 24
  !e4
  !instr,$1F
  !volume,144
  db 18
  !c4
  db 6
  !rest
  !instr,$1B
  !volume,224
  db 24
  !e4
  !instr,$1F
  !volume,144
  db 18
  !c4
  db 6
  !rest
  !instr,$20
  !volume,224
  db 16
  !e4
  !e4
  !fs4
  db 48
  !rest
  db 90
  !g4
  db 6
  !rest
  db 14
  !g4
  db 2
  !rest
  db 14
  !g4
  db 2
  !rest
  db 14
  !g4
  db 2
  !rest
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !g4
  !g4
  !g4
  !g4
  db 16
  !g4
  !g4
  !g4
  db 72
  !rest
  db 12
  !b4
  !b4
  db 24
  !b4
  !b4
  db 16
  !b4
  !b4
  db 88
  !b4
  db 12
  !b4
  !b4
  db 24
  !b4
  !b4
  db 16
  !b4
  !b4
  !b4
  db 24
  !b4
  db 48
  !b4
  !b4
  db 24
  !b4
  db 16
  !b4
  !b4
  !b4
  !dynamicVolume,192,160
  db 24
  !b4
  db 48
  !b4
  !b4
  !b4
  db 24
  !b4
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
  db 48
  !tie
  !volume,208
  db 16
  !e4
  !e4
  !e4
  !instr,$18
  !volume,130
  db 96
  !b4
  !instr,$1E
  !volume,96
  db 72
  !c4
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  db 72
  !c4
  db 96
  !rest
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1B
  !volume,208
  db 18
  !e4
  db 6
  !rest
  db 24
  !e4
  db 48
  !rest
  !instr,$1E
  !volume,96
  db 72
  !c4
  db 96
  !rest
  !tie
  !tie
  !tie
  !end

Track5DE1:
  db 127,$7F
  !transpose,0
  !instr,$21
  !pan,10
  !volume,128
  db 96
  !rest
  !tie
  db 48
  !tie
  db 96
  !e4
  !tie
  !end

Track5DF4:
  !instr,$21
  !pan,10
  !volume,128
  db 96
  !e4
  !tie
  !e4
  !tie
  !rest
  !tie
  !e4
  !tie
  !e4
  !tie
  !e4
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
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$1D
  db 6
  !rest
  !pan,14
  !dynamicPan,96,6
  !volume,144
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !pan,6
  !dynamicPan,96,14
  !volume,96
  !dynamicVolume,96,144
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !pan,14
  !dynamicPan,96,6
  !volume,144
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !pan,6
  !dynamicPan,96,14
  !volume,96
  !dynamicVolume,96,144
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !pan,14
  !dynamicPan,96,6
  !volume,144
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !pan,6
  !dynamicPan,96,14
  !volume,96
  !dynamicVolume,96,144
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !pan,14
  !dynamicPan,96,6
  !volume,144
  !dynamicVolume,96,96
  db 14
  !fs4
  db 2
  !rest
  db 14
  !b4
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b6
  db 2
  !rest
  !pan,6
  !dynamicPan,96,14
  !volume,96
  !dynamicVolume,96,144
  db 14
  !fs6
  db 2
  !rest
  db 14
  !ds6
  db 2
  !rest
  db 14
  !b5
  db 2
  !rest
  db 14
  !fs5
  db 2
  !rest
  db 14
  !ds5
  db 2
  !rest
  !loop : dw Sub5F30 : db 255
  !end

Sub5F30:
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 7E: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
