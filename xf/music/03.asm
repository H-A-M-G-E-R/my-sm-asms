asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Elevator

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$F7,$E7,$B8,$0B,$60
  db $19,$FD,$E0,$B8,$02,$E0
  db $1A,$7F,$E0,$00,$00,$E0
  db $1B,$7F,$E0,$00,$00,$E0
  db $1C,$7F,$E0,$00,$00,$E0
  db $1D,$7F,$E0,$00,$00,$E0
  db $1E,$7F,$E0,$00,$00,$E0
  db $1F,$7F,$E0,$00,$00,$E0
  db $20,$7F,$E0,$00,$00,$E0
  db $21,$7F,$E0,$00,$00,$E0
  db $22,$7F,$E0,$00,$00,$E0
  db $23,$7F,$E0,$00,$00,$E0
  db $24,$7F,$E0,$00,$00,$E0
  db $25,$7F,$E0,$00,$00,$E0
  db $26,$7F,$E0,$00,$00,$E0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
  dw Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26,Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26+18
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_2e1822edc659430c60ca1e822fefddc2.brr")
  Sample19_1A_1B_1C_1D_1E_1F_20_21_22_23_24_25_26: skip filesize("Sample_a2c12bb7be2f47aee50de0c1f31959fb.brr")
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
Pattern5850: dw Track5877, Track58E0, Track5916, Track594A, 0, 0, 0, 0
Pattern5860: dw Track5877, 0, 0, 0, 0, 0, 0, 0

Track5870:
  !tempo,32
  !musicVolume,191
  !end

Track5877:
  db 127,$7F
  !transpose,0
  !pan,10
  !subtranspose,64
  !echo,%00001111,48,48
  !echoParameters,2,32,1
  !dynamicEcho,128,52,52
  !instr,$18
  db 24
  !rest
  !volume,48
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  db 16
  !rest
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  db 16
  !rest
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  db 16
  !rest
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  db 16
  !rest
  !dynamicVolume,96,255
  db 96
  !c2
  !dynamicVolume,32,64
  db 32
  !tie
  !end

Track58E0:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,56
  !pan,7
  db 96
  !rest
  db 48,$2F
  !as6
  !f6
  !a6
  !cs6
  db 72
  !rest
  !rest
  db 48
  !c6
  !fs6
  !b6
  !rest
  !rest
  db 48,$1F
  !f6
  db 24
  !rest
  db 48
  !d6
  db 24
  !rest
  db 72
  !rest
  db 96
  !rest
  !rest
  !rest
  !rest
  db 24
  !rest
  !loop : dw Sub5912 : db 255
  !end

Sub5912:
  db 96
  !rest
  !tie
  !end

Track5916:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,48
  !pan,10
  db 96
  !rest
  db 48,$2F
  !d5
  !a4
  !cs5
  !f4
  db 72
  !rest
  !rest
  db 48
  !e4
  !as4
  !ds5
  !rest
  !rest
  !a5
  db 24
  !rest
  db 48
  !fs5
  db 24
  !rest
  db 66
  !rest
  db 96
  !rest
  !rest
  !rest
  !rest
  db 30
  !rest
  !loop : dw Sub5946 : db 255
  !end

Sub5946:
  db 96
  !rest
  !tie
  !end

Track594A:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,48
  !pan,13
  db 64
  !rest
  db 12,$0F
  !as6
  !f6
  !a6
  !cs6
  !c6
  !fs6
  !b6
  db 84
  !rest
  db 12
  !as6
  !f6
  !a6
  !cs6
  !c6
  !fs6
  !b6
  db 108
  !rest
  db 12
  !a6
  !cs6
  !as6
  !f6
  !c6
  !fs6
  !b6
  db 124
  !rest
  db 12
  !as6
  !f6
  !a6
  !cs6
  !c6
  !fs6
  !b6
  db 64
  !rest
  db 12
  !f6
  !as6
  !a6
  !cs6
  !c6
  !fs6
  !b6
  db 34
  !rest
  db 96
  !rest
  !rest
  !rest
  !rest
  db 14
  !rest
  !loop : dw Sub5997 : db 255
  !end

Sub5997:
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
