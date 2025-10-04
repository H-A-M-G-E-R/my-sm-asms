asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$04,$00
  db $19,$FF,$E0,$B8,$04,$2E
  db $1A,$FF,$F2,$B8,$01,$E8
  db $1B,$FF,$E0,$B8,$05,$33
  db $1C,$FF,$E0,$B8,$07,$A0
  db $1D,$FF,$E0,$B8,$04,$44
  db $1E,$FD,$EB,$B8,$02,$7A
  db $1F,$FF,$E0,$B8,$05,$82
  db $20,$FF,$E0,$B8,$00,$40
  db $21,$FF,$E7,$B8,$02,$7A
  db $22,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+18
  dw Sample19,Sample19
  dw Sample1A_1C,Sample1A_1C
  dw Sample1B,Sample1B
  dw Sample1A_1C,Sample1A_1C
  dw Sample1D,Sample1D
  dw Sample1E,Sample1E+1368
  dw Sample1F,Sample1F
  dw Sample20,Sample20+36
  dw Sample21,Sample21
  dw Sample22,Sample22
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr")
  Sample19: skip filesize("Sample_8e7e20296fa60ac19d652807808fbf09.brr")
  Sample1A_1C: skip filesize("Sample_bbe78ea792aaca4886c0c6c4ebaee1a0.brr")
  Sample1B: skip filesize("Sample_e252324e422454908ea0de0565f41e0d.brr")
  Sample1D: skip filesize("Sample_cc665d2b4c8c68a674a8053fe691bbeb.brr")
  Sample1E: skip filesize("Sample_641b15dcd55d0f5bb5d923c84c24935e.brr")
  Sample1F: skip filesize("Sample_1fba0d95f836fd29bbe39586e53ea1ec.brr")
  Sample20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21: skip filesize("Sample_76edbd93a18de2665ef477b5ed21ccb5.brr")
  Sample22: skip filesize("Sample_0e021b8c900b6db8440abf3c3b172967.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern5848
-
  dw Pattern5858
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5848
-
  dw Pattern5868
  dw $00FF,-
  dw $0000

Tracker7:
  dw Pattern5848
  dw Pattern5878
  dw $0000

Pattern5848: dw Track5888, 0, 0, 0, 0, 0, 0, 0
Pattern5858: dw Track58D8, Track591D, Track59A8, Track59F9, Track5976, 0, 0, 0
Pattern5868: dw Track58A3, Track5A38, Track5AA8, 0, 0, 0, 0, 0
Pattern5878: dw Track5ABF, Track5B10, Track5B40, Track5B57, 0, 0, 0, 0

Track5888:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,49
  !musicVolume,224
  !echo,%00001111,47,47
  !echoParameters,3,63,0
  !dynamicEcho,128,52,52
  !end

Track58A3:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,3,63,0
  !dynamicEcho,128,52,52
  !instr,$1E
  !loop : dw Sub58BA : db 255
  !end

Sub58BA:
  !dynamicMusicVolume,240,208
  !volume,176
  !pan,6
  !dynamicPan,192,14
  db 96
  !c4
  !tie
  !tie
  !tie
  !dynamicMusicVolume,240,192
  !volume,192
  !pan,14
  !dynamicPan,192,6
  !c3
  !tie
  !tie
  !tie
  !end

Track58D8:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,3,63,0
  !dynamicEcho,128,52,52
  !instr,$1E
  !pan,10
  !volume,224
  !vibrato,0,4,79
  !loop : dw Sub58F7 : db 255
  !end

Sub58F7:
  !dynamicPan,192,14
  db 96
  !c4
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,224
  !rest
  !echo,%00001111,47,47
  !echoParameters,3,63,0
  !dynamicEcho,128,52,52
  !dynamicPan,192,6
  !c3
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,224
  !rest
  !end

Track591D:
  db 127,$7F
  !transpose,0
  !instr,$19
  !volume,192
  !pan,12
  db 48
  !c4
  !pan,8
  !c4
  !pan,14
  !c4
  !rest
  !instr,$19
  !volume,192
  !pan,6
  !c4
  !pan,12
  !c4
  !pan,8
  !c4
  !rest
  !loop : dw Sub5943 : db 255
  !end

Sub5943:
  !instr,$19
  !volume,192
  !pan,12
  db 48
  !c4
  !pan,8
  !c4
  !pan,14
  !c4
  !instr,$1B
  !volume,128
  !pan,10
  db 12
  !c5
  !c5
  !c5
  !rest
  !instr,$19
  !volume,192
  !pan,6
  db 48
  !c4
  !pan,12
  !c4
  !pan,8
  !c4
  !instr,$1B
  !volume,128
  !pan,10
  db 12
  !c5
  !rest
  !c5
  !rest
  !end

Track5976:
  db 127,$7F
  !transpose,0
  !volume,160
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub5986 : db 255
  !end

Sub5986:
  !pan,12
  !instr,$1D
  db 24
  !c4
  !pan,8
  !instr,$1D
  !cs4
  !pan,10
  !instr,$1D
  !c4
  !cs4
  !pan,12
  !instr,$1D
  !c4
  !pan,8
  !instr,$1D
  !cs4
  !pan,10
  !instr,$1D
  !c4
  !cs4
  !end

Track59A8:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,160
  !instr,$19
  !volume,160
  db 24
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  !c4
  !rest
  !instr,$19
  !volume,160
  !c4
  !rest
  !c4
  !rest
  !c4
  !rest
  !instr,$1F
  !c4
  !rest
  !loop : dw Sub59D2 : db 255
  !end

Sub59D2:
  !instr,$19
  !volume,160
  db 24
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !volume,136
  !c4
  !rest
  !c4
  !rest
  !instr,$19
  !volume,96
  !c4
  !rest
  !instr,$1F
  db 12
  !c4
  !c4
  db 24
  !c4
  !instr,$19
  !volume,80
  !c4
  !rest
  !c4
  !rest
  !end

Track59F9:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,208
  !loop : dw Sub5A06 : db 255
  !end

Sub5A06:
  !pan,6
  db 12
  !c4
  !pan,8
  !rest
  !pan,10
  !c4
  !pan,10
  !c4
  !pan,12
  !c4
  !pan,14
  !c4
  !pan,10
  !c4
  !pan,10
  !c4
  !pan,6
  !c3
  !pan,8
  !rest
  !pan,10
  !c3
  !pan,10
  !rest
  !pan,12
  !c3
  !pan,14
  !rest
  !pan,10
  !c3
  !pan,10
  !rest
  !end

Track5A38:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,32
  !pan,10
  !loop : dw Sub5A4B : db 8
  !loop : dw Sub5A4F : db 255
  !end

Sub5A4B:
  db 96
  !rest
  !tie
  !end

Sub5A4F:
  !dynamicPan,192,20
  !dynamicVolume,192,128
  db 12
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !dynamicPan,192,0
  !dynamicVolume,192,64
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !volume,64
  !dynamicPan,192,20
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !dynamicPan,192,0
  !dynamicVolume,192,128
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !gs4
  !g4
  !d4
  !gs3
  !g3
  !gs3
  !d4
  !g4
  !end

Track5AA8:
  db 127,$7F
  !transpose,244
  !instr,$18
  !volume,32
  !pan,10
  !loop : dw Sub5ABB : db 8
  !loop : dw Sub5A4F : db 255
  !end

Sub5ABB:
  db 96
  !rest
  !tie
  !end

Track5ABF:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,3,63,0
  !dynamicEcho,128,52,52
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  db 24
  !rest
  !instr,$1C
  !volume,128
  !vibrato,0,79,31
  !dynamicPan,192,18
  db 96
  !a2
  !tie
  !rest
  !tie
  !rest
  db 48
  !rest
  !instr,$1A
  !volume,208
  !pan,8
  db 96
  !c4
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1E
  !volume,204
  !loop : dw Sub5B03 : db 255
  !end

Sub5B03:
  !pan,4
  db 96
  !d3
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,204
  !rest
  !end

Track5B10:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  db 24
  !rest
  !rest
  !instr,$1A
  !volume,192
  !pan,16
  !vibrato,0,31,79
  db 96
  !cs2
  !tie
  !rest
  !tie
  !rest
  db 48
  !rest
  !instr,$1A
  !volume,192
  !pan,10
  db 96
  !d3
  !loop : dw Sub5B3C : db 255
  !end

Sub5B3C:
  db 96
  !rest
  !tie
  !end

Track5B40:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,32
  !pan,10
  !loop : dw Sub5B53 : db 3
  !loop : dw Sub5A4F : db 255
  !end

Sub5B53:
  db 96
  !rest
  !tie
  !end

Track5B57:
  db 127,$7F
  !transpose,244
  !instr,$18
  !volume,32
  !pan,10
  !loop : dw Sub5B6A : db 3
  !loop : dw Sub5A4F : db 255
  !end

Sub5B6A:
  db 96
  !rest
  !tie
  !end

if defined("print_freespace")
  print "Song 2D: Space left: $",hex($10000-(3*$800)-pc())
endif
assert pc() <= $10000-(3*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
