asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E5,$B8,$02,$7A
  db $19,$FF,$E3,$B8,$02,$7A
  db $1A,$FF,$EF,$B8,$08,$60
  db $1B,$FD,$87,$B8,$02,$99
  db $1C,$FF,$F4,$B8,$02,$99
  db $1D,$FF,$91,$B8,$05,$FE
  db $1E,$FF,$E0,$B8,$05,$32
  db $1F,$FF,$E0,$B8,$02,$99
  db $20,$FF,$F1,$B8,$04,$F4
  db $21,$FC,$F4,$B8,$02,$99
  db $22,$FF,$E0,$B8,$04,$F4
  db $23,$FF,$E0,$B8,$04,$F4
  db $24,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+1791
  dw Sample19,Sample19+2142
  dw Sample1A,Sample1A+18
  dw Sample1B_1C_21,Sample1B_1C_21+99
  dw Sample1B_1C_21,Sample1B_1C_21+99
  dw Sample1D,Sample1D+27
  dw Sample1E_1F,Sample1E_1F+27
  dw Sample1E_1F,Sample1E_1F+27
  dw Sample20,Sample20+576
  dw Sample1B_1C_21,Sample1B_1C_21+99
  dw Sample22,Sample22
  dw Sample23,Sample23
  dw Sample24,Sample24
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400 nspc
  Sample18: incbin "Sample_9397e4a518ad76499f1187b12a2171fe.brr"
  Sample19: incbin "Sample_e298086596e36db363badb019772c047.brr"
  Sample1A: incbin "Sample_53702d7ee57dd2aba4eb7253fe64a3fd.brr"
  Sample1B_1C_21: incbin "Sample_04ff79c5f0bfe47aa51f852ac2a1c870.brr"
  Sample1D: incbin "Sample_153af0a14dfa01b26538333fd4f5e4c1.brr"
  Sample1E_1F: incbin "Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"
  Sample20: incbin "Sample_bd72d694035b51beffc72510b314fd19.brr"
  Sample22: incbin "Sample_2f3350d5fcd8bf5eb5f2ab5c16532226.brr"
  Sample23: incbin "Sample_ff8b37e06639ca6f4c8983178b73c75f.brr"
  Sample24: incbin "Sample_da1530af58462df8494ebdc079f396b3.brr"

Trackers:
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track599D, Track5B56, Track5D9F, Track5EE7, Track610F, Track616B, 0
Pattern5856: dw Track58DB, Track59FF, Track5BAB, Track5DD3, Track5F24, Track6132, Track61D1, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,44
  !musicVolume,192
  !echo,%00011111,32,32
  !echoParameters,2,16,0
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,208
  db 96
  !as3
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,208
  db 48
  !rest
  db 96
  !rest
  !loop : dw Sub589B : db 1
  !end

Sub589B:
  db 24
  !rest
  !instr,$1A
  !volume,184
  !a3
  !as3
  db 96
  !e4
  db 24
  !a3
  !as3
  db 96
  !f4
  db 48
  !tie
  db 24
  !a3
  !as3
  db 96
  !g4
  db 48
  !tie
  db 24
  !a3
  !as3
  db 120
  !f4
  db 24
  !d4
  db 48
  !e4
  !dynamicVolume,48,16
  !tie
  !volume,184
  db 120
  !rest
  !instr,$1B
  !volume,240
  db 96
  !as3
  db 72
  !tie
  db 96
  !c4
  !tie
  !as3
  db 48
  !tie
  !dynamicVolume,48,16
  !tie
  !volume,240
  db 24
  !rest
  !end

Track58DB:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub589B : db 1
  !instr,$1A
  !volume,184
  db 24
  !rest
  !e4
  !f4
  db 120
  !d5
  db 24
  !rest
  !e4
  !f4
  db 96
  !c5
  db 48
  !rest
  db 24
  !e4
  !f4
  db 120
  !b4
  db 24
  !rest
  !e4
  !f4
  db 120
  !as4
  db 24
  !rest
  !a3
  !as3
  db 96
  !e4
  db 24
  !a3
  !as3
  db 96
  !f4
  db 48
  !tie
  db 24
  !a3
  !as3
  db 96
  !g4
  db 48
  !tie
  db 24
  !a3
  !as3
  db 96
  !f4
  db 72
  !tie
  !pan,12
  !instr,$1C
  !loop : dw Sub594F : db 4
  !loop : dw Sub597B : db 3
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub597B : db 2
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw Sub597B : db 2
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !pan,10
  !loop : dw Sub589B : db 1
  !end

