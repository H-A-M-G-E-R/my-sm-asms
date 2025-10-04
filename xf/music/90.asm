asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Power down

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$0B,$60
  db $19,$F4,$E0,$B8,$02,$99
  db $1A,$FD,$E0,$B8,$02,$99
  db $1B,$FF,$E0,$B8,$02,$7A
  db $1C,$F5,$EA,$B8,$02,$7A
  db $1D,$FF,$E0,$B8,$00,$B0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+27
  dw Sample19_1A,Sample19_1A+27
  dw Sample19_1A,Sample19_1A+27
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C+18
  dw Sample1D,Sample1D
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_2e1822edc659430c60ca1e822fefddc2.brr")
  Sample19_1A: skip filesize("Sample_24f2776ccd9c9315c85798b6b5e78a00.brr")
  Sample1B: skip filesize("Sample_48972f703281c1d2c6c9c1ccdd3c3f4b.brr")
  Sample1C: skip filesize("Sample_278f07e8e1ffdb96da9b899da90d9f9c.brr")
  Sample1D: skip filesize("Sample_287e6c92b0fc050e3a18a21d8cdba209.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5844
-
  dw Pattern5874
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5844
  dw Pattern5854
  dw Pattern5864
-
  dw Pattern5874
  dw $00FF,-
  dw $0000

Pattern5844: dw Track5884, 0, 0, 0, 0, 0, 0, 0
Pattern5854: dw Track589B, Track58D3, Track5933, 0, 0, 0, 0, 0
Pattern5864: dw Track58BB, Track58EC, Track5953, 0, 0, 0, 0, 0
Pattern5874: dw Track58BB, Track58EC, 0, 0, 0, 0, 0, 0

Track5884:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,240
  !echo,%00001111,47,47
  !echoParameters,2,24,4
  !end

Track589B:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,224
  db 1
  !b4
  !pitchSlide,0,160 : !b2
  !dynamicVolume,192,160
  db 96
  !tie
  db 48
  !tie
  !dynamicVolume,48,48
  !tie
  db 96
  !rest
  db 48
  !tie
  !end

Track58BB:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1A
  !volume,42
  db 96
  !cs7
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
  !end

Track58D3:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,255
  db 1
  !c4
  !pitchSlide,0,112 : !c2
  !dynamicVolume,192,160
  db 96
  !tie
  !tie
  !rest
  !tie
  !end

Track58EC:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !subtranspose,64
  db 24
  !rest
  !volume,48
  !dynamicVolume,144,176
  db 96
  !c2
  db 48
  !tie
  !dynamicVolume,48,64
  !tie
  !dynamicVolume,144,176
  db 96
  !c2
  db 48
  !tie
  !dynamicVolume,48,48
  !tie
  db 24
  !rest
  !dynamicVolume,144,176
  db 96
  !c2
  !tie
  !dynamicVolume,48,64
  db 48
  !tie
  db 12
  !rest
  !dynamicVolume,144,176
  db 96
  !c2
  !tie
  !dynamicVolume,24,48
  db 48
  !tie
  !loop : dw Sub592F : db 255
  !end

Sub592F:
  db 96
  !rest
  !tie
  !end

Track5933:
  db 127,$7F
  !transpose,254
  !pan,10
  !instr,$1C
  !volume,160
  db 1
  !g4
  !pitchSlide,0,160 : !g2
  !dynamicVolume,192,112
  db 96
  !tie
  db 48
  !tie
  !loop : dw Sub594F : db 255
  !end

Sub594F:
  db 96
  !rest
  !tie
  !end

Track5953:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub595E : db 255
  !end

Sub595E:
  !instr,$1D
  !pan,15
  db 48
  !rest
  !pan,6
  !volume,143
  !dynamicVolume,62,47
  db 96
  !b5
  !tie
  !pan,12
  !volume,79
  !dynamicVolume,62,63
  !dynamicPan,94,5
  !c6
  !rest
  !tie
  !pan,5
  !volume,111
  !dynamicVolume,62,31
  !dynamicPan,94,13
  !c6
  !tie
  !pan,16
  !volume,127
  !dynamicVolume,62,47
  !dynamicPan,94,13
  !c6
  !tie
  !rest
  !end

if defined("print_freespace")
  print "Song 90: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
