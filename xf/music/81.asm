asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$EE,$CF,$B8,$01,$3D
  db $19,$FF,$E0,$B8,$02,$98
  db $1A,$FF,$F3,$B8,$02,$98
  db $1B,$FF,$E0,$B8,$01,$98
  db $1C,$FF,$F0,$B8,$04,$F4
  db $1D,$FF,$F2,$B8,$0A,$A0
  db $1E,$FF,$F3,$B8,$02,$7B
  db $1F,$FF,$E0,$B8,$02,$7B
  db $20,$FF,$E1,$B8,$02,$7A
  db $21,$FF,$E0,$B8,$00,$9E
  db $22,$FF,$E0,$B8,$02,$FF
  db $23,$ED,$C0,$B8,$04,$00
  db $24,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+1899
  dw Sample19_1A,Sample19_1A+27
  dw Sample19_1A,Sample19_1A+27
  dw Sample1B,Sample1B+1584
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D+513
  dw Sample1E_1F,Sample1E_1F+1062
  dw Sample1E_1F,Sample1E_1F+1062
  dw Sample20,Sample20+234
  dw Sample21,Sample21+18
  dw Sample22,Sample22+27
  dw Sample23,Sample23+18
  dw Sample24,Sample24+18
endspcblock

spcblock $8B00-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_2264c24a6f5bdd42acc939287e1398fc.brr"
  Sample19_1A: incbin "Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"
  Sample1B: incbin "Sample_91eb0ad40cbb8edb59d1a8eb274bb61a.brr"
  Sample1C: incbin "Sample_ff8b37e06639ca6f4c8983178b73c75f.brr"
  Sample1D: incbin "Sample_441d4eac476cad49850f2c9cc81a9aec.brr"
  Sample1E_1F: incbin "Sample_002b224c6729825252e7f39a13633f64.brr"
  Sample20: incbin "Sample_0ca2e923494667f4c3a148f312b12259.brr"
  Sample21: incbin "Sample_3429be383b9039b6b0406cc1633cfca3.brr"
  Sample22: incbin "Sample_153af0a14dfa01b26538333fd4f5e4c1.brr"
  Sample23: incbin "Sample_3841b4150856deb8b8ee01fe35f497c3.brr"
  Sample24: incbin "Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr"

Trackers:
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5842
  dw Pattern5852
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5842
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Pattern5842: dw Track5872, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track5889, Track594F, Track5A56, Track5B94, Track5C7C, Track5D59, Track5DCB, Track594F
Pattern5862: dw Track5E0B, Track5E34, Track5E4F, Track5E69, 0, 0, 0, 0

Track5872:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,51
  !musicVolume,192
  !echo,%00111111,47,47
  !echoParameters,2,0,6
  !end

Track5889:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,208
  !pan,10
  db 96
  !rest
  db 60
  !d7
  db 36
  !rest
  db 24
  !a6
  !rest
  !g6
  !rest
  db 72
  !c7
  db 24
  !rest
  db 12
  !g6
  db 4
  !rest
  db 12
  !g6
  db 4
  !rest
  db 12
  !a6
  db 4
  !rest
  db 60
  !as6
  db 36
  !rest
  db 60
  !f6
  db 36
  !rest
  db 24
  !ds6
  !rest
  db 60
  !as6
  db 36
  !rest
  db 24
  !as6
  !rest
  !volume,144
  db 96
  !a6
  !tie
  !as6
  !tie
  !b6
  !tie
  db 114
  !c7
  db 30
  !rest
  db 16
  !c7
  !c7
  !c7
  !volume,192
  !instr,$1C
  db 24
  !c4
  db 72
  !rest
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
  !instr,$1D
  !volume,144
  db 16
  !c4
  !c4
  db 64
  !c4
  db 48
  !rest
  !instr,$1C
  !volume,192
  db 24
  !c4
  !c4
  !rest
  db 6
  !c4
  !c4
  !c4
  !c4
  db 24
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  db 24
  !c4
  !c4
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  db 16
  !c4
  !c4
  !c4
  db 48
  !rest
  db 16
  !c4
  !c4
  !c4
  db 24
  !c4
  !c4
  db 16
  !c4
  !c4
  !c4
  db 24
  !rest
  !c4
  !rest
  !c4
  !c4
  !c4
  !c4
  !c4
  db 48
  !rest
  db 16
  !c4
  !c4
  !c4
  db 24
  !c4
  !rest
  db 16
  !c4
  !c4
  !c4
  !instr,$1F
  !volume,192
  !pan,8
  db 12
  !rest
  db 96
  !d4
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !rest
  !end

