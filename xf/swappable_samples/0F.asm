asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, !zero, !zero, !zero, !zero, !zero, !zero, Sound7A, Sound7B, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, Sound7B>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$F2,$B8,$02,$70
  db $17,$FF,$F2,$B8,$04,$00
endspcblock

spcblock 4*$16+!p_sampleTable nspc
  dw Sample16_17,0
  dw Sample16_17,0
endspcblock

spcblock !p_sampleDataEnd nspc
Sound7A:
  db $12 : dw .voice0, .voice1
.voice1
  db $16
  db $A0,$E8,$30
  db $11
  db $BE,$A0,$FA
  db $FF

.voice0
  db $16
  db $A5,$10,$0C
  db $A0,$90,$40
  db $FF

Sound7B:
  db $12 : dw .voice0, .voice1
.voice1
  db $16
  db $A0,$FF,$30
  db $9E,$90,$30
  db $FF

.voice0
  db $16
  db $A5,$10,$18
  db $9F,$C0,$30
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $F5,$08,$9F
  db $02
  db $88,$B0,$03
  db $90,$D0,$04
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F5,$90,$A9
  db $10
  db $95,$F0,$10
  db $F5,$90,$A9
  db $95,$F0,$10
  db $FF

  Sample16_17: incbin "Sample_6a1d2c118cb40a3f8831964bbf70bc1e.brr"
endspcblock

dw $0000
