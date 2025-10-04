asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Vs. Neo-Ridley

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$DF,$F0,$B8,$02,$7B
  db $19,$FF,$E2,$B8,$02,$7B
  db $1A,$7E,$E0,$50,$02,$70
  db $1B,$7E,$E0,$50,$02,$7A
  db $1C,$7E,$E0,$50,$02,$75
  db $1D,$7E,$E0,$50,$02,$7F
  db $1E,$FA,$E0,$B8,$02,$7A
  db $1F,$FF,$E0,$B8,$02,$7A
  db $20,$FF,$E0,$B8,$02,$7A
  db $21,$FF,$EB,$B8,$02,$7A
  db $22,$FF,$F0,$B8,$01,$3D
  db $23,$FF,$E3,$B8,$00,$9E
  db $24,$FF,$E0,$B8,$01,$3D
  db $25,$FF,$EF,$B8,$01,$3D
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19,Sample18_19+1062
  dw Sample18_19,Sample18_19+1062
  dw Sample1A_1B_1C_1D,Sample1A_1B_1C_1D
  dw Sample1A_1B_1C_1D,Sample1A_1B_1C_1D
  dw Sample1A_1B_1C_1D,Sample1A_1B_1C_1D
  dw Sample1A_1B_1C_1D,Sample1A_1B_1C_1D
  dw Sample1E,Sample1E+1971
  dw Sample1F,Sample1F
  dw Sample20,Sample20
  dw Sample21,Sample21+513
  dw Sample22,Sample22+666
  dw Sample23,Sample23
  dw Sample24,Sample24+864
  dw Sample25,Sample25+630
endspcblock

pushpc
org $AF00-$9F80+!p_sampleDataEnd+$400
  Sample18_19: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1A_1B_1C_1D: skip filesize("Sample_4d73b345c85aeb62add04a28d133408c.brr")
  Sample1E: skip filesize("Sample_352d4efbf024c62ef8ef1771b6d75c88.brr")
  Sample1F: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample20: skip filesize("Sample_2f5692cd107acfd64888f4a4ede244af.brr")
  Sample21: skip filesize("Sample_281d7b2cb8917f9fc3d3ad5071dad747.brr")
  Sample22: skip filesize("Sample_e81fe2bdf6473308304597a422a5f73d.brr")
  Sample23: skip filesize("Sample_2046070ed30e9aaf047b5b496a0a3fcb.brr")
  Sample24: skip filesize("Sample_43bc4f28d5162b86489cbd3dca2e7af7.brr")
  Sample25: skip filesize("Sample_d789d8b4545d918b6564cc827ee4a348.brr")
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
Pattern5844: dw Track586F, Track5906, Track5AD7, Track5BE9, Track5C5A, Track5D19, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,76
  !musicVolume,224
  !echo,%00111111,47,47
  !echoParameters,2,28,5
  !dynamicEcho,128,52,52
  !end

Track586F:
  db 127,$7F
  !transpose,0
  !echo,%00111111,47,47
  !echoParameters,2,28,5
  !dynamicEcho,128,52,52
  !instr,$18
  !loop : dw Sub58CA : db 8
  !instr,$19
  !volume,208
  !pan,9
  db 96
  !g4
  !tie
  !gs4
  !tie
  !a4
  !tie
  db 72
  !as4
  !b4
  !loop : dw Sub58E8 : db 4
  !loop : dw Sub58CA : db 4
  !instr,$19
  !volume,184
  !pan,11
  db 96
  !ds5
  db 48
  !tie
  db 96
  !c5
  db 48
  !tie
  db 96
  !ds5
  db 48
  !tie
  db 96
  !fs5
  db 48
  !tie
  db 96
  !a5
  db 48
  !tie
  db 96
  !fs5
  db 48
  !tie
  db 96
  !a5
  db 48
  !tie
  db 96
  !c6
  db 48
  !tie
  db 72
  !ds6
  db 48
  !fs6
  db 72
  !a6
  !end

Sub58CA:
  !pan,8
  !volume,192
  db 24
  !c6
  !c5
  !volume,128
  !c5
  !pan,12
  !volume,192
  !c6
  !c5
  !volume,128
  !c5
  !volume,192
  !pan,8
  !cs6
  !cs5
  !pan,12
  !as5
  !as4
  !end

Sub58E8:
  !pan,8
  !volume,192
  db 24
  !ds6
  !ds5
  !volume,128
  !ds5
  !pan,12
  !volume,192
  !ds6
  !ds5
  !volume,128
  !ds5
  !volume,192
  !pan,8
  !e6
  !e5
  !pan,12
  !cs6
  !cs5
  !end

