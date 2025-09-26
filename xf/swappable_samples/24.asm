asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, !zero, !zero, !zero, !zero, Sound78, Sound79, !zero, Sound7B, Sound7C
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound78>>8, Sound79>>8, !zero>>8, Sound7B>>8, Sound7C>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound7C:
  db $12 : dw .voice0, .voice1
.voice0
  db $F5,$20,$99
  db $1C
  db $84,$70,$99
  db $FF

.voice1
  db $F5,$C0,$99
  db $1D
  db $83,$60,$30
  db $8F,$60,$60
  db $F5,$60,$99
  db $02
  db $83,$30,$30
  db $FF

Sound78:
  db $02 : dw .voice0, .voice1
.voice0
  db $1D
  db $9A,$F8,$08
  db $FF

.voice1
  db $1D
  db $98,$00,$03
  db $98,$D8,$18
  db $FF

Sound79:
  db $02 : dw .voice0, .voice1
.voice0
  db $1D
  db $96,$F8,$08
  db $FF

.voice1
  db $1D
  db $95,$00,$03
  db $95,$D8,$18
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $1A
  db $AA,$D0,$2B
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
