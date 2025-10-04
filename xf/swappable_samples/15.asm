asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Varia Core-X fight

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, !zero, !zero, !zero, Sound77, Sound78, !zero, Sound7A, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound77>>8, Sound78>>8, !zero>>8, Sound7A>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$08,$00
  db $17,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound78:
  db $02 : dw .voice0, .voice1
.voice0
  db $F5,$60,$C7
  db $05
  db $A7,$50,$20
  db $FF

.voice1
  db $F5,$50,$80
  db $09
  db $AB,$80,$46
  db $FF

Sound77:
  db $02 : dw .voice0, .voice1
.voice0
  db $16
  db $97,$80,$30
  db $FF

.voice1
  db $16
  db $98,$01,$04
  db $98,$80,$2C
  db $FF

Sound7A:
  db $12 : dw .voice0, .voice1
.voice0
  db $F5,$B0,$C7
  db $05
  db $98,$D0,$46
  db $FF

.voice1
  db $F5,$A0,$C7
  db $F6,$0F
  db $09
  db $80,$D0,$50
  db $F5,$50,$80
  db $F6,$0A
  db $AB,$D0,$46
  db $FF

  Sample16_17: incbin "Sample_d45a80b697cd1049df29152c05eb60e3.brr"
endspcblock

dw $0000