Track5906:
  db 127,$7F
  !transpose,0
  !endVibrato
  !pan,10
  !instr,$1C
  !pan,8
  db 24
  !c5
  !rest
  !volume,144
  !c5
  !instr,$1B
  !pan,12
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1D
  !pan,10
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !instr,$1B
  !pan,12
  !cs5
  !rest
  !instr,$1A
  !as4
  !rest
  !c5
  !rest
  !volume,144
  !c5
  !instr,$1B
  !pan,12
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1D
  !pan,10
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !instr,$1B
  !pan,12
  !cs5
  !rest
  !instr,$1A
  !as4
  !rest
  !instr,$1E
  !volume,136
  !vibrato,0,18,47
  !pan,11
  db 96
  !fs6
  !tie
  !g6
  !tie
  !gs6
  !tie
  db 72
  !a6
  !as6
  !endVibrato
  !volume,192
  !pan,10
  !instr,$1B
  !pan,12
  db 24
  !ds5
  !rest
  !volume,144
  !ds5
  !volume,192
  !ds5
  !rest
  !volume,144
  !ds5
  !volume,192
  !e5
  !rest
  !cs5
  db 72
  !rest
  !instr,$1C
  !pan,8
  db 24
  !ds5
  !volume,192
  !ds5
  !rest
  !volume,144
  !ds5
  !volume,192
  !e5
  !rest
  !cs5
  !rest
  !ds5
  !rest
  !instr,$1D
  !pan,10
  !volume,144
  !ds5
  !volume,192
  !ds5
  !rest
  !volume,144
  !ds5
  !volume,192
  !e5
  !rest
  !cs5
  !rest
  !ds5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !ds5
  !volume,192
  !ds5
  !rest
  !volume,144
  !ds5
  !volume,192
  !instr,$1B
  !pan,12
  !e5
  !rest
  !instr,$1A
  !cs5
  !rest
  !instr,$1C
  !pan,8
  !c5
  !rest
  !volume,144
  !c5
  !instr,$1B
  !pan,12
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1D
  !pan,10
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !cs5
  !rest
  !as4
  !rest
  !c5
  !rest
  !instr,$1C
  !pan,8
  !volume,144
  !c5
  !volume,192
  !c5
  !rest
  !volume,144
  !c5
  !volume,192
  !instr,$1B
  !pan,12
  !cs5
  !rest
  !instr,$1A
  !as4
  !rest
  !instr,$1E
  !volume,136
  !vibrato,0,18,47
  !pan,9
  db 96
  !c6
  db 48
  !tie
  db 96
  !ds6
  db 48
  !tie
  db 96
  !fs6
  db 48
  !tie
  db 96
  !a6
  db 48
  !tie
  db 96
  !a6
  db 48
  !tie
  db 96
  !fs6
  db 48
  !tie
  db 96
  !a6
  db 48
  !tie
  db 96
  !c7
  db 48
  !tie
  db 72
  !ds7
  db 48
  !fs7
  db 72
  !a7
  !end

Track5AD7:
  db 127,$7F
  !transpose,0
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  db 72
  !c6
  db 96
  !rest
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,$23
  !volume,255
  !vibrato,0,18,159
  db 96
  !g4
  !tie
  !dynamicPan,240,4
  !tie
  !tie
  db 48
  !tie
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  !as5
  db 72
  !c6
  db 96
  !rest
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,$23
  !volume,255
  !vibrato,0,18,159
  db 96
  !g4
  !tie
  !dynamicPan,240,16
  !tie
  !tie
  db 48
  !tie
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  !as5
  !instr,$24
  !volume,176
  !vibrato,0,18,79
  !loop : dw Sub5B8E : db 1
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  db 72
  !ds6
  db 96
  !rest
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,$23
  !volume,255
  !vibrato,0,18,159
  db 96
  !as4
  !tie
  !dynamicPan,240,4
  !tie
  !tie
  db 48
  !tie
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  !cs6
  db 72
  !c6
  db 96
  !rest
  !tie
  !tie
  !tie
  db 24
  !tie
  !instr,$23
  !volume,255
  !vibrato,0,18,159
  db 96
  !g4
  !tie
  !dynamicPan,240,16
  !tie
  !tie
  db 48
  !tie
  !endVibrato
  !instr,$22
  !pan,10
  !volume,192
  !as5
  !instr,$24
  !volume,176
  !vibrato,0,18,79
  !loop : dw Sub5BA5 : db 1
  !end

