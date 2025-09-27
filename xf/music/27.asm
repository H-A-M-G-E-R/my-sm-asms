asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$D8,$70,$B8,$00,$9E
  db $19,$FF,$E0,$B8,$00,$B0
  db $1A,$FF,$E7,$B8,$00,$80
  db $1B,$FF,$E0,$B8,$00,$9E
  db $1C,$FF,$E0,$B8,$07,$A0
  db $1D,$FF,$E0,$B8,$00,$9E
  db $1E,$FF,$E0,$B8,$02,$C1
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+81
  dw Sample19,Sample19
  dw Sample1A,Sample1A+27
  dw Sample1B,Sample1B+18
  dw Sample1C,Sample1C
  dw Sample1D,Sample1D+18
  dw Sample1E,Sample1E
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr")
  Sample19: skip filesize("Sample_287e6c92b0fc050e3a18a21d8cdba209.brr")
  Sample1A: skip filesize("Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr")
  Sample1B: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample1C: skip filesize("Sample_bbe78ea792aaca4886c0c6c4ebaee1a0.brr")
  Sample1D: skip filesize("Sample_ecfd273f3f42fe8a26eaca051537db5c.brr")
  Sample1E: skip filesize("Sample_53ed5b4572e6bf095c6df514da78df38.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5842
  dw Pattern5852
-
  dw Pattern5862
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5842
-
  dw Pattern5872
  dw $00FF,-
  dw $0000

Pattern5842: dw Track5882, 0, 0, 0, 0, 0, 0, 0
Pattern5852: dw Track589D, Track58F3, Track5939, Track59C5, Track5AAA, 0, 0, 0
Pattern5862: dw Track589D, Track58F3, Track5939, Track597D, Track59D9, 0, 0, 0
Pattern5872: dw Track5ACB, 0, 0, 0, 0, 0, 0, 0

Track5882:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,23
  !musicVolume,208
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !end

Track589D:
  db 127,$7F
  !transpose,255
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !instr,$18
  !pan,10
  !vibrato,0,47,79
  !volume,79
  !loop : dw Sub58BC : db 255
  !end

Sub58BC:
  !dynamicVolume,190,161
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !d7
  !dynamicVolume,190,63
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !d7
  !end

Track58F3:
  db 127,$7F
  !transpose,255
  !instr,$18
  !pan,14
  !volume,79
  !loop : dw Sub5902 : db 255
  !end

Sub5902:
  !dynamicVolume,190,161
  db 32
  !a6
  db 16
  !rest
  db 32
  !a6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  !dynamicVolume,190,63
  db 32
  !a6
  db 16
  !rest
  db 32
  !a6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  db 32
  !a6
  db 16
  !rest
  db 32
  !a6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  db 32
  !as6
  db 16
  !rest
  !end

Track5939:
  db 127,$7F
  !transpose,254
  !instr,$18
  !pan,6
  !volume,79
  !loop : dw Sub5948 : db 255
  !end

Sub5948:
  !dynamicVolume,190,145
  db 32
  !rest
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !d7
  !dynamicVolume,190,63
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !cs7
  db 16
  !rest
  db 32
  !d7
  db 16
  !rest
  !d7
  !end

Track597D:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,193
  !pan,10
  !vibrato,0,47,63
  db 96
  !a3
  !volume,193
  db 48
  !gs3
  !c4
  !b3
  !f3
  db 96
  !as3
  !a3
  db 48
  !gs3
  !d3
  !g3
  !cs3
  db 96
  !fs3
  !dynamicVolume,96,16
  !tie
  !volume,193
  !loop : dw Sub59A9 : db 255
  !end

Sub59A9:
  !instr,$1A
  !pan,5
  !volume,63
  !dynamicVolume,142,239
  db 96
  !as4
  !tie
  !tie
  !tie
  !instr,$1A
  !pan,13
  !volume,63
  !dynamicVolume,142,239
  !as4
  !tie
  !tie
  !tie
  !end

Track59C5:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,193
  !pan,10
  !vibrato,0,47,63
  db 96
  !a3
  !tie
  !a3
  !tie
  !end

Track59D9:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,241
  !pan,10
  !vibrato,0,47,63
  db 60
  !a4
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,241
  !volume,241
  db 48
  !gs4
  !c5
  !b4
  !f4
  db 60
  !as4
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,241
  db 60
  !a4
  !dynamicVolume,36,16
  db 36
  !tie
  !volume,241
  db 48
  !gs4
  !d4
  !g4
  !cs4
  db 96
  !fs4
  !dynamicVolume,96,16
  !tie
  !volume,241
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !instr,$19
  !volume,79
  !dynamicVolume,94,207
  !dynamicPan,94,5
  !c6
  !instr,$1C
  !volume,144
  !pan,18
  !dynamicPan,94,8
  !c3
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !instr,$1A
  !volume,63
  !dynamicVolume,142,223
  !pan,15
  !as5
  !tie
  !tie
  !instr,$19
  !volume,79
  !dynamicVolume,94,159
  !pan,5
  !dynamicPan,94,15
  !cs6
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !instr,$1E
  !volume,79
  !dynamicVolume,94,207
  !pan,5
  !dynamicPan,94,15
  db 36
  !f4
  db 12
  !f4
  !instr,$1C
  !volume,96
  !pan,13
  db 48
  !c4
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  db 96
  !rest
  !tie
  !tie
  !echo,%00011111,47,47
  !echoParameters,1,16,0
  !dynamicEcho,128,52,52
  !instr,$19
  !volume,79
  !dynamicVolume,62,207
  !pan,5
  !dynamicPan,62,15
  !c6
  !end

Track5AAA:
  db 127,$7F
  !transpose,0
  !instr,$19
  !pan,15
  db 48
  !rest
  !volume,79
  !dynamicVolume,62,175
  !dynamicPan,94,5
  db 96
  !c6
  !volume,143
  !dynamicVolume,62,31
  !dynamicPan,94,13
  !c6
  !tie
  !rest
  !tie
  !end

Track5ACB:
  db 127,$7F
  !transpose,0
  !vibrato,0,15,63
  db 48
  !rest
  !instr,$1C
  !volume,96
  !pan,4
  !dynamicPan,94,15
  db 24
  !rest
  db 96
  !c4
  !tie
  !instr,$1D
  !pan,5
  !volume,63
  !dynamicVolume,46,175
  !as4
  !dynamicVolume,94,16
  !tie
  !tie
  !instr,$1C
  !volume,96
  !pan,16
  db 24
  !rest
  db 96
  !c4
  !tie
  db 48
  !rest
  !end

assert pc() <= $10000-(1*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
