asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$02,$7A
  db $19,$FF,$E0,$B8,$02,$7A
  db $1A,$FF,$E0,$B8,$02,$7A
  db $1B,$FF,$E0,$B8,$02,$7A
  db $1C,$FF,$E0,$B8,$02,$7A
  db $1D,$FF,$E0,$B8,$02,$7A
  db $1E,$FF,$E0,$B8,$02,$99
  db $1F,$FF,$E0,$B8,$02,$7A
  db $20,$FF,$F0,$B8,$02,$99
  db $21,$FB,$F0,$B8,$02,$99
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E+63
  dw Sample1F,Sample1F
  dw Sample20_21,Sample20_21+99
  dw Sample20_21,Sample20_21+99
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_ff8b37e06639ca6f4c8983178b73c75f.brr"
  Sample19: incbin "Sample_850852da5c349c3afa42df4f4e7b4c95.brr"
  Sample1A: incbin "Sample_2f5692cd107acfd64888f4a4ede244af.brr"
  Sample1B: incbin "Sample_c02d28bd6a3c8317afc00be24adec7a1.brr"
  Sample1C: incbin "Sample_e5230fbebb607c8b32fe2959e0902347.brr"
  Sample1D: incbin "Sample_cc665d2b4c8c68a674a8053fe691bbeb.brr"
  Sample1E: incbin "Sample_5ff955130ef19a6c13a90e09bc4e4119.brr"
  Sample1F: incbin "Sample_8c1f02134ac346c8f14eb82059b8ef02.brr"
  Sample20_21: incbin "Sample_04ff79c5f0bfe47aa51f852ac2a1c870.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5836
-
  dw Pattern5846
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5876, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track58D9, Track5922, Track595D, Track59D6, Track59E9, 0, 0, 0
Pattern5856: dw Track5984, Track59C1, Track58AA, Track58D9, Track5922, Track595D, Track5890, Track59D6
  db 88,$22
  db 89,$5D
  db 89
  db 89,$00
  !end
  !end
  !end
  !end
  !end
  !end
  !end

Track5876:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,70
  !musicVolume,16
  !dynamicMusicVolume,192,112
  !echo,%11111110,64,64
  !echoParameters,4,16,0
  !end

Track5890:
  db 127,$7F
  !transpose,0
  !pan,10
  !echo,%11111110,64,64
  !echoParameters,4,16,0
  !instr,$1C
  !volume,208
  !loop : dw Sub58A7 : db 255
  !end

Sub58A7:
  db 48
  !c5
  !end

Track58AA:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,208
  !loop : dw Sub58B7 : db 255
  !end

Sub58B7:
  !instr,$19
  db 96
  !c5
  !instr,$18
  !c5
  db 48
  !tie
  !instr,$19
  !c5
  !instr,$1A
  db 96
  !c5
  !instr,$19
  !c5
  !instr,$18
  !c5
  db 48
  !tie
  !instr,$19
  !c5
  !instr,$1A
  !c5
  !instr,$1B
  !c5
  !end

Track58D9:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1E
  !volume,208
  !loop : dw Sub58EC : db 2
  !loop : dw Sub5907 : db 2
  !end

Sub58EC:
  !pan,12
  db 48
  !e3
  db 96
  !e4
  !pan,8
  db 48
  !e3
  db 96
  !e4
  !tie
  !pan,12
  db 48
  !e3
  db 96
  !e4
  !pan,8
  db 48
  !e3
  db 96
  !e4
  !tie
  !end

Sub5907:
  !pan,12
  db 48
  !c3
  db 96
  !c4
  !pan,8
  db 48
  !c3
  db 96
  !c4
  !tie
  !pan,12
  db 48
  !d3
  db 96
  !d4
  !pan,8
  db 48
  !d3
  db 96
  !d4
  !tie
  !end

Track5922:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1D
  !volume,208
  db 48
  !rest
  !loop : dw Sub5937 : db 2
  !loop : dw Sub594A : db 2
  !end

Sub5937:
  db 24
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !tie
  db 24
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !tie
  !tie
  !end

Sub594A:
  db 24
  !ds4
  !ds4
  !ds4
  !ds4
  db 96
  !rest
  !tie
  !tie
  db 24
  !ds4
  !ds4
  !ds4
  !ds4
  db 96
  !rest
  !tie
  !tie
  !end

Track595D:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !volume,240
  !loop : dw Sub596A : db 4
  !end

Sub596A:
  !pan,10
  db 48
  !c4
  db 24
  !c4
  !c4
  db 96
  !rest
  db 48
  !tie
  db 96
  !c4
  db 48
  !tie
  !pan,6
  !c4
  db 24
  !c4
  !c4
  db 96
  !rest
  !tie
  !tie
  !end

Track5984:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$20
  !volume,208
  !loop : dw Sub5997 : db 2
  !loop : dw Sub59AC : db 2
  !end

Sub5997:
  db 96
  !e4
  db 48
  !tie
  !b3
  db 96
  !a4
  db 48
  !tie
  !c4
  db 96
  !fs4
  db 48
  !tie
  !d4
  db 96
  !b3
  db 48
  !tie
  !as3
  !end

Sub59AC:
  db 96
  !g4
  db 48
  !tie
  !d4
  db 96
  !e4
  db 48
  !tie
  !b3
  db 96
  !fs4
  db 48
  !tie
  !d4
  db 96
  !a4
  db 48
  !tie
  !e4
  !end

Track59C1:
  db 127,$7F
  !transpose,0
  !pan,11
  !instr,$21
  !volume,208
  db 24
  !rest
  !loop : dw Sub5997 : db 2
  !loop : dw Sub59AC : db 2
  !end

Track59D6:
  db 127,$7F
  !transpose,12
  !pan,9
  !instr,$1E
  !volume,128
  !loop : dw Sub5997 : db 2
  !loop : dw Sub59AC : db 2
  !end

Track59E9:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  db 96
  !rest
  !tie
  !dynamicMusicVolume,192,224
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
