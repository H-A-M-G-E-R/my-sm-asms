asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Arachnus

spcblock !p_sounds2Low+$72-1 nspc
  db Sound72, !zero, Sound74, Sound75, !zero, !zero, !zero, !zero, !zero, !zero, !zero
endspcblock

spcblock !p_sounds2High+$72-1 nspc
  db Sound72>>8, !zero>>8, Sound74>>8, Sound75>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8, !zero>>8
endspcblock

spcblock !p_sampleDataEnd nspc
Sound72:
  db $01 : dw .voice0
.voice0
  db $26
  db $94,$90,$30
  db $FF

Sound74:
  db $11 : dw Sound72_voice0

Sound75:
  db $11 : dw .voice0
.voice0
  db $26
  db $97,$A0,$30
  db $FF

endspcblock

dw $0000
