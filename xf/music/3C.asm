asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E1,$B8,$02,$98
  db $19,$FF,$E0,$B8,$05,$83
  db $1A,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19,Sample19
  dw Sample1A,Sample1A
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample19: skip filesize("Sample_da187b6a41fbf48f10b461fc7ed0d3d5.brr")
  Sample1A: skip filesize("Sample_4ef89861ffb6c245a4bc3930d41b5fd1.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5844
  dw Pattern5854
-
  dw Pattern5864
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5844
  dw Pattern5874
-
  dw Pattern5884
  dw $00FF,-
  dw $0000

Pattern5844: dw Track5894, 0, 0, 0, 0, 0, 0, 0
Pattern5854: dw Track58E3, Track5951, Track59A1, Track5A0B, 0, 0, 0, 0
Pattern5864: dw Track5905, Track596F, Track59BD, Track5A27, 0, 0, 0, 0
Pattern5874: dw Track58E3, Track5951, Track59A1, Track5A0B, Track58AB, 0, 0, 0
Pattern5884: dw Track5905, Track596F, Track59BD, Track5A27, Track58AB, Track58BE, 0, 0

Track5894:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,72
  !musicVolume,144
  !echo,%00001111,31,31
  !echoParameters,4,16,5
  !end

Track58AB:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,10
  !loop : dw Sub58B8 : db 255
  !end

Sub58B8:
  !volume,239
  db 96
  !d3
  !tie
  !end

Track58BE:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,192
  !loop : dw Sub58CB : db 255
  !end

Sub58CB:
  db 48
  !rest
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1A
  !pan,13
  !f3
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1A
  !pan,5
  !e3
  !tie
  !end

Track58E3:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,79
  !dynamicVolume,238,111
  db 96
  !f6
  !tie
  !tie
  !dynamicVolume,238,79
  !tie
  !tie
  !tie
  !dynamicVolume,190,111
  !b5
  !tie
  !tie
  !dynamicVolume,94,79
  !tie
  !end

Track5905:
  !instr,$18
  !pan,10
  !volume,95
  db 96
  !fs6
  !tie
  !tie
  !volume,79
  !tie
  !tie
  !tie
  !volume,79
  !dynamicVolume,238,111
  !f6
  !tie
  !tie
  !dynamicVolume,238,79
  !tie
  !tie
  !tie
  !dynamicVolume,238,111
  !b5
  !tie
  !tie
  !dynamicVolume,94,95
  !tie
  !pan,10
  !volume,95
  !fs6
  !tie
  !tie
  !volume,79
  !tie
  !tie
  !tie
  !volume,79
  !dynamicVolume,238,111
  !f6
  !tie
  !tie
  !dynamicVolume,238,79
  !tie
  !tie
  !tie
  !dynamicVolume,238,111
  !b5
  !tie
  !tie
  !dynamicVolume,94,95
  !tie
  !end

Track5951:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  db 96
  !rest
  !tie
  !volume,95
  !dynamicVolume,190,111
  !fs6
  !tie
  !tie
  !dynamicVolume,238,79
  !tie
  !tie
  !tie
  !volume,95
  !f6
  !tie
  !end

Track596F:
  !instr,$18
  !pan,11
  db 96
  !rest
  !tie
  !volume,95
  !c6
  !tie
  !tie
  !tie
  !rest
  !tie
  !fs6
  !tie
  !tie
  !tie
  !dynamicVolume,190,63
  !tie
  !tie
  !f6
  !tie
  !pan,9
  !rest
  !tie
  !volume,95
  !c6
  !tie
  !tie
  !tie
  !rest
  !tie
  !fs6
  !tie
  !tie
  !tie
  !dynamicVolume,190,63
  !tie
  !tie
  !f6
  !tie
  !end

Track59A1:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,9
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !volume,79
  !dynamicVolume,190,95
  !f6
  !tie
  !dynamicVolume,190,111
  !b6
  !tie
  !end

Track59BD:
  !instr,$18
  !pan,9
  !volume,95
  db 96
  !b6
  !tie
  !dynamicVolume,190,111
  !as6
  !tie
  !volume,79
  !dynamicVolume,190,79
  !tie
  !tie
  !dynamicVolume,254,95
  !a7
  !tie
  !tie
  !tie
  !dynamicVolume,254,79
  !gs7
  !tie
  !tie
  !tie
  !dynamicVolume,190,111
  !b6
  !tie
  !pan,11
  !volume,95
  !b6
  !tie
  !dynamicVolume,190,111
  !as6
  !tie
  !volume,79
  !dynamicVolume,190,79
  !tie
  !tie
  !dynamicVolume,254,95
  !a7
  !tie
  !tie
  !tie
  !dynamicVolume,254,79
  !gs7
  !tie
  !tie
  !tie
  !dynamicVolume,190,111
  !b6
  !tie
  !end

Track5A0B:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !volume,95
  !dynamicVolume,94,111
  !c6
  !dynamicVolume,190,79
  !tie
  !tie
  !tie
  !rest
  !tie
  !end

Track5A27:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !volume,79
  !dynamicVolume,190,95
  !b5
  !tie
  !dynamicVolume,190,111
  !tie
  !tie
  !rest
  !tie
  !volume,95
  !c6
  !tie
  !dynamicVolume,190,79
  !tie
  !tie
  !rest
  !tie
  !pan,10
  !rest
  !tie
  !tie
  !tie
  !volume,79
  !dynamicVolume,190,95
  !b5
  !tie
  !dynamicVolume,190,111
  !tie
  !tie
  !rest
  !tie
  !volume,95
  !c6
  !tie
  !dynamicVolume,190,79
  !tie
  !tie
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 3C: Space left: $",hex($10000-(4*$800)-pc())
endif
assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
