asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Vs. Zazabi, varia core-X

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E7,$B8,$01,$3D
  db $19,$FF,$E6,$B8,$01,$3D
  db $1A,$FF,$F0,$B8,$01,$3D
  db $1B,$FF,$F0,$B8,$01,$F8
  db $1C,$FD,$F3,$B8,$01,$3C
  db $1D,$FF,$E7,$B8,$01,$3D
  db $1E,$FD,$F3,$B8,$01,$3D
  db $1F,$FF,$E0,$B8,$04,$F4
  db $20,$FF,$E0,$B8,$04,$A0
  db $21,$FF,$E0,$B8,$07,$A0
  db $22,$FF,$E7,$B8,$02,$7A
  db $23,$FF,$E0,$B8,$04,$F4
  db $24,$FF,$F3,$3C,$02,$7A
  db $25,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+594
  dw Sample19,Sample19+945
  dw Sample1A,Sample1A+504
  dw Sample1B,Sample1B+675
  dw Sample1C,Sample1C+630
  dw Sample1D,Sample1D+648
  dw Sample1E,Sample1E+1179
  dw Sample1F,Sample1F
  dw Sample20,Sample20
  dw Sample21,Sample21
  dw Sample22,Sample22+783
  dw Sample23,Sample23
  dw Sample24,Sample24
  dw Sample25,Sample25+18
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_13ba3399f8fb237a89b7617fdc3c5cc4.brr")
  Sample19: skip filesize("Sample_5a91dbb457653ba13ad13f9a38fe5e66.brr")
  Sample1A: skip filesize("Sample_386914ec5f10e96351b23ca877f4b703.brr")
  Sample1B: skip filesize("Sample_791c11a320b992357fb30654bb72da96.brr")
  Sample1C: skip filesize("Sample_d789d8b4545d918b6564cc827ee4a348.brr")
  Sample1D: skip filesize("Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2.brr")
  Sample1E: skip filesize("Sample_6c080140dbee361c456c58572403fcbc.brr")
  Sample1F: skip filesize("Sample_2f3350d5fcd8bf5eb5f2ab5c16532226.brr")
  Sample20: skip filesize("Sample_ed9f2b452e2b39d90ee8699eea59ace8.brr")
  Sample21: skip filesize("Sample_fc0a703f3d90d9667c60e64cfe3d7cf9.brr")
  Sample22: skip filesize("Sample_3d36472cfb337b1b0d660795cfb1ed72.brr")
  Sample23: skip filesize("Sample_3d57fd039e821278013a5fed25bfebb7.brr")
  Sample24: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample25: skip filesize("Sample_3841b4150856deb8b8ee01fe35f497c3.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5842
-
  dw Pattern5852
  dw Pattern5862
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5872
-
  dw Pattern5882
  dw $00FF,-
  dw $0000

Pattern5842: dw Track5892, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track58A9, Track5A2C, Track5B37, Track5BE2, Track5C90, 0, 0, 0
Pattern5862: dw Track5936, Track5A9E, Track5BA9, Track5C55, Track5CFD, 0, 0, 0
Pattern5872: dw Track5E37, 0, 0, 0, 0, 0, 0, 0
Pattern5882: dw Track5EE5, Track5F23, Track5FAA, Track5E50, Track5F99, 0, 0, 0

Track5892:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,42
  !musicVolume,176
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !end

Track58A9:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !instr,$18
  !volume,128
  !loop : dw Sub58E6 : db 8
  !dynamicVolume,128,96
  !pan,10
  db 12
  !b4
  !pan,8
  !b5
  !pan,10
  !c5
  !pan,12
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,4
  !c6
  !pan,10
  !cs5
  !pan,16
  !cs6
  !end

Sub58E6:
  !dynamicVolume,128,224
  !pan,10
  db 12
  !b4
  !pan,8
  !b5
  !pan,10
  !c5
  !pan,12
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,4
  !c6
  !pan,10
  !cs5
  !pan,16
  !cs6
  !dynamicVolume,128,128
  !pan,10
  !b4
  !pan,4
  !b5
  !pan,10
  !c5
  !pan,16
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,8
  !c6
  !pan,10
  !cs5
  !pan,12
  !cs6
  !end

Track5936:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !instr,$1C
  !volume,64
  !pan,8
  db 12
  !gs5
  !a5
  !as5
  !volume,72
  !pan,9
  !gs5
  !a5
  !as5
  !volume,80
  !pan,10
  !gs5
  !a5
  !as5
  !volume,96
  !gs5
  !a5
  !as5
  !gs5
  !a5
  !as5
  !gs5
  !a5
  !as5
  !volume,80
  !pan,11
  !gs5
  !a5
  !as5
  !volume,72
  !pan,12
  !gs5
  !a5
  !as5
  !volume,64
  !pan,12
  !gs5
  !a5
  !as5
  !volume,72
  !pan,11
  !gs5
  !a5
  !as5
  !volume,80
  !pan,10
  !gs5
  !a5
  !as5
  !volume,96
  !gs5
  !a5
  !as5
  !gs5
  !a5
  !as5
  !gs5
  !a5
  !as5
  !volume,80
  !pan,9
  !gs5
  !a5
  !as5
  !volume,72
  !pan,8
  !gs5
  !a5
  !as5
  !volume,64
  !pan,8
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,9
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,10
  !cs6
  !d6
  !ds6
  !volume,96
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,11
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,12
  !cs6
  !d6
  !ds6
  !volume,64
  !pan,12
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,11
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,10
  !cs6
  !d6
  !ds6
  !volume,96
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,9
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,8
  !cs6
  !d6
  !ds6
  !volume,64
  !pan,8
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,9
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,10
  !cs6
  !d6
  !ds6
  !volume,96
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !cs6
  !d6
  !ds6
  !volume,80
  !pan,11
  !cs6
  !d6
  !ds6
  !volume,72
  !pan,12
  !cs6
  !d6
  !ds6
  !end

Track5A2C:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  db 60
  !tie
  !loop : dw Sub5A6C : db 1
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !c4
  db 96
  !cs5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !pan,10
  db 96
  !rest
  !tie
  db 12
  !tie
  !loop : dw Sub5A6C : db 1
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !b5
  db 96
  !a5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !loop : dw Sub5A9A : db 255
  !end

Sub5A6C:
  !instr,$19
  !volume,128
  db 6
  !g5
  !a5
  db 60
  !c6
  db 6
  !g5
  !e5
  db 96
  !as4
  !tie
  db 24
  !tie
  !instr,$1A
  !volume,144
  db 12
  !gs4
  db 24
  !gs4
  db 12
  !gs4
  !gs4
  db 60
  !gs4
  db 24
  !rest
  !instr,$1B
  !pan,8
  !volume,96
  db 12
  !b7
  !e7
  !f7
  !a7
  !gs7
  !d7
  !end

Sub5A9A:
  db 96
  !rest
  !tie
  !end

Track5A9E:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !pan,10
  !volume,80
  !dynamicVolume,95,128
  db 12
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !dynamicVolume,95,80
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !dynamicVolume,95,128
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !d6
  !ds6
  !e6
  !f6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !dynamicVolume,95,80
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !dynamicVolume,95,128
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !dynamicVolume,95,80
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !dynamicVolume,95,128
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !fs6
  !g6
  !gs6
  !a6
  !end

Track5B37:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  db 72
  !tie
  !loop : dw Sub5B77 : db 1
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !rest
  db 96
  !a5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !pan,10
  db 96
  !rest
  !tie
  db 24
  !tie
  !loop : dw Sub5B77 : db 1
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !ds5
  db 96
  !cs5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !loop : dw Sub5BA5 : db 255
  !end

Sub5B77:
  !instr,$19
  !volume,128
  db 72
  !as5
  db 96
  !e5
  db 48
  !tie
  !rest
  db 24
  !rest
  !instr,$1A
  !volume,176
  db 6
  !e5
  !rest
  db 12
  !e5
  !rest
  db 6
  !e5
  !rest
  !e5
  !rest
  db 12
  !e5
  db 72
  !rest
  !instr,$1B
  !pan,12
  !volume,80
  db 12
  !rest
  !b7
  !e7
  !f7
  !a7
  !gs7
  !end

Sub5BA5:
  db 96
  !rest
  !tie
  !end

Track5BA9:
  db 127,$7F
  !transpose,0
  !instr,$22
  !pan,12
  !volume,64
  !dynamicVolume,96,128
  !vibrato,0,18,47
  db 120
  !b4
  db 24
  !as4
  !b4
  !as4
  !a4
  db 72
  !gs4
  db 96
  !g4
  !tie
  !rest
  db 120
  !e5
  db 24
  !ds5
  !e5
  !ds5
  !d5
  db 72
  !cs5
  db 120
  !c5
  db 24
  !rest
  db 48
  !e5
  db 24
  !ds5
  db 96
  !fs5
  !tie
  db 72
  !tie
  !endVibrato
  db 96
  !rest
  !tie
  !end

Track5BE2:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  db 84
  !tie
  !instr,$19
  !volume,128
  db 6
  !g5
  !a5
  db 60
  !as5
  db 6
  !g5
  !e5
  db 96
  !as4
  db 48
  !tie
  db 72
  !rest
  db 6
  !as5
  !rest
  db 12
  !as5
  !rest
  db 6
  !as5
  !rest
  !as5
  !rest
  db 12
  !as5
  db 120
  !rest
  !instr,$1D
  !volume,64
  !dynamicVolume,96,160
  db 96
  !ds5
  !tie
  !rest
  !tie
  !tie
  !tie
  db 84
  !tie
  !instr,$19
  !volume,128
  db 6
  !g5
  !a5
  db 60
  !as5
  db 6
  !g5
  !e5
  db 96
  !as4
  db 48
  !tie
  db 72
  !rest
  db 6
  !as5
  !rest
  db 12
  !as5
  !rest
  db 6
  !as5
  !rest
  !as5
  !rest
  db 12
  !as5
  db 96
  !rest
  db 48
  !tie
  !instr,$1D
  !volume,96
  db 72
  !b5
  db 96
  !a5
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub5C51 : db 255
  !end

Sub5C51:
  db 96
  !rest
  !tie
  !end

Track5C55:
  db 127,$7F
  !transpose,0
  !instr,$22
  !pan,8
  !volume,64
  !dynamicVolume,96,128
  !vibrato,0,18,47
  db 24
  !rest
  db 120
  !b4
  db 24
  !as4
  !b4
  !as4
  !a4
  db 72
  !gs4
  db 96
  !g4
  !tie
  !rest
  db 120
  !e5
  db 24
  !ds5
  !e5
  !ds5
  !d5
  db 72
  !cs5
  db 120
  !c5
  db 24
  !rest
  db 48
  !e5
  db 24
  !ds5
  db 96
  !fs5
  !tie
  db 72
  !tie
  !endVibrato
  db 96
  !rest
  !tie
  !end

Track5C90:
  db 127,$7F
  !transpose,0
  !volume,192
  !pan,10
  !loop : dw Sub5CB4 : db 8
  !instr,$1F
  db 12
  !c4
  !rest
  !instr,$21
  !c4
  !instr,$1F
  !c4
  !c4
  !instr,$21
  !c4
  !instr,$20
  db 24
  !c4
  !loop : dw Sub5CF9 : db 255
  !end

Sub5CB4:
  !instr,$1F
  db 12
  !c4
  !rest
  !instr,$21
  !c4
  !instr,$1F
  !c4
  !c4
  !instr,$21
  !pan,12
  !c4
  !pan,10
  !instr,$20
  db 24
  !c4
  db 12
  !rest
  !instr,$1F
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$21
  !pan,8
  !c4
  !pan,10
  !instr,$1F
  !c4
  !rest
  !instr,$21
  !pan,12
  !c4
  !pan,10
  !instr,$20
  db 24
  !c4
  !instr,$21
  !pan,8
  db 12
  !c4
  !rest
  !pan,10
  !instr,$1F
  !c4
  !rest
  !end

Sub5CF9:
  db 96
  !rest
  !tie
  !end

Track5CFD:
  db 127,$7F
  !transpose,255
  !volume,208
  !pan,12
  !instr,$23
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !instr,$23
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !pan,12
  !instr,$1F
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !c4
  !pan,12
  !instr,$1F
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !instr,$23
  !cs4
  !instr,$21
  db 12
  !c4
  !c4
  !pan,12
  !instr,$23
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !instr,$23
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !pan,12
  !instr,$1F
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !c4
  !pan,12
  !instr,$1F
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !instr,$23
  !cs4
  !instr,$21
  db 6
  !c4
  !c4
  db 12
  !c4
  !pan,12
  !instr,$23
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !instr,$23
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !pan,12
  !instr,$1F
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !c4
  !pan,12
  !instr,$1F
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !instr,$23
  !cs4
  !instr,$21
  db 12
  !c4
  !c4
  !pan,12
  !instr,$23
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !instr,$23
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !pan,12
  !instr,$1F
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !c4
  !pan,12
  !instr,$1F
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !instr,$23
  !cs4
  !instr,$21
  db 12
  !c4
  !c4
  !pan,12
  !instr,$23
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !instr,$23
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !pan,12
  !instr,$1F
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !c4
  !pan,12
  !instr,$1F
  db 24
  !cs4
  db 12
  !rest
  !pan,8
  !instr,$21
  !cs4
  !c4
  !d4
  !instr,$20
  db 24
  !ds4
  !instr,$23
  !cs4
  !instr,$21
  db 6
  !c4
  !c4
  db 12
  !c4
  db 96
  !rest
  !tie
  !end

Track5E37:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,51
  !musicVolume,192
  !volume,0
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  db 24
  !c4
  !end

Track5E50:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,0,6
  !instr,$18
  !volume,128
  !loop : dw Sub5E91 : db 8
  !dynamicVolume,128,96
  !pan,10
  db 12
  !b4
  !pan,8
  !b5
  !pan,10
  !c5
  !pan,12
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,4
  !c6
  !pan,10
  !cs5
  !pan,16
  !cs6
  !loop : dw Sub5EE1 : db 255
  !end

Sub5E91:
  !dynamicVolume,128,224
  !pan,10
  db 12
  !b4
  !pan,8
  !b5
  !pan,10
  !c5
  !pan,12
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,4
  !c6
  !pan,10
  !cs5
  !pan,16
  !cs6
  !dynamicVolume,128,128
  !pan,10
  !b4
  !pan,4
  !b5
  !pan,10
  !c5
  !pan,16
  !c6
  !pan,10
  !cs5
  !pan,6
  !cs6
  !pan,10
  !b4
  !pan,14
  !b5
  !pan,10
  !c5
  !pan,8
  !c6
  !pan,10
  !cs5
  !pan,12
  !cs6
  !end

Sub5EE1:
  db 96
  !rest
  !tie
  !end

Track5EE5:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !pan,10
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !c4
  db 96
  !cs5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !pan,10
  db 96
  !rest
  !tie
  db 24
  !tie
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !b5
  db 96
  !a5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !loop : dw Sub5F1F : db 255
  !end

Sub5F1F:
  db 96
  !rest
  !tie
  !end

Track5F23:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !pan,10
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !c4
  db 96
  !a5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  !pan,10
  db 96
  !rest
  !tie
  db 24
  !tie
  !instr,$1D
  !volume,144
  !vibrato,0,18,47
  db 72
  !ds5
  db 96
  !cs5
  !tie
  !tie
  db 72
  !tie
  !endVibrato
  db 120
  !rest
  !loop : dw Sub5F5F : db 3
  !end

Sub5F5F:
  !instr,$25
  !pan,12
  !volume,255
  db 12
  !f3
  !b3
  !volume,192
  !f3
  !b3
  db 48
  !rest
  !pan,8
  !volume,255
  db 12
  !f3
  !b3
  !volume,192
  !f3
  !b3
  db 48
  !rest
  !pan,12
  !volume,255
  db 12
  !f3
  !b3
  !volume,192
  !f3
  !b3
  db 48
  !rest
  !pan,8
  !volume,255
  db 12
  !f3
  !b3
  db 24
  !rest
  db 12
  !g3
  !pan,12
  !c4
  db 24
  !rest
  !end

Track5F99:
  db 127,$7F
  !transpose,0
  !loop : dw Sub5F5F : db 4
  !loop : dw Sub5FA6 : db 255
  !end

Sub5FA6:
  db 96
  !rest
  !tie
  !end

Track5FAA:
  db 127,$7F
  !transpose,0
  !volume,255
  !loop : dw Sub5FB5 : db 255
  !end

Sub5FB5:
  !pan,8
  !instr,$24
  db 24
  !b4
  !instr,$1E
  !b4
  !pan,12
  !instr,$24
  !b4
  !instr,$1E
  !b4
  !end

if defined("print_freespace")
  print "Song 33: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
