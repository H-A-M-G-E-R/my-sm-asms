asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$B1,$B8,$02,$C1
  db $19,$FF,$B2,$B8,$02,$C1
  db $1A,$DF,$B0,$B8,$09,$EC
  db $1B,$FF,$B2,$B8,$02,$C1
  db $1C,$BD,$68,$B8,$00,$B0
  db $1D,$EE,$D0,$B8,$02,$C0
  db $1E,$FF,$E7,$B8,$00,$B0
  db $1F,$FF,$F0,$B8,$02,$C1
  db $20,$FF,$F2,$B8,$03,$40
  db $21,$FF,$F2,$B8,$03,$40
  db $22,$FF,$E0,$B8,$03,$40
  db $23,$FF,$E0,$B8,$10,$00
  db $24,$FF,$E0,$B8,$03,$60
  db $25,$FF,$E0,$B8,$03,$60
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_1B,Sample18_1B+3717
  dw Sample19_1F,Sample19_1F+90
  dw Sample1A,Sample1A
  dw Sample18_1B,Sample18_1B+3717
  dw Sample1C_1D_1E,Sample1C_1D_1E+1233
  dw Sample1C_1D_1E,Sample1C_1D_1E+1233
  dw Sample1C_1D_1E,Sample1C_1D_1E+1233
  dw Sample19_1F,Sample19_1F+90
  dw Sample20_21_22,Sample20_21_22
  dw Sample20_21_22,Sample20_21_22
  dw Sample20_21_22,Sample20_21_22
  dw Sample23_24_25,Sample23_24_25
  dw Sample23_24_25,Sample23_24_25
  dw Sample23_24_25,Sample23_24_25
endspcblock

spcblock $A100-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18_1B: incbin "Sample_b649c95c8307da16268e475b83060216.brr"
  Sample19_1F: incbin "Sample_339e2514032d4e1335bab88b6de80e48.brr"
  Sample1A: incbin "Sample_89767433c447228a2f21fe0b1a2442f0.brr"
  Sample1C_1D_1E: incbin "Sample_616aa02c04ba9f2f2ff88b6fd62db5c2.brr"
  Sample20_21_22: incbin "Sample_2822bad39b87fb8c53e54a49b8a625f0.brr"
  Sample23_24_25: incbin "Sample_65de485131683021221ec0135ce51596.brr"

Trackers:
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern5852
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5892
-
  dw Pattern5872
  dw Pattern5872
  dw Pattern5882
  dw Pattern5882
  dw $00FF,-
  dw $0000

Tracker7:
  dw Pattern58A2
-
  dw Pattern58B2
  dw $00FF,-
  dw $0000

Pattern5852: dw Track58C2, 0, 0, 0, 0, 0, 0, 0
Pattern5862: dw Track58DF, Track59B0, Track5ABA, Track5B49, Track5BB6, Track5A4F, 0, 0
Pattern5872: dw Track5C58, Track5C80, Track5CA7, 0, 0, 0, 0, 0
Pattern5882: dw Track5CD9, Track5CE6, Track5CF1, Track5CF6, Track5D03, 0, 0, 0
Pattern5892: dw Track5D10, Track5D22, Track5D2D, Track5D38, Track5D43, 0, 0, 0
Pattern58A2: dw Track5D4F, 0, 0, 0, 0, 0, 0, 0
Pattern58B2: dw Track5D6C, Track5E5A, Track5EF4, Track5FA1, Track603F, Track60A9, 0, 0

Track58C2:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,81
  !musicVolume,216
  !musicTranspose,255
  !echo,%00011111,47,47
  !echoParameters,2,12,5
  !dynamicEcho,128,52,52
  !end

Track58DF:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,240
  !pan,6
  !loop : dw Sub5926 : db 2
  !instr,$19
  !loop : dw Sub5963 : db 1
  db 96
  !rest
  !tie
  !tie
  !tie
  !instr,$18
  !volume,176
  !pan,10
  !ds4
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  db 96
  !ds4
  !tie
  db 24
  !tie
  !volume,216
  !g4
  !a4
  !b4
  db 108
  !ds4
  !volume,240
  db 12
  !rest
  db 24
  !g4
  !a4
  !b4
  db 108
  !ds4
  !volume,255
  db 12
  !rest
  db 24
  !g4
  !a4
  !b4
  db 96
  !ds4
  !end

