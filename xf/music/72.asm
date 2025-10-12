asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E7,$B8,$01,$3D
  db $19,$FF,$E0,$B8,$05,$30
  db $1A,$FD,$E0,$B8,$02,$98
  db $1B,$FF,$F1,$B8,$04,$F6
  db $1C,$FF,$F2,$B8,$04,$F4
  db $1D,$FE,$F3,$B8,$0A,$67
  db $1E,$FF,$F2,$B8,$04,$F4
  db $1F,$D8,$F2,$B8,$04,$F4
  db $20,$FF,$E0,$B8,$00,$40
  db $21,$FF,$E0,$B8,$04,$F4
  db $22,$FF,$E0,$B8,$04,$F4
  db $23,$FF,$F0,$B8,$02,$7A
  db $24,$FF,$F2,$B8,$01,$4C
  db $25,$EE,$D3,$B8,$09,$90
  db $26,$FF,$E0,$B8,$01,$4C
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+18
  dw Sample19_1A_24_26,Sample19_1A_24_26+135
  dw Sample19_1A_24_26,Sample19_1A_24_26+135
  dw Sample1B,Sample1B+1062
  dw Sample1C,Sample1C
  dw Sample1D_25,Sample1D_25+513
  dw Sample1E,Sample1E
  dw Sample1F,Sample1F
  dw Sample20,Sample20+36
  dw Sample21,Sample21
  dw Sample22,Sample22
  dw Sample23,Sample23
  dw Sample19_1A_24_26,Sample19_1A_24_26+135
  dw Sample1D_25,Sample1D_25+513
  dw Sample19_1A_24_26,Sample19_1A_24_26+135
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_84c6d5b414c72aecd879951c3b874549.brr")
  Sample19_1A_24_26: skip filesize("Sample_9b8c27a5d3be46e264a8815e398d9659.brr")
  Sample1B: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1C: skip filesize("Sample_ff8b37e06639ca6f4c8983178b73c75f.brr")
  Sample1D_25: skip filesize("Sample_441d4eac476cad49850f2c9cc81a9aec.brr")
  Sample1E: skip filesize("Sample_ae8e1de965071e6c9210ea1074e4ae53.brr")
  Sample1F: skip filesize("Sample_9b3e33be9ebdd07b2922da92c7899ad8.brr")
  Sample20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21: skip filesize("Sample_601a4b08468b4095e62779faacd92271.brr")
  Sample22: skip filesize("Sample_0e021b8c900b6db8440abf3c3b172967.brr")
  Sample23: skip filesize("Sample_da1530af58462df8494ebdc079f396b3.brr")
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
  dw Pattern5860
-
  dw Pattern5870
  dw $00FF,-
  dw $0000

Pattern5840: dw Track5880, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track588D, Track58EF, Track5959, Track59C9, Track59FD, 0, 0, 0
Pattern5860: dw Track5A85, 0, 0, 0, 0, 0, 0, 0
Pattern5870: dw Track5A92, Track5B1E, Track5C56, Track5CB1, Track5D45, 0, 0, 0

Track5880:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,60
  !musicVolume,192
  !end

Track588D:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,144
  db 96
  !fs6
  db 18
  !g6
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 96
  !fs6
  db 18
  !g6
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 96
  !e6
  db 18
  !f6
  db 6
  !rest
  db 18
  !f6
  db 6
  !rest
  db 96
  !e6
  db 18
  !f6
  db 6
  !rest
  db 18
  !f6
  db 6
  !rest
  db 96
  !fs6
  db 18
  !g6
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 96
  !fs6
  db 18
  !g6
  db 6
  !rest
  db 18
  !g6
  db 6
  !rest
  db 96
  !e6
  db 18
  !f6
  db 6
  !rest
  db 18
  !f6
  db 6
  !rest
  db 84
  !e6
  db 12
  !ds6
  db 18
  !ds6
  !e6
  db 12
  !f6
  !loop : dw Sub58EB : db 255
  !end

Sub58EB:
  db 96
  !rest
  !tie
  !end

Track58EF:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1A
  !loop : dw Sub5929 : db 2
  !loop : dw Sub5941 : db 2
  !loop : dw Sub5929 : db 2
  !loop : dw Sub5941 : db 1
  !volume,176
  db 18
  !b2
  !b3
  db 12
  !b4
  !volume,128
  !b5
  db 6
  !rest
  db 12
  !b5
  db 6
  !rest
  db 12
  !ds5
  !ds5
  !volume,160
  db 6
  !rest
  db 12
  !e5
  db 6
  !rest
  db 12
  !f5
  !loop : dw Sub58EB : db 1
  !end

Sub5929:
  !volume,176
  db 18
  !cs3
  !cs4
  db 12
  !cs5
  !volume,128
  !cs6
  db 6
  !rest
  db 12
  !cs6
  db 18
  !rest
  db 12
  !cs6
  !rest
  !volume,160
  !cs5
  !rest
  !end

Sub5941:
  !volume,176
  db 18
  !b2
  !b3
  db 12
  !b4
  !volume,128
  !b5
  db 6
  !rest
  db 12
  !b5
  db 18
  !rest
  db 12
  !c6
  !rest
  !volume,160
  !c5
  !rest
  !end

