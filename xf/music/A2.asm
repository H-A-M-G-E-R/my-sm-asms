asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Intro cutscene

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F2,$B8,$02,$A0
  db $19,$FF,$E0,$B8,$03,$90
  db $1A,$FF,$E0,$B8,$06,$F0
  db $1B,$FF,$F0,$B8,$02,$C1
  db $1C,$FF,$E0,$B8,$02,$99
  db $1D,$FF,$EB,$B8,$02,$99
  db $1E,$FF,$E0,$B8,$01,$00
  db $1F,$FF,$F1,$B8,$0B,$06
  db $20,$FF,$E0,$B8,$05,$83
  db $21,$FF,$E0,$B8,$05,$83
  db $22,$F4,$81,$B8,$05,$00
  db $23,$FF,$F0,$B8,$03,$90
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19_23,Sample19_23
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B
  dw Sample1C_1D,Sample1C_1D+135
  dw Sample1C_1D,Sample1C_1D+135
  dw Sample1E,Sample1E+27
  dw Sample1F,Sample1F+1278
  dw Sample20_21_22,Sample20_21_22
  dw Sample20_21_22,Sample20_21_22
  dw Sample20_21_22,Sample20_21_22
  dw Sample19_23,Sample19_23
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_86d8f75e64b863de0c8b6c6a32a5afd7.brr")
  Sample19_23: skip filesize("Sample_97a785af7dee81db8c178ac9bfc223b5.brr")
  Sample1A: skip filesize("Sample_282615d1464fdb0623504ef86c5de66b.brr")
  Sample1B: skip filesize("Sample_287e6c92b0fc050e3a18a21d8cdba209.brr")
  Sample1C_1D: skip filesize("Sample_9b8c27a5d3be46e264a8815e398d9659.brr")
  Sample1E: skip filesize("Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr")
  Sample1F: skip filesize("Sample_73cb64f395dad0784c958d0ed478f686.brr")
  Sample20_21_22: skip filesize("Sample_53ed5b4572e6bf095c6df514da78df38.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern5842
-
  dw Pattern5852
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5862
  dw $0000

Tracker7:
  dw Pattern5872
  dw Pattern5882
  dw $0000

Pattern5842: dw Track5892, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track58AB, Track58F1, Track5934, Track5969, Track59B2, Track5A13, 0, 0
Pattern5862: dw Track5A70, Track5A95, Track5AB0, Track5ACC, Track5AE1, 0, 0, 0
Pattern5872: dw Track5AFB, 0, 0, 0, 0, 0, 0, 0
Pattern5882: dw Track5B12, Track5B47, Track5B7A, 0, 0, 0, 0, 0

Track5892:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,27
  !musicVolume,230
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  db 24
  !rest
  !end

Track58AB:
  db 127,$7F
  !transpose,0
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  !instr,$19
  !volume,240
  !pan,15
  db 96
  !c4
  db 44
  !tie
  !instr,$1C
  !subtranspose,70
  !pan,15
  !volume,50
  !dynamicVolume,60,180
  db 96
  !c2
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 12
  !tie
  !volume,180
  !dynamicVolume,90,30
  db 80
  !tie
  db 16
  !rest
  !instr,$1D
  !pan,10
  !loop : dw Sub58E8 : db 255
  !end

Sub58E8:
  !volume,50
  !dynamicVolume,60,244
  db 96
  !c2
  !tie
  !end

Track58F1:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !pan,5
  db 6
  !rest
  db 96
  !c4
  db 38
  !tie
  db 48
  !rest
  !instr,$1C
  !subtranspose,70
  !pan,5
  !volume,50
  !dynamicVolume,60,180
  db 96
  !f2
  !tie
  !tie
  db 36
  !tie
  !volume,180
  !dynamicVolume,90,30
  db 96
  !tie
  !instr,$18
  !pan,12
  !loop : dw Sub5924 : db 255
  !end

Sub5924:
  !volume,255
  db 12
  !c3
  !volume,223
  !c3
  !volume,191
  !c3
  !volume,159
  !c3
  db 48
  !rest
  !end

Track5934:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !pan,5
  db 30
  !rest
  db 110
  !c4
  db 96
  !rest
  !instr,$1C
  !subtranspose,70
  !pan,15
  !volume,50
  !dynamicVolume,60,180
  !c3
  !tie
  db 84
  !tie
  !volume,180
  !dynamicVolume,90,30
  db 96
  !tie
  !instr,$18
  !volume,240
  !pan,10
  !loop : dw Sub5965 : db 255
  !end

Sub5965:
  db 48
  !c3
  !rest
  !end

Track5969:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !pan,15
  db 45
  !rest
  !volume,10
  !dynamicVolume,30,200
  db 119
  !c4
  db 120
  !rest
  !instr,$1C
  !subtranspose,70
  !pan,5
  !volume,50
  !dynamicVolume,60,180
  db 96
  !c4
  !tie
  db 36
  !tie
  !volume,180
  !dynamicVolume,90,30
  db 96
  !tie
  !instr,$1D
  !rest
  !tie
  !loop : dw Sub599E : db 255
  !end

Sub599E:
  !pan,4
  !volume,50
  !dynamicVolume,32,180
  db 96
  !c3
  !tie
  !pan,16
  !volume,50
  !dynamicVolume,32,180
  !c3
  !tie
  !end

Track59B2:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !pan,5
  db 55
  !rest
  !volume,10
  !dynamicVolume,40,180
  db 96
  !g3
  db 64
  !tie
  db 10
  !rest
  !loop : dw Sub5A02 : db 1
  db 30
  !rest
  db 2
  !rest
  !pan,15
  db 12,$2E
  db 12
  !c7
  db 4
  !c7
  !c7
  !rest
  db 8
  !c7
  !c7
  !c7
  db 4
  !rest
  db 12
  !c7
  db 4
  !c7
  !c7
  !rest
  db 8
  !c7
  !c7
  !c7
  db 10
  !rest
  db 6
  !b6
  !b6
  !gs6
  !cs7
  !cs7
  db 96
  !rest
  db 72
  !tie
  !instr,$18
  !pan,16
  !volume,192
  !loop : dw Sub5A0F : db 255
  !end

Sub5A02:
  !instr,$1A
  !subtranspose,40
  !volume,80
  db 30
  !rest
  db 2
  !rest
  !pan,10
  !end

Sub5A0F:
  db 48
  !c3
  !rest
  !end

Track5A13:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !pan,15
  db 65
  !rest
  !volume,10
  !dynamicVolume,40,130
  db 96
  !b3
  db 64
  !tie
  !loop : dw Sub5A02 : db 1
  db 30
  !rest
  db 2
  !rest
  !pan,5
  db 12,$2E
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  !loop : dw Sub5A57 : db 2
  db 96
  !rest
  db 72
  !tie
  !instr,$18
  !pan,7
  !volume,192
  !loop : dw Sub5A6C : db 255
  !end

Sub5A57:
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  db 12
  !g7
  db 4
  !rest
  !end

Sub5A6C:
  db 48
  !cs3
  !rest
  !end

Track5A70:
  db 127,$7F
  !transpose,0
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  !musicVolume,255
  !instr,$1F
  !volume,128
  !pan,10
  db 72
  !c4
  !instr,$20
  db 24
  !f3
  db 96
  !c4
  !loop : dw Sub5A91 : db 255
  !end

Sub5A91:
  db 96
  !rest
  !tie
  !end

Track5A95:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !volume,128
  !pan,7
  db 72
  !c4
  !instr,$20
  db 24
  !f3
  db 96
  !c4
  !loop : dw Sub5AAC : db 255
  !end

Sub5AAC:
  db 96
  !rest
  !tie
  !end

Track5AB0:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !volume,192
  !pan,4
  db 72
  !cs3
  !instr,$1E
  db 12
  !e4
  !f4
  !e4
  !f4
  !loop : dw Sub5AC8 : db 255
  !end

Sub5AC8:
  db 96
  !rest
  !tie
  !end

Track5ACC:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !volume,192
  !pan,16
  db 96
  !cs3
  !loop : dw Sub5ADD : db 255
  !end

Sub5ADD:
  db 96
  !rest
  !tie
  !end

Track5AE1:
  db 127,$7F
  !transpose,0
  db 72
  !rest
  !instr,$1E
  !volume,192
  !pan,14
  db 12
  !c4
  !d4
  !c4
  !d4
  !loop : dw Sub5AF7 : db 255
  !end

Sub5AF7:
  db 96
  !rest
  !tie
  !end

Track5AFB:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,27
  !musicVolume,220
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  !end

Track5B12:
  db 126,$7F
  !transpose,0
  !instr,$08
  !volume,210
  !pan,15
  db 3
  !e4
  !c4
  !d4
  !c4
  db 6
  !c4
  db 8
  !a3
  db 7
  !d4
  db 15
  !a3
  db 6
  !d4
  !b3
  !d4
  !e4
  db 24
  !c4
  db 12
  !c4
  !b3
  !f3
  !d4
  db 8
  !f4
  !b3
  !g3
  !d4
  !e4
  !b3
  !a3
  !d4
  !loop : dw Sub5B43 : db 255
  !end

Sub5B43:
  db 96
  !rest
  !tie
  !end

Track5B47:
  db 126,$7F
  !transpose,0
  !instr,$08
  !volume,210
  !pan,5
  db 12
  !rest
  db 3
  !b3
  !b3
  !c4
  !c4
  db 6
  !d4
  !c4
  !a3
  !a3
  !d4
  !d4
  !a3
  !a3
  db 12
  !f3
  !c4
  db 6
  !c4
  db 12
  !a3
  !f3
  !c4
  db 6
  !e3
  db 4
  !c4
  db 8
  !b3
  db 4
  !a3
  !instr,$23
  !volume,255
  db 96
  !c4
  !tie
  !end

Track5B7A:
  db 126,$7F
  !transpose,0
  !instr,$08
  !volume,230
  !pan,10
  db 12
  !rest
  db 48
  !e3
  !e3
  !e3
  !instr,$23
  db 96
  !c4
  !tie
  !end

if defined("print_freespace")
  print "Song A2: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