Sub594F:
  !volume,32
  !dynamicVolume,208,128
  db 12
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !volume,128
  !dynamicVolume,96,32
  !a4
  !d5
  !a5
  !e6
  !a4
  !d5
  !a5
  !e6
  !end

Sub597B:
  !volume,128
  db 12
  !a4
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  !rest
  !e4
  !g4
  !a4
  db 48
  !rest
  !end

Track599D:
  db 127,$7F
  !transpose,0
  !pan,12
  !instr,$1C
  !volume,32
  !dynamicVolume,208,144
  !loop : dw Sub59ED : db 1
  !dynamicVolume,240,16
  !loop : dw Sub59ED : db 2
  !pan,10
  !instr,$18
  !volume,208
  db 72
  !rest
  db 120
  !gs3
  !volume,160
  db 96
  !g3
  !tie
  db 24
  !rest
  db 120
  !f3
  db 48
  !rest
  db 96
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  !rest
  !volume,240
  !instr,$1D
  db 24
  !a2
  !a2
  db 48
  !rest
  db 24
  !a2
  db 48
  !rest
  db 24
  !a2
  db 96
  !rest
  !tie
  db 24
  !g2
  !g2
  !rest
  !as2
  !end

Sub59ED:
  db 12
  !c5
  !g5
  !as5
  !c6
  !c5
  !g5
  !as5
  !c6
  !c5
  !g5
  !as5
  !c6
  !c5
  !g5
  !as5
  !c6
  !end

Track59FF:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,160
  db 96
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !rest
  db 120
  !gs3
  db 96
  !g3
  !tie
  db 120
  !f3
  db 72
  !rest
  !instr,$1D
  !volume,240
  db 36
  !a2
  !a2
  db 120
  !rest
  !instr,$1B
  !volume,208
  db 96
  !a3
  db 72
  !tie
  db 96
  !a3
  !tie
  !g3
  !tie
  db 24
  !rest
  !instr,$1E
  !volume,16
  !dynamicVolume,240,64
  !subtranspose,23
  db 96
  !c6
  !tie
  !tie
  !tie
  !tie
  !tie
  !pitchSlide,0,96 : !b5
  db 48
  !tie
  !dynamicVolume,48,16
  !tie
  !volume,16
  db 96
  !rest
  !subtranspose,0
  !instr,$18
  !volume,160
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  !rest
  db 96
  !gs3
  !g3
  !tie
  db 120
  !f3
  db 96
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
  db 72
  !tie
  !instr,$19
  !volume,128
  db 96
  !as3
  !tie
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,128
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
  !instr,$1E
  !volume,16
  !dynamicVolume,112,96
  !subtranspose,23
  db 96
  !e4
  !tie
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,16
  !volume,96
  !a4
  !rest
  db 96
  !g4
  db 72
  !d4
  db 96
  !f4
  db 48
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !g4
  !rest
  db 96
  !e4
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !volume,96
  db 96
  !e4
  !tie
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  !a4
  !rest
  db 96
  !g4
  db 72
  !d4
  db 96
  !f4
  db 48
  !tie
  db 24
  !rest
  !g4
  !rest
  db 120
  !e4
  db 24
  !c4
  !rest
  !d4
  db 120
  !a3
  db 24
  !rest
  !c4
  !rest
  db 96
  !as3
  db 72
  !tie
  db 24
  !rest
  db 120
  !g3
  db 24
  !rest
  !as3
  !rest
  db 96
  !a3
  !tie
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !subtranspose,0
  !instr,$18
  !volume,160
  db 96
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  db 24
  !rest
  !volume,208
  db 120
  !gs3
  !volume,160
  db 96
  !g3
  !tie
  db 24
  !rest
  !volume,192
  db 120
  !f3
  db 48
  !rest
  !volume,160
  db 96
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,160
  !instr,$1D
  !volume,240
  !rest
  db 12
  !a2
  !rest
  !a2
  db 60
  !rest
  db 24
  !a2
  db 48
  !rest
  db 24
  !a2
  db 96
  !rest
  !tie
  db 12
  !a2
  !rest
  !a2
  db 36
  !rest
  !volume,160
  db 24
  !a3
  db 96
  !rest
  !tie
  !end

