asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$02,$C1
  db $17,$FF,$E0,$B8,$02,$C1
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound0B:
  db $02 : dw .voice0, .voice1
.voice0
  db $06
  db $84,$50,$FF

.voice1
  db $06
  db $98,$40,$FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $16
  db $96,$80,$10
  db $FF

  Sample16_17: incbin "Sample_4e48666553714a661b61e310456abca5.brr"
endspcblock

dw $0000
