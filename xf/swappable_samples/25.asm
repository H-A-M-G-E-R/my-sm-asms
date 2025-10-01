asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Fune/namihe
; Modified so it can happily coexist with sova (see "sova.asm")

spcblock !p_sounds2Low+$73-1 nspc
  db Sound73, !zero, !zero, !zero, Sound77, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$73-1 nspc
  db Sound73>>8, !zero>>8, !zero>>8, !zero>>8, Sound77>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$17+!p_instrumentTable nspc
  db $17,$FF,$E0,$B8,$03,$00
endspcblock

spcblock 4*$17+!p_sampleTable nspc
  dw Sample17,0
endspcblock

spcblock !p_sampleDataEnd+filesize("sova_hurt_4953.705_0.brr")+20 nspc
Sound73:
  db $01 : dw .voice0
.voice0
  db $17
  db $8E,$D0,$09
  db $00
  db $95,$D8,$07
  db $FF

Sound77:
  db $02 : dw .voice0, .voice1
.voice0
  db $07
  db $C2,$FF,$04
  db $0A
  db $98,$FF,$04
  db $FF

.voice1
  db $12
  db $88,$FF,$08
  db $FF

  Sample17: incbin "Sample_dc98b817613701439d7ecd15ac8f6be3.brr"
endspcblock

dw $0000