Track594F:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !volume,204
  !pan,10
  db 48
  !rest
  !e4
  db 16
  !e4
  !e4
  !e4
  db 24
  !e4
  db 48
  !e4
  db 24
  !e4
  db 48
  !e4
  db 16
  !e4
  !e4
  !e4
  db 24
  !e4
  !e4
  !e4
  !e4
  !f4
  !rest
  db 16
  !f4
  !f4
  !f4
  db 24
  !f4
  !f4
  !rest
  !f4
  !f4
  db 48
  !f4
  !f4
  !f4
  db 24
  !f4
  !fs4
  db 48
  !fs4
  db 24
  !fs4
  !fs4
  db 48
  !fs4
  db 24
  !fs4
  !g4
  db 48
  !g4
  db 24
  !g4
  !g4
  db 48
  !g4
  db 24
  !g4
  !gs4
  db 48
  !gs4
  db 24
  !gs4
  !gs4
  db 48
  !gs4
  db 24
  !gs4
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  db 12
  !a4
  !rest
  !a4
  !rest
  db 16
  !a4
  !a4
  !a4
  db 48
  !d4
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 12
  !d4
  !rest
  !d4
  db 36
  !rest
  db 12
  !d4
  !rest
  db 48
  !d4
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 12
  !d4
  !rest
  !d4
  db 60
  !rest
  db 48
  !d4
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 12
  !d4
  !rest
  !d4
  db 60
  !rest
  !volume,208
  db 48
  !d4
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 14
  !d4
  db 2
  !rest
  db 12
  !d4
  !rest
  !d4
  !rest
  !volume,192
  db 8
  !d4
  !d4
  !d4
  !d4
  !d4
  !d4
  db 24
  !rest
  db 48
  !d4
  !d4
  db 12
  !d4
  !rest
  !volume,176
  db 16
  !d4
  !d4
  !d4
  db 48
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
  db 16
  !d4
  !d4
  !d4
  db 24
  !rest
  db 12
  !d4
  db 36
  !rest
  db 24
  !d4
  !d4
  !d4
  !d4
  !d4
  db 48
  !rest
  !volume,208
  db 16
  !d4
  !d4
  !d4
  db 24
  !d4
  db 72
  !rest
  !instr,$18
  !volume,192
  db 12
  !rest
  db 96
  !c6
  !tie
  db 48
  !tie
  !loop : dw Sub5A52 : db 255
  !end

Sub5A52:
  db 96
  !rest
  !tie
  !end

Track5A56:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,144
  !pan,10
  db 96
  !rest
  db 60
  !d6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !a5
  !dynamicVolume,24,16
  !tie
  !volume,144
  !g5
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 60
  !g5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 16
  !g5
  !g5
  !a5
  !instr,$19
  db 60
  !as5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 60
  !c5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !as4
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 60
  !as5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !as5
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 96
  !a5
  db 72
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 96
  !as5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !b5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 108
  !c6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 16
  !c6
  !c6
  !c6
  db 24
  !a5
  !rest
  !d5
  !rest
  db 48
  !rest
  !volume,160
  db 16
  !rest
  !gs5
  !as5
  !a5
  !d5
  !a5
  !g5
  !ds5
  !as4
  !ds5
  !g5
  !as5
  !ds6
  !g6
  !as6
  !c7
  db 32
  !rest
  !instr,$1A
  db 16
  !f5
  db 96
  !rest
  db 16
  !b5
  !cs6
  !c6
  !f5
  !c6
  !instr,$19
  db 48
  !d6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  db 6
  !rest
  !instr,$1A
  db 18
  !d6
  db 16
  !g6
  !b6
  !d7
  !instr,$19
  db 96
  !a6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  !instr,$1A
  !a6
  !volume,144
  db 16
  !a6
  !d6
  !a6
  !instr,$19
  db 96
  !b6
  db 48
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  !rest
  db 72
  !c7
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  !c7
  !dynamicVolume,24,16
  !tie
  !volume,144
  !instr,$1A
  db 16
  !c7
  !f6
  !c7
  !instr,$19
  db 72
  !d7
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  !instr,$1A
  db 16
  !d7
  db 32
  !rest
  db 16
  !d7
  !d7
  !d7
  !instr,$1F
  !volume,192
  !pan,12
  db 12
  !rest
  db 96
  !d4
  !tie
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub5A52 : db 255
  !end

Track5B94:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,144
  !pan,14
  db 96
  !rest
  !e5
  db 24
  !e5
  !dynamicVolume,24,16
  !tie
  !volume,144
  !d5
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 60
  !d5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 16
  !d5
  !d5
  !e5
  !instr,$19
  db 60
  !f5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 60
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !f4
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 60
  !f5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 96
  !e5
  db 72
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 96
  !f5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !fs5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 108
  !g5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 16
  !rest
  !g5
  !pan,10
  !instr,$19
  db 64
  !d5
  db 48
  !rest
  db 60
  !ds5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !rest
  !tie
  !tie
  db 60
  !fs5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !rest
  !tie
  !instr,$21
  !volume,96
  !pan,10
  !gs5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !rest
  db 48
  !rest
  db 96
  !gs4
  db 48
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !rest
  db 96
  !g4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  db 96
  !rest
  !g7
  !loop : dw Sub5A52 : db 255
  !end

