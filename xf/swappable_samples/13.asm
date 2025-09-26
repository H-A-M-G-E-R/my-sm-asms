asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, !zero, !zero, !zero, Sound77, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, !zero>>8, !zero>>8, !zero>>8, Sound77>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
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
Sound77:
  db $02 : dw .voice0, .voice1
.voice0
  db $16
  db $94,$90,$30
  db $FF

.voice1
  db $16
  db $95,$01,$04
  db $95,$90,$2C
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F6,$09
  db $14
  db $96,$40,$30
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $00
  db $9B,$A8,$14
  db $FF

  Sample16_17: incbin "Sample_d206507a1a89ffc448ca26d6c037f985.brr"
endspcblock

dw $0000
