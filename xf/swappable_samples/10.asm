asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Neo-Ridley

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, Sound74, Sound75, Sound76, !zero, !zero, !zero, Sound7A, Sound7B, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, Sound74>>8, Sound75>>8, Sound76>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, Sound7B>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$82
  db $17,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound7A:
  db $12 : dw .voice0, .voice1
.voice0
  db $F6,$09
  db $16
  db $97,$A0,$30
  db $FF

.voice1
  db $16
  db $97,$10,$08
  db $F6,$0B
  db $97,$70,$40
  db $FF

Sound7B:
  db $12 : dw .voice0, .voice1
.voice0
  db $F6,$09
  db $16
  db $97,$A0,$1C
  db $F6,$06
  db $97,$10,$30
  db $FF

.voice1
  db $16
  db $97,$10,$0C
  db $F6,$0C
  db $97,$70,$30
  db $FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $16
  db $94,$90,$30
  db $FF

Sound75:
  db $11 : dw .voice0
.voice0
  db $16
  db $97,$90,$30
  db $FF

Sound76:
  db $11 : dw .voice0
.voice0
  db $16
  db $9A,$70,$20
  db $FF

  Sample16_17: incbin "Sample_34011d206d6a4d07ed4a42c2de871a61.brr"
endspcblock

dw $0000
