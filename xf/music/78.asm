asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Title

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$01,$0A
  db $19,$FF,$E0,$B8,$01,$3D
  db $1A,$FF,$F2,$B8,$01,$3D
  db $1B,$FF,$F1,$B8,$01,$3D
  db $1C,$FA,$E0,$B8,$02,$98
  db $1D,$FF,$E0,$B8,$00,$9E
  db $1E,$FF,$F2,$B8,$00,$86
  db $1F,$F3,$E7,$B8,$00,$86
  db $20,$FB,$EB,$B8,$01,$4C
  db $21,$FF,$EB,$B8,$01,$0A
  db $22,$FC,$EE,$B8,$01,$F8
  db $23,$FF,$EB,$B8,$06,$B0
  db $24,$FF,$ED,$B8,$10,$A8
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_21_24,Sample18_21_24+675
  dw Sample19,Sample19+3663
  dw Sample1A_1B,Sample1A_1B+9
  dw Sample1A_1B,Sample1A_1B+9
  dw Sample1C_20,Sample1C_20+27
  dw Sample1D,Sample1D+81
  dw Sample1E_1F,Sample1E_1F+27
  dw Sample1E_1F,Sample1E_1F+27
  dw Sample1C_20,Sample1C_20+27
  dw Sample18_21_24,Sample18_21_24+675
  dw Sample22,Sample22+675
  dw Sample23,Sample23
  dw Sample18_21_24,Sample18_21_24+675
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18_21_24: skip filesize("Sample_070774228d4d8b89d9ca1ed89dad328a.brr")
  Sample19: skip filesize("Sample_ef25c5b6dec0eb9284501ed4e7b4825a.brr")
  Sample1A_1B: skip filesize("Sample_ef6b054116253361d675341632d6a4d7.brr")
  Sample1C_20: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1D: skip filesize("Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr")
  Sample1E_1F: skip filesize("Sample_952149bda8c138e34f1b41d599c4243f.brr")
  Sample22: skip filesize("Sample_791c11a320b992357fb30654bb72da96.brr")
  Sample23: skip filesize("Sample_f4ee4d04d4846fb534a4e559e83cbdf5.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern5854
  dw Pattern5874
  dw Pattern5884
-
  dw Pattern5894
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5864
  dw Pattern5884
-
  dw Pattern5894
  dw $00FF,-
  dw $0000

Tracker7:
  dw Pattern5864
  dw Pattern58A4
-
  dw Pattern58B4
  dw $00FF,-
  dw $0000

Pattern5854: dw Track58C4, 0, 0, 0, 0, 0, 0, 0
Pattern5864: dw Track58D1, 0, 0, 0, 0, 0, 0, 0
Pattern5874: dw Track58E0, Track5910, Track5952, Track59A9, Track59E0, Track5A2C, 0, 0
Pattern5884: dw Track5AE5, Track5B22, Track5C52, Track5A52, Track5A73, Track5A8F, Track5AAB, Track5AC7
Pattern5894: dw Track5AFF, Track5B64, Track5C6E, Track5C94, Track5D35, Track5D7A, Track5DDE, 0
Pattern58A4: dw Track5E1C, Track5E54, Track5F7B, Track5A73, Track5A8F, Track5AAB, Track5AC7, 0
Pattern58B4: dw Track5E36, Track5E96, Track5F97, Track5FB8, Track6060, Track60A8, 0, 0

Track58C4:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,22
  !musicVolume,208
  !end

Track58D1:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,22
  !musicVolume,208
  db 24
  !rest
  !end

Track58E0:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !pan,16
  !transpose,7
  !loop : dw Sub5902 : db 5
  !volume,192
  db 32
  !c7
  !pan,15
  !volume,208
  !c7
  !pan,14
  !volume,224
  !c7
  !pan,12
  !volume,255
  !c7
  !end

Sub5902:
  !volume,128
  db 48
  !c7
  !volume,144
  !c7
  !volume,160
  !c7
  !volume,144
  !c7
  !end

Track5910:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !pan,2
  !transpose,7
  db 3
  !rest
  !loop : dw Sub5944 : db 4
  !volume,128
  db 48
  !c7
  !volume,112
  !c7
  !volume,96
  !c7
  !volume,96
  !c7
  !pan,4
  !volume,112
  db 32
  !c7
  !pan,6
  !volume,160
  !c7
  !pan,8
  !volume,208
  !c7
  !pan,10
  !volume,255
  db 29
  !c7
  !end

Sub5944:
  !volume,128
  db 48
  !c7
  !volume,144
  !c7
  !volume,160
  !c7
  !volume,144
  !c7
  !end

Track5952:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  db 72
  !tie
  !loop : dw Sub5992 : db 1
  !instr,$21
  !volume,112
  !dynamicVolume,63,255
  !dynamicPan,63,6
  db 48
  !a7
  !dynamicPan,63,15
  db 96
  !gs7
  db 48
  !tie
  db 72
  !rest
  !loop : dw Sub5992 : db 1
  !instr,$22
  !volume,112
  !pan,10
  db 12
  !ds6
  !a6
  !c7
  !gs7
  db 96
  !rest
  !tie
  db 24
  !tie
  db 48
  !rest
  !loop : dw Sub5992 : db 1
  !loop : dw Sub59A5 : db 255
  !end

Sub5992:
  !instr,$20
  !volume,134
  !pan,4
  !dynamicPan,96,10
  db 72
  !d7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,134
  !end

Sub59A5:
  db 96
  !rest
  !tie
  !end

Track59A9:
  db 127,$7F
  !transpose,0
  db 120
  !rest
  !instr,$20
  !volume,134
  !pan,10
  !a7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,134
  db 96
  !rest
  !tie
  db 24
  !tie
  db 120
  !a7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,134
  db 96
  !rest
  !tie
  db 24
  !tie
  db 48
  !rest
  db 120
  !a7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,134
  !loop : dw Sub59A5 : db 255
  !end

Track59E0:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  db 48
  !tie
  !loop : dw Sub5A1C : db 1
  !instr,$21
  !volume,112
  !pan,10
  !dynamicVolume,63,255
  db 48
  !a6
  db 96
  !gs6
  db 48
  !tie
  !rest
  !loop : dw Sub5A1C : db 1
  !instr,$22
  !volume,96
  !pan,10
  db 6
  !rest
  db 12
  !ds6
  !a6
  !c7
  !gs7
  db 96
  !rest
  db 90
  !tie
  db 48
  !rest
  !loop : dw Sub5A1C : db 1
  !loop : dw Sub59A5 : db 255
  !end

Sub5A1C:
  !instr,$20
  !volume,134
  !pan,14
  db 96
  !gs7
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,134
  !end

Track5A2C:
  db 127,$7F
  !transpose,0
  !instr,$23
  !subtranspose,200
  !volume,250
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !a2
  !dynamicVolume,96,16
  !tie
  !volume,250
  !rest
  !gs2
  !dynamicVolume,96,16
  !tie
  !volume,250
  !loop : dw Sub59A5 : db 255
  !end

Track5A52:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  !musicVolume,40
  !dynamicMusicVolume,24,190
  !instr,$23
  !volume,246
  !pan,10
  !slideOut,12,12,10
  db 96,$7F
  !d2
  db 96
  !tie
  !tie
  !endSlide
  !loop : dw Sub59A5 : db 255
  !end

Track5A73:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  !instr,$24
  !volume,236
  !pan,10
  !slideOut,5,19,254
  db 96,$7F
  !ds3
  db 96
  !tie
  !tie
  !endSlide
  !loop : dw Sub59A5 : db 255
  !end

Track5A8F:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  !instr,$23
  !volume,246
  !pan,10
  !slideOut,1,23,10
  db 96,$7F
  !a2
  db 96
  !tie
  !tie
  !endSlide
  !loop : dw Sub59A5 : db 255
  !end

Track5AAB:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  !instr,$23
  !volume,246
  !pan,10
  !slideOut,1,23,10
  db 96,$7F
  !f2
  db 96
  !tie
  !tie
  !endSlide
  !loop : dw Sub59A5 : db 255
  !end

Track5AC7:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  !instr,$24
  !transpose,244
  !volume,236
  !pan,10
  !slideOut,5,19,254
  db 96,$7F
  !ds3
  db 96
  !tie
  !tie
  !endSlide
  !loop : dw Sub59A5 : db 255
  !end

Track5AE5:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  db 32
  !rest
  !tempo,54
  !musicVolume,224
  !instr,$18
  !pan,10
  !volume,160
  db 96
  !d6
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

Track5AFF:
  db 127,$7F
  !transpose,0
  !endSlide
  !instr,$18
  !pan,10
  !loop : dw Sub5B0D : db 5
  !end

Sub5B0D:
  !volume,160
  !dynamicVolume,208,192
  db 96
  !d6
  !tie
  !tie
  !dynamicVolume,208,160
  !tie
  !tie
  !tie
  !dynamicVolume,176,112
  !tie
  !tie
  !end

Track5B22:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  db 32
  !rest
  !pan,10
  !volume,240
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,192
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  !end

Track5B64:
  db 127,$7F
  !transpose,0
  !endSlide
  !pan,10
  db 96
  !rest
  !tie
  !volume,240
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,176
  !instr,$1A
  db 36
  !c6
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !c6
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  db 96
  !rest
  !tie
  !volume,240
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,192
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  db 96
  !rest
  !tie
  !volume,224
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,160
  !instr,$1A
  db 36
  !c6
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !c6
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$19
  !pan,12
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  db 96
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$1C
  !volume,32
  !dynamicVolume,255,64
  !pan,8
  !dynamicPan,255,10
  db 96
  !a7
  !tie
  !tie
  !tie
  !dynamicPan,192,12
  !dynamicVolume,192,32
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub5C4E : db 255
  !end

Sub5C4E:
  db 96
  !rest
  !tie
  !end

Track5C52:
  db 127,$7F
  !transpose,0
  !subtranspose,0
  db 32
  !rest
  !instr,$19
  !pan,10
  !volume,80
  !dynamicVolume,240,64
  db 12
  !rest
  db 96
  !d6
  !tie
  !tie
  !tie
  !tie
  db 84
  !tie
  !end

Track5C6E:
  db 127,$7F
  !transpose,0
  !endSlide
  !instr,$19
  !pan,10
  !loop : dw Sub5C7C : db 5
  !end

Sub5C7C:
  !volume,64
  !dynamicVolume,191,80
  db 96
  !d6
  !tie
  !dynamicVolume,191,96
  !tie
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !dynamicVolume,191,64
  !tie
  !tie
  !end

Track5C94:
  db 127,$7F
  !transpose,0
  !endSlide
  !instr,$19
  !pan,8
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  db 96
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$1D
  !pan,14
  !volume,160
  !dynamicVolume,191,192
  db 96
  !a5
  !tie
  !dynamicVolume,191,208
  !tie
  !tie
  !dynamicVolume,191,176
  !gs5
  !tie
  !dynamicVolume,191,112
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !f6
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !c7
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,120
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !pan,10
  !volume,240
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,192
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  !end

Track5D35:
  db 127,$7F
  !transpose,0
  !endSlide
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$19
  !pan,12
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
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
  db 48
  !tie
  !instr,$1D
  !pan,20
  !volume,176
  !dynamicVolume,191,120
  db 96
  !ds6
  !tie
  !dynamicVolume,191,56
  !tie
  !tie
  !loop : dw Sub5C4E : db 255
  !end

Track5D7A:
  db 127,$7F
  !transpose,0
  !endSlide
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  db 6
  !rest
  !instr,$1D
  !pan,6
  !volume,160
  !dynamicVolume,191,192
  db 96
  !a5
  !tie
  !dynamicVolume,191,144
  !tie
  !tie
  !dynamicVolume,191,176
  !gs5
  !tie
  !dynamicVolume,191,112
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !f6
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !volume,176
  !dynamicVolume,191,120
  !ds6
  !tie
  !dynamicVolume,191,56
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !c7
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,120
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !loop : dw Sub5C4E : db 255
  !end

Track5DDE:
  db 127,$7F
  !transpose,0
  !endSlide
  !instr,$23
  !volume,154
  !pan,10
  db 96
  !rest
  db 48
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !cs2
  !dynamicVolume,96,16
  !tie
  !volume,154
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !volume,170
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,170
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !d2
  !dynamicVolume,96,16
  !tie
  !volume,170
  !loop : dw Sub5C4E : db 255
  !end

Track5E1C:
  db 127,$7F
  !transpose,0
  !tempo,54
  !musicVolume,224
  !tremolo,4,16,80
  !instr,$18
  !pan,10
  !volume,160
  db 96
  !d6
  !tie
  !tie
  !tie
  !tie
  !tie
  !end

Track5E36:
  !instr,$18
  !pan,10
  !loop : dw Sub5E3F : db 5
  !end

Sub5E3F:
  !volume,160
  !dynamicVolume,208,192
  db 96
  !d6
  !tie
  !tie
  !dynamicVolume,208,160
  !tie
  !tie
  !tie
  !dynamicVolume,176,112
  !tie
  !tie
  !end

Track5E54:
  db 127,$7F
  !transpose,0
  !slideOut,5,19,254
  !pan,10
  !volume,255
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,192
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  !end

Track5E96:
  !pan,10
  db 96
  !rest
  !tie
  !volume,224
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,160
  !instr,$1A
  db 36
  !c6
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !c6
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  db 96
  !rest
  !tie
  !volume,224
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,176
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  db 96
  !rest
  !tie
  !volume,208
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,144
  !instr,$1A
  db 36
  !c6
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !c6
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$19
  !pan,12
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  db 96
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$1C
  !volume,32
  !dynamicVolume,255,64
  !pan,8
  !dynamicPan,255,10
  db 96
  !a7
  !tie
  !tie
  !tie
  !dynamicPan,192,12
  !dynamicVolume,192,32
  !tie
  !tie
  db 48
  !tie
  !loop : dw Sub5C4E : db 255
  !end

Track5F7B:
  db 127,$7F
  !transpose,0
  !slideOut,1,23,10
  !instr,$19
  !pan,10
  !volume,80
  !dynamicVolume,240,64
  db 12
  !rest
  db 96
  !d6
  !tie
  !tie
  !tie
  !tie
  db 84
  !tie
  !end

Track5F97:
  !instr,$19
  !pan,10
  !loop : dw Sub5FA0 : db 5
  !end

Sub5FA0:
  !volume,64
  !dynamicVolume,191,80
  db 96
  !d6
  !tie
  !dynamicVolume,191,96
  !tie
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !dynamicVolume,191,64
  !tie
  !tie
  !end

Track5FB8:
  db 127,$7F
  !transpose,0
  !slideOut,12,12,10
  !instr,$19
  !pan,8
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  db 96
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  !instr,$1D
  !pan,14
  !volume,160
  !dynamicVolume,191,192
  db 96
  !a5
  !tie
  !dynamicVolume,191,208
  !tie
  !tie
  !dynamicVolume,191,176
  !gs5
  !tie
  !dynamicVolume,191,112
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !f6
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !c7
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,120
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !pan,10
  !slideOut,5,19,254
  !volume,224
  !instr,$1A
  db 36
  !d5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !d5
  db 60
  !tie
  !pan,10
  !volume,192
  !instr,$1A
  db 36
  !as5
  !instr,$1B
  !pan,12
  !dynamicPan,102,8
  db 96
  !as5
  db 60
  !tie
  !pan,10
  !instr,$1A
  db 36
  !f5
  !instr,$1B
  !pan,8
  !dynamicPan,102,12
  db 96
  !f5
  db 60
  !tie
  !pan,10
  !end

Track6060:
  db 127,$7F
  !transpose,0
  !slideOut,1,23,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$19
  !pan,12
  !dynamicPan,255,10
  !volume,48
  !dynamicVolume,191,80
  !ds6
  !tie
  !dynamicVolume,191,80
  !tie
  !tie
  !tie
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
  db 48
  !tie
  !instr,$1D
  !pan,20
  !volume,176
  !dynamicVolume,191,120
  db 96
  !ds6
  !tie
  !dynamicVolume,191,56
  !tie
  !tie
  !loop : dw Sub5C4E : db 255
  !end

Track60A8:
  db 127,$7F
  !transpose,0
  !slideOut,5,19,254
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 48
  !tie
  db 6
  !rest
  !instr,$1D
  !pan,6
  !volume,160
  !dynamicVolume,191,192
  db 96
  !a5
  !tie
  !dynamicVolume,191,144
  !tie
  !tie
  !dynamicVolume,191,176
  !gs5
  !tie
  !dynamicVolume,191,112
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !f6
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !volume,176
  !dynamicVolume,191,120
  !ds6
  !tie
  !dynamicVolume,191,56
  !tie
  !tie
  !volume,48
  !dynamicVolume,191,128
  !c7
  !tie
  !dynamicVolume,191,176
  !tie
  !tie
  !dynamicVolume,191,120
  !tie
  !tie
  !dynamicVolume,191,40
  !tie
  !tie
  !loop : dw Sub5C4E : db 255
  !end

if defined("print_freespace")
  print "Song 78: Space left: $",hex($10000-(0*$800)-pc())
endif
assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
