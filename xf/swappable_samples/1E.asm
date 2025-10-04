asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Etecoon

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$FF,$E0,$B8,$05,$83
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $16
  db $96,$80,$10
  db $FF

  Sample16_17: incbin "Sample_88e30a710c90a60799ce3ab942469a30.brr"
endspcblock

dw $0000
