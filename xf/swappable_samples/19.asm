asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Serris

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound74:
  db $11 : dw .voice0
.voice0
  db $16
  db $97,$A0,$30
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $16
  db $97,$A0,$36
  db $99,$A0,$10
  db $F5,$D0,$9D
  db $90,$A0,$30
  db $F5,$90,$B2
  db $90,$A0,$20
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $F6,$11
  db $0F
  db $91,$70,$03
  db $8E,$E0,$08
  db $82,$70,$10
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F6,$04
  db $0F
  db $91,$70,$03
  db $8E,$E0,$08
  db $82,$70,$10
  db $FF

  Sample16_17: incbin "Sample_ba382c5df07b887f8f4c946026ea3e11.brr"
endspcblock

dw $0000
