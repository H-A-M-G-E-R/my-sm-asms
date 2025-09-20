org $8B880D ; extended spritemap drawing routine was relocated to there
DrawExtendedSpritemap:
{
  LDA $0000,y : BEQ .rtl
  STA $18 ; remaining spritemap entries
  INY : INY
  LDX $0590 ; oam stack pointer
  CLC
.loop
  LDA $0000,y : ADC $14 : STA $0370,x ; x
  AND #$0100 : BEQ +
    ; x high
    LDA $8B8503,x : STA $16
    LDA ($16) : ORA $8B8303,x : STA ($16)
  +
  LDA $0000,y : BPL +
    ; size
    LDA $8B8503,x : STA $16
    LDA ($16) : ORA $8B8305,x : STA ($16)
  +
  ; y
  ; sign extend y offset
  LDA $0002,y : BIT #$0080 : BEQ +
  ORA #$FF00 : BRA ++
  +
  AND #$00FF
  ++
  CLC : ADC $12
  CMP #$00F0 : BCC .yOnscreen
  CMP #$FFF0 : BCS .yOnscreen
  ; y is offscreen, place it offscreen
  LDA #$00F0
.yOnscreen
  STA $0371,x
  ; tile number and attributes
  LDA $0003,y : CLC : ADC $00 : ORA $03 : STA $0372,x
  ; next
  TYA : ADC #$0005 : TAY
  TXA : ADC #$0004 : AND #$01FF : TAX
  DEC $18 : BNE .loop
  STX $0590
.rtl
  RTL
}

org $A0955B
LDY $16 : JSL DrawExtendedSpritemap
BRA + : org $A09570 : +

org $8683D6 ; enemy projectiles too
DrawEnemyProjectile:
{
  LDA $19BB,x : AND #$00FF : STA $00 ; base tile number
  LDA $19BB,x : AND #$FF00 : STA $03 ; palette
  LDA $1A4B,x : SEC : SBC $0911 : CLC : ADC $24 : STA $14 ; x
  CLC : ADC #$0080 : BIT #$FE00 : BNE .rts
  LDA $1A93,x : SEC : SBC $0915 : CLC : ADC $22 : STA $12 ; y
  LDY $1B6B,x ; spritemap pointer
  PHX : JSL DrawExtendedSpritemap : PLX
.rts
  RTS
}
