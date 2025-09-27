asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FE,$E0,$B8,$00,$9E
  db $19,$FB,$E7,$B8,$01,$4C
  db $1A,$FF,$F2,$B8,$02,$7A
  db $1B,$FF,$E0,$B8,$01,$3C
  db $1C,$FF,$E0,$B8,$01,$3D
  db $1D,$FF,$E0,$B8,$01,$3D
  db $1E,$FF,$E0,$B8,$04,$00
  db $1F,$FF,$E0,$B8,$04,$F4
  db $20,$FF,$E0,$E8,$00,$40
  db $21,$7F,$E0,$00,$04,$F4
  db $22,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+234
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+1062
  dw Sample1B,Sample1B+18
  dw Sample1C,Sample1C+90
  dw Sample1D,Sample1D+135
  dw Sample1E,Sample1E+27
  dw Sample1F,Sample1F
  dw Sample20,Sample20+36
  dw Sample21_22,Sample21_22
  dw Sample21_22,Sample21_22
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_0ca2e923494667f4c3a148f312b12259.brr")
  Sample19: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1A: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1B: skip filesize("Sample_278f07e8e1ffdb96da9b899da90d9f9c.brr")
  Sample1C: skip filesize("Sample_797af8119579c0ab291d42bd5b294da9.brr")
  Sample1D: skip filesize("Sample_43c5b6101fd297c7af5a76e6733f4f0c.brr")
  Sample1E: skip filesize("Sample_bdd3ed2bb8600fa03669172d5130595d.brr")
  Sample1F: skip filesize("Sample_ff8b37e06639ca6f4c8983178b73c75f.brr")
  Sample20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21_22: skip filesize("Sample_0e021b8c900b6db8440abf3c3b172967.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track5906, Track59A0, Track5A1A, Track5B0C, 0, 0, 0
Pattern5856: dw Track58B2, Track5943, Track59F9, Track5A61, Track5B78, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,52
  !musicVolume,255
  !echo,%00011111,79,79
  !echoParameters,2,0,6
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !musicVolume,207
  !instr,$18
  !pan,10
  db 48
  !rest
  !volume,240
  !dynamicVolume,48,144
  db 96
  !a6
  !tie
  !dynamicVolume,191,192
  !tie
  !tie
  !dynamicVolume,191,144
  !tie
  !tie
  !dynamicVolume,191,192
  !b6
  !tie
  !instr,$19
  !volume,144
  !pan,8
  !a6
  !tie
  !tie
  !c7
  !tie
  !tie
  !b6
  db 72
  !c7
  db 24
  !rest
  !end

Track58B2:
  db 127,$7F
  !transpose,0
  !echo,%00011111,79,79
  !echoParameters,2,0,6
  !instr,$18
  !volume,144
  !pan,10
  db 96
  !a6
  !tie
  !tie
  !c7
  !tie
  !tie
  !volume,176
  !cs7
  db 72
  !tie
  db 24
  !rest
  !volume,160
  db 72
  !c7
  db 24
  !rest
  db 72
  !c7
  db 24
  !rest
  db 72
  !d7
  db 24
  !rest
  db 72
  !ds7
  db 24
  !rest
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !instr,$19
  !pan,12
  !as6
  !tie
  !rest
  !fs7
  !f7
  !tie
  db 24
  !tie
  !rest
  db 48
  !rest
  db 96
  !a6
  !tie
  !cs7
  !c7
  !tie
  !tie
  !b6
  db 72
  !c7
  db 24
  !rest
  !end

Track5906:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !volume,144
  !pan,10
  !dynamicVolume,48,208
  db 12
  !c4
  !c4
  !c4
  !c4
  db 24
  !c4
  db 72
  !rest
  !instr,$18
  !volume,144
  !pan,12
  db 96
  !as6
  !tie
  !volume,176
  !c7
  !tie
  !volume,192
  !f7
  !dynamicVolume,95,112
  !tie
  !volume,192
  !as6
  !rest
  !instr,$19
  !pan,12
  !as6
  !tie
  !rest
  !fs7
  !f7
  !tie
  db 24
  !tie
  db 72
  !rest
  !end

Track5943:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !instr,$18
  !pan,10
  !volume,192
  !as6
  !tie
  !rest
  !tie
  !as6
  !tie
  db 72
  !tie
  db 24
  !rest
  !instr,$19
  !volume,160
  !pan,10
  db 72
  !a7
  db 24
  !as7
  db 72
  !fs7
  db 24
  !g7
  db 72
  !a7
  db 24
  !as7
  db 72
  !fs7
  db 24
  !g7
  !volume,128
  db 72
  !f6
  db 24
  !e6
  db 72
  !fs6
  db 24
  !f6
  !volume,144
  db 72
  !a6
  db 24
  !gs6
  db 72
  !b6
  !volume,176
  db 24
  !as6
  db 96
  !a6
  !tie
  !pan,8
  !cs7
  !c7
  !tie
  !tie
  !b6
  db 72
  !c7
  db 120
  !rest
  db 96
  !as6
  !tie
  !rest
  !fs7
  !f7
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !end

Track59A0:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,192
  !pan,10
  !dynamicVolume,48,255
  db 12
  !f5
  !b4
  !g4
  !cs4
  db 48
  !c4
  db 96
  !rest
  db 48
  !tie
  !instr,$18
  !volume,128
  !pan,8
  !dynamicVolume,95,160
  db 96
  !cs7
  !tie
  !fs7
  !dynamicVolume,95,128
  !tie
  !pan,10
  !volume,48
  !dynamicVolume,96,176
  !instr,$1B
  db 120
  !c6
  !instr,$1C
  db 72
  !c6
  !instr,$1D
  !volume,208
  !dynamicVolume,191,16
  !pan,14
  !dynamicPan,95,6
  db 96
  !c6
  !pan,14
  !dynamicPan,95,12
  !tie
  !instr,$19
  !volume,128
  !pan,10
  !cs7
  !rest
  !tie
  !tie
  !tie
  !tie
  !end

Track59F9:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !instr,$18
  !pan,10
  !volume,144
  !cs7
  !tie
  !volume,160
  !a6
  !tie
  !tie
  !volume,176
  db 72
  !c7
  !loop : dw Sub5A16 : db 255
  !end

Sub5A16:
  db 96
  !rest
  !tie
  !end

Track5A1A:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  db 96
  !rest
  !tie
  db 48
  !tie
  !volume,112
  !dynamicVolume,95,160
  db 96
  !a6
  !as6
  !volume,176
  !cs7
  !volume,128
  !c7
  !volume,96
  !fs7
  !volume,144
  !f7
  !instr,$1A
  !volume,255
  db 24
  !ds4
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !rest
  !ds4
  !end

Track5A61:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,255
  db 24
  !e4
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !rest
  !e4
  !f4
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !rest
  !f4
  !fs4
  !fs4
  !rest
  !fs4
  !g4
  !g4
  !rest
  !g4
  !gs4
  !gs4
  !rest
  !gs4
  !a4
  !a4
  !rest
  !a4
  !as4
  !as4
  !rest
  !as4
  !b4
  !b4
  !rest
  !b4
  !c5
  !c5
  !rest
  !c5
  !cs5
  !cs5
  !rest
  !cs5
  !c5
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !rest
  !c5
  !ds5
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 24
  !ds5
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 36
  !ds5
  db 12
  !rest
  db 24
  !ds5
  db 96
  !rest
  !tie
  !end

Track5B0C:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$1E
  !volume,146
  !pan,8
  !dynamicPan,176,12
  !dynamicVolume,176,194
  db 12
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicVolume,176,130
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicPan,176,8
  !dynamicVolume,176,194
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicVolume,176,130
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicPan,176,12
  !ds4
  !ds4
  !ds4
  !ds4
  !end

Track5B78:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !volume,146
  db 12
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !dynamicVolume,176,130
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !e4
  !dynamicPan,176,8
  !dynamicVolume,176,194
  !e4
  !e4
  !e4
  !e4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !dynamicVolume,176,130
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !f4
  !dynamicPan,176,12
  !dynamicVolume,176,194
  !f4
  !f4
  !f4
  !f4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !fs4
  !g4
  !g4
  !g4
  !g4
  !dynamicVolume,176,130
  !g4
  !g4
  !g4
  !g4
  !gs4
  !gs4
  !gs4
  !gs4
  !gs4
  !gs4
  !gs4
  !gs4
  !a4
  !a4
  !a4
  !a4
  !dynamicPan,176,8
  !dynamicVolume,176,194
  !a4
  !a4
  !a4
  !a4
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !as3
  !b3
  !b3
  !b3
  !b3
  !dynamicVolume,176,130
  !b3
  !b3
  !b3
  !b3
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !cs4
  !cs4
  !cs4
  !cs4
  !dynamicPan,176,12
  !dynamicVolume,176,194
  !cs4
  !cs4
  !cs4
  !cs4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !dynamicVolume,176,130
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !dynamicPan,176,8
  !dynamicVolume,176,194
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !dynamicVolume,176,130
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !dynamicPan,176,12
  !dynamicVolume,176,194
  !c4
  !c4
  !c4
  !c4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicVolume,176,130
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicPan,176,8
  !dynamicVolume,176,194
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !dynamicVolume,176,130
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  !ds4
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
