asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$BB,$C3,$B8,$02,$FF
  db $19,$DC,$E4,$B8,$00,$9E
  db $1A,$FF,$E7,$B8,$01,$4C
  db $1B,$FF,$E7,$B8,$01,$45
  db $1C,$FD,$E3,$B8,$00,$9E
  db $1D,$DF,$F3,$B8,$02,$7B
  db $1E,$FF,$F1,$B8,$04,$F4
  db $1F,$AD,$55,$B8,$06,$60
  db $20,$DC,$E4,$B8,$01,$3C
  db $21,$F9,$F0,$B8,$01,$3C
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19_20_21,Sample19_20_21+18
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+855
  dw Sample1C,Sample1C+81
  dw Sample1D,Sample1D+1062
  dw Sample1E,Sample1E
  dw Sample1F,Sample1F+513
  dw Sample19_20_21,Sample19_20_21+18
  dw Sample19_20_21,Sample19_20_21+18
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_153af0a14dfa01b26538333fd4f5e4c1.brr"
  Sample19_20_21: incbin "Sample_3429be383b9039b6b0406cc1633cfca3.brr"
  Sample1A: incbin "Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"
  Sample1B: incbin "Sample_acff56f4282c90b04ed0178987166b41.brr"
  Sample1C: incbin "Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr"
  Sample1D: incbin "Sample_002b224c6729825252e7f39a13633f64.brr"
  Sample1E: incbin "Sample_ff8b37e06639ca6f4c8983178b73c75f.brr"
  Sample1F: incbin "Sample_441d4eac476cad49850f2c9cc81a9aec.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5844
-
  dw Pattern5854
  dw Pattern5864
  dw Pattern5874
  dw Pattern5884
  dw Pattern5894
  dw Pattern58A4
  dw Pattern58B4
  dw Pattern58C4
  dw Pattern58D4
  dw $00FF,-
  dw $0000

Pattern5844: dw Track58E4, 0, 0, 0, 0, 0, 0, 0
Pattern5854: dw Track58FB, Track5BAD, Track5E2C, Track605E, Track639B, 0, 0, 0
Pattern5864: dw Track593D, Track5BD1, Track5E50, Track5F79, Track60AD, Track6421, 0, 0
Pattern5874: dw Track5968, Track5BE1, Track5E63, Track5E8E, Track5F8D, Track60F8, Track646E, 0
Pattern5884: dw Track59C5, Track5A0B, Track5C2D, Track6183, Track64F4, 0, 0, 0
Pattern5894: dw Track5A64, Track5C8A, Track5EAA, Track5FA9, Track61DF, Track6545, 0, 0
Pattern58A4: dw Track5AB7, Track5AE7, Track5CE5, Track6292, Track65F6, 0, 0, 0
Pattern58B4: dw Track5AFD, Track5D03, Track5EDB, Track5FC5, Track62BE, Track665D, 0, 0
Pattern58C4: dw Track5B28, Track5D50, Track5D67, Track5F18, Track5FF2, Track66F4, 0, 0
Pattern58D4: dw Track5B4D, Track5F4D, Track5DB0, Track603E, Track636F, Track6731, 0, 0

Track58E4:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,160
  !echo,%00001101,47,47
  !echoParameters,2,48,0
  !end

Track58FB:
  db 127,$7F
  !transpose,0
  !echo,%00001101,47,47
  !echoParameters,2,64,2
  !instr,$18
  !volume,192
  !pan,10
  db 96
  !e4
  !tie
  !e4
  !tie
  !e4
  !tie
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
  !instr,$19
  !volume,112
  !pan,12
  !dynamicPan,192,8
  !dynamicVolume,192,176
  !e7
  !tie
  !dynamicPan,176,10
  !dynamicVolume,176,128
  !tie
  !tie
  !instr,$18
  !volume,192
  !e4
  !tie
  !e4
  !tie
  !end

Track593D:
  !instr,$1A
  !volume,176
  !pan,10
  db 18
  !e6
  db 30
  !rest
  db 18
  !a5
  db 30
  !rest
  db 66
  !as5
  db 18
  !ds6
  db 12
  !f6
  !volume,160
  db 16
  !e6
  !a5
  !e6
  !d6
  !as5
  !f5
  !as5
  !d6
  !f6
  !as6
  !d7
  !f7
  !volume,96
  db 96
  !a7
  !tie
  !gs7
  !g7
  !end

