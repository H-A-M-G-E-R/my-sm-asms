asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$EA,$B8,$02,$7B
  db $19,$FF,$F4,$B8,$02,$99
  db $1A,$FF,$F0,$B8,$01,$3D
  db $1B,$FD,$E0,$B8,$00,$9E
  db $1C,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+1062
  dw Sample19,Sample19+27
  dw Sample1A,Sample1A+1899
  dw Sample1B,Sample1B+234
  dw Sample1C,Sample1C
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample19: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1A: skip filesize("Sample_2264c24a6f5bdd42acc939287e1398fc.brr")
  Sample1B: skip filesize("Sample_0ca2e923494667f4c3a148f312b12259.brr")
  Sample1C: skip filesize("Sample_f092f99be4d94f2fe921fc8664977f59.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern583E
  dw Pattern584E
-
  dw Pattern585E
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern583E
  dw Pattern586E
  dw $0000

Pattern583E: dw Track587E, 0, 0, 0, 0, 0, 0, 0
Pattern584E: dw Track59DD, Track5A55, Track5895, Track58FE, Track5967, 0, 0, 0
Pattern585E: dw Track58B3, Track591C, Track5979, Track59EF, Track5A67, 0, 0, 0
Pattern586E: dw Track5A40, Track5AAA, Track58EB, Track5954, Track59C8, 0, 0, 0

Track587E:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,176
  !echo,%00011111,31,31
  !echoParameters,1,8,4
  !end

Track5895:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,12
  !dynamicPan,190,8
  db 96
  !c6
  !tie
  !instr,$1B
  !pan,6
  !volume,63
  !dynamicVolume,192,127
  !b6
  !tie
  db 48
  !tie
  !end

Track58B3:
  !instr,$1B
  !pan,6
  !volume,159
  !dynamicVolume,192,79
  db 96
  !b6
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !loop : dw Sub58D3 : db 3
  !end

Sub58D3:
  !volume,159
  !dynamicVolume,192,79
  db 96
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !end

Track58EB:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,12
  !dynamicPan,190,8
  db 96
  !c6
  !tie
  db 48
  !tie
  !end

Track58FE:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,8
  !dynamicPan,190,12
  db 96
  !c6
  !tie
  !instr,$1B
  !pan,14
  !volume,63
  !dynamicVolume,192,127
  !f6
  !tie
  db 48
  !tie
  !end

Track591C:
  !instr,$1B
  !pan,14
  !volume,159
  !dynamicVolume,192,79
  db 96
  !f6
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !loop : dw Sub593C : db 3
  !end

Sub593C:
  !volume,159
  !dynamicVolume,192,79
  db 96
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !dynamicVolume,192,79
  !tie
  !tie
  !dynamicVolume,192,159
  !tie
  !tie
  !end

Track5954:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,240
  !pan,8
  !dynamicPan,190,12
  db 96
  !c6
  !tie
  db 48
  !tie
  !end

Track5967:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,12
  db 96
  !c4
  !tie
  !tie
  !tie
  !rest
  !tie
  !end

Track5979:
  !instr,$19
  !pan,12
  !loop : dw Sub5982 : db 255
  !end

Sub5982:
  !volume,81
  !pan,8
  db 32
  !as6
  !pan,10
  !c7
  !pan,12
  !c7
  !pan,10
  !d7
  !pan,8
  !as6
  !pan,10
  !c7
  !volume,95
  !pan,12
  !c7
  !pan,10
  !d7
  !pan,8
  !as6
  !pan,10
  !c7
  !pan,12
  !c7
  !pan,10
  !d7
  !volume,111
  !pan,8
  !as6
  !pan,10
  !c7
  !pan,12
  !c7
  !pan,10
  !d7
  !pan,8
  !as6
  !pan,10
  !c7
  !volume,95
  !pan,12
  !c7
  !pan,10
  !d7
  !end

Track59C8:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,12
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  !end

Track59DD:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,8
  db 96
  !c4
  !tie
  !tie
  !tie
  !rest
  !tie
  !end

Track59EF:
  !instr,$19
  !pan,8
  db 16
  !rest
  !loop : dw Sub59FA : db 255
  !end

Sub59FA:
  !volume,81
  !pan,8
  db 32
  !b6
  !pan,10
  !cs7
  !pan,12
  !cs7
  !pan,10
  !ds7
  !pan,8
  !b6
  !pan,10
  !cs7
  !volume,95
  !pan,12
  !cs7
  !pan,10
  !ds7
  !pan,8
  !b6
  !pan,10
  !cs7
  !pan,12
  !cs7
  !pan,10
  !ds7
  !volume,111
  !pan,8
  !b6
  !pan,10
  !cs7
  !pan,12
  !cs7
  !pan,10
  !ds7
  !pan,8
  !b6
  !pan,10
  !cs7
  !volume,95
  !pan,12
  !cs7
  !pan,10
  !ds7
  !end

Track5A40:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,8
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  !end

Track5A55:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,10
  db 96
  !c4
  !tie
  !tie
  !tie
  !rest
  !tie
  !end

Track5A67:
  !instr,$19
  !volume,81
  !pan,10
  !loop : dw Sub5A72 : db 255
  !end

Sub5A72:
  !dynamicVolume,191,97
  db 8
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !dynamicVolume,191,81
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !e6
  !f6
  !end

Track5AAA:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !pan,10
  db 96
  !c4
  !dynamicVolume,144,16
  !tie
  db 48
  !tie
  !volume,208
  !end

if defined("print_freespace")
  print "Song 39: Space left: $",hex($10000-(1*$800)-pc())
endif
assert pc() <= $10000-(1*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