Track5C7C:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,144
  !pan,6
  db 96
  !rest
  !tie
  db 24
  !b4
  !dynamicVolume,24,16
  !tie
  !volume,144
  !a4
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 96
  !rest
  !instr,$1A
  db 16
  !a4
  !a4
  !rest
  !instr,$19
  db 60
  !c5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !rest
  db 48
  !tie
  db 60
  !c5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 24
  !c5
  !dynamicVolume,24,16
  !tie
  !volume,144
  db 96
  !b4
  db 72
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 96
  !c5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !cs5
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 108
  !d5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 16
  !d5
  !d5
  !rest
  !instr,$1B
  !volume,144
  !pan,8
  db 96
  !a6
  !pan,12
  !gs6
  !pan,8
  !a6
  !pan,12
  !as6
  !pan,8
  !c7
  !pan,12
  !b6
  !pan,8
  db 24
  !c7
  !rest
  !pan,12
  db 60
  !b6
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,144
  db 12
  !rest
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !pan,8
  db 96
  !b7
  !pan,12
  db 18
  !b7
  db 30
  !rest
  !pan,10
  db 16
  !b7
  !b7
  !b7
  db 72
  !rest
  !instr,$20
  !volume,80
  !pan,8
  !dynamicVolume,192,120
  db 96
  !d7
  !tie
  !tie
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,80
  !loop : dw Sub5A52 : db 255
  !end

Track5D59:
  db 127,$7F
  !transpose,0
  !instr,$21
  !volume,112
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
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !d6
  !ds6
  !d6
  !ds6
  !f6
  !fs6
  db 24
  !f6
  !dynamicVolume,24,16
  !tie
  !volume,112
  db 96
  !rest
  db 48
  !tie
  db 96
  !d7
  !tie
  db 60
  !d7
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 12
  !rest
  db 96
  !rest
  !f7
  !tie
  db 60
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,112
  db 12
  !rest
  db 18
  !g7
  db 30
  !rest
  db 16
  !g7
  !g7
  !g7
  db 72
  !rest
  !instr,$20
  !volume,80
  !pan,12
  !dynamicVolume,192,120
  db 96
  !d6
  !tie
  !tie
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,80
  !loop : dw Sub5A52 : db 255
  !end

Track5DCB:
  db 127,$7F
  !transpose,0
  !instr,$22
  !volume,160
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
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !d5
  !tie
  !tie
  !tie
  !d4
  !tie
  !tie
  !tie
  !instr,$1F
  !d4
  !tie
  !d4
  !tie
  !d4
  !tie
  !d4
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  !rest
  db 16
  !d4
  !d4
  !d4
  !loop : dw Sub5A52 : db 255
  !end

Track5E0B:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,54
  !musicVolume,128
  db 127,$7F
  !transpose,0
  !pan,12
  !echo,%00001111,47,47
  !echoParameters,2,40,5
  !instr,$1F
  !volume,160
  !loop : dw Sub5E2E : db 8
  !end

Sub5E2E:
  db 96
  !d4
  db 48
  !tie
  !rest
  !end

Track5E34:
  db 127,$7F
  !transpose,0
  !pan,8
  !instr,$19
  !volume,128
  !loop : dw Sub5E43 : db 8
  !end

Sub5E43:
  db 96
  !a3
  db 72
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,128
  !end

Track5E4F:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$24
  !volume,192
  !loop : dw Sub5E5E : db 8
  !end

Sub5E5E:
  db 96
  !d3
  db 48
  !tie
  !dynamicVolume,48,16
  !tie
  !volume,192
  !end

Track5E69:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$23
  !loop : dw Sub5E76 : db 1
  !end

Sub5E76:
  !volume,192
  !dynamicVolume,96,48
  db 18
  !d6
  !d6
  !d6
  !d6
  !d6
  !d6
  db 84
  !rest
  !volume,192
  !dynamicVolume,96,48
  db 18
  !as6
  !as6
  !as6
  !as6
  !as6
  !as6
  db 84
  !rest
  !volume,192
  !dynamicVolume,96,48
  db 18
  !f6
  !f6
  !f6
  !f6
  !f6
  !f6
  db 84
  !rest
  db 96
  !rest
  !tie
  !volume,192
  !dynamicVolume,96,48
  db 18
  !d6
  !d6
  !d6
  !d6
  !d6
  !d6
  db 84
  !rest
  !volume,192
  !dynamicVolume,96,48
  db 18
  !c7
  !c7
  !c7
  !c7
  !c7
  !c7
  db 84
  !rest
  !volume,192
  !dynamicVolume,96,48
  db 18
  !as6
  !as6
  !as6
  !as6
  !as6
  !as6
  db 84
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