Track5968:
  !instr,$1A
  !volume,128
  !pan,10
  db 96
  !f6
  !rest
  !tie
  !tie
  !volume,176
  db 12
  !a5
  db 36
  !rest
  db 12
  !d5
  db 36
  !rest
  db 66
  !ds5
  db 18
  !gs5
  db 12
  !as5
  db 18
  !d6
  !volume,152
  !f5
  !d6
  db 12
  !rest
  !volume,176
  db 30
  !d6
  db 18
  !cs6
  !volume,152
  !ds5
  db 24
  !cs6
  db 6
  !rest
  !volume,176
  db 30
  !cs6
  db 96
  !rest
  !tie
  db 16
  !e6
  !b5
  !e6
  db 48
  !ds6
  db 16
  !d6
  !g5
  !d6
  !c6
  !f5
  !c6
  !as6
  !d6
  !as6
  !rest
  !as6
  !rest
  !as6
  !d6
  !as6
  !rest
  !as6
  !rest
  !d7
  !g6
  !d7
  !ds7
  !b6
  !gs6
  !ds6
  !b5
  !gs5
  !ds5
  !b4
  !gs4
  !end

Track59C5:
  !instr,$19
  !volume,192
  !pan,8
  db 12
  !a6
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,192
  db 48
  !rest
  !volume,128
  db 96
  !f7
  !e7
  !d7
  db 16
  !e7
  !rest
  !a6
  !rest
  !e7
  !rest
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  !e7
  !rest
  !e7
  !rest
  !e7
  !rest
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  !instr,$19
  !volume,128
  !pan,10
  db 48
  !f7
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,128
  db 12
  !rest
  db 96
  !ds6
  !a6
  !as6
  !end

Track5A0B:
  !instr,$18
  !volume,128
  !pan,10
  db 48
  !rest
  !a4
  !instr,$19
  !volume,112
  db 16
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  db 24
  !e7
  !dynamicVolume,24,16
  !tie
  !volume,112
  !instr,$18
  !volume,128
  db 48
  !a4
  !instr,$19
  !volume,112
  db 16
  !as6
  !rest
  !as6
  !rest
  !as6
  !rest
  !instr,$1D
  !volume,240
  !pan,10
  !a5
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !instr,$19
  !pan,8
  db 96
  !rest
  !tie
  !volume,144
  !d6
  db 48
  !ds6
  !rest
  !end

Track5A64:
  !instr,$1A
  !volume,160
  !pan,10
  db 12
  !a6
  db 24
  !rest
  db 12
  !d6
  db 60
  !gs6
  db 24
  !rest
  db 12
  !gs6
  db 16
  !gs6
  !a6
  !as6
  !volume,144
  db 96
  !d7
  !cs7
  !c7
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  db 16
  !c7
  !ds7
  !g7
  !as7
  !rest
  !gs7
  db 96
  !g7
  !volume,128
  !fs7
  !volume,112
  !g7
  !f7
  !e7
  !instr,$19
  !volume,128
  !pan,12
  !ds6
  !rest
  !f6
  !instr,$1A
  !volume,96
  !pan,6
  !dynamicPan,176,14
  !dynamicVolume,176,176
  !a6
  !tie
  !dynamicPan,176,8
  !dynamicVolume,176,64
  !gs6
  !tie
  !end

Track5AB7:
  !instr,$19
  !volume,192
  !pan,10
  !instr,$18
  !volume,128
  !pan,12
  db 96
  !e4
  !tie
  !e4
  !tie
  !e4
  !tie
  !volume,112
  !e4
  !tie
  !instr,$1B
  !volume,128
  !echo,%00001110,47,47
  !echoParameters,2,64,0
  !pan,11
  !e6
  !pan,9
  !ds6
  !pan,11
  !e6
  !pan,9
  !f6
  !end

Track5AE7:
  db 127,$7F
  !transpose,0
  !instr,$21
  !volume,160
  !pan,8
  db 96
  !rest
  !tie
  !loop : dw Sub5AF9 : db 255
  !end

Sub5AF9:
  db 96
  !rest
  !tie
  !end

