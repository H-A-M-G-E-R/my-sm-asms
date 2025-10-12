asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Intro speech

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$08,$00
  db $19,$FF,$E0,$B8,$08,$00
  db $1A,$FF,$E0,$B8,$08,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_a0d92a11a8faee666248670e88d6ae24.brr")
  Sample19: skip filesize("Sample_05f2645aa9e3762f8319fae3ba515fa8.brr")
  Sample1A: skip filesize("Sample_8f70ef4287d6cd29a14683e1aae3ab7d.brr")
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
Pattern5844: dw Track586D, Track5894, Track58B0, Track58C4, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,24
  !musicVolume,192
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  db 24
  !rest
  !end

Track586D:
  db 127,$7F
  !transpose,0
  !volume,192
  !pan,10
  !instr,$18
  db 6
  !c4
  !c4
  !c4
  db 21
  !rest
  db 12
  !rest
  db 6
  !rest
  !loop : dw Sub588B : db 1
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Sub588B:
  !instr,$19
  db 42
  !c4
  !instr,$1A
  db 96
  !c4
  !end

Track5894:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,192
  !pan,10
  db 3
  !rest
  db 6
  !c4
  !c4
  db 24
  !rest
  db 12
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !rest
  !tie
  !end

Track58B0:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,207
  !pan,14
  db 57
  !rest
  !loop : dw Sub588B : db 1
  db 96
  !rest
  !tie
  !end

Track58C4:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,175
  !pan,6
  db 3
  !rest
  db 57
  !rest
  !loop : dw Sub588B : db 1
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 9F: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8
endspcblock

dw $0000