Track5B56:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !instr,$19
  !volume,16
  !dynamicVolume,96,144
  !as3
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,16
  !instr,$1D
  !volume,224
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  !rest
  db 12
  !a2
  db 96
  !rest
  db 60
  !tie
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !e3
  !rest
  db 72
  !g2
  db 12
  !rest
  !e3
  !g3
  !a3
  db 36
  !c4
  db 12
  !rest
  db 24
  !a2
  db 12
  !rest
  db 24
  !a2
  db 96
  !rest
  db 36
  !tie
  !instr,$1B
  db 96
  !a3
  db 72
  !tie
  db 96
  !a3
  !tie
  !g3
  !tie
  db 24
  !rest
  !end

Track5BAB:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1D
  !volume,224
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  db 12
  !rest
  !a2
  db 24
  !rest
  db 12
  !a2
  !rest
  db 96
  !a2
  db 24
  !rest
  !a2
  db 48
  !rest
  db 72
  !a2
  db 24
  !rest
  !e3
  db 12
  !a2
  db 24
  !rest
  db 12
  !a2
  !rest
  !a2
  !a2
  !rest
  !a2
  !rest
  db 72
  !g2
  !instr,$18
  !volume,208
  db 96
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  !instr,$1D
  !rest
  db 12
  !a2
  !rest
  !a2
  db 60
  !rest
  db 24
  !a2
  db 48
  !rest
  db 12
  !a2
  db 96
  !rest
  !tie
  db 12
  !tie
  !a2
  !rest
  !a2
  db 36
  !rest
  db 24
  !a3
  db 72
  !d3
  !d3
  db 24
  !rest
  !a3
  db 72
  !d3
  !d3
  db 24
  !rest
  !gs3
  db 72
  !d3
  !d3
  db 24
  !rest
  !gs3
  db 72
  !d3
  !d3
  db 24
  !rest
  !as3
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  db 12
  !rest
  !a2
  db 24
  !rest
  !a2
  db 96
  !as2
  db 24
  !rest
  !a2
  db 48
  !rest
  db 72
  !a2
  db 24
  !rest
  !e3
  db 12
  !a2
  db 24
  !rest
  db 12
  !a2
  !rest
  !a2
  !a2
  !rest
  !a2
  !rest
  db 72
  !g2
  !instr,$1E
  !volume,32
  !dynamicVolume,96,160
  !subtranspose,23
  db 96
  !a2
  !tie
  !tie
  !volume,160
  !as2
  !g2
  !tie
  !instr,$1F
  !volume,192
  db 108
  !as2
  db 12
  !rest
  db 72
  !c3
  db 96
  !a2
  !tie
  !tie
  !tie
  !subtranspose,0
  !instr,$18
  !volume,192
  !as3
  !tie
  db 48
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  !rest
  db 96
  !rest
  !instr,$1D
  !volume,240
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  db 18
  !rest
  db 6
  !e3
  db 12
  !g3
  !a3
  db 24
  !a2
  db 12
  !rest
  db 96
  !a2
  db 12
  !rest
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !a3
  db 96
  !a2
  db 24
  !rest
  db 48
  !g2
  db 24
  !rest
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  db 18
  !rest
  db 6
  !e3
  db 12
  !g3
  !a3
  db 24
  !a2
  db 12
  !rest
  db 48
  !a2
  db 60
  !rest
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !g2
  !rest
  db 120
  !a2
  db 24
  !rest
  db 12
  !a2
  !rest
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !as2
  !rest
  db 12
  !a2
  !rest
  !a2
  !rest
  !a2
  db 108
  !rest
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  !rest
  !g3
  db 12
  !a3
  db 36
  !rest
  db 24
  !d3
  db 18
  !ds3
  db 6
  !rest
  db 18
  !e3
  db 30
  !rest
  db 96
  !a2
  db 48
  !tie
  db 24
  !rest
  !a3
  db 18
  !rest
  db 6
  !e3
  db 12
  !g3
  !a3
  db 24
  !a2
  db 12
  !rest
  db 48
  !a2
  db 60
  !rest
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !g2
  !rest
  db 120
  !a2
  db 24
  !rest
  db 12
  !a2
  !rest
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !g2
  !rest
  db 48
  !a2
  !rest
  db 12
  !e3
  db 36
  !rest
  db 96
  !a2
  db 48
  !tie
  !rest
  db 24
  !a3
  db 18
  !rest
  db 6
  !e3
  db 12
  !g3
  !a3
  db 24
  !a2
  db 12
  !rest
  db 48
  !a2
  db 60
  !rest
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !g2
  !rest
  db 120
  !a2
  db 24
  !rest
  db 36
  !a2
  db 60
  !rest
  db 66
  !a2
  db 6
  !rest
  db 48
  !a2
  db 96
  !rest
  db 18
  !g2
  db 6
  !rest
  db 24
  !g2
  db 96
  !rest
  db 72
  !tie
  db 24
  !rest
  !rest
  !a3
  !rest
  db 12
  !a2
  db 96
  !rest
  db 60
  !tie
  db 18
  !a2
  db 54
  !rest
  db 72
  !a2
  db 24
  !rest
  !e3
  !rest
  db 72
  !g2
  db 12
  !rest
  !e3
  !g3
  !a3
  db 36
  !c4
  db 12
  !rest
  db 24
  !a2
  db 12
  !rest
  db 24
  !a2
  db 96
  !rest
  db 36
  !tie
  !instr,$1B
  !volume,224
  db 96
  !a3
  db 72
  !tie
  db 96
  !a3
  !tie
  !g3
  !tie
  !rest
  !tie
  !end

