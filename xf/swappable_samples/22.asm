asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; The Xenometroid

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, Sound76, Sound77, !zero, !zero, Sound7A, Sound7B, Sound7C
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, Sound76>>8, Sound77>>8, !zero>>8, !zero>>8, Sound7A>>8, Sound7B>>8, Sound7C>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $15
  db $C2,$E0,$0A
  db $C2,$60,$0A
  db $C2,$30,$0A
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $12
  db $91,$40,$02
  db $93,$40,$03
  db $0F
  db $8B,$40,$03
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $1D
  db $88,$D0,$90
  db $8E,$D0,$37
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $1D
  db $92,$D0,$2B
  db $FF

Sound76:
  db $11 : dw .voice0
.voice0
  db $1D
  db $97,$80,$1F
  db $FF

Sound77:
  db $02 : dw .voice0, .voice1
.voice0
  db $02
  db $97,$80,$1F
  db $FF

.voice1
  db $F5,$F0,$88
  db $1D
  db $97,$80,$1F
  db $FF

Sound7C:
  db $12 : dw .voice0, .voice1
.voice0
  db $02
  db $97,$80,$1F
  db $1E
  db $97,$80,$1F
  db $94,$80,$1F
  db $FF

.voice1
  db $F5,$60,$97
  db $1D
  db $88,$80,$30
  db $1C
  db $9C,$80,$18
  db $94,$80,$18
  db $8C,$80,$18
  db $FF

Sound7A:
  db $12 : dw .voice0, .voice1
.voice0
  db $F5,$30,$88
  db $1C
  db $8C,$A0,$30
  db $FF

.voice1
  db $1C
  db $9D,$00,$03
  db $87,$80,$45
  db $FF

Sound7B:
  db $12 : dw .voice0, .voice1
.voice0
  db $1C
  db $9C,$A0,$20
  db $FF

.voice1
  db $1C
  db $9D,$00,$05
  db $95,$80,$40
  db $FF

endspcblock

dw $0000
