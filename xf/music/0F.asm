asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FD,$E3,$B8,$0B,$FD
  db $19,$FF,$F1,$B8,$04,$F4
  db $1A,$FA,$48,$B8,$02,$7A
  db $1B,$FF,$E7,$B8,$04,$F4
  db $1C,$FF,$E7,$B8,$04,$F4
  db $1D,$FF,$E7,$B8,$04,$F4
  db $1E,$F9,$D6,$B8,$02,$60
  db $1F,$FF,$F1,$B8,$02,$60
  db $20,$FF,$F3,$B8,$09,$FC
  db $21,$77,$E7,$0F,$0A,$A0
  db $22,$FF,$E7,$B8,$04,$F4
  db $23,$FF,$F5,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19,Sample19+1053
  dw Sample1A,Sample1A+18
  dw Sample1B,Sample1B+432
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E+261
  dw Sample1F,Sample1F+450
  dw Sample20,Sample20+1062
  dw Sample21,Sample21+513
  dw Sample22,Sample22
  dw Sample23,Sample23+495
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_153af0a14dfa01b26538333fd4f5e4c1.brr")
  Sample19: skip filesize("Sample_13e81bb8014411c52017120ee1c36250.brr")
  Sample1A: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample1B: skip filesize("Sample_ad67229b04d0d78fc5b618649e1045ce.brr")
  Sample1C: skip filesize("Sample_fac2c1c52b2a74bef3744c7b5eabc4d0.brr")
  Sample1D: skip filesize("Sample_16ce10a533ccd74ee3344332de770cec.brr")
  Sample1E: skip filesize("Sample_9bfc0e2aad37b40de39f503a14d4104d.brr")
  Sample1F: skip filesize("Sample_787b5f8b3014c08b47c0c0bad88c046f.brr")
  Sample20: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample21: skip filesize("Sample_441d4eac476cad49850f2c9cc81a9aec.brr")
  Sample22: skip filesize("Sample_c1125a8f0cdd64461116ab45700cf085.brr")
  Sample23: skip filesize("Sample_c434725161d61d00367792494d4c6be3.brr")
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
Pattern5844: dw Track586B, Track59DE, Track5A77, Track5B66, Track5C39, Track5CB4, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,34
  !musicVolume,224
  !echo,%00011110,32,32
  !echoParameters,2,8,0
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !pan,10
  !echo,%00011110,32,32
  !echoParameters,2,8,0
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$18
  !volume,208
  db 24
  !rest
  db 96
  !g2
  db 48
  !tie
  !dynamicVolume,60,16
  db 60
  !tie
  !volume,208
  !instr,$19
  !volume,176
  db 96
  !c4
  !rest
  !tie
  db 84
  !tie
  !instr,$1A
  !volume,208
  db 96
  !fs4
  !dynamicVolume,72,16
  db 72
  !tie
  !volume,208
  !loop : dw Sub598B : db 1
  !volume,144
  !instr,$1B
  db 24
  !c4
  !instr,$1C
  db 36
  !c4
  !volume,112
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !instr,$1B
  db 24
  !c4
  db 6
  !c4
  db 18
  !rest
  !volume,112
  !instr,$1C
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !c4
  !instr,$1B
  !c4
  !c4
  db 24
  !rest
  !instr,$1C
  !c4
  !volume,112
  db 6
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  !loop : dw Sub598B : db 2
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  db 96
  !fs4
  db 48
  !g4
  db 96
  !e4
  db 48
  !fs4
  !dynamicVolume,96,144
  db 96
  !cs4
  db 48
  !tie
  !dynamicVolume,96,208
  db 96
  !d4
  db 48
  !tie
  !instr,$1E
  !loop : dw Sub59C9 : db 1
  db 96
  !rest
  db 66
  !tie
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  db 96
  !fs4
  db 48
  !g4
  db 96
  !a4
  db 48
  !b4
  db 96
  !c5
  db 24
  !b4
  !a4
  db 96
  !b4
  db 48
  !g4
  db 96
  !gs4
  !tie
  !tie
  !d4
  db 48
  !tie
  !volume,208
  db 96
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  !instr,$1F
  !volume,176
  db 12
  !cs5
  db 24
  !rest
  !volume,160
  db 12
  !cs5
  db 24
  !rest
  !volume,144
  db 12
  !gs4
  !rest
  !instr,$1E
  !loop : dw Sub59C9 : db 1
  db 66
  !rest
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  db 96
  !d5
  db 24
  !cs5
  !b4
  db 96
  !cs5
  !dynamicVolume,96,144
  db 48
  !a4
  db 96
  !b4
  db 48
  !g4
  db 96
  !b4
  db 48
  !d5
  !dynamicVolume,96,208
  db 96
  !f5
  db 48
  !tie
  db 96
  !fs5
  db 48
  !tie
  db 96
  !g5
  db 48
  !tie
  !volume,208
  db 96
  !gs5
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  !end

