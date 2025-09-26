asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E3,$B8,$00,$9E
  db $19,$FF,$E3,$B8,$01,$4C
  db $1A,$FF,$E7,$B8,$01,$4C
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+234
  dw Sample19_1A,Sample19_1A+27
  dw Sample19_1A,Sample19_1A+27
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_0ca2e923494667f4c3a148f312b12259.brr"
  Sample19_1A: incbin "Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track586B, Track58A4, Track58B1, Track58C8, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,34
  !musicVolume,160
  !echo,%00001111,31,31
  !echoParameters,4,16,5
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  !loop : dw Sub5878 : db 1
  !end

Sub5878:
  !volume,79
  !dynamicVolume,190,143
  db 96
  !b5
  !tie
  !dynamicVolume,190,175
  !tie
  !tie
  !dynamicVolume,190,127
  !as5
  !tie
  !dynamicVolume,190,79
  !tie
  !tie
  !dynamicVolume,190,143
  !fs6
  !tie
  !dynamicVolume,190,175
  !tie
  !tie
  !dynamicVolume,190,127
  !f6
  !tie
  !dynamicVolume,190,79
  !tie
  !tie
  !end

Track58A4:
  db 127,$7F
  !transpose,250
  !instr,$18
  !pan,9
  !loop : dw Sub5878 : db 1
  !end

Track58B1:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,10
  !loop : dw Sub58BE : db 255
  !end

Sub58BE:
  !volume,239
  db 96
  !c4
  !b3
  !volume,207
  !f4
  !e4
  !end

Track58C8:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,10
  !loop : dw Sub58D5 : db 255
  !end

Sub58D5:
  !volume,239
  !pan,8
  db 96
  !c4
  !pan,12
  !b3
  !volume,207
  !pan,8
  !f4
  !pan,12
  !e4
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
