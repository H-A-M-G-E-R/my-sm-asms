asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; SA-X explosion & footsteps

spcblock !p_sounds2Low+$72-1 nspc
  db !zero, !zero, Sound74, Sound75, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db !zero>>8, !zero>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$7F,$00,$00,$05,$33
  db $17,$FF,$E0,$B8,$05,$33
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound0B:
  db $02 : dw .voice0, .voice1
.voice0
  db $06
  db $84,$50,$FF

.voice1
  db $06
  db $98,$40,$FF

Sound74:
  db $11 : dw .voice0
.voice0
  db $F6,$0B
  db $17
  db $8D,$A0,$10
  db $F6,$09
  db $8C,$90,$18
  db $FF

  db $FF
Sound75:
  db $11 : dw .voice0
.voice0
  db $F6,$0F
  db $21
  db $97,$90,$22
  db $F6,$0C
  db $97,$80,$22
  db $F6,$0A
  db $97,$70,$22
  db $F6,$08
  db $97,$60,$22
  db $F6,$06
  db $97,$40,$22
  db $F6,$04
  db $97,$20,$22
  db $F6,$02
  db $97,$10,$22
  db $FF

  Sample16_17: incbin "Sample_2cab998afa3a4ade018908435ec2e24b.brr"
endspcblock

dw $0000