Track5959:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,128
  !dynamicPan,96,15
  db 96
  !as4
  !dynamicPan,48,5
  db 12
  !b4
  !rest
  !b4
  !rest
  !dynamicPan,96,15
  db 96
  !as4
  !dynamicPan,48,5
  db 12
  !b4
  !rest
  !b4
  !rest
  !dynamicPan,96,15
  db 96
  !gs4
  !dynamicPan,48,5
  db 12
  !c5
  !rest
  !c5
  !rest
  !dynamicPan,96,15
  db 96
  !gs4
  !dynamicPan,48,5
  db 12
  !c5
  !rest
  !c5
  !rest
  !dynamicPan,96,15
  db 96
  !as4
  !dynamicPan,48,5
  db 12
  !b4
  !rest
  !b4
  !rest
  !dynamicPan,96,15
  db 96
  !as4
  !dynamicPan,48,5
  db 12
  !b4
  !rest
  !b4
  !rest
  !dynamicPan,96,15
  db 96
  !gs4
  !dynamicPan,48,5
  db 12
  !c5
  !rest
  !c5
  !rest
  !dynamicPan,96,15
  db 96
  !gs4
  !dynamicPan,48,5
  db 48
  !c5
  !end

Track59C9:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,208
  db 24
  !cs3
  db 120
  !rest
  db 24
  !cs3
  db 120
  !rest
  db 24
  !b2
  db 120
  !rest
  db 24
  !b2
  db 120
  !rest
  db 24
  !cs3
  db 120
  !rest
  db 24
  !cs3
  db 120
  !rest
  db 24
  !b2
  db 120
  !rest
  db 24
  !b2
  db 72
  !rest
  db 18
  !ds3
  !e3
  db 12
  !f3
  !loop : dw Sub58EB : db 1
  !end

Track59FD:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !instr,$1C
  !volume,192
  db 48
  !c4
  !instr,$1D
  !volume,112
  !c4
  db 12
  !c4
  !c4
  !c4
  db 48
  !c4
  db 12
  !rest
  db 48
  !c4
  !instr,$1E
  !volume,192
  db 18
  !c4
  !c4
  db 12
  !c4
  !instr,$1D
  !volume,112
  db 48
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  db 48
  !c4
  db 12
  !rest
  !instr,$1F
  !volume,240
  db 6
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !instr,$1D
  !volume,112
  db 48
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  db 48
  !c4
  db 12
  !rest
  db 48
  !c4
  !instr,$1E
  !volume,192
  db 18
  !c4
  !c4
  db 12
  !c4
  !instr,$1D
  !volume,112
  db 48
  !c4
  !c4
  db 12
  !c4
  !c4
  !c4
  db 48
  !c4
  db 12
  !rest
  db 48
  !c4
  !instr,$1C
  !volume,192
  db 12
  !c4
  db 6
  !rest
  db 12
  !c4
  db 6
  !rest
  db 12
  !c4
  !loop : dw Sub58EB : db 1
  !end

Track5A85:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,68
  !musicVolume,160
  !end

Track5A92:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  !volume,161
  db 64
  !fs6
  db 32
  !g6
  !a6
  !as6
  !volume,129
  !b6
  !volume,161
  !ds7
  !d7
  !cs7
  db 36
  !c7
  db 28
  !cs7
  db 32
  !d7
  !as6
  !b6
  !c7
  !d7
  !ds7
  !e7
  !volume,113
  db 24
  !g7
  db 8
  !rest
  db 24
  !fs7
  db 8
  !rest
  db 24
  !f7
  db 8
  !rest
  db 72
  !fs7
  db 24
  !g7
  db 72
  !ds7
  db 24
  !e7
  !volume,129
  db 32
  !rest
  db 40
  !as6
  db 24
  !b6
  db 32
  !rest
  db 40
  !g6
  db 24
  !gs6
  db 30
  !rest
  !volume,160
  db 32
  !fs6
  db 24
  !f6
  db 10
  !rest
  db 30
  !rest
  db 32
  !gs6
  !volume,129
  db 24
  !g6
  db 10
  !rest
  db 36
  !rest
  db 28
  !b6
  db 24
  !as6
  db 8
  !rest
  !volume,161
  db 30
  !rest
  db 32
  !d7
  db 24
  !cs7
  db 10
  !rest
  !volume,113
  db 72
  !fs7
  db 24
  !g7
  db 32
  !rest
  !fs5
  !g5
  !rest
  !fs6
  !volume,129
  !g6
  !volume,160
  db 24
  !fs7
  db 8
  !rest
  db 24
  !fs7
  db 8
  !rest
  db 24
  !g7
  db 8
  !rest
  !end