Sub598B:
  !volume,144
  !instr,$1B
  db 24
  !c4
  !instr,$1C
  db 36
  !c4
  !volume,112
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !instr,$1B
  db 24
  !c4
  db 6
  !c4
  db 18
  !rest
  !volume,112
  !instr,$1C
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !c4
  !instr,$1B
  !c4
  !c4
  db 24
  !rest
  !instr,$1C
  !c4
  !volume,112
  db 12
  !c4
  !c4
  !volume,144
  !instr,$1D
  !c4
  !instr,$1B
  !c4
  !end

Sub59C9:
  !volume,176
  db 18
  !cs5
  !volume,160
  !cs5
  !volume,144
  !cs5
  !volume,128
  db 24
  !cs5
  !volume,112
  !cs5
  !volume,96
  !cs5
  !end

Track59DE:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$20
  !volume,255
  !loop : dw Sub5A4A : db 4
  !loop : dw Sub5A52 : db 1
  !loop : dw Sub5A4A : db 3
  !loop : dw Sub5A65 : db 1
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A52 : db 1
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A65 : db 1
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A52 : db 1
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A65 : db 1
  !loop : dw Sub5A4A : db 3
  !loop : dw Sub5A65 : db 1
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A65 : db 2
  !loop : dw Sub5A4A : db 1
  !loop : dw Sub5A65 : db 1
  !loop : dw Sub5A4A : db 3
  !instr,$1A
  !volume,208
  db 96
  !fs3
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  !instr,$20
  !volume,255
  !loop : dw Sub5A4A : db 255
  !end

Sub5A4A:
  db 12
  !cs2
  db 24
  !rest
  !cs2
  db 84
  !rest
  !end

Sub5A52:
  db 12
  !cs2
  db 24
  !rest
  !cs2
  db 60
  !rest
  !instr,$21
  !volume,176
  db 12
  !c4
  !c4
  !instr,$20
  !volume,255
  !end

Sub5A65:
  db 12
  !cs2
  db 24
  !rest
  !cs2
  db 72
  !rest
  !instr,$21
  !volume,176
  db 12
  !c4
  !instr,$20
  !volume,255
  !end

Track5A77:
  db 127,$7F
  !transpose,0
  !pan,10
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
  db 24
  !tie
  !instr,$1A
  !volume,208
  db 96
  !cs4
  !dynamicVolume,72,16
  db 72
  !tie
  !volume,208
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
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  !gs3
  db 48
  !a3
  db 96
  !fs3
  db 48
  !gs3
  db 96
  !rest
  db 84
  !tie
  !instr,$21
  !volume,176
  db 12
  !c4
  db 96
  !rest
  !tie
  !tie
  !tie
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  !gs3
  db 48
  !a3
  db 96
  !b3
  db 48
  !cs4
  !instr,$1E
  !loop : dw Sub59C9 : db 1
  db 18
  !rest
  !instr,$1A
  !volume,208
  db 96
  !c4
  db 48
  !tie
  !volume,208
  db 96
  !fs4
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,208
  !rest
  db 48
  !tie
  !instr,$20
  !volume,255
  db 12
  !cs2
  db 24
  !rest
  db 12
  !cs2
  !instr,$21
  !volume,208
  !c4
  !c4
  !c4
  !c4
  !c4
  db 6
  !c4
  !c4
  db 12
  !c4
  db 6
  !c4
  db 24
  !c4
  !dynamicVolume,24,16
  !tie
  !volume,208
  db 96
  !rest
  !tie
  !tie
  db 54
  !tie
  !instr,$1E
  !loop : dw Sub59C9 : db 1
  db 66
  !rest
  !instr,$1A
  !volume,192
  db 96
  !a4
  !tie
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,192
  !rest
  !instr,$1F
  !volume,160
  db 12
  !cs5
  db 24
  !rest
  db 12
  !cs5
  db 24
  !rest
  db 12
  !gs4
  db 60
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !d5
  db 24
  !rest
  db 12
  !gs4
  db 60
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !ds5
  db 24
  !rest
  db 12
  !e5
  db 24
  !rest
  db 12
  !e5
  db 24
  !rest
  db 12
  !e5
  db 96
  !rest
  !tie
  !end

