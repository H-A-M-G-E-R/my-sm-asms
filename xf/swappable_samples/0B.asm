asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; elevator

spcblock !p_sampleDataEnd nspc
Sound0B:
  db $02 : dw .voice0, .voice1
.voice0
  db $06
  db $84,$50,$FF

.voice1
  db $06
  db $98,$40,$FF
endspcblock

dw $0000
