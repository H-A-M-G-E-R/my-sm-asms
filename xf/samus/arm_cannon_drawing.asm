; bank $83

DrawArmCannon_Front:
{
  PHB : PHK : PLB
  LDX $0A1C : LDA.w ArmCannonDrawingModesPerPose,x : AND #$00FF
  BEQ .rtl
  BIT #$0080 : BNE .rtl
  AND #$007F : ASL : TAX
  JSR (DrawArmCannonFunctions-2,x)
.rtl
  PLB : RTL
}

DrawArmCannon_Back:
{
  PHB : PHK : PLB
  LDX $0A1C : LDA.w ArmCannonDrawingModesPerPose,x : AND #$00FF
  BEQ .rtl
  BIT #$0080 : BEQ .rtl
  AND #$007F : ASL : TAX
  JSR (DrawArmCannonFunctions-2,x)
.rtl
  PLB : RTL
}

DrawArmCannonFunctions:
  dw DrawArmCannonFunction_Normal

DrawArmCannonFunction_Normal:
{
  ; get arm cannon direction
  LDA $0A1C : ASL : ASL : ASL : TAX : LDA $91B62C,x : AND #$000F
  ASL : TAX

  ; oam
  LDY.w ArmCannonOamPointers,x
  LDA $0D1A : SEC : SBC $0911 : STA $14
  LDA $0D1C : SEC : SBC $0915 : STA $12
  STZ $03 : STZ $00
  PHX : JSL $8B829A : PLX

  ; dma
  LDA $0AA8 : BNE .armed
  LDA.w ArmCannonDmaPointers_Normal,x
  BRA +
.armed
  LDA.w ArmCannonDmaPointers_Armed,x
+
  JSL DoDmaDef

  RTS
}

ArmCannonDrawingModesPerPose:
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $01, $00, $01, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01, $00, $01, $00, $01
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $01
  db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

ArmCannonOamPointers:
  dw ArmCannonOam_Right_Up
  dw ArmCannonOam_Right_DiagonalUp
  dw ArmCannonOam_Right_Forward
  dw ArmCannonOam_Right_DiagonalDown
  dw ArmCannonOam_Right_Down
  dw 0
  dw 0
  dw 0
  dw 0
  dw 0

ArmCannonOam_Right_Forward:
dw 2
%spritemapEntry(1, -4-18, -29+21, 0, 0, 2, 4, $05)
%spritemapEntry(1, 4-18, -29+21, 0, 0, 2, 4, $06)

ArmCannonOam_Right_DiagonalUp:
dw 1
%spritemapEntry(1, 3-17, -40+38, 0, 0, 2, 4, $06) ; x = 3-18 for standing or running

ArmCannonOam_Right_DiagonalDown:
dw 1
%spritemapEntry(1, 2-16, -31+17, 0, 0, 2, 4, $06)

ArmCannonOam_Right_Up:
dw 3
%spritemapEntry(1, -3-5, -48+46, 0, 0, 2, 4, $06)
%spritemapEntry(0, -3-5, -48+16+46, 0, 0, 2, 4, $05)
%spritemapEntry(0, -3+8-5, -48+16+46, 0, 0, 2, 4, $15)

ArmCannonOam_Right_Down:
dw 3
%spritemapEntry(0, -3-5, -24+2, 0, 0, 2, 4, $05)
%spritemapEntry(0, -3+8-5, -24+2, 0, 0, 2, 4, $15)
%spritemapEntry(1, -3-5, -16+2, 0, 0, 2, 4, $06)

ArmCannonDmaPointers_Normal:
  dw ArmCannonDma_Right_Up
  dw ArmCannonDma_Right_DiagonalUp
  dw ArmCannonDma_Right_Forward
  dw ArmCannonDma_Right_DiagonalDown
  dw ArmCannonDma_Right_Down
  dw ArmCannonDma_Left_Down
  dw ArmCannonDma_Left_DiagonalDown
  dw ArmCannonDma_Left_Forward
  dw ArmCannonDma_Left_DiagonalUp
  dw ArmCannonDma_Left_Up

