asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E7,$B8,$01,$3C
  db $19,$FF,$E0,$B8,$04,$F4
  db $1A,$FF,$E0,$B8,$04,$F4
  db $1B,$FF,$E0,$B8,$01,$3D
  db $1C,$F9,$F0,$B8,$02,$7A
  db $1D,$FF,$E0,$B8,$02,$7B
  db $1E,$F3,$E2,$B8,$02,$00
  db $1F,$FF,$E0,$B8,$08,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+783
  dw Sample19,Sample19
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B+4545
  dw Sample1C,Sample1C+5337
  dw Sample1D,Sample1D+1062
  dw Sample1E,Sample1E+18
  dw Sample1F,Sample1F+36
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_5f3245a505aef0cab8f6817493b927cf.brr")
  Sample19: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample1A: skip filesize("Sample_2f5692cd107acfd64888f4a4ede244af.brr")
  Sample1B: skip filesize("Sample_f4b98a6e87a1b968270ab79d84403d4d.brr")
  Sample1C: skip filesize("Sample_aa687b385eec6ee98f906c710aefcc97.brr")
  Sample1D: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1E: skip filesize("Sample_2eed29c8e1dfc1aebc7a9bacb053a9e8.brr")
  Sample1F: skip filesize("Sample_face02e10e86fbbc2227ec86184e85fa.brr")
  Trackers:
pullpc

spcblock Trackers nspc
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
Pattern5852: dw Track5889, Track58A8, Track58C7, Track58E8, Track5900, 0, 0, 0
Pattern5862: dw Track5A52, Track5B47, Track5C3C, Track5CF4, Track5C8C, Track5918, 0, 0

Track5872:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,52
  !musicVolume,192
  !echo,%00001111,47,47
  !echoParameters,2,16,5
  !end

Track5889:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,16
  !vibrato,0,23,127
  !volume,240
  db 48
  !c4
  !dynamicVolume,144,143
  !dynamicPan,112,4
  db 96
  !tie
  !pitchSlide,0,96 : !a4
  db 24
  !tie
  !end

Track58A8:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,4
  !dynamicPan,112,16
  !vibrato,0,23,127
  !volume,128
  db 48
  !c5
  !dynamicVolume,144,79
  db 96
  !tie
  !pitchSlide,0,96 : !a5
  db 24
  !tie
  !end

Track58C7:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,10
  !volume,128
  !loop : dw Sub58D9 : db 1
  db 96
  !rest
  !tie
  !end

Sub58D9:
  db 24
  !rest
  db 16
  !a4
  !c5
  !ds5
  !fs5
  !a5
  !c6
  db 12
  !ds6
  !fs6
  !a6
  !c7
  !end

Track58E8:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !pan,6
  !dynamicPan,96,10
  !volume,64
  !dynamicVolume,96,175
  !loop : dw Sub58D9 : db 1
  db 96
  !rest
  !tie
  !end

Track5900:
  db 127,$7F
  !transpose,250
  !instr,$1F
  !pan,14
  !dynamicPan,96,10
  !volume,64
  !dynamicVolume,96,175
  !loop : dw Sub58D9 : db 1
  db 96
  !rest
  !tie
  !end

Track5918:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,2,16,5
  !volume,160
  !pan,10
  db 36
  !rest
  !instr,$19
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$19
  db 12
  !rest
  !c4
  db 24
  !rest
  !instr,$1A
  !c4
  !instr,$19
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  !instr,$1A
  db 12
  !c4
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$19
  db 12
  !rest
  !c4
  db 24
  !rest
  !instr,$1A
  !c4
  !instr,$19
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  !instr,$1A
  !c4
  !c4
  !c4
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  !instr,$19
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$19
  db 12
  !rest
  !c4
  db 24
  !rest
  !instr,$1A
  !c4
  !instr,$19
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  !instr,$1A
  db 12
  !c4
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$19
  db 12
  !rest
  !c4
  db 24
  !rest
  !instr,$1A
  !c4
  !instr,$19
  db 12
  !c4
  db 24
  !rest
  db 12
  !c4
  !instr,$1A
  db 24
  !c4
  db 12
  !rest
  !instr,$19
  !c4
  db 48
  !rest
  db 96
  !rest
  !tie
  !end