Sub5926:
  db 36
  !c4
  !rest
  db 72
  !b4
  db 48
  !rest
  db 24
  !as4
  !rest
  !e4
  !rest
  !a4
  !rest
  !c4
  db 36
  !cs4
  !rest
  db 72
  !b4
  db 48
  !rest
  db 24
  !as4
  !rest
  !e4
  !rest
  !a4
  !rest
  !cs4
  db 36
  !d4
  !rest
  db 72
  !c5
  db 48
  !rest
  db 24
  !b4
  !rest
  !f4
  !rest
  !as4
  !rest
  !d4
  db 36
  !ds4
  !rest
  db 72
  !cs5
  db 48
  !rest
  db 24
  !c5
  !rest
  !fs4
  !rest
  !b4
  !rest
  !ds4
  !end

Sub5963:
  !volume,144
  !pan,6
  db 24
  !as6
  !a6
  db 48
  !rest
  !volume,96
  !pan,14
  db 24
  !d6
  !cs6
  db 48
  !rest
  !volume,128
  !pan,10
  db 24
  !cs5
  db 48
  !rest
  !volume,144
  db 24
  !d5
  db 48
  !rest
  !volume,160
  db 24
  !ds5
  !rest
  !volume,176
  !pan,12
  db 18
  !e5
  db 30
  !rest
  !volume,112
  !pan,8
  db 24
  !ds5
  !volume,136
  !pan,12
  !e5
  !volume,160
  !pan,8
  !f5
  !volume,176
  !pan,12
  !fs5
  !volume,144
  !pan,8
  !f5
  !volume,104
  !pan,12
  !e5
  !end

Track59B0:
  db 127,$7F
  !transpose,0
  !endVibrato
  !instr,$18
  !volume,208
  db 6
  !rest
  !pan,12
  !loop : dw Sub5A02 : db 2
  !instr,$19
  !pan,14
  !transpose,0
  !vibrato,0,18,79
  !loop : dw Sub5963 : db 1
  db 96
  !rest
  !tie
  !tie
  !tie
  !instr,$18
  !volume,176
  !pan,12
  !ds3
  !tie
  !tie
  db 84
  !tie
  db 12
  !rest
  db 96
  !ds3
  !tie
  db 24
  !tie
  !volume,216
  !g3
  !a3
  !b3
  db 108
  !ds3
  !volume,240
  db 12
  !rest
  db 24
  !g3
  !a3
  !b3
  db 108
  !ds3
  !volume,255
  db 12
  !rest
  db 24
  !g3
  !a3
  !b3
  db 96
  !ds3
  !end

Sub5A02:
  !pan,4
  db 36
  !c4
  !rest
  db 72
  !b4
  db 48
  !rest
  !pan,16
  db 24
  !as4
  !rest
  !e4
  !rest
  !a4
  !rest
  !c4
  !pan,4
  db 36
  !cs4
  !rest
  db 72
  !b4
  db 48
  !rest
  !pan,16
  db 24
  !as4
  !rest
  !e4
  !rest
  !a4
  !rest
  !cs4
  !pan,4
  db 36
  !d4
  !rest
  db 72
  !c5
  db 48
  !rest
  !pan,16
  db 24
  !b4
  !rest
  !f4
  !rest
  !as4
  !rest
  !d4
  !pan,4
  db 36
  !ds4
  !rest
  db 72
  !cs5
  db 48
  !rest
  !pan,16
  db 24
  !c5
  !rest
  !fs4
  !rest
  !b4
  !rest
  !ds4
  !end

Track5A4F:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,255
  !pan,9
  !loop : dw Sub5A89 : db 2
  db 48
  !rest
  !pan,10
  db 24
  !c3
  !c2
  db 48
  !rest
  db 24
  !c3
  !c2
  !c2
  !c2
  !c2
  !c2
  !c2
  !c2
  !c2
  !c2
  !c2
  db 96
  !rest
  db 72
  !tie
  !volume,176
  !pan,9
  !loop : dw Sub5AB3 : db 7
  db 72
  !ds2
  db 48
  !a2
  db 24
  !b3
  !c4
  !cs4
  !volume,240
  !end

