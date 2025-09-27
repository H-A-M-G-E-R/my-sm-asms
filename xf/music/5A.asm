asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$05,$A0
  db $19,$FF,$E0,$B8,$05,$E0
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19+8046
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_d391220b3132f7ed7be1121ada000db3.brr")
  Sample19: skip filesize("Sample_8a3f4ee7cee8ce18a51d1d096404eda5.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern582E
  dw $0000

Pattern582E: dw Track583E, Track58A0, Track5872, 0, 0, 0, 0, 0

Track583E:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,224
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,144
  !pan,10
  db 72
  !c4
  !instr,$19
  !volume,192
  !pan,4
  !dynamicPan,94,16
  db 96
  !c4
  !tie
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,192
  !loop : dw Sub586E : db 255
  !end

Sub586E:
  db 96
  !rest
  !tie
  !end

Track5872:
  db 127,$7F
  !transpose,0
  !instr,$18
  !volume,112
  !pan,10
  db 24
  !rest
  db 72
  !c4
  db 96
  !rest
  !instr,$19
  !volume,192
  !pan,16
  !dynamicPan,94,4
  !c4
  !tie
  !tie
  db 48
  !tie
  !dynamicVolume,96,16
  db 96
  !tie
  !volume,192
  !loop : dw Sub589C : db 255
  !end

Sub589C:
  db 96
  !rest
  !tie
  !end

Track58A0:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !rest
  db 60
  !tie
  !instr,$18
  !volume,96
  !pan,10
  db 96
  !c4
  !volume,80
  !pan,10
  !c4
  !volume,64
  !pan,10
  !c4
  !volume,48
  !pan,10
  !c4
  !volume,32
  !loop : dw Sub58C8 : db 255
  !end

Sub58C8:
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
