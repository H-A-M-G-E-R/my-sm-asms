asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Appearance fanfare

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$0A,$67
  db $19,$FF,$E0,$B8,$04,$F4
  db $1A,$FF,$E0,$B8,$04,$F4
  db $1B,$FF,$E0,$B8,$13,$D7
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+63
  dw Sample19,Sample19+3573
  dw Sample1A,Sample1A+4284
  dw Sample1B,Sample1B+108
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_5ff955130ef19a6c13a90e09bc4e4119.brr")
  Sample19: skip filesize("Sample_33870d7b9fb0ae9a8ea3b27ae6560230.brr")
  Sample1A: skip filesize("Sample_2927a7e5bdb79ab7228c58ba371e3514.brr")
  Sample1B: skip filesize("Sample_878ea10e42cb89660db51cb44f1c0fc8.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5830
  dw Pattern5840
  dw $0000

Pattern5830: dw Track5850, 0, 0, 0, 0, 0, 0, 0
Pattern5840: dw Track5861, Track588E, Track58B7, Track58E5, Track58FA, Track593E, 0, 0

Track5850:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,60
  !musicVolume,240
  !volume,0
  db 12
  !c5
  !end

Track5861:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,96
  !pan,10
  db 66
  !d4
  db 6
  !rest
  db 66
  !f4
  db 6
  !rest
  db 66
  !d4
  db 6
  !rest
  db 66
  !c4
  db 6
  !rest
  db 96
  !a3
  db 36
  !tie
  db 18
  !rest
  db 96
  !a3
  db 36
  !tie
  !loop : dw Sub588A : db 255
  !end

Sub588A:
  db 96
  !rest
  !tie
  !end

Track588E:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,96
  !pan,10
  db 66
  !as3
  db 6
  !rest
  db 66
  !as3
  db 6
  !rest
  db 66
  !as3
  db 6
  !rest
  db 66
  !as3
  db 6
  !rest
  db 96
  !d3
  db 36
  !tie
  db 18
  !rest
  db 96
  !d3
  db 36
  !tie
  !loop : dw Sub588A : db 255
  !end

Track58B7:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,192
  !subtranspose,23
  !pan,10
  db 120
  !rest
  db 96
  !gs3
  db 60
  !tie
  !instr,$1B
  db 12
  !rest
  db 96
  !d2
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  db 30
  !rest
  db 96
  !d2
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,192
  db 96
  !rest
  !tie
  !end

Track58E5:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,192
  !subtranspose,23
  !pan,10
  db 96
  !gs3
  db 60
  !tie
  !loop : dw Sub588A : db 255
  !end

Track58FA:
  db 127,$7F
  !transpose,0
  !instr,$02
  !subtranspose,0
  !pan,8
  !volume,60
  !dynamicVolume,166,112
  db 16
  !rest
  db 16
  !g3
  db 33
  !rest
  db 50
  !b3
  db 66
  !rest
  db 26
  !g3
  !pan,10
  db 13
  !rest
  !a3
  !rest
  !b3
  db 36
  !rest
  !pan,5
  db 16
  !rest
  !g3
  db 33
  !rest
  db 50
  !g3
  db 100
  !rest
  db 26
  !e3
  !pan,11
  db 13
  !rest
  !g3
  !rest
  !dynamicVolume,100,20
  !g3
  !loop : dw Sub593A : db 255
  !end

Sub593A:
  db 96
  !rest
  !tie
  !end

Track593E:
  db 127,$7F
  !transpose,0
  !instr,$02
  !subtranspose,0
  !pan,12
  !volume,12
  !dynamicVolume,166,112
  db 16
  !f3
  db 100
  !rest
  db 20
  !rest
  !g3
  db 53
  !rest
  !pan,10
  db 13
  !g3
  !rest
  !e3
  !rest
  db 30
  !g3
  !pan,15
  db 16
  !f3
  db 120
  !rest
  db 20
  !g3
  db 53
  !rest
  !pan,9
  db 13
  !g3
  db 46
  !rest
  db 13
  !b3
  !rest
  db 20
  !b3
  !dynamicVolume,100,20
  db 13
  !g3
  !loop : dw Sub597E : db 255
  !end

Sub597E:
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 4B: Space left: $",hex($10000-(0*$800)-pc())
endif
assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
