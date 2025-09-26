asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, !zero, !zero, !zero, Sound77, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, Sound77>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock 6*$16+!p_instrumentTable nspc
  db $16,$FF,$E0,$B8,$05,$83
  db $17,$FF,$F2,$B8,$02,$00
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
  db $97,$50,$20
  db $FF

Sound77:
  db $02 : dw .voice0, .voice1
.voice0
  db $03
  db $89,$90,$05
  db $F5,$F0,$BB
  db $07
  db $B0,$40,$20
  db $BB,$40,$0A
  db $FF

.voice1
  db $03
  db $87,$90,$05
  db $F5,$F0,$C7
  db $07
  db $BC,$40,$20
  db $FF

  Sample16_17: incbin "Sample_dee3403c2352efabd55154721f59f2e0.brr"
endspcblock

dw $0000