Track5AFD:
  !instr,$1C
  !pan,12
  !volume,96
  !dynamicVolume,96,144
  db 96
  !e7
  !tie
  !f7
  !tie
  !instr,$19
  !volume,144
  !pan,12
  !a6
  !gs6
  !a6
  !as6
  !instr,$1C
  !volume,152
  !pan,12
  !a7
  !tie
  !tie
  !tie
  !g7
  !tie
  !fs7
  !tie
  !f7
  !tie
  !rest
  !tie
  !end

Track5B28:
  !instr,$1C
  !volume,152
  !pan,12
  db 96
  !rest
  !f7
  !e7
  !d7
  db 16
  !e7
  !rest
  !a6
  !rest
  !e7
  !rest
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  !e7
  !rest
  !e7
  !rest
  !e7
  !rest
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  !end

Track5B4D:
  !instr,$1C
  !volume,152
  !pan,10
  db 48
  !f7
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,152
  db 12
  !rest
  !volume,160
  db 96
  !ds6
  !a6
  !as6
  !instr,$1A
  !volume,160
  !pan,10
  db 12
  !a6
  db 24
  !rest
  db 12
  !d6
  db 60
  !gs6
  db 24
  !rest
  db 12
  !gs6
  db 16
  !gs6
  !a6
  !as6
  !volume,144
  db 96
  !d7
  !cs7
  !c7
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  db 16
  !c7
  !ds7
  !g7
  !as7
  !rest
  !gs7
  db 96
  !g7
  !volume,128
  !fs7
  !volume,112
  !g7
  !f7
  !instr,$19
  !volume,128
  !pan,8
  !rest
  !as5
  !rest
  !as5
  !instr,$1C
  !volume,192
  !pan,10
  !e6
  !tie
  !f6
  db 48
  !tie
  !rest
  !end

Track5BAD:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,192
  !pan,8
  db 96
  !rest
  !f4
  !rest
  !f4
  !b4
  !c5
  !b4
  !a4
  !gs4
  !tie
  !e4
  !tie
  !b4
  !c5
  !d5
  !c5
  !rest
  !f4
  !rest
  !f4
  !b4
  !c5
  !d5
  !ds5
  !end

Track5BD1:
  !instr,$1B
  !volume,104
  !pan,10
  db 96
  !e6
  !ds6
  !e6
  !f6
  !e6
  !ds6
  !d6
  !ds6
  !end

Track5BE1:
  !instr,$1B
  !volume,176
  !pan,10
  db 16
  !f6
  !d6
  !f6
  db 48
  !a6
  db 16
  !rest
  !gs6
  !a6
  !as6
  !rest
  !as6
  db 96
  !a6
  !gs6
  !rest
  !tie
  !tie
  !tie
  !volume,192
  db 12
  !e6
  db 24
  !rest
  db 12
  !g6
  db 60
  !b6
  db 24
  !rest
  db 12
  !b6
  db 16
  !as6
  !b6
  !c7
  db 96
  !b6
  !c7
  db 12
  !d7
  db 24
  !rest
  db 12
  !g6
  db 60
  !cs7
  db 24
  !rest
  db 12
  !cs7
  db 16
  !cs7
  !d7
  !ds7
  !g6
  !g6
  !rest
  !gs6
  !gs6
  !rest
  !gs6
  !gs6
  !rest
  !gs6
  !gs6
  !rest
  !end

Track5C2D:
  !instr,$1D
  !volume,240
  !pan,10
  db 12
  !a5
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,240
  db 16
  !a4
  !instr,$19
  !volume,160
  !pan,12
  !a6
  !e7
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  db 24
  !e7
  !dynamicVolume,24,16
  !tie
  !volume,160
  !instr,$1D
  !volume,240
  !pan,10
  db 16
  !a4
  !instr,$19
  !volume,160
  !pan,12
  !a6
  !e7
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  !instr,$19
  !volume,112
  !pan,9
  db 96
  !e7
  !f7
  !pan,10
  !g7
  !gs7
  !instr,$18
  !volume,128
  !pan,10
  !a4
  db 72
  !tie
  db 24
  !rest
  db 96
  !d5
  !tie
  !volume,128
  !tie
  !tie
  !end

