asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; "Sixty seconds to isolation lockdown."

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$05,$04
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
endspcblock

pushpc
org $9F80-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_aa8041956e85a1b08499011624d59627.brr")
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
Pattern5844: dw Track5865, 0, 0, 0, 0, 0, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,62
  !musicVolume,208
  !volume,0
  db 24
  !c5
  !end

Track5865:
  db 127,$7F
  !transpose,0
  !pan,10
  !volume,240
  !instr,$18
  db 96
  !c4
  !tie
  !tie
  !tie
  !tie
  !end

if defined("print_freespace")
  print "Song 57: Space left: $",hex($10000-(0*$800)-pc())
endif
assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
