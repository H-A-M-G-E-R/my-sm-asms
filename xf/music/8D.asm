asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$00,$C0
  db $19,$FF,$F0,$B8,$05,$55
  db $1A,$FF,$F0,$B8,$04,$F4
  db $1B,$FF,$F0,$B8,$04,$F4
  db $1C,$FC,$E3,$B8,$02,$7A
  db $1D,$FD,$E0,$B8,$05,$32
  db $1E,$FD,$E8,$B8,$02,$7B
  db $1F,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+2205
  dw Sample19,Sample19+576
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C+18
  dw Sample1D,Sample1D+27
  dw Sample1E,Sample1E+1062
  dw Sample1F,Sample1F+27
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_3f20d9deb006a2c155ae0ceb4f2311e9.brr")
  Sample19: skip filesize("Sample_bd72d694035b51beffc72510b314fd19.brr")
  Sample1A: skip filesize("Sample_9f3d2a485736a0b959a04bd44c0cf47b.brr")
  Sample1B: skip filesize("Sample_1fa5a00c1e9f4720443b33cef349150f.brr")
  Sample1C: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample1D: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1E: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1F: skip filesize("Sample_3ac9c767cae870ea42b9e05be3922f7a.brr")
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
Pattern5844: dw Track586B, Track58C8, Track5914, Track597E, Track59A7, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,160
  !echo,%00011100,47,47
  !echoParameters,2,16,5
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !echo,%00011100,47,47
  !echoParameters,2,16,5
  !instr,$18
  !pan,9
  !volume,97
  !dynamicVolume,190,177
  db 96
  !a6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,97
  db 96
  !rest
  db 72
  !tie
  !volume,97
  !dynamicVolume,190,177
  db 96
  !a6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,97
  db 96
  !rest
  db 72
  !tie
  !volume,97
  !dynamicVolume,190,145
  db 96
  !a6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,97
  db 96
  !rest
  db 72
  !tie
  !volume,97
  !dynamicVolume,190,145
  db 96
  !a6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,97
  db 96
  !rest
  db 72
  !tie
  !end

Track58C8:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,11
  db 96
  !rest
  !tie
  !volume,177
  !dynamicVolume,190,97
  !as6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,177
  db 96
  !rest
  db 72
  !tie
  !volume,177
  !dynamicVolume,190,97
  db 96
  !as6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,177
  db 96
  !rest
  db 72
  !tie
  !volume,145
  !dynamicVolume,190,97
  db 96
  !as6
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,145
  db 96
  !rest
  db 72
  !tie
  !volume,145
  !dynamicVolume,190,97
  db 96
  !gs6
  !tie
  !end

Track5914:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,104
  db 96
  !rest
  db 16
  !c4
  !c4
  !c4
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  db 56
  !c4
  !instr,$1A
  !volume,208
  db 96
  !rest
  db 16
  !c4
  !f3
  !fs3
  db 24
  !c3
  db 72
  !c3
  !instr,$1B
  !volume,160
  db 16
  !c4
  !c4
  !c4
  db 8
  !c4
  !c4
  !c4
  !c4
  !c4
  !c4
  db 24
  !c4
  !instr,$1A
  !volume,208
  db 96
  !rest
  db 24
  !c4
  !fs3
  !c3
  !f3
  db 72
  !fs3
  !instr,$1C
  !pan,9
  db 48
  !rest
  !volume,65
  !dynamicVolume,94,136
  !e5
  !ds5
  !dynamicVolume,94,65
  db 96
  !tie
  db 48
  !tie
  !instr,$1D
  !pan,11
  !volume,63
  !dynamicVolume,190,81
  db 96
  !a5
  !tie
  !pan,9
  !dynamicVolume,190,63
  !gs5
  !tie
  !end

Track597E:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !pan,8
  !volume,192
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  db 96
  !fs4
  db 72
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  !loop : dw Sub59A3 : db 255
  !end

Sub59A3:
  db 96
  !rest
  !tie
  !end

Track59A7:
  db 127,$7F
  !transpose,0
  !instr,$1E
  !pan,12
  !volume,192
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 24
  !tie
  db 120
  !fs4
  !instr,$1C
  !pan,11
  !volume,65
  !dynamicVolume,94,120
  db 48
  !f4
  !e4
  !dynamicVolume,94,65
  db 96
  !tie
  db 48
  !tie
  !instr,$1E
  !pan,11
  !volume,63
  !dynamicVolume,190,145
  db 96
  !a4
  !tie
  !pan,9
  !dynamicVolume,190,63
  !gs4
  !tie
  !end

if defined("print_freespace")
  print "Song 8D: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
