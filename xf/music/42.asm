asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F2,$B8,$05,$00
  db $19,$AF,$20,$B8,$02,$7A
  db $1A,$BF,$D1,$B8,$02,$7A
  db $1B,$FF,$E1,$B8,$02,$7A
  db $1C,$FF,$E0,$B8,$02,$7A
  db $1D,$FF,$E0,$B8,$02,$7A
  db $1E,$FF,$E0,$B8,$08,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+45
  dw Sample19,Sample19+648
  dw Sample1A,Sample1A+639
  dw Sample1B,Sample1B+405
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E
endspcblock

spcblock $B080-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_f13a2fcb125ccc9286eea93787f20f50.brr"
  Sample19: incbin "Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2.brr"
  Sample1A: incbin "Sample_14513002db7f6139db33682eaa96e6ea.brr"
  Sample1B: incbin "Sample_acc05dd87e50fa2a7b7fa318dedf761a.brr"
  Sample1C: incbin "Sample_c02d28bd6a3c8317afc00be24adec7a1.brr"
  Sample1D: incbin "Sample_2f3350d5fcd8bf5eb5f2ab5c16532226.brr"
  Sample1E: incbin "Sample_502b12d73ee0a0bfbddb6902a988f6ca.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track5870, Track5891, Track58AC, Track58C7, Track590A, Track591D, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,34
  !musicVolume,128
  !dynamicMusicVolume,240,224
  !echo,%00111111,32,32
  !echoParameters,2,24,4
  db 48
  !rest
  !end

Track5870:
  db 127,$7F
  !transpose,0
  !echo,%00111111,32,32
  !echoParameters,2,24,4
  !instr,$18
  !volume,128
  !pan,10
  !loop : dw Sub5887 : db 12
  !end

Sub5887:
  db 48
  !e2
  !pan,8
  !e3
  !f2
  !pan,12
  !f3
  !end

Track5891:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,160
  !pan,10
  db 24
  !rest
  !loop : dw Sub58A2 : db 12
  !end

Sub58A2:
  db 48
  !as2
  !pan,12
  !as3
  !b2
  !pan,10
  !b3
  !end

Track58AC:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,96
  !pan,10
  db 36
  !rest
  !loop : dw Sub58BD : db 12
  !end

Sub58BD:
  db 24
  !e2
  !as2
  !e3
  !as3
  !f2
  !b2
  !f3
  !b3
  !end

Track58C7:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,11
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub58DA : db 255
  !end

Sub58DA:
  !volume,64
  db 16
  !ds4
  !volume,72
  !e4
  !volume,80
  !ds4
  !volume,88
  !e4
  !volume,96
  !ds4
  !volume,104
  !e4
  !ds4
  !e4
  !ds4
  !e4
  !ds4
  db 14
  !e4
  !ds4
  db 12
  !e4
  !ds4
  !e4
  db 96
  !ds4
  !dynamicVolume,48,64
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

Track590A:
  db 127,$7F
  !transpose,250
  !instr,$1B
  !pan,9
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub58DA : db 255
  !end

Track591D:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub5928 : db 255
  !end

Sub5928:
  !instr,$19
  !volume,224
  db 24
  !b4
  db 12
  !rest
  !volume,128
  db 24
  !b4
  db 12
  !rest
  !volume,72
  db 24
  !b4
  db 96
  !rest
  !instr,$1C
  !volume,192
  db 36
  !c5
  !volume,80
  !c5
  db 96
  !rest
  !tie
  !tie
  !instr,$1D
  !volume,224
  db 12
  !c5
  !rest
  !c5
  !rest
  db 120
  !rest
  !instr,$1A
  !volume,176
  db 16
  !e4
  !volume,192
  !e4
  !volume,208
  !e4
  !volume,255
  db 48
  !e4
  db 96
  !rest
  !tie
  !tie
  db 48
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