Track5C8A:
  !instr,$19
  !volume,128
  !pan,12
  db 96
  !rest
  !gs6
  !rest
  !tie
  !instr,$1B
  !volume,224
  !pan,10
  db 16
  !g5
  !c5
  !g5
  db 60
  !fs5
  db 24
  !rest
  db 12
  !fs5
  db 16
  !fs5
  !g5
  !gs5
  !g5
  !c5
  !g5
  db 60
  !fs5
  db 24
  !rest
  db 12
  !fs5
  db 16
  !g5
  !fs5
  !f5
  db 96
  !ds5
  db 72
  !tie
  db 96
  !rest
  !tie
  db 24
  !tie
  db 12
  !e6
  db 36
  !rest
  db 12
  !a5
  db 36
  !rest
  db 64
  !ds6
  db 16
  !e6
  !f6
  db 18
  !e6
  db 6
  !rest
  db 18
  !a5
  db 96
  !rest
  !tie
  db 54
  !tie
  !instr,$19
  !volume,128
  !pan,12
  db 96
  !ds6
  !rest
  db 72
  !f6
  db 24
  !rest
  !end

Track5CE5:
  !instr,$18
  !volume,176
  !pan,8
  !instr,$18
  !volume,160
  !pan,8
  db 96
  !rest
  !f4
  !rest
  !f4
  !b4
  !c5
  !d5
  !ds5
  !volume,208
  !pan,10
  !a4
  !tie
  !tie
  !tie
  !end

Track5D03:
  !instr,$18
  !volume,208
  !pan,10
  db 96
  !a4
  !tie
  !tie
  !tie
  !instr,$1B
  !volume,160
  !pan,10
  !echo,%00001101,47,47
  !echoParameters,2,64,0
  db 16
  !f6
  !d6
  !f6
  db 48
  !a6
  db 16
  !rest
  !gs6
  !a6
  !as6
  !rest
  !a6
  db 96
  !a6
  !gs6
  !instr,$1C
  !volume,152
  !pan,8
  !rest
  !tie
  !gs7
  !tie
  !c7
  !tie
  !c7
  !tie
  !c7
  !tie
  !instr,$19
  !volume,160
  !pan,12
  db 48
  !rest
  db 72
  !gs6
  db 24
  !rest
  !gs6
  !dynamicVolume,24,16
  !tie
  !volume,160
  !end

Track5D50:
  !instr,$1C
  !volume,176
  !pan,10
  db 96
  !c7
  !tie
  !volume,152
  db 48
  !c7
  db 96
  !rest
  db 48
  !tie
  db 96
  !c7
  !tie
  !c7
  !tie
  !end

Track5D67:
  !instr,$1D
  !volume,255
  !pan,10
  db 12
  !a5
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,255
  db 16
  !a4
  !instr,$19
  !volume,160
  !pan,12
  !a6
  !e7
  !f7
  !rest
  !f7
  !rest
  !f7
  !rest
  db 24
  !e7
  !dynamicVolume,24,16
  !tie
  !volume,160
  !instr,$1D
  !volume,240
  !pan,10
  db 16
  !a4
  !instr,$19
  !volume,160
  !pan,12
  !a6
  !e7
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  !instr,$1C
  !volume,152
  !pan,8
  db 96
  !e7
  !f7
  !g7
  !gs7
  !end

Track5DB0:
  !instr,$1C
  !volume,96
  !pan,12
  db 96
  !rest
  !tie
  !dynamicVolume,160,192
  !d6
  db 48
  !ds6
  !rest
  !instr,$19
  !volume,128
  !pan,12
  db 96
  !rest
  !ds6
  !d6
  !tie
  !instr,$1B
  !volume,224
  !pan,10
  db 16
  !g5
  !c5
  !g5
  db 60
  !fs5
  db 24
  !rest
  db 12
  !fs5
  db 16
  !fs5
  !g5
  !gs5
  !g5
  !c5
  !g5
  db 60
  !fs5
  db 24
  !rest
  db 12
  !fs5
  db 16
  !g5
  !fs5
  !f5
  db 96
  !ds5
  db 72
  !tie
  db 24
  !rest
  !instr,$19
  !volume,128
  !pan,8
  db 96
  !c6
  db 72
  !as5
  db 24
  !rest
  !instr,$1B
  !volume,192
  !pan,10
  db 12
  !e6
  db 36
  !rest
  db 12
  !a5
  db 36
  !rest
  db 64
  !ds6
  db 16
  !e6
  !f6
  db 18
  !e6
  db 6
  !rest
  db 18
  !a5
  db 6
  !rest
  db 96
  !rest
  db 54
  !tie
  !instr,$19
  !volume,112
  !pan,12
  db 96
  !rest
  !as5
  !rest
  db 72
  !as5
  db 24
  !rest
  !end