Sub5A89:
  db 72
  !c3
  !c3
  !c3
  db 24
  !rest
  db 72
  !c3
  db 48
  !c3
  db 72
  !cs3
  !cs3
  !cs3
  db 24
  !rest
  db 72
  !cs3
  db 48
  !cs3
  db 72
  !d3
  !d3
  !d3
  db 24
  !rest
  db 48
  !d3
  db 72
  !d3
  !ds3
  !ds3
  !ds3
  db 24
  !rest
  db 48
  !ds3
  db 24
  !ds3
  db 48
  !ds3
  !end

Sub5AB3:
  db 72
  !ds2
  db 96
  !a2
  db 24
  !rest
  !end

Track5ABA:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,255
  !pan,11
  !subtranspose,64
  !loop : dw Sub5AE3 : db 2
  !instr,$19
  !transpose,250
  !loop : dw Sub5963 : db 1
  !instr,$1C
  !transpose,12
  !pan,10
  !loop : dw Sub5B2D : db 1
  db 12
  !rest
  db 24
  !cs6
  !d6
  !ds6
  !end

Sub5AE3:
  db 48
  !c2
  db 24
  !rest
  db 48
  !c2
  db 24
  !rest
  db 48
  !c2
  db 24
  !rest
  !rest
  db 48
  !c2
  db 24
  !rest
  db 48
  !c2
  !cs2
  db 24
  !rest
  db 48
  !cs2
  db 24
  !rest
  db 48
  !cs2
  db 24
  !rest
  !rest
  db 48
  !cs2
  db 24
  !rest
  db 48
  !cs2
  !d2
  db 24
  !rest
  db 48
  !d2
  db 24
  !rest
  db 48
  !d2
  db 24
  !rest
  !rest
  db 48
  !d2
  !d2
  db 24
  !rest
  db 48
  !ds2
  db 24
  !rest
  db 48
  !ds2
  db 24
  !rest
  db 48
  !ds2
  db 24
  !rest
  !rest
  db 48
  !ds2
  db 24
  !ds2
  db 48
  !ds2
  !end

Sub5B2D:
  !volume,80
  db 96
  !a5
  !tie
  !tie
  !tie
  !volume,96
  !as5
  !tie
  !tie
  !tie
  !volume,112
  !b5
  !tie
  !tie
  !tie
  !dynamicVolume,240,160
  !c6
  !tie
  !tie
  db 12
  !tie
  !end

Track5B49:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,8
  !loop : dw Sub5B77 : db 2
  !instr,$18
  !volume,208
  !pan,11
  db 96
  !e4
  !pitchSlide,0,96 : !e3
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1C
  !pan,8
  !pan,10
  !loop : dw Sub5B2D : db 1
  db 12
  !rest
  db 24
  !cs6
  !d6
  !ds6
  !end

Sub5B77:
  !volume,240
  db 72
  !f4
  !volume,176
  !f4
  !f4
  db 24
  !rest
  !volume,224
  db 72
  !f4
  !volume,176
  db 48
  !f4
  !volume,224
  db 72
  !fs4
  !volume,192
  !fs4
  !fs4
  db 24
  !rest
  db 72
  !fs4
  !volume,208
  db 48
  !fs4
  !volume,224
  db 72
  !g4
  !volume,176
  !g4
  !g4
  db 24
  !rest
  !volume,240
  db 72
  !g4
  db 48
  !g4
  db 72
  !gs4
  !gs4
  !gs4
  db 24
  !rest
  db 72
  !gs4
  !volume,176
  db 48
  !gs4
  !end

Track5BB6:
  db 127,$7F
  !transpose,8
  !endVibrato
  !instr,$1B
  !pan,11
  !loop : dw Sub5B77 : db 2
  !instr,$18
  !volume,208
  !pan,8
  db 96
  !ds5
  !pitchSlide,0,96 : !ds4
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1D
  !pan,10
  !volume,80
  !vibrato,0,18,79
  !pan,8
  db 72
  !g3
  !pan,10
  db 48
  !f4
  db 12
  !rest
  !pan,12
  db 48
  !b3
  db 12
  !rest
  !pan,8
  db 72
  !g4
  !pan,10
  !b3
  !pan,12
  db 48
  !g3
  !volume,96
  !pan,8
  db 72
  !gs3
  !pan,10
  db 48
  !g4
  db 12
  !rest
  !pan,12
  db 48
  !c4
  db 12
  !rest
  !pan,8
  db 72
  !gs4
  !pan,10
  !c4
  !pan,12
  db 48
  !gs3
  !volume,112
  !pan,8
  db 72
  !a4
  !pan,10
  !f4
  !pan,12
  db 48
  !b3
  !pan,8
  db 72
  !a4
  !pan,10
  !f4
  db 12
  !rest
  !pan,12
  db 24
  !b3
  db 12
  !rest
  !volume,96
  !loop : dw Sub5C3F : db 3
  !pan,10
  db 18
  !as4
  db 78
  !rest
  !end

