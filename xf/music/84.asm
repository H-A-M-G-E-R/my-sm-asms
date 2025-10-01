asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Sector 0 lockdown

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F3,$B8,$02,$7A
  db $19,$FF,$E7,$B8,$04,$F4
  db $1A,$FF,$E0,$B8,$09,$EC
  db $1B,$FF,$E0,$B8,$04,$F4
  db $1C,$FF,$E0,$B8,$00,$40
  db $1D,$FF,$E0,$B8,$00,$40
  db $1E,$FF,$E0,$B8,$00,$40
  db $1F,$FF,$E0,$B8,$00,$40
  db $20,$FF,$E0,$B8,$00,$40
  db $21,$7F,$E0,$00,$02,$7A
  db $22,$FF,$E0,$B8,$03,$80
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+18
  dw Sample19,Sample19
  dw Sample1A,Sample1A+1062
  dw Sample1B,Sample1B+378
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample21_22,Sample21_22
  dw Sample21_22,Sample21_22
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample19: skip filesize("Sample_ae8e1de965071e6c9210ea1074e4ae53.brr")
  Sample1A: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1B: skip filesize("Sample_af748b56afa8489cc137e7360fafc840.brr")
  Sample1C_1D_1E_1F_20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21_22: skip filesize("Sample_966096e36e1cb2d211f0ca91ee2d390c.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5840
-
  dw Pattern5850
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5840
-
  dw Pattern5860
  dw $00FF,-
  dw $0000

Pattern5840: dw Track5870, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track5887, Track5A17, Track5CA8, Track5D5D, Track5B2D, Track5C8E, 0, 0
Pattern5860: dw Track5D5D, 0, 0, 0, 0, 0, 0, 0

Track5870:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,221
  !echo,%00011111,47,47
  !echoParameters,5,16,0
  !end

Track5887:
  db 127,$7F
  !transpose,0
  !pan,10
  !echo,%00011111,47,47
  !echoParameters,5,16,0
  !loop : dw Sub589A : db 1
  !end

Sub589A:
  !instr,$18
  !volume,144
  db 24
  !c5
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,144
  db 24
  !c5
  !dynamicVolume,24,16
  !tie
  !volume,144
  !c5
  !cs5
  !dynamicVolume,24,16
  !tie
  !volume,144
  !volume,160
  !f5
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !f5
  !dynamicVolume,24,16
  !tie
  !volume,160
  !f5
  !fs5
  !dynamicVolume,24,16
  !tie
  !volume,160
  !volume,176
  !c6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,176
  db 24
  !c6
  !dynamicVolume,24,16
  !tie
  !volume,176
  !c6
  !cs6
  !dynamicVolume,24,16
  !tie
  !volume,176
  !volume,192
  !f6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,192
  db 24
  !f6
  !dynamicVolume,24,16
  !tie
  !volume,192
  !f6
  !fs6
  !dynamicVolume,24,16
  !tie
  !volume,192
  db 12
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !f4
  !e4
  !ds4
  !d4
  !g3
  !rest
  !c3
  !rest
  db 18
  !cs4
  db 6
  !rest
  db 18
  !cs4
  db 6
  !rest
  db 12
  !c3
  !rest
  !c3
  !rest
  db 18
  !f4
  db 6
  !rest
  db 24
  !f4
  db 12
  !c3
  !rest
  !c3
  !rest
  db 18
  !fs4
  db 6
  !rest
  db 24
  !fs4
  db 12
  !c3
  !rest
  !c3
  !rest
  db 18
  !a4
  db 6
  !rest
  db 24
  !a4
  !c4
  !c4
  db 12
  !f4
  !rest
  db 24
  !f4
  !c4
  !c4
  db 12
  !fs4
  !rest
  db 24
  !fs4
  !c4
  !c4
  db 12
  !a4
  !rest
  db 24
  !a4
  !c4
  !c4
  db 12
  !c5
  !rest
  db 24
  !c5
  !volume,144
  db 12
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !volume,160
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !volume,176
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !volume,192
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  db 66
  !a4
  db 6
  !rest
  db 24
  !as4
  db 66
  !cs5
  db 6
  !rest
  db 24
  !c5
  db 66
  !as4
  db 6
  !rest
  db 24
  !a4
  db 66
  !cs5
  db 6
  !rest
  db 24
  !c5
  db 66
  !ds5
  db 6
  !rest
  db 24
  !d5
  db 66
  !fs5
  db 6
  !rest
  db 24
  !f5
  db 66
  !ds5
  db 6
  !rest
  db 24
  !d5
  db 66
  !fs5
  db 6
  !rest
  db 24
  !f5
  !a4
  !gs4
  db 12
  !c5
  db 6
  !rest
  db 12
  !b4
  db 6
  !rest
  db 12
  !as4
  !d5
  db 6
  !rest
  db 12
  !cs5
  db 6
  !rest
  db 12
  !c5
  !e5
  db 6
  !rest
  db 12
  !f5
  db 6
  !rest
  db 12
  !fs5
  !end

Track5A17:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub5A72 : db 1
  !instr,$19
  !volume,112
  !dynamicVolume,192,160
  db 12
  !e4
  db 6
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !loop : dw Sub5AF4 : db 1
  !loop : dw Sub5B29 : db 255
  !end

Sub5A72:
  !instr,$18
  !volume,192
  db 24
  !c3
  db 48
  !rest
  db 24
  !c3
  !rest
  !c3
  !cs3
  !rest
  !c3
  db 48
  !rest
  db 24
  !c3
  !rest
  !c3
  !cs3
  !rest
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  !cs4
  !rest
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  !cs4
  !rest
  db 96
  !rest
  !tie
  !b3
  db 72
  !tie
  db 6
  !rest
  db 12
  !as3
  !rest
  db 96
  !a3
  db 48
  !tie
  db 18
  !rest
  db 6
  !gs3
  db 18
  !rest
  db 12
  !c3
  db 36
  !rest
  db 18
  !c4
  db 6
  !rest
  db 18
  !c4
  db 54
  !rest
  db 18
  !c4
  db 6
  !rest
  db 24
  !c4
  db 48
  !rest
  db 18
  !c4
  db 6
  !rest
  db 24
  !c4
  db 48
  !rest
  db 18
  !c4
  db 6
  !rest
  db 24
  !c4
  !c3
  !c3
  db 12
  !c4
  !rest
  db 24
  !c4
  !c3
  !c3
  db 12
  !c4
  !rest
  db 24
  !c4
  !c3
  !c3
  db 12
  !c4
  !rest
  db 24
  !c4
  !c3
  !c3
  db 12
  !as4
  !rest
  db 24
  !as4
  db 96
  !rest
  !tie
  !tie
  !tie
  !end

Sub5AF4:
  !instr,$18
  !volume,192
  db 48
  !c4
  !c3
  !ds4
  !ds3
  !c4
  !fs3
  !ds4
  !a3
  !fs3
  !fs2
  !c4
  !a2
  db 24
  !fs3
  !c2
  db 48
  !c3
  db 24
  !c4
  !ds2
  db 48
  !ds3
  !rest
  db 12
  !a3
  db 6
  !rest
  db 12
  !gs3
  db 6
  !rest
  db 12
  !g3
  !b3
  db 6
  !rest
  db 12
  !as3
  db 6
  !rest
  db 12
  !a3
  !cs4
  db 6
  !rest
  db 12
  !d4
  !end

Sub5B29:
  db 96
  !rest
  !tie
  !end

Track5B2D:
  db 127,$7F
  !transpose,0
  db 9
  !rest
  !volume,112
  !instr,$18
  !pan,14
  db 24
  !c5
  db 48
  !rest
  db 24
  !c5
  !rest
  !c5
  !cs5
  !rest
  !pan,6
  !f5
  db 48
  !rest
  db 24
  !f5
  !rest
  !f5
  !fs5
  !rest
  !pan,14
  !c6
  db 48
  !rest
  db 24
  !c6
  !rest
  !c6
  !cs6
  !rest
  !pan,6
  !f6
  db 48
  !rest
  db 24
  !f6
  !rest
  !f6
  !fs6
  !rest
  !volume,160
  !loop : dw Sub5C80 : db 12
  !pan,14
  db 12
  !g3
  !rest
  !c3
  !rest
  !pan,6
  db 18
  !cs4
  db 6
  !rest
  db 18
  !cs4
  db 6
  !rest
  !pan,14
  db 12
  !c3
  !rest
  !c3
  !rest
  !pan,6
  db 18
  !f4
  db 6
  !rest
  db 24
  !f4
  !pan,14
  db 12
  !c3
  !rest
  !c3
  !rest
  !pan,6
  db 18
  !fs4
  db 6
  !rest
  db 24
  !fs4
  !pan,14
  db 12
  !c3
  !rest
  !c3
  !rest
  !pan,6
  db 18
  !a4
  db 6
  !rest
  db 24
  !a4
  !pan,14
  !c4
  !c4
  !pan,6
  db 12
  !f4
  !rest
  db 24
  !f4
  !pan,14
  !c4
  !c4
  !pan,6
  db 12
  !fs4
  !rest
  db 24
  !fs4
  !pan,14
  !c4
  !c4
  !pan,6
  db 12
  !a4
  !rest
  db 24
  !a4
  !pan,14
  !c4
  !c4
  !pan,6
  db 12
  !c5
  !rest
  db 24
  !c5
  !pan,14
  db 12
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !b4
  !as4
  !a4
  !gs4
  !pan,6
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !c5
  !b4
  !as4
  !a4
  !pan,12
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !cs5
  !c5
  !b4
  !as4
  !pan,8
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  !d5
  !cs5
  !c5
  !b4
  !volume,112
  !pan,14
  db 66
  !a4
  db 6
  !rest
  db 24
  !as4
  db 66
  !cs5
  db 6
  !rest
  db 24
  !c5
  !pan,6
  db 66
  !as4
  db 6
  !rest
  db 24
  !a4
  db 66
  !cs5
  db 6
  !rest
  db 24
  !c5
  !pan,14
  db 66
  !ds5
  db 6
  !rest
  db 24
  !d5
  db 66
  !fs5
  db 6
  !rest
  db 24
  !f5
  !pan,6
  db 66
  !ds5
  db 6
  !rest
  db 24
  !d5
  db 66
  !fs5
  db 6
  !rest
  db 24
  !f5
  !pan,14
  !dynamicPan,191,6
  !volume,112
  !dynamicVolume,191,192
  !a4
  !gs4
  db 12
  !c5
  db 6
  !rest
  db 12
  !b4
  db 6
  !rest
  db 12
  !as4
  !d5
  db 6
  !rest
  db 12
  !cs5
  db 6
  !rest
  db 12
  !c5
  !e5
  db 6
  !rest
  db 12
  !f5
  db 6
  !rest
  db 12
  !fs5
  !end

Sub5C80:
  !pan,16
  db 12
  !f4
  !pan,4
  !e4
  !pan,16
  !ds4
  !pan,4
  !d4
  !end

Track5C8E:
  db 127,$7F
  !transpose,0
  !pan,8
  db 9
  !rest
  !loop : dw Sub5A72 : db 1
  db 96
  !rest
  !tie
  !tie
  !tie
  !loop : dw Sub5AF4 : db 1
  !loop : dw Sub5B29 : db 255
  !end

Track5CA8:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1A
  !volume,240
  db 72
  !c2
  db 48
  !c2
  db 24
  !c2
  db 48
  !cs2
  db 72
  !c2
  db 48
  !c2
  db 24
  !c2
  db 48
  !cs2
  !volume,224
  db 72
  !c3
  db 48
  !c3
  db 24
  !c3
  db 48
  !cs3
  db 72
  !c3
  db 48
  !c3
  db 24
  !c3
  db 48
  !cs3
  db 96
  !rest
  !tie
  !volume,208
  !b3
  db 66
  !tie
  db 12
  !rest
  !as3
  db 6
  !rest
  db 96
  !a3
  db 48
  !tie
  db 24
  !rest
  db 6
  !gs3
  db 18
  !rest
  !g3
  db 6
  !rest
  db 12
  !c3
  db 60
  !rest
  db 6
  !c3
  db 18
  !rest
  db 6
  !c3
  db 66
  !rest
  db 12
  !c3
  !rest
  db 24
  !c3
  db 48
  !rest
  db 24
  !c3
  db 6
  !c3
  db 42
  !rest
  db 12
  !c3
  !rest
  !c3
  !rest
  !c3
  db 60
  !rest
  db 12
  !c3
  !rest
  !c3
  db 60
  !rest
  db 12
  !c3
  !rest
  !c3
  db 60
  !rest
  db 12
  !c3
  !rest
  !c3
  db 36
  !rest
  db 24
  !c3
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !c2
  db 48
  !c3
  db 24
  !rest
  !ds2
  db 48
  !ds3
  db 24
  !rest
  !fs2
  db 48
  !fs3
  db 24
  !rest
  !a2
  db 48
  !a3
  db 24
  !rest
  !fs2
  db 48
  !fs3
  db 24
  !rest
  !a2
  db 48
  !a3
  db 24
  !rest
  !c3
  db 66
  !c4
  db 6
  !rest
  db 24
  !ds3
  db 48
  !ds4
  db 24
  !a3
  !c4
  !loop : dw Sub5B29 : db 255
  !end

Track5D5D:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,16
  !dynamicVolume,32,208
  !loop : dw Sub5D6F : db 255
  !end

Sub5D6F:
  db 24
  !e2
  !pitchSlide,0,24 : !ds4
  db 72
  !tie
  db 48
  !tie
  !pitchSlide,0,48 : !c2
  db 3
  !tie
  db 96
  !rest
  !end

assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
