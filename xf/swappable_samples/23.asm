asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; not kraid barf

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, !zero, !zero, !zero, !zero, Sound7A, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, !zero>>8, !zero>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $00
  db $A0,$80,$08
  db $01
  db $9C,$70,$10
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $F5,$20,$99
  db $25
  db $8F,$FF,$28
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $00
  db $90,$C0,$08
  db $24
  db $91,$FF,$20
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $FE,$06
  db $12
  db $88,$60,$04
  db $FB
  db $FF

Sound7A:
  db $12 : dw .voice0, .voice1
.voice0
  db $F5,$20,$99
  db $18
  db $84,$90,$66
  db $FF

.voice1
  db $F5,$C0,$99
  db $19
  db $83,$70,$44
  db $FF

endspcblock

dw $0000
