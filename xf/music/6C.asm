asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E2,$B8,$00,$9E
  db $19,$FF,$F3,$B8,$01,$3D
  db $1A,$FF,$EB,$B8,$01,$3D
  db $1B,$FF,$E0,$B8,$04,$F5
  db $1C,$8F,$ED,$B8,$01,$1E
  db $1D,$FF,$E0,$B8,$01,$3D
  db $1E,$FF,$E0,$B8,$07,$A0
  db $1F,$FF,$E0,$B8,$0A,$67
  db $20,$FE,$F0,$B8,$09,$E8
  db $21,$FF,$F0,$B8,$02,$7A
  db $22,$FF,$E0,$B8,$02,$7A
  db $23,$FF,$E0,$B8,$02,$7A
  db $24,$FF,$E0,$B8,$01,$4C
  db $25,$FF,$E0,$B8,$01,$00
  db $26,$FF,$E0,$B8,$0B,$06
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+36
  dw Sample19_1A,Sample19_1A+522
  dw Sample19_1A,Sample19_1A+522
  dw Sample1B,Sample1B+108
  dw Sample1C,Sample1C+693
  dw Sample1D,Sample1D+18
  dw Sample1E,Sample1E
  dw Sample1F,Sample1F+513
  dw Sample20,Sample20
  dw Sample21,Sample21
  dw Sample22,Sample22
  dw Sample23,Sample23
  dw Sample24,Sample24
  dw Sample25,Sample25+27
  dw Sample26,Sample26
endspcblock

pushpc
org $A080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ad838049f259a4f1171d73e2a9ff0c30.brr")
  Sample19_1A: skip filesize("Sample_f1b3383538467c6d9585a3089f2bff09.brr")
  Sample1B: skip filesize("Sample_878ea10e42cb89660db51cb44f1c0fc8.brr")
  Sample1C: skip filesize("Sample_3d03eefd2e3912bacdc75766d9f89c08.brr")
  Sample1D: skip filesize("Sample_ecfd273f3f42fe8a26eaca051537db5c.brr")
  Sample1E: skip filesize("Sample_fc0a703f3d90d9667c60e64cfe3d7cf9.brr")
  Sample1F: skip filesize("Sample_441d4eac476cad49850f2c9cc81a9aec.brr")
  Sample20: skip filesize("Sample_ff8b37e06639ca6f4c8983178b73c75f.brr")
  Sample21: skip filesize("Sample_da1530af58462df8494ebdc079f396b3.brr")
  Sample22: skip filesize("Sample_e4ec38024ef64ca23f8bb5aecc52c3d6.brr")
  Sample23: skip filesize("Sample_ae8e1de965071e6c9210ea1074e4ae53.brr")
  Sample24: skip filesize("Sample_eefb57a8c45455334318ad6ef8bcf9dd.brr")
  Sample25: skip filesize("Sample_bdd3ed2bb8600fa03669172d5130595d.brr")
  Sample26: skip filesize("Sample_3ce56ddc06d6279f0865433c167956a4.brr")
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
Pattern5846: dw Track5881, Track59D0, Track5B2B, Track5C0B, Track5DEC, 0, 0, 0
Pattern5856: dw Track58A0, Track59EF, Track5B49, Track5C2E, Track5E0B, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,68
  !musicVolume,176
  !echo,%00011111,47,47
  !echoParameters,2,28,5
  !dynamicEcho,128,52,52
  !end

Track5881:
  db 127,$7F
  !transpose,0
  !instr,$18
  !vibrato,0,18,79
  !pan,11
  !volume,240
  !dynamicVolume,48,96
  db 72
  !b6
  !pan,7
  !volume,96
  !dynamicVolume,96,176
  db 120
  !d7
  db 96
  !rest
  !end