ArmCannonDmaPointers_Armed:
  dw ArmCannonDma_Right_Up_Armed
  dw ArmCannonDma_Right_DiagonalUp_Armed
  dw ArmCannonDma_Right_Forward_Armed
  dw ArmCannonDma_Right_DiagonalDown_Armed
  dw ArmCannonDma_Right_Down_Armed
  dw ArmCannonDma_Left_Down_Armed
  dw ArmCannonDma_Left_DiagonalDown_Armed
  dw ArmCannonDma_Left_Forward_Armed
  dw ArmCannonDma_Left_DiagonalUp_Armed
  dw ArmCannonDma_Left_Up_Armed

ArmCannonDma_Right_Forward:
db 3 : dw ArmCannonGfx_Right_Forward+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Forward+3*$20 : db $15
db 0

ArmCannonDma_Right_Forward_Armed:
db 3 : dw ArmCannonGfx_Right_Forward_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Forward_Armed+3*$20 : db $15
db 0

ArmCannonDma_Right_DiagonalUp:
db 2 : dw ArmCannonGfx_Right_DiagonalUp+0*$20 : db $06
db 2 : dw ArmCannonGfx_Right_DiagonalUp+2*$20 : db $16
db 0

ArmCannonDma_Right_DiagonalUp_Armed:
db 2 : dw ArmCannonGfx_Right_DiagonalUp_Armed+0*$20 : db $06
db 2 : dw ArmCannonGfx_Right_DiagonalUp_Armed+2*$20 : db $16
db 0

ArmCannonDma_Right_DiagonalDown:
db 2 : dw ArmCannonGfx_Right_DiagonalDown+0*$20 : db $06
db 2 : dw ArmCannonGfx_Right_DiagonalDown+2*$20 : db $16
db 0

ArmCannonDma_Right_DiagonalDown_Armed:
db 2 : dw ArmCannonGfx_Right_DiagonalDown_Armed+0*$20 : db $06
db 2 : dw ArmCannonGfx_Right_DiagonalDown_Armed+2*$20 : db $16
db 0

ArmCannonDma_Right_Up:
db 3 : dw ArmCannonGfx_Right_Up+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Up+3*$20 : db $15
db 0

ArmCannonDma_Right_Up_Armed:
db 3 : dw ArmCannonGfx_Right_Up_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Up_Armed+3*$20 : db $15
db 0

ArmCannonDma_Right_Down:
db 3 : dw ArmCannonGfx_Right_Down+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Down+3*$20 : db $15
db 0

ArmCannonDma_Right_Down_Armed:
db 3 : dw ArmCannonGfx_Right_Down_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Right_Down_Armed+3*$20 : db $15
db 0

ArmCannonDma_Left_Forward:
db 3 : dw ArmCannonGfx_Left_Forward+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Forward+3*$20 : db $15
db 0

ArmCannonDma_Left_Forward_Armed:
db 3 : dw ArmCannonGfx_Left_Forward_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Forward_Armed+3*$20 : db $15
db 0

ArmCannonDma_Left_DiagonalUp:
db 2 : dw ArmCannonGfx_Left_DiagonalUp+0*$20 : db $06
db 2 : dw ArmCannonGfx_Left_DiagonalUp+2*$20 : db $16
db 0

ArmCannonDma_Left_DiagonalUp_Armed:
db 2 : dw ArmCannonGfx_Left_DiagonalUp_Armed+0*$20 : db $06
db 2 : dw ArmCannonGfx_Left_DiagonalUp_Armed+2*$20 : db $16
db 0

ArmCannonDma_Left_DiagonalDown:
db 2 : dw ArmCannonGfx_Left_DiagonalDown+0*$20 : db $06
db 2 : dw ArmCannonGfx_Left_DiagonalDown+2*$20 : db $16
db 0

ArmCannonDma_Left_DiagonalDown_Armed:
db 2 : dw ArmCannonGfx_Left_DiagonalDown_Armed+0*$20 : db $06
db 2 : dw ArmCannonGfx_Left_DiagonalDown_Armed+2*$20 : db $16
db 0

ArmCannonDma_Left_Up:
db 3 : dw ArmCannonGfx_Left_Up+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Up+3*$20 : db $15
db 0

