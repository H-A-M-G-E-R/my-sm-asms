asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F0,$B8,$04,$F6
  db $19,$7F,$E0,$00,$09,$EC
  db $1A,$FF,$F2,$B8,$00,$80
  db $1B,$FF,$E0,$B8,$00,$80
  db $1C,$7F,$F2,$00,$09,$EC
  db $1D,$7F,$E0,$00,$09,$EC
  db $1E,$FF,$E7,$B8,$00,$9E
  db $1F,$FD,$E0,$B8,$00,$80
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19_1C_1D,Sample18_19_1C_1D+1062
  dw Sample18_19_1C_1D,Sample18_19_1C_1D+1062
  dw Sample1A_1B_1F,Sample1A_1B_1F+27
  dw Sample1A_1B_1F,Sample1A_1B_1F+27
  dw Sample18_19_1C_1D,Sample18_19_1C_1D+1062
  dw Sample18_19_1C_1D,Sample18_19_1C_1D+1062
  dw Sample1E,Sample1E+45
  dw Sample1A_1B_1F,Sample1A_1B_1F+27
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18_19_1C_1D: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1A_1B_1F: skip filesize("Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr")
  Sample1E: skip filesize("Sample_70088be2c42db8f26aa5a6014a2e9398.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern583A
-
  dw Pattern586A
  dw Pattern584A
  dw Pattern587A
  dw $00FF,-
  dw $0000

Pattern583A: dw Track588A, Track58A1, Track58A9, Track58B1, Track58B5, 0, 0, 0
Pattern584A: dw Track58BD, Track58E0, Track58F1, Track5901, Track5909, 0, 0, 0
  db 49,$59
  db 80,$59
  db 115,$59
  !ds3
  db 89
  !cs6
  db 89,$00
  !end
  !end
  !end
  !end
  !end
Pattern586A: dw Track59F4, Track5A11, Track5A32, Track5A4C, Track5A70, 0, 0, 0
Pattern587A: dw Track5AB2, Track5AE0, Track5AED, Track5AF9, Track5B17, 0, 0, 0

Track588A:
  !musicVolume,210
  !tempo,27
  !volume,230
  !instr,$18
  !subtranspose,0
  !echo,%00000001,10,10
  !echoParameters,2,10,0
  db 24
  !rest
  !end

Track58A1:
  !volume,210
  !instr,$19
  !subtranspose,15
  db 24
  !rest

Track58A9:
  !volume,210
  !instr,$19
  !subtranspose,15
  db 24
  !rest

Track58B1:
  !loop : dw Sub5B49 : db 1

Track58B5:
  !volume,240
  !instr,$1C
  !subtranspose,50
  db 24
  !rest

Track58BD:
  !loop : dw Sub5B56 : db 1
  !cs3
  !a2
  !c3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !c3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !cs3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !cs3
  !gs2
  !cs3
  !gs2
  !end

Track58E0:
  !loop : dw Sub5B65 : db 1
  !loop : dw Sub5B74 : db 3
  !loop : dw Sub5B85 : db 1
  !as3
  !as3
  !as3
  db 12
  !gs3

Track58F1:
  !loop : dw Sub5B8E : db 1
  !loop : dw Sub5B9B : db 3
  !loop : dw Sub5BAC : db 1
  !c4
  !c4
  !c4
  !c4

Track5901:
  !loop : dw Sub5BB5 : db 1
  !loop : dw Sub5BCA : db 3

Track5909:
  !instr,$1C
  !subtranspose,50
  db 96
  !rest
  !rest
  !rest
  db 24
  !rest
  db 48
  !rest
  !rest
  db 96
  !rest
  !rest
  !rest
  db 48,$7F
  !c5
  !c5
  db 96
  !rest
  !rest
  !rest
  !volume,180
  db 48
  !c5
  !c5
  db 96
  !rest
  !rest
  !rest
  !volume,220
  db 48
  !c5
  db 24
  !c5
  !musicVolume,210
  !tempo,27
  !volume,230
  !instr,$18
  !subtranspose,0
  db 24
  !rest
  db 48,$7F
  !c3
  !gs2
  !loop : dw Sub5BD8 : db 10
  !volume,230
  !instr,$18
  !subtranspose,0
  !loop : dw Sub5BDB : db 12
  !end
  !volume,210
  !instr,$19
  !subtranspose,15
  db 24
  !rest
  db 12
  !rest
  db 24,$7F
  !as3
  !as3
  !as3
  !gs3
  !loop : dw Sub5BDE : db 10
  !volume,230
  !instr,$19
  !subtranspose,15
  !loop : dw Sub5BE3 : db 11
  !b3
  !b3
  !b3
  db 12
  !a3
  !volume,210
  !instr,$19
  !subtranspose,15
  db 24
  !rest
  db 24,$7F
  !c4
  !c4
  !c4
  !c4
  !loop : dw Sub5BE8 : db 10
  !volume,230
  !instr,$19
  !subtranspose,15
  !loop : dw Sub5BED : db 12
  !loop : dw Sub5B49 : db 1
  !loop : dw Sub5BF2 : db 1
  !tie
  !tie
  !rest
  !loop : dw Sub5BF6 : db 1
  !tie
  !tie
  !rest
  !loop : dw Sub5C01 : db 1
  !tie
  !tie
  !tie
  !rest
  !loop : dw Sub5C01 : db 1
  !tie
  !tie
  !tie
  !rest
  !volume,240
  !instr,$1C
  !subtranspose,50
  db 24
  !rest
  !rest
  db 48,$7F
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  !fs5
  db 72
  !rest
  db 24
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  !fs5
  db 72
  !rest
  db 24
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  !g5
  db 72
  !rest
  db 24
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 72
  !g5

Track59F4:
  !musicVolume,210
  !tempo,27
  !volume,230
  !instr,$18
  !subtranspose,0
  db 48,$7F
  !c3
  !gs2
  !loop : dw Sub5BD8 : db 10
  !volume,230
  !instr,$18
  !subtranspose,0
  !loop : dw Sub5BDB : db 12
  !end

Track5A11:
  !volume,210
  !instr,$19
  !subtranspose,15
  db 12
  !rest
  db 24,$7F
  !as3
  !as3
  !as3
  !gs3
  !loop : dw Sub5BDE : db 10
  !volume,230
  !instr,$19
  !subtranspose,15
  !loop : dw Sub5BE3 : db 11
  !b3
  !b3
  !b3
  db 12
  !a3

Track5A32:
  !volume,210
  !instr,$19
  !subtranspose,15
  db 24,$7F
  !c4
  !c4
  !c4
  !c4
  !loop : dw Sub5BE8 : db 10
  !volume,230
  !instr,$19
  !subtranspose,15
  !loop : dw Sub5BED : db 12

Track5A4C:
  !volume,230
  !instr,$1B
  !subtranspose,70
  db 96,$7F
  !fs3
  !tie
  !tie
  !tie
  !rest
  !loop : dw Sub5BF6 : db 1
  !tie
  !tie
  !rest
  !loop : dw Sub5C01 : db 1
  !tie
  !tie
  !tie
  !rest
  !loop : dw Sub5C01 : db 1
  !tie
  !tie
  !tie
  !rest

Track5A70:
  !volume,240
  !instr,$1C
  !subtranspose,50
  db 24
  !rest
  db 48,$7F
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  !fs5
  db 72
  !rest
  db 24
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  !fs5
  db 72
  !rest
  db 24
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  !g5
  db 72
  !rest
  db 24
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 48
  !cs5
  !cs5
  db 96
  !rest
  db 72
  !g5

Track5AB2:
  !loop : dw Sub5B56 : db 1
  !cs3
  !a2
  !c3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !c3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !cs3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !cs3
  !a2
  !cs3
  !gs2
  !cs3
  !gs2
  !cs3
  !a2
  !volume,220
  db 24
  !cs3
  !cs3
  !volume,250
  db 48
  !cs3
  !end

Track5AE0:
  !loop : dw Sub5B65 : db 1
  !loop : dw Sub5B74 : db 4
  !b3
  !b3
  !rest
  db 12
  !rest

Track5AED:
  !loop : dw Sub5B8E : db 1
  !loop : dw Sub5B9B : db 4
  !cs4
  !cs4
  !cs4
  !rest

Track5AF9:
  !loop : dw Sub5BB5 : db 1
  !loop : dw Sub5BCA : db 3
  !rest
  !instr,$18
  !subtranspose,0
  !volume,240
  db 24
  !rest
  !a2
  !a2
  !volume,200
  !instr,$1B
  !subtranspose,70
  db 6
  !c3
  !d3
  !e3
  !f3

Track5B17:
  !instr,$1C
  !subtranspose,50
  db 96
  !rest
  !rest
  !rest
  db 24
  !rest
  !volume,200
  db 48,$7F
  !c5
  !c5
  db 96
  !rest
  !rest
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  !c5
  db 96
  !rest
  db 48
  !c5
  db 24
  !c4
  !end

Sub5B49:
  !volume,230
  !instr,$1B
  !subtranspose,70
  db 6,$7F
  !c3
  !d3
  !e3
  !f3
  !end

Sub5B56:
  !musicVolume,210
  !tempo,27
  !volume,230
  !instr,$18
  !subtranspose,0
  db 48,$7F
  !cs3
  !a2
  !end

Sub5B65:
  !volume,190
  !instr,$19
  !subtranspose,15
  db 12
  !rest
  db 24,$7F
  !b3
  !b3
  !b3
  !a2
  !end

Sub5B74:
  !b3
  !b3
  !b3
  !a2
  !as3
  !as3
  !as3
  !gs3
  !as3
  !as3
  !as3
  !gs3
  !b3
  !b3
  !b3
  !a2
  !end

Sub5B85:
  !b3
  !b3
  !b3
  !a2
  !as3
  !as3
  !as3
  !gs3
  !end

Sub5B8E:
  !volume,190
  !instr,$19
  !subtranspose,15
  db 24,$7F
  !cs4
  !cs4
  !cs4
  !cs4
  !end

Sub5B9B:
  !cs4
  !cs4
  !cs4
  !cs4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !cs4
  !cs4
  !cs4
  !cs4
  !end

Sub5BAC:
  !cs4
  !cs4
  !cs4
  !cs4
  !c4
  !c4
  !c4
  !c4
  !end

Sub5BB5:
  !volume,250
  !instr,$1D
  !subtranspose,50
  db 96
  !rest
  !rest
  !volume,30
  !dynamicVolume,96,230
  db 96,$7F
  !c4
  !instr,$1C
  !c4
  !end

Sub5BCA:
  !rest
  !rest
  !instr,$1D
  !volume,30
  !dynamicVolume,96,230
  !c4
  !instr,$1C
  !c4
  !end

Sub5BD8:
  !c3
  !gs2
  !end

Sub5BDB:
  !cs3
  !a2
  !end

Sub5BDE:
  !as3
  !as3
  !as3
  !gs3
  !end

Sub5BE3:
  !b3
  !b3
  !b3
  !a3
  !end

Sub5BE8:
  !c4
  !c4
  !c4
  !c4
  !end

Sub5BED:
  !cs4
  !cs4
  !cs4
  !cs4
  !end

Sub5BF2:
  db 96
  !fs3
  !tie
  !end

Sub5BF6:
  db 72
  !rest
  db 6
  !c3
  !d3
  !e3
  !f3
  db 96
  !fs3
  !tie
  !end

Sub5C01:
  db 72
  !rest
  db 6
  !cs3
  !ds3
  !f3
  !fs3
  db 96
  !g3
  !end
Tracker6:
-
  dw Pattern5C13
  dw $00FF,-
  dw $0000

Pattern5C13: dw Track5C23, Track5C37, Track5C86, Track5CE0, Track5D40, Track5D66, 0, 0

Track5C23:
  !musicVolume,200
  !tempo,21
  !instr,$1F
  !volume,230
  !pan,10
  db 96,$7F
  !c5
  !loop : dw Sub5D8D : db 18
  !end

Track5C37:
  !instr,$1E
  !volume,250
  !volume,60
  !dynamicVolume,70,230
  db 96,$7F
  !ds5
  !volume,60
  !dynamicVolume,50,230
  !d5
  !volume,60
  !dynamicVolume,50,230
  !gs4
  !volume,60
  !dynamicVolume,50,230
  !a4
  !tie
  !tie
  !volume,230
  !dynamicVolume,96,60
  !tie
  !instr,$1E
  !volume,250
  !volume,60
  !dynamicVolume,90,230
  !ds5
  !volume,60
  !dynamicVolume,50,230
  !d5
  !volume,60
  !dynamicVolume,50,230
  !as5
  !volume,60
  !dynamicVolume,50,230
  !a5
  !volume,230
  !dynamicVolume,40,30
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !rest

Track5C86:
  !instr,$1E
  !volume,250
  !pan,12
  !volume,60
  !dynamicVolume,70,230
  db 72,$7F
  !ds6
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !volume,60
  !dynamicVolume,48,230
  db 72
  !gs5
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !tie
  !tie
  !volume,60
  !dynamicVolume,90,10
  !tie
  !instr,$1E
  !volume,250
  !pan,12
  !volume,60
  !dynamicVolume,70,230
  db 72
  !ds6
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !volume,60
  !dynamicVolume,48,200
  db 72
  !as6
  !volume,200
  !dynamicVolume,70,20
  db 24
  !tie
  db 96
  !tie
  !loop : dw Sub5D8D : db 7
  !rest

Track5CE0:
  !instr,$1E
  !volume,250
  !pan,8
  db 96
  !rest
  !volume,60
  !dynamicVolume,70,230
  db 72,$7F
  !d6
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !volume,60
  !dynamicVolume,48,230
  db 72
  !a5
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !tie
  !volume,60
  !dynamicVolume,90,30
  !tie
  !instr,$1E
  !volume,250
  !pan,8
  !rest
  !volume,60
  !dynamicVolume,70,230
  db 72
  !d6
  !volume,230
  !dynamicVolume,53,60
  db 24
  !tie
  db 96
  !tie
  !volume,60
  !dynamicVolume,48,200
  db 48
  !a6
  !volume,200
  !dynamicVolume,70,20
  db 24
  !tie
  db 96
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !rest
  db 24
  !rest

Track5D40:
  !instr,$1E
  !volume,250
  !pan,7
  !volume,60
  !dynamicVolume,70,250
  db 96,$7F
  !ds4
  !d4
  !a4
  !gs4
  !loop : dw Sub5D8F : db 1
  !loop : dw Sub5DA2 : db 1
  !d4
  !a4
  !as4
  !loop : dw Sub5D8F : db 1
  !loop : dw Sub5DAE : db 2
  db 96
  !rest

Track5D66:
  !instr,$1E
  !volume,250
  !pan,13
  !volume,60
  !dynamicVolume,70,250
  db 96,$7F
  !ds4
  !d4
  !gs4
  !a4
  !loop : dw Sub5DB7 : db 1
  !loop : dw Sub5DA2 : db 1
  !d4
  !as4
  !a4
  !loop : dw Sub5DB7 : db 1
  !loop : dw Sub5DC8 : db 2
  db 96
  !rest
  !end

Sub5D8D:
  !tie
  !end

Sub5D8F:
  !instr,$18
  !subtranspose,0
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  db 96
  !rest
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  !end

Sub5DA2:
  !instr,$1E
  !volume,250
  !volume,50
  !dynamicVolume,90,250
  db 96
  !ds4
  !end

Sub5DAE:
  db 96
  !rest
  db 24
  !rest
  db 48
  !c3
  db 24
  !rest
  !end

Sub5DB7:
  !instr,$18
  !subtranspose,0
  db 48
  !c3
  db 24
  !rest
  !rest
  db 96
  !rest
  db 48
  !c3
  db 24
  !rest
  !rest
  !end

Sub5DC8:
  db 96
  !rest
  db 48
  !c3
  db 24
  !rest
  !rest
  !end

if defined("print_freespace")
  print "Song 2A: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8
endspcblock

dw $0000