Sub5C3F:
  !pan,8
  db 18
  !as4
  db 6
  !rest
  !pan,9
  db 18
  !fs4
  db 6
  !rest
  !pan,11
  db 18
  !e4
  db 6
  !rest
  !pan,12
  db 18
  !c4
  db 6
  !rest
  !end

Track5C58:
  !musicTranspose,255
  !tempo,25
  !musicVolume,224
  !echo,%00011111,47,47
  !echoParameters,2,12,5
  !dynamicEcho,128,52,52
  !loop : dw Sub5C73 : db 1
  !tie
  !d4
  !tie
  !end
  !end

Sub5C73:
  !instr,$1E
  !subtranspose,80
  !pan,10
  !volume,140
  db 96,$7F
  !cs4
  !end
  !end

Track5C80:
  !instr,$1E
  !subtranspose,70
  !pan,10
  !loop : dw Sub5C8B : db 1
  !end

Sub5C8B:
  !volume,56
  !dynamicVolume,96,130
  db 96,$7F
  !f5
  !volume,130
  !dynamicVolume,24,50
  !tie
  !volume,56
  !dynamicVolume,96,130
  !fs5
  !volume,130
  !dynamicVolume,24,50
  !tie
  !end
  !end

Track5CA7:
  !loop : dw Sub5CAC : db 1
  !end

Sub5CAC:
  !instr,$1F
  !subtranspose,70
  !transpose,250
  !pan,10
  !volume,150
  !dynamicVolume,96,210
  db 12,$7F
  !g3
  !gs3
  !a3
  !g3
  !gs3
  !a3
  !g3
  db 6
  !gs3
  !gs3
  db 96
  !rest
  !volume,150
  !dynamicVolume,40,210
  db 12
  !gs3
  !a3
  !as3
  db 6
  !gs3
  !gs3
  db 48
  !rest
  db 96
  !rest
  !end
  !end

Track5CD9:
  !tempo,25
  !musicVolume,184
  !loop : dw Sub5C73 : db 1
  !tie
  !d4
  !tie
  !end
  !end

Track5CE6:
  !instr,$1E
  !subtranspose,70
  !pan,10
  !loop : dw Sub5C8B : db 1
  !end

Track5CF1:
  !loop : dw Sub5CAC : db 1
  !end

Track5CF6:
  !instr,$1E
  !transpose,12
  !subtranspose,70
  !pan,10
  !loop : dw Sub5C8B : db 1
  !end

Track5D03:
  !instr,$1E
  !transpose,6
  !subtranspose,70
  !pan,10
  !loop : dw Sub5C8B : db 1
  !end

Track5D10:
  !percBase,$27
  !tempo,25
  !musicVolume,184
  !instr,$1E
  !subtranspose,80
  !volume,140
  !pan,10
  db 12
  !rest
  !end
  !end

Track5D22:
  !instr,$1E
  !subtranspose,70
  !volume,200
  !pan,10
  db 12
  !rest
  !end

Track5D2D:
  !instr,$1F
  !subtranspose,70
  !volume,210
  !pan,10
  db 12
  !rest
  !end

Track5D38:
  !instr,$1E
  !subtranspose,70
  !volume,130
  !pan,10
  db 12
  !rest
  !end

Track5D43:
  !instr,$1E
  !subtranspose,70
  !pan,10
  !volume,130
  db 12
  !rest
  !end
  !end

Track5D4F:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,76
  !musicVolume,232
  !musicTranspose,255
  !echo,%00011111,47,47
  !echoParameters,2,12,5
  !dynamicEcho,192,52,52
  !end