ArmCannonDma_Left_Up_Armed:
db 3 : dw ArmCannonGfx_Left_Up_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Up_Armed+3*$20 : db $15
db 0

ArmCannonDma_Left_Down:
db 3 : dw ArmCannonGfx_Left_Down+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Down+3*$20 : db $15
db 0

ArmCannonDma_Left_Down_Armed:
db 3 : dw ArmCannonGfx_Left_Down_Armed+0*$20 : db $05
db 3 : dw ArmCannonGfx_Left_Down_Armed+3*$20 : db $15
db 0

ArmCannonGfx_Right_Forward: incbin "arm_cannon_gfx/Right_Forward_Default.gfx"
ArmCannonGfx_Right_Forward_Armed: incbin "arm_cannon_gfx/Right_Forward_Armed_Default.gfx"
ArmCannonGfx_Right_DiagonalUp: incbin "arm_cannon_gfx/Right_DiagonalUp_Default.gfx"
ArmCannonGfx_Right_DiagonalUp_Armed: incbin "arm_cannon_gfx/Right_DiagonalUp_Armed_Default.gfx"
ArmCannonGfx_Right_DiagonalDown: incbin "arm_cannon_gfx/Right_DiagonalDown_Default.gfx"
ArmCannonGfx_Right_DiagonalDown_Armed: incbin "arm_cannon_gfx/Right_DiagonalDown_Armed_Default.gfx"
ArmCannonGfx_Right_Up: incbin "arm_cannon_gfx/Right_Up_Default.gfx"
ArmCannonGfx_Right_Up_Armed: incbin "arm_cannon_gfx/Right_Up_Armed_Default.gfx"
ArmCannonGfx_Right_Down: incbin "arm_cannon_gfx/Right_Down_Default.gfx"
ArmCannonGfx_Right_Down_Armed: incbin "arm_cannon_gfx/Right_Down_Armed_Default.gfx"

ArmCannonGfx_Left_Forward: incbin "arm_cannon_gfx/Left_Forward_Default.gfx"
ArmCannonGfx_Left_Forward_Armed: incbin "arm_cannon_gfx/Left_Forward_Armed_Default.gfx"
ArmCannonGfx_Left_DiagonalUp: incbin "arm_cannon_gfx/Left_DiagonalUp_Default.gfx"
ArmCannonGfx_Left_DiagonalUp_Armed: incbin "arm_cannon_gfx/Left_DiagonalUp_Armed_Default.gfx"
ArmCannonGfx_Left_DiagonalDown: incbin "arm_cannon_gfx/Left_DiagonalDown_Default.gfx"
ArmCannonGfx_Left_DiagonalDown_Armed: incbin "arm_cannon_gfx/Left_DiagonalDown_Armed_Default.gfx"
ArmCannonGfx_Left_Up: incbin "arm_cannon_gfx/Left_Up_Default.gfx"
ArmCannonGfx_Left_Up_Armed: incbin "arm_cannon_gfx/Left_Up_Armed_Default.gfx"
ArmCannonGfx_Left_Down: incbin "arm_cannon_gfx/Left_Down_Default.gfx"
ArmCannonGfx_Left_Down_Armed: incbin "arm_cannon_gfx/Left_Down_Armed_Default.gfx"

pushpc

org $9085E2 ; normal draw samus routine
DrawSamus:
{
  PHP : REP #$30
  JSL DrawArmCannon_Front
  ; draw top
  LDA $0A1C : ASL : TAX
  PHX
    LDA $929263,x : CLC : ADC $0A96 : STA $0AC8
    PHA : JSR $8C1F : PLA ; calculate position
    JSL $8B8703
    ; determine whether bottom is drawn
    LDA $0A1F : AND #$00FF : ASL : TAX : JSR ($864E,x)
  PLX
  BCC .noBottom
  ; draw bottom
  LDA $92945D,x : CLC : ADC $0A96 : STA $0ACA
  LDX $0B04 : LDY $0B06 : JSL $8B8703
.noBottom
  JSL DrawArmCannon_Back
  JSL SetSamusTileDefs
  PLP : RTS
}
%padSafe($90864E)

pullpc
