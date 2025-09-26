asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$05,$83
  db $19,$FF,$E0,$B8,$05,$83
  db $1A,$FF,$E0,$B8,$05,$83
  db $1B,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19_1A,Sample18_19_1A
  dw Sample18_19_1A,Sample18_19_1A
  dw Sample18_19_1A,Sample18_19_1A
  dw Sample1B,Sample1B+378
endspcblock

spcblock $A000-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18_19_1A: incbin "Sample_487ca836f684610d37adb9f2e8f5d41b.brr"
  Sample1B: incbin "Sample_af748b56afa8489cc137e7360fafc840.brr"

Trackers:
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5836
  dw Pattern5846
  dw $0000

Tracker6:
  dw Pattern5856
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track5881, Track58A9, Track58F3, Track5917, Track594E, Track59DD, 0, 0
Pattern5856: dw Track596F, Track5998, Track59B2, Track59CB, 0, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,240
  !echo,%00010111,47,47
  !echoParameters,2,32,0
  db 96
  !rest
  db 48
  !tie
  !end

Track5881:
  db 127,$7F
  !transpose,0
  !pan,12
  !instr,$05
  !volume,240
  !loop : dw Sub5894 : db 4
  !loop : dw Sub58A5 : db 255
  !end

Sub5894:
  db 24
  !e4
  !pitchSlide,0,24 : !ds5
  db 48
  !tie
  db 24
  !tie
  !pitchSlide,0,24 : !c6
  db 3
  !tie
  !end

Sub58A5:
  db 96
  !rest
  !tie
  !end

Track58A9:
  db 127,$7F
  !transpose,0
  !pan,8
  !instr,$09
  !volume,240
  !loop : dw Sub58C0 : db 1
  !loop : dw Sub58D1 : db 1
  !loop : dw Sub58E2 : db 255
  !end

Sub58C0:
  db 24
  !e2
  !pitchSlide,0,24 : !ds3
  db 48
  !tie
  db 24
  !tie
  !pitchSlide,0,24 : !c4
  db 3
  !tie
  !end

Sub58D1:
  db 24
  !e3
  !pitchSlide,0,24 : !ds4
  db 48
  !tie
  db 24
  !tie
  !pitchSlide,0,24 : !c5
  db 3
  !tie
  !end

Sub58E2:
  db 24
  !e4
  !pitchSlide,0,24 : !ds5
  db 48
  !tie
  db 24
  !tie
  !pitchSlide,0,24 : !c6
  db 3
  !tie
  !end

Track58F3:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$11
  !volume,255
  db 96
  !rest
  !tie
  !loop : dw Sub5905 : db 255
  !end

Sub5905:
  db 24
  !e4
  !pitchSlide,0,24 : !ds5
  db 48
  !tie
  db 24
  !tie
  !pitchSlide,0,24 : !c6
  db 96
  !tie
  !tie
  !end

Track5917:
  db 127,$7F
  !transpose,0
  !pan,4
  !instr,$11
  !subtranspose,128
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub592B : db 255
  !end

Sub592B:
  !volume,96
  !dynamicVolume,16,255
  !dynamicPan,96,18
  db 24
  !e6
  !pitchSlide,0,24 : !ds7
  db 48
  !tie
  !volume,96
  !dynamicVolume,16,255
  !pan,4
  !dynamicPan,96,4
  db 24
  !e6
  !pitchSlide,0,24 : !ds7
  db 48
  !tie
  !end

Track594E:
  db 127,$7F
  !transpose,0
  !instr,$02
  !volume,240
  db 96
  !rest
  !tie
  !loop : dw Sub595E : db 255
  !end

Sub595E:
  !pan,12
  db 24
  !e3
  !pan,10
  db 12
  !d3
  !pan,8
  db 24
  !e3
  !pan,10
  db 12
  !d3
  !end

Track596F:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,240
  !echo,%00010111,47,47
  !echoParameters,2,32,0
  db 127,$7F
  !transpose,0
  !pan,10
  !dynamicPan,240,4
  !instr,$18
  !volume,240
  db 96
  !c4
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

Track5998:
  db 127,$7F
  !transpose,244
  !pan,10
  !dynamicPan,240,16
  !instr,$18
  !volume,192
  db 96
  !c4
  !tie
  !tie
  !tie
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,192
  !end

Track59B2:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,240
  db 96
  !c5
  !dynamicVolume,96,16
  !tie
  !volume,240
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !end

Track59CB:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$04
  !volume,192
  db 96
  !c3
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

Track59DD:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,128
  !loop : dw Sub59EC : db 255
  !end

Sub59EC:
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

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