Track5B1E:
  db 127,$7F
  !transpose,0
  !instr,$26
  !pan,10
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  db 24
  !cs4
  !cs5
  !cs6
  !cs4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !cs4
  !cs5
  !cs6
  !cs4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !cs4
  !cs5
  !cs6
  !cs4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !d4
  !d5
  !d6
  !d4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !d4
  !d5
  !d6
  !d4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !d4
  !d5
  !d6
  !d4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !d4
  !d5
  !d6
  !d4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !instr,$24
  db 36
  !ds4
  db 18
  !ds4
  !rest
  db 24
  !ds4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !ds4
  db 6
  !rest
  db 18
  !ds4
  db 24
  !rest
  !ds4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  db 36
  !ds4
  db 24
  !ds4
  db 12
  !rest
  db 24
  !ds4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !ds4
  db 6
  !rest
  db 18
  !ds4
  db 24
  !rest
  !ds4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  db 36
  !e4
  db 24
  !e4
  db 12
  !rest
  db 24
  !e4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !e4
  db 6
  !rest
  db 18
  !e4
  db 24
  !rest
  !e4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !e4
  db 6
  !rest
  db 18
  !e4
  db 24
  !rest
  !e4
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !instr,$26
  !e4
  !e5
  !e6
  !e4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !f4
  !f5
  !f6
  !f4
  !instr,$24
  !volume,249
  !dynamicVolume,176,153
  !pan,6
  !dynamicPan,176,14
  !f4
  db 6
  !rest
  db 18
  !f4
  db 24
  !rest
  !f4
  !volume,249
  !dynamicVolume,176,153
  !pan,14
  !dynamicPan,176,6
  !f4
  db 6
  !rest
  db 18
  !f4
  db 24
  !rest
  !f4
  !volume,249
  !f4
  db 48
  !rest
  !volume,153
  db 24
  !f4
  !end

Track5C56:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,8
  !volume,255
  db 32
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !cs3
  !pan,12
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !d3
  !pan,8
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !ds3
  !pan,12
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !e3
  !pan,8
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !f3
  !pan,10
  db 24
  !f3
  db 6
  !rest
  db 24
  !f3
  db 8
  !rest
  db 24
  !f3
  db 8
  !rest
  db 24
  !f3
  db 8
  !rest
  !end

Track5CB1:
  db 127,$7F
  !instr,$26
  !pan,9
  !transpose,4
  !volume,161
  db 64
  !fs6
  db 32
  !g6
  !a6
  !as6
  !volume,129
  !b6
  !volume,161
  !ds7
  !d7
  !cs7
  db 36
  !c7
  db 28
  !cs7
  db 32
  !d7
  !as6
  !b6
  !c7
  !d7
  !ds7
  !e7
  !volume,113
  db 24
  !g7
  db 8
  !rest
  db 24
  !fs7
  db 8
  !rest
  db 24
  !f7
  db 8
  !rest
  !transpose,7
  !volume,128
  db 72
  !fs7
  db 24
  !g7
  db 72
  !ds7
  db 24
  !e7
  !volume,129
  db 32
  !rest
  db 40
  !as6
  db 24
  !b6
  db 32
  !rest
  db 40
  !g6
  db 24
  !gs6
  db 30
  !rest
  !volume,160
  db 32
  !fs6
  db 24
  !f6
  db 10
  !rest
  db 30
  !rest
  db 32
  !gs6
  !volume,129
  db 24
  !g6
  db 10
  !rest
  db 36
  !rest
  db 28
  !b6
  db 24
  !as6
  db 8
  !rest
  !volume,161
  db 30
  !rest
  db 32
  !d7
  db 24
  !cs7
  db 10
  !rest
  !volume,113
  !transpose,4
  db 72
  !fs7
  db 24
  !g7
  db 32
  !rest
  !fs5
  !g5
  !rest
  !fs6
  !volume,129
  !g6
  !transpose,248
  !volume,160
  db 24
  !fs7
  db 8
  !rest
  db 24
  !fs7
  db 8
  !rest
  db 24
  !g7
  db 8
  !rest
  !end

Track5D45:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1C
  !volume,208
  db 48
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  db 32
  !c4
  !c4
  !c4
  !instr,$23
  !volume,208
  !a4
  !g4
  !f4
  !instr,$1C
  !volume,208
  db 48
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  db 32
  !c4
  !instr,$25
  !volume,144
  !c4
  !c4
  !instr,$1C
  !volume,208
  db 24
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$23
  !volume,208
  !b4
  !g4
  !instr,$1C
  !volume,208
  db 48
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  db 32
  !c4
  !c4
  !c4
  db 48
  !c4
  !instr,$25
  !volume,144
  db 12
  !rest
  db 36
  !c4
  !instr,$1C
  !volume,208
  db 48
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  !c4
  !instr,$25
  !volume,144
  db 12
  !rest
  db 36
  !c4
  !instr,$1C
  !volume,208
  db 48
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  db 32
  !c4
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  !c4
  !instr,$25
  !volume,144
  !c4
  !instr,$1C
  !volume,208
  !c4
  !c4
  !instr,$25
  !volume,144
  !c4
  !c4
  !c4
  !instr,$1C
  !volume,208
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !d4
  !instr,$25
  !volume,144
  !c4
  db 16
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 72: Space left: $",hex($10000-(0*$800)-pc())
endif
assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8
endspcblock

dw $0000
