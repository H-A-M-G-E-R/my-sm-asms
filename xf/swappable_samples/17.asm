asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Omega metroid

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, Sound75, Sound76, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, Sound75>>8, Sound76>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$FF,$F2,$B8,$05,$83
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $16
  db $96,$90,$10
  db $96,$30,$10
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $1C
  db $95,$B0,$45
  db $FF

Sound76:
  db $11 : dw .voice0
.voice0
  db $1C
  db $9A,$B0,$28
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $1C
  db $94,$80,$06
  db $9A,$A0,$10
  db $9A,$40,$03
  db $9A,$30,$03
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $07
  db $C9,$F0,$10
  db $FF

  Sample16_17: incbin "Sample_f9b0bf05af6ba0e965db28fc983284a9.brr"
endspcblock

dw $0000
