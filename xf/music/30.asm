asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$04,$C0
  db $19,$FF,$E0,$B8,$02,$7A
  db $1A,$FF,$E0,$B8,$02,$7A
  db $1B,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19_1A_1B,Sample19_1A_1B+378
  dw Sample19_1A_1B,Sample19_1A_1B+378
  dw Sample19_1A_1B,Sample19_1A_1B+378
endspcblock

spcblock $A7A0-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_0ed7268f6428f4963a5e49d58aeb71d8.brr"
  Sample19_1A_1B: incbin "Sample_af748b56afa8489cc137e7360fafc840.brr"

Trackers:
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern583C
-
  dw Pattern584C
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern583C
  dw Pattern585C
  dw $0000

Pattern583C: dw Track586C, 0, 0, 0, 0, 0, 0, 0
Pattern584C: dw Track5883, Track58B1, 0, 0, 0, 0, 0, 0
Pattern585C: dw Track5898, Track58B1, 0, 0, 0, 0, 0, 0

Track586C:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,208
  !echo,%00001110,47,47
  !echoParameters,3,16,0
  !end

Track5883:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,240
  db 96
  !rest
  !c4
  !tie
  !tie
  !tie
  !rest
  !tie
  db 48
  !tie
  !end

Track5898:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$09
  !volume,160
  db 48
  !f6
  !f6
  !instr,$18
  !volume,255
  db 96
  !c4
  !pitchSlide,0,96 : !c3
  !tie
  !end

Track58B1:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,160
  !loop : dw Sub58C0 : db 255
  !end

Sub58C0:
  db 24
  !e2
  !pitchSlide,0,24 : !ds4
  db 72
  !tie
  db 48
  !tie
  !pitchSlide,0,48 : !c2
  db 3
  !tie
  db 96
  !rest
  !end

assert pc() <= $10000-(3*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
