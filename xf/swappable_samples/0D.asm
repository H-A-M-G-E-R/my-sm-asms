asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, !zero, !zero, !zero, !zero, Sound7A, Sound7B, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, Sound7B>>8, !zero>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound73:
  db $01 : dw .voice0
.voice0
  db $FE,$06
  db $09
  db $8C,$B0,$05
  db $0E
  db $91,$B0,$05
  db $09
  db $8C,$B0,$05
  db $0E
  db $91,$B0,$05
  db $09
  db $8C,$B0,$05
  db $0E
  db $91,$B0,$05
  db $FB
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $00
  db $8B,$90,$08
  db $08
  db $A1,$90,$03
  db $9E,$90,$03
  db $A3,$90,$03
  db $8E,$90,$03
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $25
  db $95,$FF,$45
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $25
  db $92,$B0,$44
  db $FF

Sound7B:
  db $12 : dw .voice0, .voice1
.voice0
  db $25
  db $9F,$F0,$30
  db $9A,$E0,$28
  db $98,$D0,$28
  db $FF

.voice1
  db $25
  db $9A,$00,$22
  db $9C,$E0,$30
  db $97,$D0,$28
  db $FF

Sound7A:
  db $12 : dw .voice0, .voice1
.voice1
  db $02
  db $83,$00,$19
  db $85,$78,$0A
  db $86,$78,$08
  db $86,$80,$04
  db $86,$80,$06
  db $86,$88,$04
  db $87,$88,$05
  db $88,$88,$08
  db $88,$90,$04
  db $88,$90,$06
  db $88,$90,$04
  db $89,$98,$05
  db $8A,$98,$08
  db $8A,$98,$04
  db $8A,$A0,$06
  db $8A,$A0,$04
  db $8B,$A8,$05
  db $8C,$A8,$08
  db $8C,$B0,$04
  db $8C,$B0,$06
  db $8C,$C0,$10
  db $FF

.voice0
  db $02
  db $93,$00,$12
  db $09
  db $94,$80,$0D
  db $95,$88,$0D
  db $97,$90,$0D
  db $99,$98,$0D
  db $9B,$A0,$0D
  db $9C,$A8,$0D
  db $9E,$B8,$0D
  db $A1,$C0,$0D
  db $A5,$C8,$0D
  db $AA,$D0,$14
  db $FF

endspcblock

dw $0000
