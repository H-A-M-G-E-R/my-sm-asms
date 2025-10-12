; Saves 60 frames when starting gameplay.
lorom

org $80A12B
LDX #$000F
-
PHX : JSL $808F0C : PLX : DEX : BNE -
RTS

org $80A098 : STZ $05F5

org $80A0A7 : BRA $01
org $80A117 : BRA $01

org $80A11A : BRA + : org $80A122 : +
