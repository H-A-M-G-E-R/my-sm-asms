asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Vs. B.O.X.

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$04,$F4
  db $19,$EF,$C0,$B8,$04,$F4
  db $1A,$DD,$E0,$B8,$04,$F4
  db $1B,$FF,$E0,$B8,$04,$F4
  db $1C,$FF,$F1,$B8,$04,$F4
  db $1D,$FF,$E0,$B8,$01,$3D
  db $1E,$FF,$E0,$B8,$02,$7A
  db $1F,$FF,$E0,$B8,$02,$7A
  db $20,$FF,$E0,$B8,$01,$3D
  db $21,$FF,$F1,$B8,$01,$3D
  db $22,$FF,$E0,$B8,$04,$00
  db $23,$FF,$E1,$B8,$00,$9E
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A+1143
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C+18
  dw Sample1D,Sample1D+666
  dw Sample1E,Sample1E+918
  dw Sample1F,Sample1F+1314
  dw Sample20,Sample20+1197
  dw Sample21,Sample21+639
  dw Sample22,Sample22+18
  dw Sample23,Sample23+4545
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample19: skip filesize("Sample_2f5692cd107acfd64888f4a4ede244af.brr")
  Sample1A: skip filesize("Sample_06fd166d0071d3476bebf3ce0d1a39ea.brr")
  Sample1B: skip filesize("Sample_cc665d2b4c8c68a674a8053fe691bbeb.brr")
  Sample1C: skip filesize("Sample_b0eb97e2caf1f746ab3b70688acbc862.brr")
  Sample1D: skip filesize("Sample_e81fe2bdf6473308304597a422a5f73d.brr")
  Sample1E: skip filesize("Sample_37b309a75099915cabe221b8f1189840.brr")
  Sample1F: skip filesize("Sample_c3b3f93e0b2d53bce48ae87cc36af9c7.brr")
  Sample20: skip filesize("Sample_4648f271e3145cbeb3be74154c98bbc9.brr")
  Sample21: skip filesize("Sample_14513002db7f6139db33682eaa96e6ea.brr")
  Sample22: skip filesize("Sample_3841b4150856deb8b8ee01fe35f497c3.brr")
  Sample23: skip filesize("Sample_f4b98a6e87a1b968270ab79d84403d4d.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track586B, Track5928, Track59E5, Track5A12, Track5AA3, Track5C71, Track5B3C, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,60
  !musicVolume,200
  !echo,%00011111,47,47
  !echoParameters,2,48,0
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,48,0
  !instr,$1D
  !volume,208
  db 48
  !rest
  !pan,12
  db 36
  !c6
  db 84
  !rest
  !pan,8
  db 24
  !c6
  db 48
  !rest
  !pan,10
  !volume,128
  db 36
  !as5
  !volume,208
  db 12
  !rest
  db 36
  !as5
  db 12
  !rest
  db 36
  !c6
  db 84
  !rest
  !pan,12
  db 24
  !c6
  db 48
  !rest
  !pan,8
  db 36
  !cs6
  db 60
  !rest
  !pan,10
  db 36
  !c6
  db 84
  !rest
  !pan,8
  db 24
  !c6
  db 48
  !rest
  !pan,12
  db 36
  !c6
  db 12
  !rest
  !volume,128
  db 36
  !b5
  !volume,208
  db 12
  !rest
  db 36
  !b5
  db 84
  !rest
  !pan,8
  db 24
  !b5
  db 48
  !rest
  !pan,12
  db 36
  !b5
  db 12
  !rest
  db 48
  !rest
  !pan,12
  db 36
  !c6
  db 84
  !rest
  !pan,8
  db 24
  !c6
  db 48
  !rest
  !pan,10
  !volume,128
  db 36
  !as5
  !volume,208
  db 12
  !rest
  db 36
  !as5
  db 12
  !rest
  db 36
  !c6
  db 84
  !rest
  !pan,12
  db 24
  !c6
  db 48
  !rest
  !pan,8
  db 36
  !ds6
  db 60
  !rest
  !pan,10
  db 36
  !c6
  db 84
  !rest
  !pan,8
  db 24
  !c6
  db 48
  !rest
  !pan,12
  db 36
  !c6
  db 12
  !rest
  !volume,128
  db 36
  !b5
  !volume,208
  db 12
  !rest
  db 36
  !b5
  db 84
  !rest
  !pan,8
  db 24
  !b5
  db 48
  !rest
  !pan,12
  db 36
  !b5
  db 12
  !rest
  !end

Track5928:
  db 127,$7F
  !transpose,0
  !volume,208
  !loop : dw Sub5933 : db 2
  !end

Sub5933:
  !instr,$1E
  !pan,10
  db 12
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,12
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !as5
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,10
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !instr,$20
  !pan,8
  !cs6
  !rest
  !instr,$1E
  !pan,10
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,12
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !as5
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,10
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !instr,$20
  !pan,8
  !as5
  !rest
  !instr,$1E
  !pan,10
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,12
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !as5
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !instr,$1E
  !pan,10
  !rest
  !c6
  db 24
  !rest
  db 12
  !c6
  !rest
  !instr,$20
  !pan,8
  !c6
  !rest
  !instr,$1E
  !pan,10
  !b5
  db 24
  !rest
  db 12
  !b5
  !instr,$1E
  !pan,12
  !rest
  !b5
  db 24
  !rest
  db 12
  !b5
  !rest
  !a5
  !rest
  !b5
  db 24
  !rest
  db 12
  !b5
  !instr,$1E
  !pan,10
  !rest
  !b5
  db 24
  !rest
  db 12
  !b5
  !rest
  !instr,$20
  !pan,8
  !cs6
  !rest
  !end

Track59E5:
  db 127,$7F
  !transpose,0
  !instr,$23
  !volume,176
  !loop : dw Sub59F2 : db 2
  !end

Sub59F2:
  db 48
  !rest
  !pan,8
  !dynamicPan,240,12
  db 96
  !c6
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !pan,12
  !dynamicPan,240,8
  db 96
  !b5
  !tie
  db 48
  !tie
  !end

Track5A12:
  db 127,$7F
  !transpose,0
  !pan,9
  !instr,$21
  !volume,240
  db 96
  !c6
  !instr,$22
  !volume,64
  db 12
  !rest
  !gs6
  !as6
  !c7
  !volume,80
  !loop : dw Sub5A87 : db 6
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !instr,$21
  !pan,6
  !volume,176
  !fs5
  !pan,14
  !volume,192
  !fs5
  !pan,8
  !volume,208
  !fs5
  !pan,12
  !volume,224
  !fs5
  !volume,240
  !pan,9
  !instr,$21
  !volume,240
  db 96
  !c6
  !instr,$22
  !volume,64
  db 12
  !rest
  !gs6
  !as6
  !c7
  !volume,80
  !loop : dw Sub5A95 : db 6
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !instr,$21
  !pan,6
  !volume,176
  !fs5
  !pan,14
  !volume,192
  !fs5
  !pan,8
  !volume,208
  !fs5
  !pan,12
  !volume,224
  !fs5
  !volume,240
  !end

Sub5A87:
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !rest
  !gs6
  !as6
  !c7
  !end

Sub5A95:
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !rest
  !gs6
  !as6
  !c7
  !end

Track5AA3:
  db 127,$7F
  !transpose,0
  !pan,11
  !instr,$21
  !volume,240
  db 96
  !c6
  !instr,$22
  !volume,64
  db 6
  !rest
  db 12
  !rest
  !gs6
  !as6
  !c7
  !volume,80
  !loop : dw Sub5B20 : db 6
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  db 6
  !fs6
  !instr,$21
  !pan,6
  !volume,176
  db 12
  !fs5
  !pan,14
  !volume,192
  !fs5
  !pan,8
  !volume,208
  !fs5
  !pan,12
  !volume,224
  !fs5
  !volume,240
  !pan,11
  !instr,$21
  !volume,240
  db 96
  !c6
  !instr,$22
  !volume,64
  db 6
  !rest
  db 12
  !rest
  !gs6
  !as6
  !c7
  !volume,80
  !loop : dw Sub5B2E : db 6
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  db 6
  !fs6
  !instr,$21
  !pan,6
  !volume,176
  db 12
  !fs5
  !pan,14
  !volume,192
  !fs5
  !pan,8
  !volume,208
  !fs5
  !pan,12
  !volume,224
  !fs5
  !volume,240
  !end

Sub5B20:
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !rest
  !gs6
  !as6
  !c7
  !end

Sub5B2E:
  db 12
  !c5
  !c6
  !rest
  !d6
  !rest
  !e6
  !rest
  !fs6
  !rest
  !gs6
  !as6
  !c7
  !end

Track5B3C:
  db 127,$7F
  !transpose,0
  !volume,192
  !pan,10
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  !instr,$18
  db 12
  !c4
  db 72
  !rest
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !instr,$19
  !c4
  !rest
  !instr,$18
  db 24
  !c4
  db 12
  !c4
  db 36
  !rest
  db 12
  !c4
  !instr,$19
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !instr,$18
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !c4
  db 24
  !rest
  !instr,$18
  db 12
  !c4
  db 72
  !rest
  !end

Track5C71:
  db 127,$7F
  !transpose,0
  !volume,192
  !pan,10
  !instr,$1C
  db 24
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  db 72
  !rest
  db 12
  !c4
  !c4
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  db 72
  !rest
  db 12
  !c4
  !c4
  !c4
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !rest
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1C
  !c4
  !rest
  !instr,$1A
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !c4
  !rest
  !instr,$1A
  db 24
  !c4
  !instr,$1B
  db 12
  !c4
  !rest
  !c4
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