Track5E2C:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,160
  !pan,12
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !f4
  !rest
  !f4
  !rest
  !tie
  !tie
  !tie
  !tie
  !f4
  !rest
  !f4
  !e4
  !tie
  !e4
  !tie
  !rest
  !f4
  !rest
  !tie
  !end

Track5E50:
  !instr,$19
  !volume,160
  !pan,12
  db 96
  !a5
  !as5
  !a5
  !as5
  !a5
  !as5
  !a5
  db 72
  !as5
  db 24
  !rest
  !end

Track5E63:
  !instr,$19
  !volume,128
  !pan,12
  db 96
  !d6
  !ds6
  db 48
  !d6
  !rest
  db 96
  !ds6
  !d6
  !ds6
  db 48
  !d6
  !rest
  db 72
  !ds6
  db 24
  !rest
  db 96
  !e6
  !f6
  !e6
  !f6
  !g6
  !cs7
  db 16
  !d7
  db 32
  !rest
  db 72
  !ds7
  db 24
  !rest
  db 16
  !ds7
  !ds7
  !rest
  !end

Track5E8E:
  !instr,$19
  !volume,128
  !pan,8
  db 96
  !rest
  !gs6
  !a6
  !as6
  !rest
  !gs6
  !rest
  db 72
  !as6
  db 24
  !rest
  db 96
  !b6
  !as6
  !b6
  !c7
  !d7
  !rest
  !tie
  !tie
  !end

Track5EAA:
  !instr,$19
  !volume,128
  !pan,8
  db 96
  !d6
  !ds6
  db 48
  !d6
  !rest
  db 96
  !ds6
  !g6
  !fs6
  !g6
  !gs6
  !g6
  !fs6
  !g6
  db 72
  !f6
  db 24
  !rest
  db 96
  !a5
  !as5
  db 36
  !a5
  db 60
  !rest
  db 96
  !as5
  db 36
  !a5
  db 60
  !rest
  db 96
  !as5
  db 36
  !a5
  db 60
  !rest
  db 72
  !as5
  db 24
  !rest
  !end

Track5EDB:
  !instr,$1B
  !volume,128
  !pan,10
  !echo,%00001011,47,47
  !echoParameters,2,64,0
  db 96
  !e6
  !ds6
  !d6
  !ds6
  !instr,$19
  !volume,128
  !pan,10
  !d6
  !ds6
  !d6
  !ds6
  !a6
  !gs6
  !a6
  db 72
  !as6
  db 24
  !rest
  db 96
  !b6
  !as6
  !b6
  !c7
  !d7
  !cs7
  !volume,152
  db 18
  !d7
  db 30
  !rest
  db 72
  !ds7
  db 24
  !rest
  !ds7
  !dynamicVolume,24,16
  !tie
  !volume,152
  !end

Track5F18:
  !instr,$1D
  !volume,255
  !pan,10
  db 96
  !rest
  db 16
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  db 48
  !rest
  db 16
  !rest
  !a4
  !a4
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !instr,$1F
  !volume,160
  db 32
  !c4
  !c4
  !c4
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
  !c4
  !c4
  !c4
  db 32
  !c4
  !c4
  !c4
  !end

Track5F4D:
  !instr,$19
  !volume,128
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !a6
  !gs6
  !rest
  !ds6
  !c6
  !cs6
  !c6
  !cs6
  !c6
  !cs6
  !g6
  db 72
  !f6
  db 24
  !rest
  db 96
  !e6
  !ds6
  !a5
  !f6
  db 48
  !a5
  !rest
  db 96
  !ds6
  db 48
  !a5
  !rest
  db 72
  !f6
  db 24
  !rest
  !end

Track5F79:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,160
  !pan,8
  db 96
  !a4
  !tie
  !tie
  !tie
  !a4
  !tie
  !tie
  !tie
  !end