Track58A0:
  !endVibrato
  !echo,%00011111,47,47
  !echoParameters,2,28,5
  !dynamicEcho,128,52,52
  !instr,$19
  !volume,192
  !pan,11
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  !instr,$1A
  !pan,7
  db 60
  !fs6
  db 12
  !rest
  !pan,11
  !instr,$19
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  !instr,$1A
  !pan,7
  db 36
  !f6
  db 12
  !rest
  !pan,10
  db 36
  !e6
  db 12
  !rest
  !pan,11
  !instr,$19
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  !instr,$1A
  !pan,7
  db 60
  !fs6
  db 12
  !rest
  !pan,11
  !instr,$19
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  db 24
  !f6
  db 48
  !rest
  !instr,$1A
  !pan,7
  db 60
  !fs6
  db 12
  !rest
  !instr,$19
  !pan,11
  db 24
  !g6
  db 8
  !rest
  !pan,7
  !volume,208
  db 24
  !gs6
  db 8
  !rest
  !pan,11
  !volume,224
  db 24
  !a6
  db 8
  !rest
  !instr,$18
  !volume,136
  !pan,10
  db 96
  !as7
  db 48
  !tie
  !a7
  db 96
  !cs7
  db 48
  !tie
  !c7
  db 96
  !b6
  db 48
  !tie
  !c7
  db 96
  !as6
  db 48
  !f6
  !rest
  db 96
  !b7
  db 48
  !tie
  !as7
  db 96
  !d7
  db 48
  !tie
  !cs7
  db 96
  !c7
  db 48
  !tie
  !cs7
  db 72
  !as6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,136
  db 48
  !e7
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,136
  !rest
  !volume,208
  db 20
  !e5
  db 12
  !rest
  db 20
  !f5
  db 12
  !rest
  db 20
  !fs5
  db 12
  !rest
  db 20
  !g5
  db 12
  !rest
  db 20
  !fs5
  db 12
  !rest
  db 20
  !f5
  db 12
  !rest
  db 20
  !fs5
  db 12
  !rest
  db 20
  !g5
  db 12
  !rest
  db 20
  !gs5
  db 12
  !rest
  db 20
  !a5
  db 12
  !rest
  db 20
  !gs5
  db 12
  !rest
  db 20
  !g5
  db 12
  !rest
  db 20
  !gs5
  db 12
  !rest
  db 20
  !a5
  db 12
  !rest
  db 20
  !as5
  db 12
  !rest
  db 20
  !b5
  db 12
  !rest
  db 20
  !as5
  db 12
  !rest
  db 20
  !a5
  db 12
  !rest
  db 24
  !as5
  !b5
  !c6
  !cs6
  db 16
  !b5
  !c6
  !cs6
  !d6
  !ds6
  !e6
  !end

Track59D0:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  !vibrato,0,18,79
  db 40
  !rest
  !volume,240
  !dynamicVolume,48,96
  db 72
  !as6
  !volume,96
  !dynamicVolume,46,176
  !tie
  db 96
  !rest
  !tie
  !end

Track59EF:
  !endVibrato
  !pan,10
  !instr,$1B
  !volume,255
  db 12
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  db 48
  !gs3
  db 12
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  db 24
  !g3
  db 48
  !rest
  db 36
  !g3
  db 12
  !rest
  db 36
  !fs3
  db 12
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  db 48
  !gs3
  db 12
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  !rest
  !g3
  db 36
  !rest
  db 48
  !gs3
  db 24
  !rest
  db 30
  !g4
  db 2
  !rest
  db 24
  !g4
  db 8
  !rest
  db 24
  !g4
  db 8
  !rest
  db 42
  !cs4
  db 30
  !rest
  db 84
  !cs4
  db 36
  !rest
  db 42
  !cs4
  db 30
  !rest
  db 84
  !cs4
  db 36
  !rest
  !d4
  !rest
  db 84
  !d4
  db 36
  !rest
  !d4
  !rest
  db 90
  !d4
  db 30
  !rest
  db 42
  !ds4
  db 30
  !rest
  db 90
  !ds4
  db 30
  !rest
  db 42
  !ds4
  db 30
  !rest
  db 90
  !ds4
  db 30
  !rest
  db 42
  !e4
  db 30
  !rest
  db 90
  !e4
  db 54
  !rest
  db 48
  !e4
  db 24
  !rest
  db 72
  !e4
  db 24
  !rest
  !pan,6
  db 20
  !c4
  db 12
  !rest
  !pan,7
  db 20
  !cs4
  db 12
  !rest
  !pan,10
  db 20
  !d4
  db 12
  !rest
  !pan,11
  db 20
  !ds4
  db 12
  !rest
  !pan,14
  db 20
  !d4
  db 12
  !rest
  !pan,11
  db 20
  !cs4
  db 12
  !rest
  !pan,10
  db 20
  !d4
  db 12
  !rest
  !pan,7
  db 20
  !ds4
  db 12
  !rest
  !pan,6
  db 20
  !e4
  db 12
  !rest
  !pan,7
  db 20
  !f4
  db 12
  !rest
  !pan,10
  db 20
  !e4
  db 12
  !rest
  !pan,11
  db 20
  !ds4
  db 12
  !rest
  !pan,14
  db 20
  !e4
  db 12
  !rest
  !pan,11
  db 20
  !f4
  db 12
  !rest
  !pan,10
  db 20
  !fs4
  db 12
  !rest
  !pan,7
  db 20
  !g4
  db 12
  !rest
  !pan,6
  db 20
  !fs4
  db 12
  !rest
  !pan,7
  db 20
  !f4
  db 12
  !rest
  !pan,10
  db 24
  !fs4
  !g4
  !gs4
  !a4
  db 16
  !g4
  !gs4
  !a4
  !as4
  !b4
  !c5
  !end

Track5B2B:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,9
  !vibrato,0,18,79
  db 14
  !rest
  !volume,240
  !dynamicVolume,95,96
  db 120
  !c7
  !dynamicVolume,46,176
  db 48
  !tie
  db 96
  !rest
  !tie
  !end