Track5D6C:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,12,5
  !dynamicEcho,192,52,52
  !instr,$1A
  !volume,224
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !rest
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !cs3
  !rest
  !cs3
  db 24
  !rest
  db 48
  !cs3
  db 24
  !rest
  db 48
  !d3
  db 24
  !rest
  db 48
  !d3
  db 24
  !rest
  db 48
  !d3
  !rest
  !d3
  db 24
  !rest
  db 48
  !d3
  db 24
  !rest
  db 48
  !ds3
  db 24
  !rest
  db 48
  !ds3
  db 24
  !rest
  db 48
  !ds3
  !rest
  !ds3
  db 24
  !rest
  !ds3
  !d3
  !cs3
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !rest
  !cs3
  !d3
  !ds3
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !rest
  !cs3
  !d3
  !ds3
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !pan,12
  !rest
  db 24
  !cs3
  !pan,10
  !d3
  !pan,8
  !ds3
  !pan,10
  !e3
  !pan,12
  !ds3
  !pan,10
  !d3
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !pan,12
  !rest
  db 24
  !cs3
  !pan,10
  !d3
  !pan,8
  !ds3
  !pan,10
  !e3
  !pan,12
  !ds3
  !pan,10
  !d3
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !pan,12
  !rest
  db 24
  !d3
  !pan,10
  !ds3
  !pan,8
  !e3
  !pan,10
  !f3
  !pan,12
  !e3
  !pan,10
  !ds3
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 48
  !c3
  !pan,12
  !rest
  db 24
  !ds3
  !pan,10
  !e3
  !pan,8
  !f3
  !pan,10
  !fs3
  !pan,12
  !f3
  !pan,10
  !e3
  !end

Track5E5A:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,255
  !pan,10
  db 96
  !c4
  !tie
  db 24
  !rest
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 96
  !cs4
  !tie
  db 24
  !rest
  !cs4
  !rest
  !cs4
  !cs4
  db 72
  !rest
  db 96
  !d4
  !tie
  db 24
  !rest
  !d4
  !rest
  !d4
  !d4
  db 72
  !rest
  db 96
  !ds4
  !tie
  db 24
  !rest
  !ds4
  !rest
  !ds4
  !ds4
  !ds4
  !d4
  !cs4
  !pan,10
  !g4
  db 48
  !rest
  db 24
  !g4
  db 48
  !rest
  db 24
  !g4
  !rest
  !gs4
  !rest
  !gs4
  !rest
  !g4
  !gs4
  !a4
  !rest
  !c5
  db 48
  !rest
  db 24
  !c5
  db 48
  !rest
  db 24
  !c5
  !rest
  !cs5
  !rest
  !cs5
  !rest
  !c5
  !cs5
  !d5
  !rest
  db 96
  !c4
  db 24
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  db 96
  !c4
  db 24
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  db 96
  !c4
  db 24
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  db 96
  !c4
  db 24
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  !c4
  !cs4
  !d4
  !ds4
  !end

Track5EF4:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  !cs5
  db 24
  !rest
  db 48
  !cs5
  db 24
  !rest
  db 48
  !cs5
  !cs5
  db 24
  !rest
  db 48
  !cs5
  db 24
  !rest
  db 48
  !cs5
  !d5
  db 24
  !rest
  db 48
  !d5
  db 24
  !rest
  db 48
  !d5
  !d5
  db 24
  !rest
  db 48
  !d5
  db 24
  !rest
  db 48
  !d5
  !ds5
  db 24
  !rest
  db 48
  !ds5
  db 24
  !rest
  db 48
  !ds5
  !ds5
  db 24
  !rest
  !ds5
  !rest
  !ds5
  !d5
  !cs5
  db 48
  !c5
  db 72
  !rest
  db 24
  !d5
  !ds5
  !e5
  db 48
  !c5
  db 72
  !rest
  db 24
  !d5
  !ds5
  !e5
  db 48
  !c5
  db 72
  !rest
  db 24
  !d5
  !ds5
  !e5
  db 48
  !c5
  db 72
  !rest
  db 24
  !d5
  !ds5
  !e5
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 96
  !rest
  !tie
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 12
  !rest
  db 48
  !c5
  db 96
  !rest
  !tie
  db 12
  !tie
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 96
  !rest
  !tie
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  !c5
  db 24
  !rest
  db 48
  !c5
  db 24
  !rest
  db 48
  !c5
  !end

