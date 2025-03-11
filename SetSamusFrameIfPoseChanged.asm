; Optimizes the routine at $91FB08. Frees up $5B = 91 bytes at $91FB33.
lorom

org $91FB08 ; Set Samus animation frame if pose changed
SetSamusFrameIfPoseChanged:
PHP : REP #$30
LDA $0A9A : BMI .skip ; If [new pose Samus animation frame] & 8000h != 0: return
TAY ; Y = [new pose Samus animation frame]
LDA $0A1C : CMP $0A20 : BEQ .skip ; If [Samus pose] = [Samus previous pose]: return
ASL : TAX ; X = [Samus pose] * 2
STY $0A96 ; Samus animation frame = [Y]
TYA : ADC $91B010,x : TAX : LDA $910000,x : AND #$00FF : ADC $0A9C : STA $0A94 ; Samus animation frame timer = [Samus animation frame buffer] + [[$91:B010 + [X]] + [Samus animation frame]] (don't need to CLC before both ADCs)
.skip
PLP : RTL

print pc
