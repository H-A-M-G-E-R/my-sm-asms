asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FB,$E0,$B8,$05,$83
  db $19,$FB,$E0,$B8,$05,$83
  db $1A,$FB,$E0,$B8,$05,$83
  db $1B,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B+378
endspcblock

pushpc
org $A000-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_14ec84e26b9ea0857ad958b5f843bc1b.brr")
  Sample19: skip filesize("Sample_0405f8f2e0514b6efa2920554df53d02.brr")
  Sample1A: skip filesize("Sample_f2ce9891671b6e98e6ec82c98b1cd1ab.brr")
  Sample1B: skip filesize("Sample_af748b56afa8489cc137e7360fafc840.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6, Tracker7

Tracker5:
  dw Pattern5840
  dw Pattern5850
  dw $0000

Tracker6:
  dw Pattern5860
  dw Pattern5870
  dw $0000

Tracker7:
  dw Pattern5880
  dw Pattern5870
  dw $0000

Pattern5840: dw Track5890, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track58A7, Track58D1, Track58EE, Track5916, Track5927, Track593A, 0, 0
Pattern5860: dw Track594E, 0, 0, 0, 0, 0, 0, 0
Pattern5870: dw Track5967, Track5991, 0, 0, 0, 0, 0, 0
Pattern5880: dw Track59BB, 0, 0, 0, 0, 0, 0, 0

Track5890:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,240
  !echo,%00011111,47,47
  !echoParameters,5,16,0
  !end

Track58A7:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,144
  !loop : dw Sub58B6 : db 255
  !end

Sub58B6:
  !echo,%00011111,47,47
  !echoParameters,5,16,0
  db 24
  !e2
  !pitchSlide,0,24 : !ds4
  db 72
  !tie
  db 48
  !tie
  !pitchSlide,0,48 : !c2
  db 3
  !tie
  db 96
  !rest
  !end

Track58D1:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,96
  !vibrato,0,32,15
  db 12
  !rest
  !loop : dw Sub58E9 : db 11
  db 96
  !rest
  !tie
  !end

Sub58E9:
  db 24
  !e4
  db 48
  !rest
  !end

Track58EE:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,240
  !vibrato,0,32,15
  db 96
  !rest
  !tie
  !tie
  !loop : dw Sub5903 : db 1
  !end

Sub5903:
  !instr,$18
  db 96
  !c4
  db 60
  !tie
  !instr,$19
  db 96
  !c4
  db 60
  !tie
  !instr,$1A
  db 96
  !c4
  db 60
  !tie
  !end

Track5916:
  db 127,$7F
  !transpose,255
  !pan,10
  !volume,160
  db 96
  !rest
  !tie
  !tie
  !loop : dw Sub5903 : db 1
  !end

Track5927:
  db 127,$7F
  !transpose,0
  !pan,8
  !volume,128
  db 96
  !rest
  !tie
  !tie
  db 24
  !rest
  !loop : dw Sub5903 : db 1
  !end

Track593A:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$08
  !volume,204
  !loop : dw Sub5949 : db 255
  !end

Sub5949:
  db 24
  !e2
  !ds2
  !c2
  !end

Track594E:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,102
  !volume,0
  !echo,%00000001,47,47
  !echoParameters,5,16,0
  db 24
  !c2
  !end

Track5967:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,96
  !loop : dw Sub5976 : db 255
  !end

Sub5976:
  !echo,%00000001,47,47
  !echoParameters,5,16,0
  db 24
  !e2
  !pitchSlide,0,24 : !ds4
  db 72
  !tie
  db 48
  !tie
  !pitchSlide,0,48 : !c2
  db 3
  !tie
  db 96
  !rest
  !end

Track5991:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1B
  !volume,112
  !loop : dw Sub59A0 : db 255
  !end

Sub59A0:
  !echo,%00000001,47,47
  !echoParameters,5,16,0
  db 24
  !e2
  !pitchSlide,0,24 : !ds4
  db 72
  !tie
  db 48
  !tie
  !pitchSlide,0,48 : !c2
  db 3
  !tie
  db 96
  !rest
  !end

Track59BB:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,153
  !volume,0
  !echo,%00000001,47,47
  !echoParameters,5,16,0
  !end

if defined("print_freespace")
  print "Song 9C: Space left: $",hex($10000-(5*$800)-pc())
endif
assert pc() <= $10000-(5*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