Track5FA1:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,255
  db 24
  !c4
  !rest
  !c4
  !c4
  !c4
  !rest
  !c4
  db 48
  !c4
  db 24
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 24
  !c4
  !rest
  !c4
  !c4
  !c4
  !rest
  !c4
  db 48
  !c4
  db 24
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 24
  !c4
  !rest
  !c4
  !c4
  !c4
  !rest
  !c4
  db 48
  !c4
  db 24
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 24
  !c4
  !rest
  !c4
  !c4
  !c4
  !rest
  !c4
  db 48
  !c4
  db 24
  !c4
  !rest
  !c4
  !c4
  db 48
  !rest
  db 24
  !c4
  !c5
  db 120
  !rest
  db 24
  !c5
  db 96
  !rest
  db 24
  !c5
  !rest
  !c5
  !c5
  !c5
  !c5
  db 120
  !rest
  db 24
  !c5
  db 96
  !rest
  db 24
  !c5
  !rest
  !c5
  !c5
  !c5
  !c5
  db 120
  !rest
  db 24
  !c5
  db 96
  !rest
  db 24
  !c5
  !rest
  !c5
  !c5
  !c5
  !c5
  db 120
  !rest
  db 24
  !c5
  db 96
  !rest
  db 24
  !c5
  !rest
  !c5
  !c5
  !c5
  !c5
  db 120
  !rest
  db 24
  !c5
  db 96
  !rest
  db 24
  !c5
  !rest
  !c5
  !c5
  !c5
  !c5
  db 120
  !rest
  db 24
  !c5
  !c5
  !rest
  !b4
  !b4
  !rest
  !as4
  !as4
  db 48
  !rest
  !end

Track603F:
  db 127,$7F
  !transpose,12
  !instr,$19
  !volume,192
  !pan,8
  db 96
  !c4
  !tie
  db 24
  !rest
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 96
  !cs4
  !tie
  db 24
  !rest
  !cs4
  !rest
  !cs4
  !cs4
  db 72
  !rest
  db 96
  !d4
  !tie
  db 24
  !rest
  !d4
  !rest
  !d4
  !d4
  db 72
  !rest
  db 96
  !ds4
  !tie
  db 24
  !rest
  !ds4
  !rest
  !ds4
  !ds4
  !ds4
  !d4
  !cs4
  !pan,10
  !instr,$19
  !volume,112
  !g4
  db 48
  !rest
  db 24
  !g4
  db 48
  !rest
  db 24
  !g4
  !rest
  !gs4
  !rest
  !gs4
  !rest
  !g4
  !gs4
  !a4
  !rest
  !c5
  db 48
  !rest
  db 24
  !c5
  db 48
  !rest
  db 24
  !c5
  !rest
  !cs5
  !rest
  !cs5
  !rest
  !c5
  !cs5
  !d5
  !rest
  !loop : dw Sub60A5 : db 255
  !end

Sub60A5:
  db 96
  !rest
  !tie
  !end

Track60A9:
  db 127,$7F
  !transpose,12
  !instr,$19
  !volume,160
  !pan,12
  db 6
  !rest
  db 96
  !c4
  !tie
  db 24
  !rest
  !c4
  !rest
  !c4
  !c4
  db 72
  !rest
  db 96
  !cs4
  !tie
  db 24
  !rest
  !cs4
  !rest
  !cs4
  !cs4
  db 72
  !rest
  db 96
  !d4
  !tie
  db 24
  !rest
  !d4
  !rest
  !d4
  !d4
  db 72
  !rest
  db 96
  !ds4
  !tie
  db 24
  !rest
  !ds4
  !rest
  !ds4
  !ds4
  !ds4
  !d4
  !cs4
  !pan,10
  !instr,$19
  !volume,112
  !g4
  db 48
  !rest
  db 24
  !g4
  db 48
  !rest
  db 24
  !g4
  !rest
  !gs4
  !rest
  !gs4
  !rest
  !g4
  !gs4
  !a4
  !rest
  !c5
  db 48
  !rest
  db 24
  !c5
  db 48
  !rest
  db 24
  !c5
  !rest
  !cs5
  !rest
  !cs5
  !rest
  !c5
  !cs5
  !d5
  !rest
  !loop : dw Sub6111 : db 255
  !end

Sub6111:
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