Track5F8D:
  !instr,$18
  !volume,144
  !pan,8
  db 96
  !d5
  !tie
  !tie
  !tie
  !d5
  !tie
  !tie
  !tie
  !e5
  !tie
  !tie
  !tie
  !instr,$19
  !volume,176
  !g5
  !tie
  !tie
  !tie
  !end

Track5FA9:
  !instr,$18
  !volume,160
  !pan,8
  db 96
  !d5
  !tie
  !tie
  !tie
  !c5
  !tie
  !tie
  !tie
  !c5
  !tie
  !tie
  !tie
  !a4
  !tie
  !tie
  !tie
  !a4
  !tie
  !tie
  !tie
  !end

Track5FC5:
  !instr,$1C
  !pan,8
  !volume,96
  !dynamicVolume,96,144
  db 96
  !c7
  !tie
  !tie
  !tie
  !instr,$18
  !volume,144
  !pan,8
  !d5
  !tie
  !volume,176
  !d5
  !tie
  !d5
  !tie
  !d5
  !tie
  !e5
  !tie
  !tie
  !tie
  !instr,$19
  !volume,160
  !pan,8
  !g5
  !tie
  !g5
  !tie
  !end

Track5FF2:
  !instr,$18
  !volume,144
  !pan,8
  db 48
  !rest
  !a4
  !instr,$19
  !volume,128
  db 16
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  db 24
  !e7
  !dynamicVolume,24,16
  !tie
  !volume,128
  !instr,$18
  !volume,176
  db 48
  !a4
  !instr,$19
  !volume,128
  db 16
  !as6
  !rest
  !as6
  !rest
  !as6
  !rest
  !instr,$1D
  !volume,240
  !pan,10
  !a5
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !a4
  !rest
  !end

Track603E:
  !instr,$18
  !volume,160
  !pan,8
  db 96
  !d5
  !tie
  !d5
  !tie
  !d5
  !tie
  !d5
  !tie
  !c5
  !tie
  !c5
  !tie
  !c5
  !tie
  !c5
  !tie
  !a4
  !tie
  !a4
  !tie
  !a4
  !tie
  !a4
  !tie
  !end

Track605E:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  !loop : dw Sub606D : db 4
  !end

Sub606D:
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 54
  !rest
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 54
  !rest
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 54
  !rest
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 6
  !rest
  db 8
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !end

Track60AD:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 30
  !rest
  db 24
  !a4
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 6
  !rest
  db 8
  !a4
  !a4
  !a4
  !a4
  !a4
  !a4
  !end

Track60F8:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 30
  !rest
  db 24
  !d4
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 6
  !rest
  db 8
  !d4
  !d4
  !d4
  !d4
  !d4
  !d4
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 30
  !rest
  db 24
  !e4
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 54
  !rest
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 54
  !rest
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 6
  !rest
  db 8
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !end

Track6183:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,255
  !pan,10
  db 96
  !rest
  db 16
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  db 48
  !rest
  db 16
  !rest
  !a4
  !a4
  !a5
  !rest
  !a5
  !rest
  !a5
  !rest
  !instr,$1F
  !volume,128
  db 32
  !c4
  !c4
  !c4
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
  !c4
  !c4
  !c4
  db 32
  !c4
  !c4
  !c4
  !instr,$1D
  !volume,240
  !pan,10
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 30
  !rest
  db 24
  !d4
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  !end

Track61DF:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  !loop : dw Sub61EE : db 1
  !end

Sub61EE:
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 6
  !rest
  db 8
  !d4
  !d4
  !d4
  !d4
  !d4
  !d4
  db 24
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !c4
  db 8
  !rest
  db 18
  !c4
  db 30
  !rest
  db 24
  !c4
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !c4
  db 8
  !rest
  db 18
  !c4
  db 54
  !rest
  db 24
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !c4
  db 8
  !rest
  db 18
  !c4
  db 54
  !rest
  db 24
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !c4
  db 8
  !rest
  db 18
  !c4
  db 6
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 30
  !rest
  db 24
  !a3
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 6
  !rest
  db 8
  !a4
  !a4
  !a4
  !a4
  !a4
  !a4
  !end

Track6292:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  !loop : dw Sub606D : db 1
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 30
  !rest
  db 24
  !a4
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  !end

