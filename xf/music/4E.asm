asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Item fanfare

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$04,$F4
  db $19,$FF,$E0,$B8,$0A,$67
  db $1A,$FF,$E0,$B8,$09,$EC
  db $1B,$FF,$E0,$B8,$0A,$67
  db $1C,$FF,$E0,$B8,$04,$F4
  db $1D,$FF,$E0,$B8,$02,$7A
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+9
  dw Sample19,Sample19+189
  dw Sample1A,Sample1A+1062
  dw Sample1B,Sample1B+63
  dw Sample1C,Sample1C+3573
  dw Sample1D,Sample1D+2142
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ef6b054116253361d675341632d6a4d7.brr")
  Sample19: skip filesize("Sample_2860ee6b527846bcbba36e8c75458083.brr")
  Sample1A: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1B: skip filesize("Sample_5ff955130ef19a6c13a90e09bc4e4119.brr")
  Sample1C: skip filesize("Sample_33870d7b9fb0ae9a8ea3b27ae6560230.brr")
  Sample1D: skip filesize("Sample_e298086596e36db363badb019772c047.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5830
  dw Pattern5840
  dw $0000

Pattern5830: dw Track5850, 0, 0, 0, 0, 0, 0, 0
Pattern5840: dw Track5861, Track5890, Track58C8, Track5901, Track5922, Track594C, Track5975, 0

Track5850:
  !tempo,46
  !musicVolume,208
  !echo,%00001111,0,0
  !echoParameters,0,0,0
  !volume,0
  db 12
  !c5
  !end

Track5861:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,128
  !subtranspose,23
  !pan,10
  db 24
  !f4
  !as4
  !c5
  !d5
  !e5
  !c5
  !g4
  !c5
  db 30
  !f5
  db 24
  !d5
  db 36
  !as4
  !g4
  db 96
  !a4
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  !loop : dw Sub588C : db 255
  !end

Sub588C:
  db 96
  !rest
  !tie
  !end

Track5890:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,128
  !pan,9
  db 12
  !f2
  !rest
  !as2
  !rest
  !c3
  !rest
  !d3
  !rest
  !e3
  !rest
  !c3
  !rest
  !g2
  !rest
  !c3
  !rest
  !f3
  db 6
  !rest
  db 12
  !rest
  !d3
  !rest
  !as2
  db 24
  !rest
  db 12
  !g2
  db 24
  !rest
  db 96
  !a2
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
  !loop : dw Sub588C : db 255
  !end

Track58C8:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,112
  !pan,11
  db 36
  !rest
  db 6
  !f2
  db 18
  !rest
  db 6
  !as2
  db 18
  !rest
  db 6
  !c3
  db 18
  !rest
  db 6
  !d3
  db 18
  !rest
  db 6
  !e3
  db 18
  !rest
  db 6
  !c3
  db 18
  !rest
  db 6
  !g2
  db 18
  !rest
  db 6
  !c3
  db 18
  !rest
  db 12
  !f3
  !rest
  !d3
  !rest
  !as2
  !rest
  !g2
  !loop : dw Sub588C : db 255
  !end

Track5901:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,176
  !subtranspose,23
  !pan,10
  db 96
  !as2
  !a2
  db 120
  !g2
  db 6
  !rest
  db 96
  !d2
  !tie
  !dynamicVolume,18,16
  db 18
  !tie
  !volume,176
  db 96
  !rest
  !tie
  !end

Track5922:
  db 127,$7F
  !pan,6
  db 96
  !rest
  !tie
  !tie
  db 30
  !tie
  !instr,$1C
  !volume,192
  !transpose,0
  !dynamicPan,192,12
  db 72
  !c4
  !dynamicVolume,64,255
  !instr,$1D
  db 96
  !c4
  db 48
  !tie
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,192
  !loop : dw Sub588C : db 255
  !end

Track594C:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,96
  !pan,10
  db 24
  !f4
  !as4
  !c5
  !d5
  !e5
  !c5
  !g4
  !c5
  db 30
  !f5
  db 24
  !d5
  db 36
  !as4
  !g4
  db 96
  !a4
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,96
  !loop : dw Sub588C : db 255
  !end

Track5975:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,96
  !pan,10
  db 24
  !as3
  !f4
  !f4
  !g4
  !c5
  !g4
  !c4
  !g4
  db 30
  !as4
  db 24
  !g4
  db 36
  !f4
  !c4
  db 96
  !d4
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,96
  !loop : dw Sub588C : db 255
  !end

assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
