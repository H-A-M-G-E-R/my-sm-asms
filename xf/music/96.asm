asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$F7,$E3,$B8,$02,$D8
  db $19,$FF,$EB,$B8,$02,$D8
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19,Sample18_19+27
  dw Sample18_19,Sample18_19+27
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18_19: incbin "Sample_2e1822edc659430c60ca1e822fefddc2.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track586B, Track5889, Track58A8, 0, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,36
  !musicVolume,160
  !echo,%00001111,31,31
  !echoParameters,4,16,5
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,144
  db 96
  !d5
  !tie
  !volume,160
  !as4
  !tie
  !b4
  !tie
  !fs4
  !tie
  !loop : dw Sub5885 : db 255
  !end

Sub5885:
  db 96
  !rest
  !tie
  !end

Track5889:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,192
  !loop : dw Sub5898 : db 8
  !end

Sub5898:
  db 24
  !rest
  db 96
  !ds4
  db 36
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  db 12
  !rest
  !end

Track58A8:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,8
  !volume,160
  !loop : dw Sub58B7 : db 255
  !end

Sub58B7:
  db 24
  !rest
  !dynamicPan,102,14
  db 96
  !ds4
  db 36
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  db 12
  !rest
  db 24
  !rest
  !dynamicPan,102,6
  db 96
  !ds4
  db 36
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,160
  db 12
  !rest
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
