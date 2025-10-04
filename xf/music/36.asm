asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Boss tension

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$F7,$E0,$B8,$00,$9E
  db $19,$FF,$F0,$B8,$01,$3C
  db $1A,$FE,$E7,$B8,$01,$00
  db $1B,$FF,$E0,$B8,$05,$83
  db $1C,$7F,$E0,$00,$05,$83
  db $1D,$7F,$E0,$00,$05,$83
  db $1E,$7F,$E0,$00,$05,$83
  db $1F,$7F,$E0,$00,$05,$83
  db $20,$7F,$E0,$00,$05,$83
  db $21,$7F,$E0,$00,$05,$83
  db $22,$7F,$E0,$00,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+36
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+18
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
  dw Sample1B_1C_1D_1E_1F_20_21_22,Sample1B_1C_1D_1E_1F_20_21_22
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ad838049f259a4f1171d73e2a9ff0c30.brr")
  Sample19: skip filesize("Sample_dd8eb0200756dcaddca1a987abf10663.brr")
  Sample1A: skip filesize("Sample_ea7f73808eeb2fefd661660fe62f37df.brr")
  Sample1B_1C_1D_1E_1F_20_21_22: skip filesize("Sample_5fa965a87e3b8bc31d49910823b4d3bc.brr")
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
Pattern5844: dw Track586B, Track58B5, Track58DD, Track58FD, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,20
  !musicVolume,224
  !echo,%00001111,47,47
  !echoParameters,3,48,5
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,3,48,5
  !instr,$18
  !volume,144
  !pan,10
  !dynamicVolume,47,192
  db 96
  !f4
  db 48
  !tie
  !dynamicVolume,47,240
  !tie
  !dynamicVolume,191,144
  db 96
  !tie
  !tie
  !dynamicVolume,95,192
  !tie
  !dynamicVolume,95,144
  !tie
  !loop : dw Sub589B : db 2
  !end

Sub589B:
  !dynamicVolume,47,192
  db 96
  !tie
  db 48
  !tie
  !dynamicVolume,47,240
  !tie
  !dynamicVolume,191,144
  db 96
  !tie
  !tie
  !dynamicVolume,95,192
  !tie
  !dynamicVolume,95,144
  !tie
  !end

Track58B5:
  db 127,$7F
  !transpose,0
  !loop : dw Sub58BE : db 3
  !end

Sub58BE:
  !instr,$1A
  db 96
  !rest
  !volume,96
  db 48
  !e7
  db 96
  !rest
  !instr,$18
  !volume,192
  !pan,12
  !dynamicPan,96,8
  !e4
  !tie
  !dynamicVolume,159,128
  !dynamicPan,96,10
  !tie
  db 48
  !tie
  !end

Track58DD:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !loop : dw Sub58E8 : db 3
  !end

Sub58E8:
  db 96
  !rest
  db 48
  !tie
  !volume,96
  !ds7
  !fs7
  db 96
  !f7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,96
  db 96
  !rest
  !tie
  !end

Track58FD:
  db 127,$7F
  !transpose,0
  !instr,$19
  !loop : dw Sub5908 : db 3
  !end

Sub5908:
  db 96
  !rest
  db 48
  !tie
  !volume,176
  db 96
  !c4
  db 48
  !tie
  !rest
  !volume,224
  db 96
  !c4
  db 48
  !tie
  db 96
  !rest
  !end

if defined("print_freespace")
  print "Song 36: Space left: $",hex($10000-(3*$800)-pc())
endif
assert pc() <= $10000-(3*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
