asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$05,$83
  db $19,$FF,$E0,$B8,$01,$00
  db $1A,$FF,$F0,$B8,$05,$83
  db $1B,$FF,$E0,$B8,$05,$83
  db $1C,$FF,$F0,$B8,$02,$7A
  db $1D,$FF,$E0,$B8,$05,$83
  db $1E,$FF,$E0,$B8,$05,$83
  db $1F,$FF,$E0,$B8,$05,$83
  db $20,$FF,$E0,$B8,$09,$E8
  db $21,$FF,$E0,$B8,$05,$83
  db $22,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B+9
  dw Sample1C,Sample1C+657
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E
  dw Sample1F,Sample1F
  dw Sample20,Sample20+18
  dw Sample21,Sample21
  dw Sample22,Sample22
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_da187b6a41fbf48f10b461fc7ed0d3d5.brr")
  Sample19: skip filesize("Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr")
  Sample1A: skip filesize("Sample_287e6c92b0fc050e3a18a21d8cdba209.brr")
  Sample1B: skip filesize("Sample_831b1863540f328224dbf6d79fb349dd.brr")
  Sample1C: skip filesize("Sample_8ffbbac2da03c55c193cbf36b1e520db.brr")
  Sample1D: skip filesize("Sample_cdc82f868779a0f3f8c85b6ddb4b7b53.brr")
  Sample1E: skip filesize("Sample_a607137ab681c65e6d6d9e7c667ad495.brr")
  Sample1F: skip filesize("Sample_e196c2a53620d4573a72e4dfd4255104.brr")
  Sample20: skip filesize("Sample_d7b6254dac45a1d7ada6e6833ead52ab.brr")
  Sample21: skip filesize("Sample_ac5a192f01928e331bdd5d5ad51b0b23.brr")
  Sample22: skip filesize("Sample_21ce681da14ac9d581f19b02776116a9.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5834
  dw $0000

Tracker6:
  dw Pattern5844
  dw $0000

Pattern5834: dw Track5854, Track587D, Track58A3, Track58C8, Track58E6, Track5906, 0, 0
Pattern5844: dw Track594F, Track5982, Track59A7, 0, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,28
  !musicVolume,239
  db 127,$7F
  !transpose,0
  !echo,%00111111,10,10
  !echoParameters,2,10,0
  !instr,$18
  !volume,240
  !pan,10
  !loop : dw Sub587A : db 11
  db 96
  !rest
  !tie
  !end

Sub587A:
  db 24
  !c3
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,240
  !vibrato,0,12,20
  !loop : dw Sub589B : db 2
  !pan,12
  db 48
  !c4
  !instr,$1C
  !volume,240
  !pan,10
  db 96
  !c5
  !tie
  !end

Sub589B:
  !pan,12
  db 48
  !c4
  !pan,8
  !c4
  !end

Track58A3:
  db 127,$7F
  !transpose,8
  !instr,$19
  !volume,16
  !dynamicVolume,255,192
  !pan,8
  db 48
  !c5
  !pan,12
  !c5
  !pan,8
  !c6
  !pan,12
  !c6
  !pan,8
  !c6
  !instr,$1C
  !volume,240
  !pan,10
  db 96
  !c3
  !tie
  !end

Track58C8:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,16
  !dynamicVolume,240,192
  db 48
  !rest
  !pan,10
  db 96
  !c4
  !tie
  !instr,$1C
  !volume,192
  !pan,4
  db 12
  !rest
  db 96
  !c3
  !tie
  !end

Track58E6:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,192
  !vibrato,0,12,20
  db 96
  !rest
  db 48
  !c3
  !c3
  db 24
  !c3
  !c4
  !instr,$1C
  !volume,192
  !pan,16
  db 12
  !rest
  db 96
  !c3
  !tie
  !end

Track5906:
  db 127,$7F
  !transpose,0
  !instr,$1A
  db 24
  !rest
  !rest
  !transpose,0
  !volume,136
  !pan,12
  !f3
  !transpose,1
  !volume,153
  !pan,17
  !f3
  !transpose,2
  !volume,102
  !pan,4
  !f3
  !transpose,0
  !volume,204
  !pan,15
  !f3
  !transpose,255
  !volume,119
  !pan,3
  !f3
  !transpose,2
  !volume,187
  !pan,10
  !f3
  !transpose,1
  !volume,102
  !pan,19
  !f3
  !transpose,255
  !volume,68
  !pan,8
  !f3
  !instr,$1C
  !volume,240
  db 96
  !c4
  !tie
  !end

Track594F:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,28
  !musicVolume,239
  db 127,$7F
  !transpose,0
  !echo,%00000001,10,10
  !echoParameters,2,10,0
  !instr,$20
  !volume,80
  !pan,10
  !vibrato,0,12,20
  !loop : dw Sub5976 : db 255
  !end

Sub5976:
  !dynamicVolume,192,160
  db 96
  !d2
  !tie
  !dynamicVolume,192,80
  !tie
  !tie
  !end

Track5982:
  db 127,$7F
  !transpose,0
  !instr,$22
  !volume,128
  !pan,10
  db 96
  !rest
  !tie
  !rest
  !loop : dw Sub5995 : db 255
  !end

Sub5995:
  db 12
  !c3
  !c3
  !c3
  !c3
  db 48
  !rest
  db 12
  !c3
  !c3
  !c3
  !c3
  db 48
  !rest
  db 96
  !rest
  !tie
  !end

Track59A7:
  db 127,$7F
  !transpose,0
  !volume,192
  !pan,10
  db 96
  !rest
  !instr,$1F
  !volume,192
  db 48
  !c4
  !loop : dw Sub59BC : db 255
  !end

Sub59BC:
  !instr,$1D
  !pan,12
  !volume,176
  db 6
  !c4
  !volume,128
  !c4
  !volume,80
  !c4
  !volume,32
  !c4
  db 30
  !rest
  !instr,$1D
  !pan,8
  !volume,176
  db 6
  !c4
  !volume,128
  !c4
  !volume,80
  !c4
  !volume,32
  !c4
  db 30
  !rest
  !instr,$1E
  !pan,10
  !volume,128
  db 36
  !c4
  !c4
  !c4
  !c4
  db 96
  !rest
  !end

if defined("print_freespace")
  print "Song A5: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