Track5B49:
  !endVibrato
  !instr,$1C
  !volume,255
  !transpose,246
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  !pan,11
  db 36
  !f7
  db 12
  !rest
  !pan,10
  db 36
  !e7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !g7
  db 8
  !rest
  !pan,11
  db 24
  !gs7
  db 8
  !rest
  !pan,7
  db 24
  !a7
  db 8
  !rest
  !instr,$18
  !volume,128
  !transpose,0
  !pan,10
  db 96
  !f7
  !tie
  !f6
  !tie
  !f6
  !tie
  !tie
  db 48
  !tie
  !rest
  db 96
  !fs7
  !tie
  !fs6
  !tie
  !volume,112
  !as6
  !tie
  !volume,128
  db 72
  !g6
  db 24
  !rest
  db 48
  !as6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !volume,160
  db 12
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  db 96
  !rest
  !tie
  !end

Track5C0B:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  db 60
  !rest
  !volume,240
  !dynamicVolume,48,112
  db 48
  !cs7
  !volume,112
  !dynamicVolume,46,208
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 96
  !rest
  db 48
  !tie
  !end

Track5C2E:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,184
  !instr,$1E
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  !rest
  !instr,$20
  !dynamicVolume,94,130
  db 8
  !c4
  !c4
  !rest
  db 20
  !c4
  db 4
  !rest
  db 8
  !c4
  db 4
  !rest
  db 8
  !c4
  db 4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !volume,184
  !instr,$1E
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !g3
  !rest
  !instr,$21
  db 12
  !c4
  !rest
  !fs4
  !fs4
  !e4
  !e4
  !d4
  !d4
  !c4
  !c4
  !instr,$1E
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  !rest
  !instr,$20
  !dynamicVolume,94,130
  db 8
  !c4
  !c4
  !rest
  db 20
  !c4
  db 4
  !rest
  db 8
  !c4
  db 4
  !rest
  db 8
  !c4
  db 4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !volume,184
  !instr,$1E
  db 12
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !a3
  db 12
  !rest
  !instr,$1E
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !g3
  db 48
  !rest
  db 30
  !g3
  db 24
  !g3
  db 6
  !rest
  db 12
  !rest
  !instr,$21
  db 24
  !c4
  db 6
  !rest
  !instr,$22
  db 12
  !c4
  !rest
  !c4
  !rest
  !volume,216
  !instr,$23
  db 24
  !c4
  db 48
  !rest
  !instr,$24
  db 12
  !cs4
  !rest
  !c4
  !rest
  !cs4
  db 36
  !rest
  !instr,$22
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !cs4
  db 84
  !rest
  db 12
  !cs4
  !rest
  !instr,$22
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  db 24
  !c4
  db 48
  !rest
  !instr,$24
  db 12
  !cs4
  !rest
  !c4
  !rest
  !cs4
  db 36
  !rest
  !instr,$22
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !cs4
  !rest
  !instr,$21
  db 24
  !e4
  !d4
  !d4
  !c4
  !instr,$22
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  db 24
  !c4
  db 48
  !rest
  !instr,$24
  db 12
  !cs4
  !rest
  !c4
  !rest
  !cs4
  db 36
  !rest
  !instr,$22
  db 12
  !c4
  !rest
  !c4
  !rest
  db 120
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  db 24
  !c4
  db 48
  !rest
  !instr,$24
  db 12
  !cs4
  !rest
  !c4
  !rest
  !cs4
  db 36
  !rest
  db 96
  !rest
  db 6
  !rest
  !instr,$21
  db 18
  !e4
  !rest
  !c4
  db 12
  !rest
  db 96
  !rest
  !rest
  db 18
  !c4
  db 12
  !rest
  db 18
  !c4
  db 96
  !rest
  db 18
  !c4
  db 12
  !rest
  db 18
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  db 24
  !c4
  !dynamicVolume,24,16
  !tie
  !volume,216
  db 48
  !rest
  db 24
  !c4
  !dynamicVolume,24,16
  !tie
  !volume,216
  !instr,$20
  !volume,184
  db 12
  !c4
  !rest
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !end

Track5DEC:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !pan,10
  !volume,192
  !dynamicVolume,32,112
  db 72
  !c6
  !dynamicVolume,96,176
  db 120
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  db 96
  !rest
  !tie
  !end

Track5E0B:
  !instr,$25
  !volume,160
  !transpose,246
  !pan,10
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  !pan,11
  db 36
  !f7
  db 12
  !rest
  !pan,10
  db 36
  !e7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  db 24
  !f7
  db 48
  !rest
  !pan,11
  db 60
  !fs7
  db 12
  !rest
  !pan,7
  db 24
  !g7
  db 8
  !rest
  !pan,11
  db 24
  !gs7
  db 8
  !rest
  !pan,7
  db 24
  !a7
  db 8
  !rest
  !volume,112
  !transpose,0
  !pan,10
  db 96
  !f7
  !tie
  !f6
  !tie
  !f6
  !tie
  !tie
  db 48
  !tie
  !rest
  db 96
  !fs7
  !tie
  !fs6
  !tie
  !as6
  !tie
  db 72
  !g6
  db 24
  !rest
  db 48
  !as6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  db 12
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
