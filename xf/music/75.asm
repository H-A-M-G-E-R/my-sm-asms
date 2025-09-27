asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$01,$3D
  db $19,$FF,$EF,$B8,$04,$F6
  db $1A,$FF,$E0,$B8,$03,$30
  db $1B,$FF,$E0,$B8,$02,$58
  db $1C,$FF,$E0,$B8,$0B,$06
  db $1D,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+594
  dw Sample19,Sample19+1062
  dw Sample1A,Sample1A+1584
  dw Sample1B,Sample1B+2070
  dw Sample1C,Sample1C+9
  dw Sample1D,Sample1D
endspcblock

pushpc
org $A020-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_1005d6ea2c154036604cf230b7eea4d9.brr")
  Sample19: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1A: skip filesize("Sample_91eb0ad40cbb8edb59d1a8eb274bb61a.brr")
  Sample1B: skip filesize("Sample_fbc65a1e54ed6d31ed29ca43776621ec.brr")
  Sample1C: skip filesize("Sample_4842013d9a2677e216e5246cd8c8e97e.brr")
  Sample1D: skip filesize("Sample_26fe057d696c01031f983274537acf76.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5854
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5864, 0, 0, 0, 0, 0, 0, 0
  db 123,$58
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
  !end
Pattern5854: dw Track5883, Track598E, Track59A0, Track59DC, Track5A19, 0, 0, 0

Track5864:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,31
  !musicVolume,221
  !echo,%00011111,47,47
  !echoParameters,2,16,4
  !end
  db 127,$7F
  !transpose,0
  !dynamicMusicVolume,255,16
  !end

Track5883:
  db 127,$7F
  !transpose,0
  !echo,%00011111,47,47
  !echoParameters,2,16,4
  !instr,$19
  !volume,240
  !pan,10
  !loop : dw Sub589D : db 1
  db 96
  !rest
  !tie
  !end

Sub589D:
  db 48
  !d3
  db 16
  !d3
  !d3
  !d3
  db 48
  !d3
  db 16
  !d3
  !d3
  !ds3
  db 48
  !d3
  !d3
  !d3
  db 16
  !d3
  !d3
  !ds3
  db 48
  !d3
  !d3
  !d3
  db 16
  !d3
  !d3
  !ds3
  db 48
  !d3
  !d3
  !d3
  db 16
  !d3
  !d3
  !ds3
  db 48
  !d3
  !d3
  db 96
  !rest
  db 24
  !f3
  !rest
  db 8
  !f3
  !f3
  !f3
  !f3
  db 16
  !fs3
  db 48
  !f3
  !f3
  db 24
  !f3
  !rest
  db 8
  !f3
  !f3
  !f3
  !f3
  db 16
  !fs3
  db 48
  !f3
  !f3
  db 24
  !f3
  !rest
  db 8
  !f3
  !f3
  !f3
  !f3
  db 16
  !fs3
  db 48
  !f3
  !f3
  db 24
  !f3
  !rest
  db 8
  !f3
  !f3
  !f3
  !f3
  db 16
  !fs3
  db 48
  !f3
  db 16
  !rest
  !d3
  !ds3
  db 24
  !d3
  db 8
  !d3
  db 16
  !d3
  !f3
  !d3
  !f3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !rest
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  db 24
  !d3
  db 8
  !d3
  db 16
  !d3
  !f3
  !d3
  !f3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !rest
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  db 24
  !d3
  db 8
  !d3
  db 16
  !d3
  !f3
  !d3
  !f3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !rest
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  db 24
  !d3
  db 8
  !d3
  db 16
  !d3
  !f3
  !d3
  !f3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !as2
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !ds3
  db 8
  !as2
  !rest
  db 16
  !ds3
  !ds3
  !b2
  !ds3
  !end

Track598E:
  db 127,$7F
  !transpose,12
  !instr,$19
  !volume,176
  !pan,10
  !loop : dw Sub589D : db 1
  db 96
  !rest
  !tie
  !end

Track59A0:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !instr,$1A
  !volume,176
  !pan,11
  !a4
  !d5
  !a5
  !f5
  !a4
  !d5
  !a5
  !e5
  !instr,$1A
  !volume,192
  db 16
  !f4
  !f4
  !f4
  !f4
  !ds4
  !as4
  db 96
  !f4
  !dynamicVolume,96,16
  !tie
  !volume,192
  !rest
  !transpose,5
  db 16
  !f4
  !f4
  !f4
  !f4
  !ds4
  !as4
  db 96
  !f4
  !dynamicVolume,96,16
  !tie
  !volume,192
  !rest
  !end

Track59DC:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !instr,$1A
  !volume,176
  !pan,9
  !d4
  !g4
  !e5
  !as4
  !d4
  !g4
  !e5
  !g4
  !instr,$1A
  !volume,192
  !rest
  !tie
  db 16
  !f5
  !f5
  !f5
  !f5
  !ds5
  !as5
  db 96
  !f5
  !dynamicVolume,96,16
  !tie
  !volume,192
  !transpose,5
  !rest
  db 16
  !f5
  !f5
  !f5
  !f5
  !ds5
  !as5
  db 48
  !f5
  !dynamicVolume,48,16
  !tie
  !volume,192
  !end

Track5A19:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !instr,$1B
  !volume,224
  !pan,10
  !a4
  !d5
  !a5
  !f5
  !a4
  !d5
  !a5
  !e5
  !instr,$18
  !volume,160
  !pan,10
  db 16
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  !pan,10
  db 16
  !f4
  !f4
  !fs4
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  db 16
  !f4
  !f4
  !f4
  !pan,10
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  !pan,10
  db 16
  !f4
  !f4
  !fs4
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  db 16
  !f4
  !f4
  !f4
  !pan,10
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  !pan,10
  db 16
  !f4
  !f4
  !fs4
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  db 16
  !f4
  !f4
  !f4
  !pan,10
  !f4
  !pan,8
  db 8
  !f4
  !pan,12
  !f4
  !pan,8
  !f4
  !pan,12
  !f4
  !pan,10
  db 16
  !f4
  !f4
  !fs4
  db 96
  !rest
  !rest
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