Track5D9F:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !instr,$18
  !volume,176
  !g3
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,176
  !instr,$20
  !volume,56
  db 72
  !rest
  db 48
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !c4
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

Track5DD3:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !instr,$19
  !volume,32
  !dynamicVolume,96,128
  !g3
  db 72
  !tie
  !volume,128
  db 96
  !rest
  !tie
  db 24
  !tie
  db 96
  !g3
  !rest
  !tie
  !tie
  !g3
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  db 72
  !tie
  !instr,$1D
  !volume,96
  db 12
  !d5
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  !rest
  !d4
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  !rest
  !d5
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  !rest
  !d4
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  !rest
  !d5
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  !rest
  !d4
  !d4
  !d5
  !d5
  db 24
  !rest
  db 12
  !d4
  db 96
  !rest
  !tie
  !tie
  db 12
  !tie
  !instr,$19
  !volume,128
  db 96
  !g3
  !tie
  !rest
  !tie
  !g3
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
  !instr,$1E
  !volume,16
  !dynamicVolume,112,96
  !subtranspose,23
  !a3
  !tie
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,16
  !volume,96
  !e4
  !rest
  db 96
  !d4
  db 72
  !g3
  db 96
  !as3
  db 48
  !tie
  db 24
  !rest
  !c4
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
  !volume,96
  db 96
  !a3
  !tie
  !tie
  db 24
  !rest
  !e4
  !rest
  db 96
  !d4
  db 72
  !g3
  db 96
  !as3
  db 48
  !tie
  db 24
  !rest
  !c4
  !rest
  db 120
  !a3
  db 24
  !g3
  !rest
  !a3
  db 120
  !e3
  db 24
  !rest
  !g3
  !rest
  db 96
  !f3
  db 72
  !tie
  db 24
  !rest
  db 120
  !d3
  db 24
  !rest
  !f3
  !rest
  db 96
  !e3
  !tie
  !tie
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  !subtranspose,0
  !instr,$19
  !volume,128
  db 96
  !g3
  db 72
  !tie
  db 96
  !rest
  !tie
  db 24
  !tie
  db 96
  !g3
  !rest
  !tie
  !tie
  !g3
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !end

Track5EE7:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !instr,$19
  !volume,32
  !dynamicVolume,96,128
  !g3
  db 72
  !tie
  db 96
  !rest
  !tie
  db 24
  !tie
  !volume,32
  !dynamicVolume,96,144
  db 96
  !g3
  !rest
  !tie
  !tie
  !volume,32
  !dynamicVolume,96,144
  !g3
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !tie
  !instr,$20
  !volume,64
  db 48
  !c4
  !c4
  !c4
  db 24
  !c4
  !end