Track5A52:
  !endVibrato
  db 127,$7F
  !transpose,0
  !instr,$1C
  !volume,128
  !pan,8
  db 12
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !instr,$1C
  !pan,10
  !volume,16
  !dynamicVolume,96,112
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !as7
  !end

Track5B47:
  !endVibrato
  db 127,$7F
  !transpose,0
  !instr,$1C
  !volume,128
  !pan,12
  db 12
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !as4
  db 24
  !rest
  db 12
  !gs4
  db 24
  !rest
  db 12
  !c5
  !rest
  !fs5
  !c6
  !fs6
  !rest
  !b4
  db 24
  !rest
  db 12
  !a4
  db 24
  !rest
  db 12
  !cs5
  !rest
  !g5
  !cs6
  !g6
  !rest
  !instr,$1B
  !pan,10
  !volume,16
  !dynamicVolume,96,128
  db 36
  !rest
  db 12
  !c3
  !c3
  !e3
  !e3
  !gs3
  !c4
  !e4
  !gs4
  !c5
  !end

Track5C3C:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !volume,112
  !pan,10
  db 36
  !rest
  !loop : dw Sub5C6C : db 2
  !loop : dw Sub5C7C : db 2
  !loop : dw Sub5C6C : db 2
  !loop : dw Sub5C7C : db 2
  !loop : dw Sub5C6C : db 2
  !loop : dw Sub5C7C : db 2
  !loop : dw Sub5C6C : db 2
  !loop : dw Sub5C7C : db 1
  db 96
  !rest
  !tie
  !end

Sub5C6C:
  db 12
  !e5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs5
  !rest
  !c6
  !fs6
  !c7
  !rest
  !end

Sub5C7C:
  db 12
  !f5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !a5
  !rest
  !cs6
  !g6
  !cs7
  !rest
  !end

Track5C8C:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !loop : dw Sub5CB6 : db 2
  !loop : dw Sub5CD5 : db 2
  !loop : dw Sub5CB6 : db 2
  !loop : dw Sub5CD5 : db 2
  !loop : dw Sub5CB6 : db 2
  !loop : dw Sub5CD5 : db 2
  !loop : dw Sub5CB6 : db 2
  !loop : dw Sub5CD5 : db 1
  db 96
  !rest
  !tie
  !end

Sub5CB6:
  !pan,12
  !volume,160
  db 12
  !as5
  !rest
  !volume,80
  !as5
  !pan,8
  !volume,160
  !gs5
  !rest
  !volume,80
  !gs5
  !pan,12
  !volume,160
  !d6
  !rest
  !volume,80
  !d6
  db 36
  !rest
  !end

Sub5CD5:
  !pan,8
  !volume,160
  db 12
  !b5
  !rest
  !volume,80
  !b5
  !pan,12
  !volume,160
  !a5
  !rest
  !volume,80
  !a5
  !pan,8
  !volume,160
  !ds6
  !rest
  !volume,80
  !ds6
  db 36
  !rest
  !end

Track5CF4:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !volume,128
  !vibrato,0,23,79
  db 12
  !rest
  !loop : dw Sub5D0A : db 4
  db 96
  !rest
  !tie
  !end

Sub5D0A:
  !pan,14
  !dynamicPan,96,10
  db 96
  !as6
  db 48
  !tie
  !pan,6
  !dynamicPan,96,10
  db 96
  !as7
  db 48
  !tie
  !pan,10
  !pan,14
  !dynamicPan,96,10
  db 96
  !b6
  db 48
  !tie
  !pan,6
  !dynamicPan,96,10
  db 96
  !b7
  db 48
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
