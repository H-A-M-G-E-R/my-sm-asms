asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$CC,$90,$B8,$02,$00
  db $19,$FC,$8D,$B8,$02,$00
  db $1A,$F9,$EB,$B8,$02,$7B
  db $1B,$FB,$AB,$B8,$01,$3D
  db $1C,$DD,$ED,$B8,$01,$3D
  db $1D,$FD,$E1,$B8,$02,$98
  db $1E,$FC,$E1,$B8,$01,$3D
  db $1F,$F7,$E3,$B8,$02,$7B
  db $20,$F9,$E1,$B8,$02,$7B
  db $21,$FC,$EB,$B8,$02,$7A
  db $22,$FF,$E3,$B8,$02,$00
  db $23,$FF,$E0,$B8,$00,$D0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19,Sample18_19+1809
  dw Sample18_19,Sample18_19+1809
  dw Sample1A_1F_20,Sample1A_1F_20+1062
  dw Sample1B_1C,Sample1B_1C+3663
  dw Sample1B_1C,Sample1B_1C+3663
  dw Sample1D,Sample1D+27
  dw Sample1E_21,Sample1E_21+81
  dw Sample1A_1F_20,Sample1A_1F_20+1062
  dw Sample1A_1F_20,Sample1A_1F_20+1062
  dw Sample1E_21,Sample1E_21+81
  dw Sample22,Sample22+36
  dw Sample23,Sample23+36
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18_19: skip filesize("Sample_88532f336dd55c900a0a826201019b57.brr")
  Sample1A_1F_20: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1B_1C: skip filesize("Sample_ef25c5b6dec0eb9284501ed4e7b4825a.brr")
  Sample1D: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1E_21: skip filesize("Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr")
  Sample22: skip filesize("Sample_aecff530da367e51e6090043494c92bb.brr")
  Sample23: skip filesize("Sample_600f26d0533ebd1132a02b2323d23eb6.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern584E
  dw Pattern585E
-
  dw Pattern586E
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern584E
-
  dw Pattern587E
  dw $00FF,-
  dw $0000

Tracker7:
  dw Pattern584E
-
  dw Pattern588E
  dw $00FF,-
  dw $0000

Pattern584E: dw Track589E, 0, 0, 0, 0, 0, 0, 0
Pattern585E: dw Track58B5, Track5A70, Track5AF9, Track5BA8, Track5C2D, 0, 0, 0
Pattern586E: dw Track58F2, Track5A86, Track5B15, Track5BC4, Track5C3C, 0, 0, 0
Pattern587E: dw Track5D04, Track5D35, Track5D49, Track5D71, 0, 0, 0, 0
Pattern588E: dw Track5D71, 0, 0, 0, 0, 0, 0, 0

Track589E:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,24
  !musicVolume,160
  !echo,%00011111,32,32
  !echoParameters,2,16,0
  !end

Track58B5:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,9
  !loop : dw Sub58C2 : db 1
  !end

Sub58C2:
  db 96
  !rest
  db 48
  !tie
  !volume,175
  !dynamicVolume,80,191
  db 24
  !c4
  db 16
  !cs4
  db 14
  !f4
  !a4
  db 12
  !c5
  db 14
  !cs5
  db 12
  !f5
  db 14
  !a5
  !dynamicVolume,64,159
  !c6
  !cs6
  !f6
  !a6
  !volume,143
  db 16
  !c7
  !volume,127
  !cs7
  !volume,111
  !f7
  !volume,95
  db 40
  !a7
  db 32
  !rest
  !end

Track58F2:
  !echo,%00011111,32,32
  !echoParameters,2,16,0
  !instr,$1A
  !volume,144
  db 24
  !rest
  !c6
  db 96
  !a6
  !instr,$19
  !pan,11
  !loop : dw Sub59E1 : db 1
  !instr,$1A
  !volume,128
  db 96
  !f6
  db 48
  !tie
  !instr,$19
  !pan,8
  !loop : dw Sub5A58 : db 1
  !instr,$1A
  !volume,160
  !pan,10
  db 96
  !f6
  db 48
  !tie
  !volume,144
  !e6
  !dynamicVolume,144,16
  db 96
  !tie
  db 48
  !tie
  !volume,144
  db 96
  !rest
  !instr,$1B
  !volume,128
  db 48
  !f6
  db 72
  !e6
  db 24
  !c6
  db 96
  !cs6
  db 48
  !gs5
  !as5
  db 72
  !ds5
  db 24
  !f5
  db 96
  !as4
  db 48
  !rest
  !f6
  db 72
  !e6
  db 24
  !c6
  db 96
  !cs6
  db 48
  !gs5
  db 24
  !as5
  db 96
  !f6
  !tie
  db 60
  !tie
  db 12
  !rest
  !instr,$1C
  !volume,112
  db 24
  !f6
  !as6
  !gs6
  db 72
  !cs7
  db 24
  !c7
  !f6
  !as6
  db 48
  !ds6
  db 24
  !f6
  db 96
  !as5
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  db 24
  !f6
  !as6
  !gs6
  db 48
  !ds7
  !cs7
  db 24
  !c7
  !gs6
  db 48
  !as6
  db 24
  !ds7
  db 96
  !f7
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  !instr,$1B
  !f6
  db 72
  !e6
  !instr,$1C
  db 24
  !c6
  !instr,$1B
  !volume,128
  db 96
  !cs6
  db 48
  !gs5
  !as5
  db 72
  !ds5
  db 24
  !f5
  db 96
  !as4
  db 48
  !rest
  !f6
  db 72
  !e6
  !instr,$1C
  db 24
  !c6
  !instr,$1B
  db 96
  !cs6
  db 48
  !gs5
  db 24
  !as5
  db 96
  !f6
  !tie
  db 60
  !tie
  !rest
  db 36
  !f5
  db 108
  !rest
  db 42
  !f5
  db 30
  !rest
  db 24
  !c5
  db 72
  !f5
  db 24
  !ds5
  db 48
  !gs4
  db 96
  !as4
  !rest
  !volume,160
  db 36
  !as5
  db 60
  !rest
  db 96
  !as5
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !a4
  db 48
  !rest
  !end

Sub59E1:
  !volume,95
  db 22
  !cs7
  !volume,111
  db 16
  !f6
  !volume,143
  !a6
  !volume,191
  db 14
  !f5
  !c6
  !cs6
  !a6
  !c6
  !cs6
  db 18
  !a5
  !f5
  !c5
  !volume,159
  !f4
  db 84
  !rest
  db 18
  !f4
  !volume,191
  db 12
  !a4
  !c5
  !volume,143
  !cs5
  !f5
  !a5
  !c6
  !pan,10
  !volume,143
  !cs6
  db 14
  !f6
  !a6
  db 12
  !c7
  !cs7
  !volume,175
  !c7
  !a6
  !f6
  !cs6
  !c6
  !a5
  !f5
  db 16
  !cs5
  !c5
  db 12
  !f4
  !volume,191
  !g4
  !as4
  !c5
  !e5
  !g5
  !as5
  !c6
  !volume,159
  !e6
  db 16
  !g6
  !as6
  !c7
  db 14
  !cs7
  !c7
  db 12
  !a6
  !f6
  !cs6
  !volume,143
  !c6
  !a5
  !f5
  !pan,12
  !volume,127
  !cs5
  !c5
  !a4
  !volume,111
  !f4
  !g4
  !as4
  !pan,8
  !c5
  !e5
  !volume,143
  !g5
  db 32
  !rest
  db 48
  !rest
  !end

Sub5A58:
  !volume,143
  db 15
  !c7
  !c6
  db 12
  !g6
  !volume,175
  !g5
  !e6
  !e5
  !c6
  !c5
  !volume,127
  db 16
  !g5
  !volume,111
  !g4
  db 10
  !rest
  !end

Track5A70:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1F
  !volume,192
  !dynamicVolume,240,160
  db 96
  !rest
  db 48
  !tie
  db 96
  !f5
  !tie
  !tie
  !end

Track5A86:
  !instr,$1D
  !volume,64
  db 96
  !c7
  db 48
  !tie
  db 96
  !cs7
  db 48
  !tie
  db 96
  !c7
  db 48
  !tie
  db 96
  !cs7
  db 48
  !tie
  !instr,$1E
  !volume,128
  !fs6
  db 96
  !f6
  !e6
  db 48
  !tie
  !fs5
  db 96
  !f5
  !e5
  db 48
  !tie
  !instr,$20
  !volume,128
  db 96
  !as5
  !tie
  db 60
  !tie
  !volume,144
  db 12
  !rest
  !instr,$1A
  db 18
  !as4
  db 6
  !rest
  !instr,$1F
  db 96
  !as4
  !tie
  db 66
  !tie
  db 6
  !rest
  !instr,$1F
  db 18
  !as4
  db 6
  !rest
  !instr,$1F
  !dynamicVolume,128,64
  db 96
  !as4
  db 48
  !tie
  !volume,176
  !loop : dw Sub5AEA : db 7
  db 96
  !as4
  db 48
  !tie
  db 96
  !gs4
  db 48
  !tie
  db 96
  !fs4
  !tie
  db 48
  !tie
  !fs4
  !end

Sub5AEA:
  db 96
  !as4
  db 48
  !tie
  db 96
  !gs4
  db 48
  !tie
  db 96
  !fs4
  !tie
  db 48
  !tie
  !gs4
  !end

Track5AF9:
  db 127,$7F
  !transpose,0
  !pan,12
  !instr,$1E
  !volume,80
  db 48
  !cs6
  !dynamicVolume,96,128
  db 96
  !gs6
  db 48
  !tie
  !dynamicVolume,144,64
  db 96
  !a6
  !tie
  db 48
  !tie
  !end

Track5B15:
  !instr,$20
  !volume,160
  db 96
  !f5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !f5
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  !instr,$1F
  !volume,96
  db 96
  !a6
  db 48
  !tie
  db 120
  !gs6
  db 24
  !as6
  db 96
  !a6
  db 48
  !tie
  !gs6
  !dynamicVolume,144,16
  db 96
  !tie
  db 48
  !tie
  !volume,96
  db 96
  !rest
  !instr,$1E
  !volume,80
  !pan,12
  !dynamicPan,192,8
  !as5
  !tie
  !rest
  !tie
  !tie
  !tie
  !pan,8
  !dynamicPan,192,12
  !as5
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !pan,12
  !dynamicPan,192,8
  !as5
  !tie
  !rest
  !tie
  !tie
  !tie
  !pan,8
  !dynamicPan,192,12
  !as5
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !pan,10
  !as6
  db 48
  !tie
  db 96
  !a6
  db 48
  !tie
  db 96
  !gs6
  db 48
  !tie
  !rest
  db 96
  !f6
  !rest
  !rest
  !tie
  !end

Track5BA8:
  db 127,$7F
  !transpose,0
  !pan,8
  !instr,$1E
  !volume,80
  db 48
  !f5
  !dynamicVolume,96,160
  db 96
  !tie
  db 48
  !tie
  !dynamicVolume,191,96
  db 96
  !tie
  !tie
  db 48
  !rest
  !end

Track5BC4:
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1A
  !volume,160
  !c6
  !dynamicVolume,95,48
  db 96
  !a6
  !rest
  db 72
  !tie
  !volume,160
  db 48
  !as5
  !dynamicVolume,72,16
  db 72
  !tie
  !volume,160
  !instr,$21
  !volume,112
  db 96
  !f5
  db 72
  !rest
  !instr,$1A
  !volume,144
  db 120
  !as5
  !instr,$21
  !volume,112
  db 96
  !f4
  !loop : dw Sub5C29 : db 22
  !instr,$22
  !volume,80
  !pan,10
  db 48
  !rest
  db 36
  !as5
  db 108
  !rest
  db 36
  !c6
  db 96
  !rest
  !tie
  db 12
  !tie
  !instr,$1D
  !volume,64
  db 96
  !as6
  db 48
  !tie
  !instr,$22
  !volume,96
  !rest
  db 36
  !f5
  db 60
  !rest
  db 96
  !gs5
  db 48
  !cs5
  !volume,64
  db 96
  !as4
  !rest
  !tie
  !end

Sub5C29:
  db 96
  !rest
  !tie
  !end

Track5C2D:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  db 6
  !rest
  !loop : dw Sub58C2 : db 1
  !end

Track5C3C:
  !instr,$18
  !pan,9
  db 6
  !rest
  db 96
  !rest
  db 48
  !tie
  !loop : dw Sub59E1 : db 1
  db 96
  !rest
  db 48
  !tie
  !pan,12
  !loop : dw Sub5A58 : db 1
  db 96
  !rest
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !instr,$1B
  !volume,96
  db 48
  !f6
  db 72
  !e6
  db 24
  !c6
  db 96
  !cs6
  db 48
  !gs5
  !as5
  db 72
  !ds5
  db 24
  !f5
  db 96
  !as4
  db 48
  !rest
  !f6
  db 72
  !e6
  db 24
  !c6
  db 96
  !cs6
  db 48
  !gs5
  db 24
  !as5
  db 96
  !f6
  !tie
  db 60
  !tie
  db 12
  !rest
  !instr,$1C
  db 24
  !f6
  !as6
  !gs6
  db 72
  !cs7
  db 24
  !c7
  !f6
  !as6
  db 48
  !ds6
  db 24
  !f6
  db 96
  !as5
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  db 24
  !f6
  !as6
  !gs6
  db 48
  !ds7
  !cs7
  db 24
  !c7
  !gs6
  db 48
  !as6
  db 24
  !ds7
  db 96
  !f7
  db 48
  !tie
  db 96
  !rest
  db 48
  !tie
  !instr,$1B
  !f6
  db 72
  !e6
  !instr,$1C
  db 24
  !c6
  !instr,$1B
  db 96
  !cs6
  db 48
  !gs5
  !as5
  db 72
  !ds5
  db 24
  !f5
  db 96
  !as4
  db 48
  !rest
  !f6
  db 72
  !e6
  !instr,$1C
  db 24
  !c6
  !instr,$1B
  db 96
  !cs6
  db 48
  !gs5
  db 24
  !as5
  db 96
  !f6
  !tie
  db 60
  !tie
  !rest
  db 36
  !f5
  db 108
  !rest
  db 42
  !f5
  db 30
  !rest
  db 24
  !c5
  db 72
  !f5
  db 24
  !ds5
  db 48
  !gs4
  db 96
  !as4
  !rest
  db 36
  !as5
  db 60
  !rest
  db 96
  !as5
  db 48
  !tie
  db 96
  !as4
  db 48
  !tie
  db 96
  !a4
  db 48
  !rest
  !end

Track5D04:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,9
  !volume,175
  !loop : dw Sub5D16 : db 1
  db 96
  !rest
  !tie
  !end

Sub5D16:
  db 16
  !f4
  !a4
  !c5
  !cs5
  !f5
  !a5
  !f4
  !a4
  !c5
  !cs5
  !e5
  !gs5
  db 96
  !rest
  db 16
  !f4
  !a4
  !c5
  !cs5
  !f5
  !a5
  !f4
  !a4
  !c5
  !cs5
  !e5
  !gs5
  db 96
  !rest
  !end

Track5D35:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,11
  !volume,159
  db 8
  !rest
  !loop : dw Sub5D16 : db 1
  db 96
  !rest
  !tie
  !end

Track5D49:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !pan,10
  !volume,192
  db 96
  !rest
  !f5
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,192
  db 48
  !rest
  db 96
  !f5
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,192
  db 48
  !rest
  db 96
  !rest
  !end

Track5D71:
  db 127,$7F
  !transpose,0
  !subtranspose,128
  !instr,$23
  !pan,10
  !volume,255
  !loop : dw Sub5D82 : db 255
  !end

Sub5D82:
  db 96
  !e4
  !tie
  db 18
  !tie
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
