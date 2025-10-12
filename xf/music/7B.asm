asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E9,$B8,$00,$9E
  db $19,$FF,$E0,$B8,$02,$7B
  db $1A,$FA,$E7,$B8,$01,$08
  db $1B,$FE,$E7,$B8,$01,$4C
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+3663
  dw Sample19,Sample19+1062
  dw Sample1A,Sample1A+135
  dw Sample1B,Sample1B+27
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ef25c5b6dec0eb9284501ed4e7b4825a.brr")
  Sample19: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1A: skip filesize("Sample_b0365c4b45f439074b99be7b0579837a.brr")
  Sample1B: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5842
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5842
  dw Pattern5852
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Pattern5842: dw Track5872, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track5889, Track5938, Track599D, 0, 0, 0, 0, 0
Pattern5862: dw Track58DF, Track596B, Track59D0, Track5A05, 0, 0, 0, 0

Track5872:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,40
  !musicVolume,176
  !echo,%00111111,47,47
  !echoParameters,2,0,6
  !end

Track5889:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,112
  db 90
  !a7
  db 6
  !rest
  !volume,128
  db 90
  !gs7
  db 6
  !rest
  !volume,144
  db 90
  !fs7
  db 6
  !rest
  !dynamicVolume,80,112
  db 90
  !gs7
  db 6
  !rest
  !volume,144
  db 90
  !d7
  db 6
  !rest
  !volume,160
  db 90
  !c7
  db 6
  !rest
  !volume,176
  db 90
  !as6
  db 6
  !rest
  !volume,160
  db 90
  !c7
  db 6
  !rest
  !volume,144
  db 90
  !as6
  db 6
  !rest
  !volume,160
  db 90
  !a6
  db 6
  !rest
  !volume,144
  db 90
  !g6
  db 6
  !rest
  !volume,176
  db 96
  !a6
  !tie
  !tie
  !tie
  db 48
  !tie
  !rest
  !end

Track58DF:
  !instr,$19
  !pan,10
  !volume,176
  db 66
  !as4
  db 6
  !rest
  db 114
  !as4
  db 6
  !rest
  !volume,192
  db 66
  !as4
  db 6
  !rest
  !volume,208
  db 114
  !as4
  db 6
  !rest
  !volume,144
  db 66
  !as5
  db 6
  !rest
  !volume,192
  db 114
  !as4
  db 6
  !rest
  db 66
  !as4
  db 6
  !rest
  db 66
  !as4
  db 6
  !rest
  db 42
  !as4
  db 6
  !rest
  !volume,144
  db 66
  !as5
  db 6
  !rest
  db 114
  !as5
  db 6
  !rest
  db 66
  !as5
  db 6
  !rest
  !volume,192
  db 114
  !as4
  db 6
  !rest
  db 66
  !as4
  db 6
  !rest
  db 114
  !as4
  db 6
  !rest
  db 66
  !as4
  db 6
  !rest
  !volume,160
  db 114
  !as4
  db 6
  !rest
  !end

Track5938:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,8
  !volume,64
  !dynamicVolume,240,112
  db 96
  !d7
  !tie
  !tie
  !tie
  !volume,64
  !dynamicVolume,176,112
  !as6
  !tie
  !dynamicVolume,176,80
  !tie
  !tie
  !volume,72
  !dynamicVolume,176,104
  !g6
  !tie
  !tie
  !tie
  !volume,64
  !dynamicVolume,96,104
  !g6
  !tie
  !tie
  db 48
  !tie
  !rest
  !end

Track596B:
  !instr,$1B
  !pan,6
  !volume,144
  db 96
  !f6
  !tie
  !e6
  !tie
  !dynamicVolume,176,96
  !g6
  !tie
  !dynamicVolume,176,144
  !a6
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,176,96
  db 96
  !c7
  !tie
  !dynamicVolume,176,144
  !as6
  !tie
  !dynamicVolume,176,96
  !ds7
  !tie
  !dynamicVolume,176,144
  !c7
  db 72
  !tie
  db 96
  !rest
  !tie
  !end

Track599D:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,12
  !volume,64
  !dynamicVolume,240,112
  db 96
  !fs6
  !tie
  !tie
  !tie
  !volume,64
  !dynamicVolume,176,112
  !f6
  !tie
  !dynamicVolume,176,80
  !tie
  !tie
  !volume,72
  !dynamicVolume,176,104
  !ds6
  !tie
  !tie
  !tie
  !volume,64
  !dynamicVolume,96,104
  !ds6
  !tie
  !tie
  db 48
  !tie
  !rest
  !end

Track59D0:
  !instr,$1B
  !pan,14
  !volume,144
  db 96
  !as5
  !tie
  !dynamicVolume,176,96
  !g5
  !tie
  !dynamicVolume,176,144
  !c6
  !tie
  !dynamicVolume,176,96
  !c6
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,176,144
  db 96
  !d6
  !tie
  !dynamicVolume,176,96
  !ds6
  !tie
  !dynamicVolume,176,144
  !a6
  !tie
  !dynamicVolume,176,96
  !f6
  db 72
  !tie
  db 96
  !rest
  !tie
  !end

Track5A05:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,10
  !volume,144
  db 96
  !d6
  !tie
  !c6
  !tie
  !dynamicVolume,176,96
  !e6
  !tie
  !dynamicVolume,176,96
  !fs6
  db 90
  !tie
  db 6
  !rest
  !dynamicVolume,176,144
  db 96
  !f6
  !tie
  !dynamicVolume,176,96
  !g6
  !tie
  !dynamicVolume,176,144
  !c7
  !tie
  !dynamicVolume,176,96
  !a6
  db 72
  !tie
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 7B: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8
endspcblock

dw $0000