Sub5B8E:
  db 24
  !fs5
  !c5
  !ds5
  db 120
  !g4
  db 24
  !gs4
  !as4
  !c5
  db 120
  !g5
  db 24
  !fs5
  !d5
  db 96
  !a5
  db 48
  !tie
  db 72
  !as5
  !b5
  !end

Sub5BA5:
  db 96
  !as5
  db 16
  !a5
  !as5
  !a5
  db 96
  !fs5
  db 48
  !a5
  db 96
  !as5
  db 16
  !a5
  !as5
  !a5
  db 96
  !fs5
  db 48
  !a5
  db 96
  !cs6
  db 16
  !c6
  !cs6
  !c6
  db 96
  !a5
  db 48
  !c6
  db 96
  !ds6
  db 16
  !d6
  !ds6
  !d6
  db 96
  !fs6
  db 16
  !f6
  !fs6
  !f6
  !pan,14
  db 24
  !ds6
  !pan,10
  !d6
  !pan,6
  !fs6
  !pan,10
  !f6
  !pan,15
  !ds6
  !pan,10
  !d6
  !pan,5
  !fs6
  !pan,10
  !f6
  !end

Track5BE9:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$25
  db 48
  !rest
  !volume,128
  db 24
  !f5
  !volume,176
  db 96
  !c6
  db 72
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
  !volume,128
  db 24
  !f5
  !volume,176
  db 96
  !c6
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$24
  !volume,128
  db 36
  !rest
  !loop : dw Sub5B8E : db 1
  !instr,$25
  db 12
  !rest
  !volume,128
  db 24
  !gs5
  !volume,176
  db 96
  !ds6
  db 72
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
  !volume,128
  db 24
  !f5
  !volume,176
  db 96
  !c6
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$24
  !volume,128
  db 36
  !rest
  !loop : dw Sub5BA5 : db 1
  !end

Track5C5A:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$25
  db 48
  !rest
  !volume,128
  db 24
  !g5
  db 96
  !rest
  db 72
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
  !volume,128
  db 24
  !g5
  db 96
  !rest
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !volume,128
  db 24
  !fs5
  !fs4
  !c5
  !fs5
  db 32
  !c6
  !fs5
  !c5
  db 24
  !g5
  !g4
  !cs5
  !g5
  db 32
  !cs6
  !g5
  !cs5
  db 24
  !gs5
  !gs4
  !d5
  !gs5
  db 32
  !d6
  !gs5
  !d5
  db 24
  !a4
  !ds5
  !a5
  db 18
  !as4
  !e5
  !as5
  !e6
  db 48
  !rest
  !volume,128
  db 24
  !as5
  db 96
  !rest
  db 72
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
  !volume,128
  db 24
  !g5
  db 96
  !rest
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !volume,128
  db 24
  !ds4
  !a3
  !c4
  !ds4
  !c5
  !a4
  db 36
  !a5
  !ds5
  !a4
  !c4
  db 24
  !ds4
  !a3
  !c4
  !ds4
  !c5
  !a4
  db 36
  !a5
  !ds5
  !a4
  !c4
  db 24
  !a4
  !c4
  !ds4
  !a4
  !ds5
  !c5
  db 36
  !c6
  !a5
  !c5
  !ds4
  db 24
  !c5
  !ds4
  !a4
  !c5
  !a5
  !ds5
  db 36
  !ds6
  !c6
  !ds5
  !a4
  db 24
  !a3
  !a4
  !c5
  !ds5
  db 18
  !c4
  !c5
  db 12
  !ds5
  db 18
  !a5
  !c6
  db 12
  !ds6
  db 72
  !rest
  db 96
  !rest
  !tie
  !end

Track5D19:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !loop : dw Sub5DC3 : db 2
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$20
  !volume,128
  db 24
  !c5
  !instr,$1F
  !volume,193
  !c5
  !c5
  !instr,$20
  !volume,128
  !c5
  db 12
  !rest
  !instr,$1F
  !volume,200
  db 24
  !c5
  db 12
  !rest
  db 24
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !rest
  !c5
  !rest
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !instr,$20
  !volume,128
  !rest
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !rest
  !c5
  !rest
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !instr,$21
  db 48
  !ds5
  !loop : dw Sub5DC3 : db 1
  !loop : dw Sub5E3B : db 255
  !end

Sub5DC3:
  !instr,$1F
  !volume,193
  db 24
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !rest
  !c5
  !rest
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !rest
  !c5
  !rest
  !instr,$1F
  !volume,193
  !c5
  !rest
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !rest
  !c5
  !instr,$20
  !volume,128
  !c5
  !instr,$1F
  !volume,193
  !c5
  !instr,$21
  db 48
  !cs5
  !end

Sub5E3B:
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 69: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
