asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Nightmare

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, Sound73, Sound74, !zero, !zero, !zero, !zero, !zero, Sound7A, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, Sound73>>8, Sound74>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound7A>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$F2,$B8,$04,$00
  db $17,$FF,$F2,$B8,$04,$00
endspcblock

spcblock !p_sampleDataEnd nspc
Sound74:
  db $11 : dw .voice0
.voice0
  db $22
  db $94,$A0,$0D
  db $00
  db $98,$D8,$05
  db $09
  db $B0,$50,$03
  db $B3,$50,$06
  db $00
  db $98,$D8,$05
  db $09
  db $B0,$50,$03
  db $B3,$50,$06
  db $00
  db $98,$D8,$05
  db $F5,$F0,$C7
  db $09
  db $B0,$50,$03
  db $F5,$F0,$C7
  db $B0,$50,$03
  db $F5,$F0,$C7
  db $B0,$50,$06
  db $FF

Sound72:
  db $01 : dw .voice0
.voice0
  db $21
  db $96,$A0,$30
  db $FF

Sound73:
  db $01 : dw .voice0
.voice0
  db $F5,$10,$8C
  db $23
  db $96,$60,$30
  db $FF

Sound7A:
  db $12 : dw .voice0, .voice1
.voice1
  db $22
  db $A0,$00,$04
  db $FE,$00
  db $F6,$07
  db $11
  db $A4,$8F,$0D
  db $F6,$08
  db $A5,$8F,$0D
  db $F6,$09
  db $A7,$8F,$0D
  db $F6,$0A
  db $A9,$8F,$0D
  db $F6,$0B
  db $AB,$8F,$0D
  db $F6,$0C
  db $AC,$8F,$0D
  db $F6,$0D
  db $AE,$8F,$0D
  db $F6,$0C
  db $B0,$8F,$0D
  db $F6,$0B
  db $B1,$8F,$0D
  db $F6,$0A
  db $B3,$8F,$0D
  db $FB
  db $FF

.voice0
  db $FE,$00
  db $22
  db $84,$A0,$0D
  db $85,$A0,$0D
  db $87,$A0,$0D
  db $89,$A0,$0D
  db $8B,$A0,$0D
  db $8C,$A0,$0D
  db $8E,$A0,$0D
  db $90,$A0,$0D
  db $91,$A0,$0D
  db $93,$A0,$0D
  db $FB
  db $FF

SongSpecificSounds:
  dw SoundNightmareBeam ; C0

SoundNightmareBeam:
  db $01 : dw .voice0
.voice0
  db $24
  !c5,200,19
  db $FF

endspcblock

spcblock !p_extra+2 nspc
  dw SongSpecificSounds
endspcblock

dw $0000
