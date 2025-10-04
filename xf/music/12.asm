asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Sector 3 (PYR)

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$F4,$E4,$B8,$09,$EC
  db $19,$FE,$E3,$B8,$04,$F4
  db $1A,$FE,$E3,$B8,$05,$32
  db $1B,$DF,$E6,$B8,$09,$EC
  db $1C,$FD,$F2,$B8,$0A,$67
  db $1D,$FF,$E0,$B8,$02,$80
  db $1E,$FF,$F2,$B8,$03,$40
  db $1F,$FF,$F2,$B8,$03,$40
  db $20,$FF,$F2,$B8,$03,$40
  db $21,$FF,$F2,$B8,$03,$40
  db $22,$FF,$E0,$B8,$03,$40
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_1B,Sample18_1B+1062
  dw Sample19,Sample19+45
  dw Sample1A,Sample1A+27
  dw Sample18_1B,Sample18_1B+1062
  dw Sample1C,Sample1C+513
  dw Sample1D,Sample1D
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18_1B: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample19: skip filesize("Sample_70088be2c42db8f26aa5a6014a2e9398.brr")
  Sample1A: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1C: skip filesize("Sample_441d4eac476cad49850f2c9cc81a9aec.brr")
  Sample1D: skip filesize("Sample_d7596b127b18d933aa6356888257f6c3.brr")
  Sample1E_1F_20_21_22: skip filesize("Sample_2822bad39b87fb8c53e54a49b8a625f0.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5840
-
  dw Pattern5850
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5860
-
  dw Pattern5860
  dw $00FF,-
  dw $0000

Pattern5840: dw Track5870, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track5887, Track58A2, Track5927, Track5997, Track5A2E, Track5A97, 0, 0
Pattern5860: dw Track5AD8, Track5AFF, Track5B12, Track5B29, 0, 0, 0, 0

Track5870:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,20
  !musicVolume,192
  !echo,%00001111,48,48
  !echoParameters,4,64,1
  !end

Track5887:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,192
  !echo,%00001111,48,48
  !echoParameters,4,64,1
  !instr,$18
  !loop : dw Sub589E : db 14
  !end

Sub589E:
  db 96
  !cs2
  !tie
  !end

Track58A2:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,112
  db 96
  !cs4
  !b3
  !dynamicVolume,192,80
  !d4
  !tie
  !volume,112
  db 48
  !f4
  !dynamicVolume,48,16
  !tie
  !volume,112
  !instr,$1A
  !volume,32
  !dynamicVolume,64,144
  db 96
  !b3
  !volume,144
  !as3
  !d4
  !volume,112
  !b4
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,112
  db 96
  !rest
  !volume,144
  !d3
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,144
  !instr,$19
  !volume,112
  db 96
  !cs4
  !tie
  db 48
  !d4
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !e4
  !tie
  db 48
  !d4
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !e4
  !tie
  db 48
  !f4
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !instr,$1A
  !volume,48
  !dynamicVolume,64,128
  !cs5
  !tie
  !volume,128
  !b4
  db 48
  !as4
  !dynamicVolume,48,16
  !tie
  !volume,128
  !loop : dw Sub5923 : db 255
  !end

Sub5923:
  db 96
  !rest
  !tie
  !end

Track5927:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,80
  db 96
  !gs3
  !g3
  !as3
  !tie
  db 48
  !cs4
  !dynamicVolume,48,16
  !tie
  !volume,80
  db 96
  !rest
  !tie
  !tie
  !instr,$1A
  !volume,112
  !f4
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,112
  db 96
  !rest
  db 48
  !tie
  !volume,144
  !b3
  !dynamicVolume,48,16
  !tie
  !volume,144
  !instr,$19
  !volume,112
  db 96
  !gs3
  !tie
  db 48
  !b3
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !cs4
  !tie
  db 48
  !b3
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !cs4
  !tie
  db 48
  !d4
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !instr,$1A
  !volume,48
  !dynamicVolume,64,128
  !gs4
  !tie
  !dynamicVolume,192,32
  !gs4
  !tie
  !loop : dw Sub5923 : db 255
  !end

Track5997:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !instr,$1B
  !volume,208
  db 24
  !cs2
  db 72
  !rest
  db 12
  !cs2
  !rest
  db 24
  !cs2
  db 96
  !rest
  db 12
  !cs2
  !cs2
  !cs2
  db 6
  !cs2
  !cs2
  db 24
  !cs2
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 72
  !tie
  db 12
  !cs2
  !rest
  db 24
  !cs2
  db 96
  !rest
  db 12
  !cs2
  !cs2
  !cs2
  db 6
  !cs2
  !cs2
  db 24
  !cs2
  db 72
  !rest
  db 24
  !cs2
  db 72
  !rest
  !instr,$19
  !volume,112
  db 48
  !g3
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !instr,$1B
  !volume,208
  db 24
  !cs2
  db 72
  !rest
  db 24
  !cs2
  db 72
  !rest
  !instr,$19
  !volume,112
  db 48
  !g3
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !instr,$1B
  !volume,208
  db 24
  !cs2
  db 72
  !rest
  db 24
  !cs2
  !rest
  !cs2
  !rest
  !instr,$19
  !volume,112
  db 48
  !as3
  !dynamicVolume,48,16
  !tie
  !volume,112
  db 96
  !rest
  !instr,$1B
  !volume,208
  db 24
  !cs2
  db 72
  !rest
  db 24
  !cs2
  db 72
  !rest
  db 12
  !cs2
  !rest
  db 24
  !cs2
  !loop : dw Sub5923 : db 255
  !end

Track5A2E:
  db 127,$7F
  !transpose,0
  !pan,10
  db 48
  !rest
  !instr,$1C
  !volume,128
  !transpose,6
  db 24
  !c3
  db 96
  !rest
  !tie
  !tie
  !tie
  db 72
  !tie
  db 30
  !c3
  db 66
  !rest
  db 30
  !c3
  db 66
  !rest
  !volume,48
  !dynamicVolume,48,128
  db 12
  !c3
  !c3
  !c3
  db 6
  !c3
  !c3
  db 24
  !c3
  db 96
  !rest
  db 24
  !c3
  db 96
  !rest
  !tie
  !tie
  db 24
  !c3
  db 96
  !rest
  !tie
  db 48
  !tie
  db 24
  !c3
  db 96
  !rest
  db 24
  !c3
  db 72
  !rest
  !volume,48
  !dynamicVolume,48,128
  db 12
  !c3
  !c3
  !c3
  db 6
  !c3
  !c3
  db 12
  !c3
  !rest
  !c3
  db 84
  !rest
  db 24
  !c3
  db 96
  !rest
  db 24
  !c3
  db 96
  !rest
  !tie
  !tie
  db 72
  !tie
  db 24
  !c3
  !loop : dw Sub5923 : db 255
  !end

Track5A97:
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
  !instr,$1B
  !volume,208
  db 12
  !cs2
  !rest
  db 24
  !cs2
  db 96
  !rest
  db 24
  !cs2
  db 96
  !rest
  !tie
  db 24
  !tie
  db 12
  !cs2
  db 96
  !rest
  !tie
  !tie
  db 84
  !tie
  db 12
  !cs2
  !rest
  db 24
  !cs2
  db 72
  !rest
  db 12
  !cs2
  db 36
  !rest
  db 24
  !cs2
  !loop : dw Sub5923 : db 255
  !end

Track5AD8:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !musicVolume,192
  db 127,$7F
  !transpose,0
  !pan,11
  !echo,%00001111,48,48
  !echoParameters,4,64,1
  !tempo,41
  !instr,$1D
  !volume,160
  !loop : dw Sub5AFB : db 255
  !end

Sub5AFB:
  db 48
  !cs4
  !rest
  !end

Track5AFF:
  db 127,$7F
  !transpose,0
  !pan,9
  !instr,$1D
  !volume,160
  !loop : dw Sub5B0E : db 255
  !end

Sub5B0E:
  db 48
  !rest
  !cs4
  !end

Track5B12:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,192
  !instr,$18
  !loop : dw Sub5B21 : db 14
  !end

Sub5B21:
  !instr,$18
  db 96
  !cs2
  !tie
  !tie
  !tie
  !end

Track5B29:
  db 127,$7F
  !transpose,255
  !pan,10
  !volume,128
  !instr,$0E
  !loop : dw Sub5B38 : db 255
  !end

Sub5B38:
  db 12
  !cs3
  !c3
  !rest
  !d3
  !cs3
  !rest
  !e3
  !c3
  !rest
  db 24
  !d3
  db 12
  !rest
  !rest
  !c3
  !c3
  !cs3
  !d3
  !c3
  !e3
  !c3
  !rest
  !rest
  !rest
  !rest
  !d3
  !c3
  !e3
  !c3
  !end

if defined("print_freespace")
  print "Song 12: Space left: $",hex($10000-(4*$800)-pc())
endif
assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
