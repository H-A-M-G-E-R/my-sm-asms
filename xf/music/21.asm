asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$EC,$CF,$B8,$01,$3C
  db $19,$FE,$E0,$B8,$01,$D6
  db $1A,$EB,$CD,$B8,$01,$D6
  db $1B,$FD,$E7,$B8,$03,$AC
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+36
  dw Sample19,Sample19+45
  dw Sample1A,Sample1A+18
  dw Sample1B,Sample1B
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_ad838049f259a4f1171d73e2a9ff0c30.brr")
  Sample19: skip filesize("Sample_297f19f5a80928febb2ded9fc02251b9.brr")
  Sample1A: skip filesize("Sample_9281b998d07d46507b9aed19337b9a6c.brr")
  Sample1B: skip filesize("Sample_b76c6f0440c68cfc41d66ec60f326c7b.brr")
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
Pattern5844: dw Track586B, Track58BB, Track5906, Track5938, Track5960, Track598D, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,32
  !musicVolume,208
  !echo,%00001111,48,48
  !echoParameters,2,64,1
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !echo,%00001111,48,48
  !echoParameters,2,64,1
  !instr,$18
  !volume,48
  !pan,8
  !loop : dw Sub5882 : db 1
  !end

Sub5882:
  db 24
  !e7
  !a6
  db 48
  !e7
  !ds7
  db 24
  !d7
  !g6
  db 48
  !d7
  !cs7
  db 24
  !e7
  !fs6
  db 48
  !e7
  !ds7
  db 24
  !d7
  !g6
  db 48
  !d7
  db 72
  !cs7
  db 120
  !rest
  db 24
  !a6
  !a5
  !a6
  !a5
  !as6
  !as5
  !g6
  !g5
  !g6
  !g5
  !gs6
  !gs5
  !e7
  !e6
  !e7
  !e6
  !f7
  !f6
  !e7
  !e6
  !e7
  !e6
  !d7
  !d6
  !rest
  db 96
  !rest
  !tie
  !end

Track58BB:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,176
  !instr,$19
  db 96
  !a5
  db 48
  !rest
  db 96
  !as5
  db 48
  !rest
  db 96
  !fs5
  db 48
  !rest
  db 96
  !g5
  db 42
  !rest
  !instr,$1A
  db 120
  !g5
  !dynamicVolume,30,16
  db 30
  !tie
  !volume,176
  !instr,$19
  db 96
  !e5
  db 48
  !rest
  db 96
  !f5
  db 48
  !rest
  db 96
  !c6
  db 48
  !rest
  db 96
  !as5
  db 42
  !rest
  !instr,$1A
  db 120
  !as5
  !dynamicVolume,30,16
  db 30
  !tie
  !volume,176
  !loop : dw Sub5902 : db 255
  !end

Sub5902:
  db 96
  !rest
  !tie
  !end

Track5906:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,176
  !instr,$1B
  db 72
  !rest
  db 90
  !a4
  db 54
  !rest
  db 90
  !as4
  db 54
  !rest
  db 90
  !fs4
  db 54
  !rest
  db 90
  !g4
  db 96
  !rest
  !tie
  db 6
  !tie
  db 90
  !e4
  db 54
  !rest
  db 90
  !f4
  db 54
  !rest
  db 90
  !c5
  db 54
  !rest
  db 90
  !as4
  !loop : dw Sub5902 : db 255
  !end

Track5938:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,64
  !pan,10
  db 24
  !a5
  !e6
  db 48
  !a5
  !gs5
  db 24
  !g5
  !d6
  db 48
  !g5
  !fs5
  db 24
  !a5
  !rest
  db 48
  !a5
  !gs5
  db 24
  !g5
  !d6
  db 48
  !g5
  db 72
  !fs5
  !loop : dw Sub5902 : db 255
  !end

Track5960:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,112
  !instr,$1A
  db 96
  !rest
  db 42
  !tie
  db 120
  !a5
  db 24
  !rest
  db 120
  !as5
  db 24
  !rest
  db 120
  !fs5
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  db 120
  !e5
  db 24
  !rest
  db 120
  !f5
  db 24
  !rest
  db 120
  !c6
  !loop : dw Sub5902 : db 255
  !end

Track598D:
  db 127,$7F
  !transpose,0
  db 15
  !rest
  !instr,$18
  !volume,48
  !pan,12
  !loop : dw Sub5882 : db 1
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
