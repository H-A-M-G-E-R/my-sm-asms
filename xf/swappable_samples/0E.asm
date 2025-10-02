asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Phantomire

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, Sound76, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, Sound76>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $00
  db $95,$D8,$08
  db $F5,$F0,$80
  db $02
  db $96,$F0,$06
  db $F5,$F0,$80
  db $94,$D0,$06
  db $F5,$F0,$80
  db $92,$90,$06
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F5,$40,$80
  db $25
  db $95,$EF,$18
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $00
  db $95,$D8,$05
  db $01
  db $A4,$B0,$08
  db $F5,$F0,$B0
  db $11
  db $C0,$F0,$0E
  db $F5,$F0,$AA
  db $C0,$C0,$0E
  db $F5,$F0,$AA
  db $C0,$60,$0E
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $F6,$08
  db $09
  db $92,$D0,$08
  db $F6,$0C
  db $96,$D0,$08
  db $F6,$09
  db $9F,$D0,$08
  db $F6,$0B
  db $A9,$E0,$08
  db $F5,$F0,$C0
  db $F6,$0A
  db $A9,$F0,$18
  db $FF

Sound76:
  db $11 : dw .voice0
.voice0
  db $F5,$40,$C7
  db $11
  db $B7,$FF,$06
  db $F5,$40,$C7
  db $B6,$DF,$06
  db $F5,$40,$C7
  db $B5,$9F,$06
  db $FF

endspcblock

dw $0000