Track62BE:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 54
  !rest
  db 24
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  !a4
  db 8
  !rest
  db 18
  !a4
  db 6
  !rest
  db 8
  !a4
  !a4
  !a4
  !a4
  !a4
  !a4
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 30
  !rest
  db 24
  !d4
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 6
  !rest
  db 8
  !d4
  !d4
  !d4
  !d4
  !d4
  !d4
  db 24
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 30
  !rest
  db 24
  !e4
  !e4
  !rest
  db 16
  !e4
  !e4
  !e4
  !e4
  db 8
  !rest
  db 18
  !e4
  db 6
  !rest
  db 16
  !e4
  !e4
  !e4
  !volume,255
  !g4
  !g4
  !g4
  !g4
  !g4
  !g4
  db 12
  !g4
  !rest
  !g4
  !rest
  db 24
  !rest
  db 12
  !g4
  !rest
  !g4
  db 36
  !rest
  db 16
  !g4
  !g4
  !g4
  db 12
  !g4
  !rest
  !g4
  !rest
  db 16
  !g4
  !g4
  !g4
  !end

Track636F:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !volume,240
  !pan,10
  db 24
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 30
  !rest
  db 24
  !d4
  !d4
  !rest
  db 16
  !d4
  !d4
  !d4
  !d4
  db 8
  !rest
  db 18
  !d4
  db 54
  !rest
  !loop : dw Sub61EE : db 1
  !end

Track639B:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !loop : dw Sub63E4 : db 2
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 60
  !rest
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Sub63E4:
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 60
  !rest
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Track6421:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 36
  !rest
  db 16
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Track646E:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 36
  !rest
  db 16
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 48
  !c4
  !instr,$1E
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
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
  db 6
  !c4
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !end

Track64F4:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1F
  db 24
  !c4
  !rest
  db 48
  !c4
  !instr,$1E
  db 32
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !c4
  !rest
  db 48
  !c4
  db 32
  !c4
  !c4
  !c4
  !instr,$19
  !volume,128
  db 16
  !c7
  db 48
  !rest
  db 16
  !c7
  !rest
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  db 96
  !rest
  !tie
  !volume,160
  !pan,10
  !instr,$1F
  db 48
  !c4
  !rest
  !instr,$1E
  db 24
  !c4
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 24
  !c4
  !c4
  !instr,$1F
  db 16
  !c4
  !c4
  !c4
  !end

Track6545:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !loop : dw Sub6552 : db 1
  !end

Sub6552:
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 36
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 24
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 36
  !rest
  db 16
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Track65F6:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,128
  !pan,12
  db 96
  !rest
  !volume,176
  !pan,10
  !instr,$1E
  db 12
  !c4
  !rest
  !c4
  db 60
  !rest
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !end

Track665D:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  db 12
  !c4
  db 36
  !rest
  db 16
  !c4
  !c4
  !c4
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1E
  db 12
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  db 96
  !c4
  !instr,$1E
  db 16
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  !instr,$1E
  db 96
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1F
  db 48
  !c4
  !instr,$1E
  db 24
  !c4
  !rest
  !c4
  !c4
  !rest
  !c4
  !c4
  !c4
  db 48
  !rest
  db 24
  !c4
  !c4
  !rest
  !c4
  !c4
  !c4
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  db 24
  !c4
  !c4
  db 8
  !rest
  !rest
  !rest
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !end

Track66F4:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1F
  db 24
  !c4
  !rest
  db 48
  !c4
  !instr,$1E
  db 32
  !c4
  !c4
  !c4
  !instr,$1F
  db 24
  !c4
  !rest
  db 48
  !c4
  db 32
  !c4
  !c4
  !c4
  !instr,$19
  !volume,144
  !pan,12
  db 16
  !c7
  db 48
  !rest
  db 16
  !c7
  !rest
  !d7
  !rest
  !d7
  !rest
  !d7
  !rest
  !instr,$18
  !volume,176
  !pan,12
  db 96
  !a4
  !tie
  !end

Track6731:
  db 127,$7F
  !transpose,0
  !volume,160
  !pan,10
  !instr,$1F
  db 96
  !c4
  !instr,$1E
  db 12
  !c4
  !rest
  !c4
  db 36
  !rest
  db 12
  !c4
  !rest
  !c4
  db 84
  !rest
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  db 16
  !c4
  !c4
  !c4
  !loop : dw Sub6552 : db 1
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