Track5F24:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$20
  !volume,64
  db 24
  !rest
  db 48
  !c4
  db 24
  !c4
  db 96
  !rest
  db 48
  !tie
  !volume,176
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !loop : dw Sub609A : db 4
  !loop : dw Sub60B2 : db 2
  !loop : dw Sub60CA : db 2
  !loop : dw Sub60DF : db 2
  db 96
  !rest
  !tie
  !tie
  !tie
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  !instr,$23
  db 24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$24
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  !instr,$23
  db 24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  !instr,$23
  db 24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  !rest
  !instr,$22
  !c4
  !instr,$22
  !c4
  !c4
  db 48
  !rest
  !instr,$23
  db 24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$24
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  !instr,$23
  db 24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  db 72
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$24
  !c4
  !c4
  db 48
  !rest
  !volume,120
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$24
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$24
  !c4
  !c4
  db 96
  !rest
  db 48
  !tie
  db 96
  !rest
  !tie
  !volume,176
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  db 24
  !c4
  db 72
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  db 24
  !c4
  db 72
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !loop : dw Sub60F7 : db 2
  !end

Sub609A:
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  db 72
  !rest
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Sub60B2:
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  !c4
  db 120
  !rest
  !instr,$22
  db 24
  !c4
  !rest
  !instr,$23
  !c4
  !c4
  db 48
  !rest
  !end

Sub60CA:
  !instr,$22
  db 24
  !c4
  db 72
  !rest
  db 24
  !c4
  !c4
  !rest
  !c4
  db 96
  !rest
  !instr,$22
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Sub60DF:
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  db 72
  !rest
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Sub60F7:
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  db 72
  !rest
  !instr,$22
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Track610F:
  db 127,$7F
  !transpose,0
  !pan,8
  db 9
  !rest
  !instr,$21
  !volume,32
  !dynamicVolume,208,144
  !loop : dw Sub59ED : db 1
  !dynamicVolume,240,16
  !loop : dw Sub59ED : db 2
  !loop : dw Sub612E : db 255
  !end

Sub612E:
  db 96
  !rest
  !tie
  !end

Track6132:
  db 127,$7F
  !transpose,0
  !loop : dw Sub6163 : db 16
  !instr,$21
  !pan,8
  db 9
  !rest
  !loop : dw Sub594F : db 4
  !loop : dw Sub597B : db 3
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub597B : db 2
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !loop : dw Sub597B : db 2
  !loop : dw Sub6167 : db 255
  !end

Sub6163:
  db 96
  !rest
  !tie
  !end

Sub6167:
  db 96
  !rest
  !tie
  !end

Track616B:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,56
  !loop : dw Sub61A7 : db 2
  !instr,$22
  !volume,160
  db 24
  !c4
  !instr,$20
  !volume,64
  !c4
  !rest
  !c4
  !instr,$22
  !volume,160
  !c4
  !c4
  db 72
  !rest
  !instr,$20
  !volume,64
  db 24
  !c4
  !rest
  !c4
  !instr,$22
  !volume,160
  !c4
  !c4
  db 48
  !rest
  !loop : dw Sub61B3 : db 2
  !instr,$24
  !loop : dw Sub61BD : db 2
  !end

Sub61A7:
  !instr,$20
  db 24
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  !end

Sub61B3:
  db 24
  !c4
  db 72
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Sub61BD:
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !rest
  !c4
  db 72
  !rest
  db 24
  !c4
  db 48
  !rest
  db 24
  !c4
  !c4
  db 48
  !rest
  !end

Track61D1:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$22
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$23
  !c4
  !instr,$20
  !volume,64
  !c4
  !rest
  !c4
  !loop : dw Sub61A7 : db 1
  !loop : dw Sub6224 : db 10
  !loop : dw Sub61A7 : db 2
  !loop : dw Sub6224 : db 2
  !volume,56
  !loop : dw Sub61A7 : db 32
  !instr,$22
  !volume,160
  db 24
  !c4
  !instr,$20
  !volume,64
  !c4
  !rest
  !c4
  !instr,$22
  !volume,160
  !c4
  !c4
  !rest
  !instr,$20
  !volume,64
  !c4
  !loop : dw Sub61A7 : db 1
  !loop : dw Sub6224 : db 2
  !loop : dw Sub6232 : db 255
  !end

Sub6224:
  !instr,$20
  !volume,56
  db 24
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !end

Sub6232:
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
