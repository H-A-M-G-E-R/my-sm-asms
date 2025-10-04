asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$07,$A0
  db $19,$FF,$F2,$B8,$04,$00
  db $1A,$FF,$E0,$B8,$01,$90
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A+27
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ddd487c9bae3c9e4cd5f013218704614.brr")
  Sample19: skip filesize("Sample_64ca79c82f5165d33781b6a33c15a0e0.brr")
  Sample1A: skip filesize("Sample_235717614e1e5674ae0ef641c422feaf.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5830
  dw Pattern5840
  dw $0000

Pattern5830: dw Track5850, 0, 0, 0, 0, 0, 0, 0
Pattern5840: dw Track5867, Track5884, Track58AB, Track58DD, Track58F8, Track5915, Track5932, 0

Track5850:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,27
  !musicVolume,200
  !echo,%00001111,31,31
  !echoParameters,2,32,1
  !end

Track5867:
  db 127,$7F
  !transpose,0
  !instr,$15
  !volume,250
  !pan,12
  db 10
  !b7
  !a7
  !g7
  !f7
  !e7
  !d7
  !c7
  !b6
  !a6
  !loop : dw Sub5880 : db 255
  !end

Sub5880:
  db 96
  !rest
  !tie
  !end

Track5884:
  db 127,$7F
  !transpose,0
  !instr,$15
  !volume,250
  !pan,8
  !subtranspose,131
  db 8
  !b7
  !loop : dw Sub58A9 : db 8
  db 4
  !b7
  !instr,$19
  !subtranspose,0
  !vibrato,0,18,79
  db 8
  !a3
  db 96
  !c4
  !loop : dw Sub5880 : db 255
  !end

Sub58A9:
  !b7
  !end

Track58AB:
  db 127,$7F
  !transpose,0
  !instr,$15
  !volume,250
  !pan,10
  !subtranspose,131
  db 4
  !fs5
  !g5
  !gs5
  !a5
  !as5
  !b5
  !c6
  !cs6
  !d7
  !ds7
  !e7
  !f7
  !fs7
  !g7
  !gs7
  !a7
  !as7
  !b7
  !instr,$18
  !subtranspose,0
  db 15,$0C
  db 20
  !gs3
  !volume,120
  !gs3
  !volume,100
  !dynamicVolume,80,40
  db 80
  !gs3
  !end

Track58DD:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,15
  !volume,60
  !dynamicVolume,69,230
  db 70
  !c6
  !volume,230
  !dynamicVolume,50,40
  db 60
  !c7
  !loop : dw Sub5880 : db 255
  !end

Track58F8:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,5
  !volume,60
  !dynamicVolume,69,230
  db 8
  !rest
  db 70
  !e6
  !volume,230
  !dynamicVolume,50,40
  db 60
  !a6
  !loop : dw Sub5880 : db 255
  !end

Track5915:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,15
  !volume,60
  !dynamicVolume,69,230
  db 10
  !rest
  db 70
  !g6
  !volume,230
  !dynamicVolume,50,40
  db 60
  !g6
  !loop : dw Sub5880 : db 255
  !end

Track5932:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,5
  !volume,60
  !dynamicVolume,69,230
  db 14
  !rest
  db 70
  !c7
  !volume,230
  !dynamicVolume,50,40
  db 60
  !f6
  !loop : dw Sub5880 : db 255
  !end

if defined("print_freespace")
  print "Song 54: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
