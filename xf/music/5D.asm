asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$F7,$E5,$B8,$02,$7B
  db $19,$FF,$F1,$B8,$01,$28
  db $1A,$FF,$E4,$B8,$00,$94
  db $1B,$FF,$E0,$B8,$00,$9E
  db $1C,$FF,$E0,$B8,$07,$A0
  db $1D,$FF,$E0,$B8,$07,$90
  db $1E,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+1062
  dw Sample19_1A,Sample19_1A+1431
  dw Sample19_1A,Sample19_1A+1431
  dw Sample1B,Sample1B+81
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E
endspcblock

spcblock $A400-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_002b224c6729825252e7f39a13633f64.brr"
  Sample19_1A: incbin "Sample_588ad9d77b6e7f35ca37ba2344ca43b4.brr"
  Sample1B: incbin "Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr"
  Sample1C: incbin "Sample_bbe78ea792aaca4886c0c6c4ebaee1a0.brr"
  Sample1D: incbin "Sample_97aa7fd0c57111b1e2e3da056c59f9cf.brr"
  Sample1E: incbin "Sample_53ed5b4572e6bf095c6df514da78df38.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track58BB, Track58F9, Track592D, Track599C, 0, 0, 0
Pattern5856: dw Track5963, Track59CA, Track58A6, Track58E4, Track591C, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,224
  !echo,%00011111,31,31
  !echoParameters,1,8,4
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,12
  !dynamicPan,190,8
  db 48
  !c6
  !dynamicVolume,144,16
  db 96
  !tie
  db 48
  !tie
  !volume,240
  !instr,$19
  !volume,255
  !pan,8
  !loop : dw Sub58A0 : db 255
  !end

Sub58A0:
  db 96
  !c5
  db 48
  !c5
  !c5
  !end

Track58A6:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,255
  !pan,8
  !loop : dw Sub58B5 : db 255
  !end

Sub58B5:
  db 96
  !c5
  db 48
  !c5
  !c5
  !end

Track58BB:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,8
  !dynamicPan,190,12
  db 48
  !c6
  !dynamicVolume,144,16
  db 96
  !tie
  db 48
  !tie
  !volume,240
  !instr,$19
  !volume,255
  !pan,12
  !loop : dw Sub58DE : db 255
  !end

Sub58DE:
  db 96
  !c4
  db 48
  !c4
  !c4
  !end

Track58E4:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,255
  !pan,12
  !loop : dw Sub58F3 : db 255
  !end

Sub58F3:
  db 96
  !c4
  db 48
  !c4
  !c4
  !end

Track58F9:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,12
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  !instr,$19
  !volume,255
  !pan,10
  !loop : dw Sub5918 : db 255
  !end

Sub5918:
  db 96
  !rest
  !d4
  !end

Track591C:
  db 48
  !rest
  !instr,$19
  !volume,255
  !pan,10
  !loop : dw Sub5929 : db 255
  !end

Sub5929:
  db 96
  !rest
  !d4
  !end

Track592D:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,8
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  !instr,$19
  !volume,255
  !pan,5
  !loop : dw Sub595F : db 3
  !instr,$1B
  !pan,14
  !vibrato,0,31,111
  !volume,63
  !dynamicVolume,192,127
  db 96
  !f6
  !tie
  !tie
  db 48
  !tie
  !end

Sub595F:
  db 96
  !rest
  !d4
  !end

Track5963:
  !instr,$1B
  !pan,14
  !vibrato,0,31,111
  !volume,127
  db 96
  !f6
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !loop : dw Sub5984 : db 3
  !end

Sub5984:
  !volume,159
  !dynamicVolume,192,79
  db 96
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !end

Track599C:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,10
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1B
  !pan,6
  !vibrato,0,31,111
  !volume,63
  !dynamicVolume,192,127
  !b6
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !end

Track59CA:
  !instr,$1B
  !pan,6
  !vibrato,0,31,111
  !volume,127
  db 96
  !b6
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !loop : dw Sub59EB : db 3
  !end

Sub59EB:
  !volume,159
  !dynamicVolume,192,79
  db 96
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !end

assert pc() <= $10000-(1*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
