asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$01,$3D
  db $19,$FF,$E0,$B8,$01,$3D
  db $1A,$FF,$E0,$B8,$01,$3D
  db $1B,$FF,$F0,$B8,$02,$D8
  db $1C,$FF,$F0,$B8,$08,$00
  db $1D,$FF,$F0,$B8,$04,$00
  db $1E,$FF,$E0,$B8,$04,$00
  db $1F,$FF,$E0,$B8,$00,$F0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+81
  dw Sample19,Sample19+18
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B+27
  dw Sample1C,Sample1C+18
  dw Sample1D,Sample1D+27
  dw Sample1E,Sample1E+18
  dw Sample1F,Sample1F+27
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_8a3327ee61035255db2da136287c76a7.brr")
  Sample19: skip filesize("Sample_c2ea4842d6ecf1dd81b09409f7a94929.brr")
  Sample1A: skip filesize("Sample_48972f703281c1d2c6c9c1ccdd3c3f4b.brr")
  Sample1B: skip filesize("Sample_2e1822edc659430c60ca1e822fefddc2.brr")
  Sample1C: skip filesize("Sample_3841b4150856deb8b8ee01fe35f497c3.brr")
  Sample1D: skip filesize("Sample_3ac9c767cae870ea42b9e05be3922f7a.brr")
  Sample1E: skip filesize("Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr")
  Sample1F: skip filesize("Sample_9c53668a1b04c36d5bf80793049ec6c7.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5842
  dw Pattern5862
-
  dw Pattern5872
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5852
-
  dw Pattern5882
  dw $00FF,-
  dw $0000

Pattern5842: dw Track5892, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track58A9, 0, 0, 0, 0, 0, 0, 0
Pattern5862: dw Track58C3, Track58F6, Track593D, Track595F, 0, 0, 0, 0
Pattern5872: dw Track58D8, Track590E, Track5952, Track5980, Track5992, Track59C8, 0, 0
Pattern5882: dw Track5A1B, Track5A3C, Track5980, 0, 0, 0, 0, 0

Track5892:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,160
  !echo,%00011110,31,31
  !echoParameters,4,16,5
  !end

Track58A9:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,48
  !dynamicMusicVolume,192,128
  !echo,%00011110,31,31
  !echoParameters,4,16,5
  !end

Track58C3:
  db 127,$7F
  !transpose,0
  !instr,$18
  !pan,10
  !volume,48
  !dynamicVolume,192,160
  db 96
  !c6
  !tie
  !c6
  !tie
  db 36
  !tie
  !end

Track58D8:
  db 127,$7F
  !transpose,0
  !echo,%00011110,31,31
  !echoParameters,4,16,5
  !instr,$18
  !pan,10
  !volume,160
  db 96
  !c6
  !tie
  !loop : dw Sub58F2 : db 6
  !end

Sub58F2:
  db 96
  !tie
  !tie
  !end

Track58F6:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,12
  db 96
  !rest
  !tie
  !volume,48
  !dynamicVolume,192,72
  !dynamicPan,176,8
  !c6
  !tie
  db 36
  !tie
  !end

Track590E:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,8
  !volume,72
  !dynamicPan,176,12
  db 96
  !c6
  !tie
  !dynamicPan,176,8
  !tie
  !tie
  !dynamicPan,176,12
  !tie
  !tie
  !dynamicPan,176,8
  !tie
  !tie
  !dynamicPan,176,12
  !tie
  !tie
  !dynamicPan,176,8
  !tie
  !tie
  !dynamicPan,176,12
  !tie
  !tie
  !end

Track593D:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,10
  !loop : dw Sub594A : db 255
  !end

Sub594A:
  !volume,80
  db 84
  !c6
  !volume,80
  !c6
  !end

Track5952:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !pan,10
  !loop : dw Sub594A : db 255
  !end

Track595F:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !instr,$1B
  !pan,10
  !volume,159
  db 48
  !as3
  !volume,169
  !as3
  !volume,175
  !as3
  !volume,185
  !as3
  !volume,191
  !as3
  !volume,201
  !as3
  !volume,207
  !as3
  !end

Track5980:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !pan,10
  !volume,207
  !loop : dw Sub598F : db 255
  !end

Sub598F:
  db 48
  !as3
  !end

Track5992:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !pan,10
  !loop : dw Sub599F : db 255
  !end

Sub599F:
  !volume,144
  db 12
  !c4
  db 18
  !rest
  db 12
  !c4
  db 18
  !rest
  !volume,128
  db 12
  !c4
  db 18
  !rest
  db 12
  !c4
  db 18
  !rest
  !volume,112
  db 12
  !c4
  db 18
  !rest
  db 12
  !c4
  db 18
  !rest
  !volume,128
  db 12
  !c4
  db 18
  !rest
  db 12
  !c4
  db 18
  !rest
  !end

Track59C8:
  db 127,$7F
  !transpose,0
  !instr,$1D
  !pan,10
  !volume,128
  !loop : dw Sub5A0C : db 1
  !instr,$1E
  !pan,12
  !volume,112
  db 48
  !c5
  !pitchSlide,0,48 : !c6
  !tie
  !pan,8
  !volume,128
  !c5
  !pitchSlide,0,48 : !c6
  !tie
  !pan,12
  !volume,128
  !c5
  !pitchSlide,0,48 : !c6
  !tie
  !pan,8
  !volume,112
  !c5
  !pitchSlide,0,48 : !c6
  !tie
  !instr,$1D
  !pan,10
  !volume,128
  !loop : dw Sub5A0C : db 255
  !end

Sub5A0C:
  db 48
  !rest
  db 18
  !as5
  !as5
  db 108
  !rest
  db 48
  !rest
  db 18
  !as5
  !as5
  db 108
  !rest
  !end

Track5A1B:
  db 127,$7F
  !transpose,0
  !echo,%00011110,31,31
  !echoParameters,4,16,5
  !volume,48
  !dynamicVolume,192,160
  !instr,$18
  !pan,10
  db 96
  !c6
  !tie
  !loop : dw Sub5A38 : db 6
  !end

Sub5A38:
  db 96
  !tie
  !tie
  !end

Track5A3C:
  db 127,$7F
  !transpose,0
  !instr,$1F
  !pan,10
  !volume,128
  !loop : dw Sub5A4B : db 255
  !end

Sub5A4B:
  db 42
  !c5
  !end

if defined("print_freespace")
  print "Song 06: Space left: $",hex($10000-(4*$800)-pc())
endif
assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8
endspcblock

dw $0000