Track5B66:
  db 127,$7F
  !transpose,0
  !pan,10
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
  !loop : dw Sub598B : db 1
  !loop : dw Sub5BFE : db 1
  !loop : dw Sub598B : db 1
  !loop : dw Sub5BFE : db 1
  !instr,$1A
  !volume,208
  db 96
  !d4
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,208
  !volume,144
  !instr,$1B
  db 24
  !c4
  !instr,$1C
  db 36
  !c4
  !volume,112
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !instr,$1B
  db 24
  !c4
  db 6
  !c4
  db 18
  !rest
  !volume,112
  !instr,$1C
  db 12
  !c4
  !loop : dw Sub5BFE : db 1
  !loop : dw Sub598B : db 1
  !loop : dw Sub5BFE : db 1
  !instr,$1A
  !volume,48
  !dynamicVolume,96,208
  db 96
  !a4
  db 48
  !tie
  db 96
  !gs4
  db 48
  !tie
  !loop : dw Sub5BFE : db 1
  !instr,$1A
  !volume,208
  db 96
  !b4
  db 48
  !tie
  db 96
  !c5
  db 48
  !tie
  !volume,192
  db 96
  !cs5
  db 48
  !tie
  !volume,176
  db 96
  !d5
  db 48
  !tie
  db 96
  !rest
  !tie
  !end

Sub5BFE:
  !volume,144
  !instr,$1B
  db 24
  !c4
  !instr,$1C
  db 36
  !c4
  !volume,112
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !instr,$1B
  db 24
  !c4
  db 6
  !c4
  db 18
  !rest
  !volume,112
  !instr,$1C
  db 12
  !c4
  !volume,144
  !instr,$1D
  !c4
  !c4
  !instr,$1B
  !c4
  !c4
  db 24
  !rest
  !instr,$1C
  !c4
  !rest
  !volume,112
  !instr,$1B
  db 12
  !c4
  !instr,$1C
  !g4
  !end

Track5C39:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$22
  !loop : dw Sub5CA0 : db 1
  !volume,176
  db 12
  !cs4
  !rest
  !volume,128
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !volume,176
  !cs4
  !rest
  !volume,176
  !cs4
  !rest
  !volume,128
  !cs4
  !rest
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !volume,176
  !cs4
  !instr,$21
  !c4
  !instr,$22
  !loop : dw Sub5CA0 : db 2
  !volume,176
  db 12
  !cs4
  !rest
  !volume,128
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !volume,176
  !cs4
  !rest
  !volume,176
  !cs4
  !rest
  !volume,128
  !cs4
  !rest
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !volume,176
  !cs4
  !instr,$21
  !c4
  !instr,$22
  !loop : dw Sub5CA0 : db 255
  !end

Sub5CA0:
  !volume,176
  db 12
  !cs4
  !rest
  !volume,128
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !cs4
  !volume,176
  db 24
  !cs4
  !end

Track5CB4:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$23
  !volume,96
  !loop : dw Sub5CC3 : db 255
  !end

Sub5CC3:
  db 24
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
