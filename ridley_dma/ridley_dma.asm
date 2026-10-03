; Ridley DMA Freeup, by H A M
; DMAs most of Ridley's graphics to save sprite tile VRAM.
; Norfair Ridley doesn't use extra enemy tiles anymore.
; Uses freespace in bank $A6, and any bank to store code and new GFX.
; Requires my Enemy Draw Hook ASM and cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842).

; Instructions (SMART):
; Replace Export/Enemies/E13F.gfx in your project folder with this one.
; Do the same for E17F.gfx and E1BF.gfx.
; In Norfair Ridley's room, remove enemy $E1BF from the enemy set (Enemy Graphics).

lorom

!EnemyDrawHook = $7E700A ; must be the same as the value in enemy_draw_hook.asm

!RidleyTailTipDMAIndex = $7E20AC ; unused tail ram
!RidleyHeadDMAIndex = $7E20AE
!RidleyLegDMAIndex = $7E20B0

;;; Code ;;;

org $A6A145 : JSR RidleyInitSetPreDrawHook ; hijack ridley init

; we're gonna move drawing tail and wings to the pre-draw hook
org $A6A2B4 : BRA $04 ; Main AI - enemy $E13F (Ceres Ridley)
org $A6A2D6 : BRA $04 ; Hurt AI - enemy $E13F (Ceres Ridley)
org $A6B259 : BRA $04 ; Main AI - enemy $E17F (Ridley)
org $A6B2C0 : BRA $04 ; Hurt AI - enemy $E17F (Ridley)

; change claw source and dest
org $A6DAAB : LDA #$7640
org $A6DAB1 : LDA #$7740
org $A6DAD0 : dw $64*$20+$9400, $74*$20+$9400 ; unclenched

%BEGIN_FREESPACE(A6)
RidleyInitSetPreDrawHook:
{
  LDA.w #RidleyPreDrawHook : STA !EnemyDrawHook
  ; force DMA refresh
  STA.l !RidleyTailTipDMAIndex
  STA.l !RidleyHeadDMAIndex
  STA.l !RidleyLegDMAIndex

  TDC : RTS ; restore from hijack
}

RidleyPreDrawHook:
{
  ; move drawing tail and wings here to prevent them from wobbling when scrolling
  ; because they were drawn before scrolling
  JSR $DB2A ; Draw Ridley tail
  JSR $DAD8 ; Draw Ridley wings

  JML RidleyPreDrawHookPart2
}
%END_FREESPACE(A6)

%BEGIN_FREESPACE(89) ; any lorom bank ($80..BF)
RidleyPreDrawHookPart2:
{
  PHB : PHK : PLB
  ; DMA tail tip
  ; tail angle code copied from vanilla
  LDA $7E20A2 : CLC : ADC $7E208E
  CLC : ADC #$0008 : AND #$00F0 : LSR : LSR : LSR
  CMP.l !RidleyTailTipDMAIndex : BEQ .noTailTipDMA
    STA !RidleyTailTipDMAIndex
    TAY
    LDX $0330
    LDA #$0040 : STA $D0,x : STA $D0+7,x
    LDA.w #(RidleyTailTipGFX>>8)&$FF00 : STA $D3,x : STA $D3+7,x
    LDA.w RidleyTailTipDMAPointers,y : STA $D2,x
    CLC : ADC #$0040 : STA $D2+7,x
    LDA #$70E0 : STA $D5,x
    LDA #$71E0 : STA $D5+7,x
    TXA : CLC : ADC #$000E : STA $0330
  .noTailTipDMA
  ; DMA head
  LDX $0F8E ; spritemap pointer
  LDA $A60001,x : PHA
  AND #$000F : CMP.l !RidleyHeadDMAIndex : BEQ .noHeadDMA
    STA !RidleyHeadDMAIndex
    ASL : TAX : LDY.w RidleyHeadDMADefPointers,x
    JSL DoDMADef
  .noHeadDMA
  PLA : AND #$00F0 : CMP.l !RidleyLegDMAIndex : BEQ .noLegDMA
    STA !RidleyLegDMAIndex
    LSR : LSR : LSR : TAX : LDY.w RidleyLegDMADefPointers,x
    JSL DoDMADef
  .noLegDMA
  PLB : SEC : RTL ; draw normally
}

; can be called externally
; Parameters:
;     DB:Y: address of DMA definition 
DoDMADef:
{
  PHX
  LDX $0330
  CLC

.loop
  ; size
  LDA $0000,y : BEQ .rtl
  STA $D0,x
  ; src
  LDA $0002,y : STA $D2,x
  LDA $0003,y : STA $D3,x
  ; dest
  LDA $0005,y : STA $D5,x
  TXA : ADC #$0007 : TAX
  TYA : ADC #$0007 : TAY
  BRA .loop

.rtl
  STX $0330
  PLX : RTL
}

RidleyTailTipDMAPointers:
{
  dw 4*4*$20+RidleyTailTipGFX
  dw 3*4*$20+RidleyTailTipGFX
  dw 2*4*$20+RidleyTailTipGFX
  dw 1*4*$20+RidleyTailTipGFX
  dw 0*4*$20+RidleyTailTipGFX
  dw 1*4*$20+RidleyTailTipGFX
  dw 2*4*$20+RidleyTailTipGFX
  dw 3*4*$20+RidleyTailTipGFX
  dw 4*4*$20+RidleyTailTipGFX
  dw 3*4*$20+RidleyTailTipGFX
  dw 2*4*$20+RidleyTailTipGFX
  dw 1*4*$20+RidleyTailTipGFX
  dw 0*4*$20+RidleyTailTipGFX
  dw 1*4*$20+RidleyTailTipGFX
  dw 2*4*$20+RidleyTailTipGFX
  dw 3*4*$20+RidleyTailTipGFX
}

RidleyHeadDMADefPointers:
{
  dw RidleyHeadDMADef_MouthClosed
  dw RidleyHeadDMADef_MouthHalfOpen
  dw RidleyHeadDMADef_MouthOpen
  dw RidleyHeadDMADef_FacingForward
}

; size, src, dest
RidleyHeadDMADef_MouthClosed:
{
  dw $20*$20 : dl 0*$20*$20+RidleyHeadGFX : dw $7800
  dw 0
}

RidleyHeadDMADef_MouthHalfOpen:
{
  dw $20*$20 : dl 1*$20*$20+RidleyHeadGFX : dw $7800
  dw 2*$20 : dl 0*2*$20+RidleyNeckGFX : dw $7540
  dw 0
}

RidleyHeadDMADef_MouthOpen:
{
  dw $20*$20 : dl 2*$20*$20+RidleyHeadGFX : dw $7800
  dw 2*$20 : dl 1*2*$20+RidleyNeckGFX : dw $7540
  dw 0
}

RidleyHeadDMADef_FacingForward:
{
  dw $20*$20 : dl 3*$20*$20+RidleyHeadGFX : dw $7800
  dw 0
}

RidleyLegDMADefPointers:
{
  dw RidleyLegDMADef_NotExtended
  dw RidleyLegDMADef_HalfExtended
  dw RidleyLegDMADef_Extended
}

RidleyLegDMADef_NotExtended:
{
  dw 4*$20 : dl 0*4*$20+RidleyLegGFX : dw $7600
  dw 4*$20 : dl 1*4*$20+RidleyLegGFX : dw $7700
  dw 0
}

RidleyLegDMADef_HalfExtended:
{
  dw 4*$20 : dl 2*4*$20+RidleyLegGFX : dw $7600
  dw 4*$20 : dl 3*4*$20+RidleyLegGFX : dw $7700
  dw 0
}

RidleyLegDMADef_Extended:
{
  dw 4*$20 : dl 4*4*$20+RidleyLegGFX : dw $7600
  dw 4*$20 : dl 5*4*$20+RidleyLegGFX : dw $7700
  dw 0
}
%END_FREESPACE(89)

;;; Spritemaps ;;;

; baby
org $A6BFFD
{
BabyMetroidSpritemap_0_A6BFFD:
dw $0005 : db $00,$00,$08,$0D,$F5, $F8,$01,$08,$0D,$B5, $00,$00,$F0,$0D,$75, $F8,$01,$F0,$0D,$35, $F8,$81,$F8,$68,$37

BabyMetroidSpritemap_1_A6C018:
dw $0005 : db $00,$00,$08,$0D,$F5, $F8,$01,$08,$0D,$B5, $00,$00,$F0,$0D,$75, $F8,$01,$F0,$0D,$35, $F8,$81,$F8,$6A,$37

BabyMetroidSpritemap_2_A6C033:
dw $0005 : db $00,$00,$08,$0D,$F5, $F8,$01,$08,$0D,$B5, $00,$00,$F0,$0D,$75, $F8,$01,$F0,$0D,$35, $F8,$81,$F8,$6C,$37
}

; tail
org $A6DC90
{
RidleyTailSpritemap_0_A6DC90:
dw $0001 : db $F8,$81,$F8,$48,$31

RidleyTailSpritemap_1_A6DC97:
dw $0001 : db $F8,$81,$F8,$4A,$31

RidleyTailSpritemap_2_A6DC9E:
dw $0001 : db $F8,$81,$F8,$4C,$31

RidleyTailSpritemap_3_A6DCA5:
dw $0001 : db $F8,$81,$F8,$48,$71

RidleyTailSpritemap_4_A6DCAC:
dw $0001 : db $F8,$81,$F8,$4A,$71

RidleyTailSpritemap_5_A6DCB3:
dw $0001 : db $F8,$81,$F8,$4C,$71
}

; tail tip and wing
org $A6DCDA
{
RidleyTailTipSpritemap_0_A6DCDA:
dw $0001 : db $F0,$81,$F8,$0E,$31

RidleyTailTipSpritemap_1_A6DCE1:
dw $0001 : db $F0,$81,$F4,$0E,$31

RidleyTailTipSpritemap_2_A6DCE8:
dw $0001 : db $F2,$81,$F3,$0E,$31

RidleyTailTipSpritemap_3_A6DCEF:
dw $0001 : db $F4,$81,$F0,$0E,$31

RidleyTailTipSpritemap_4_A6DCF6:
dw $0001 : db $F8,$81,$F0,$0E,$31

RidleyTailTipSpritemap_5_A6DCFD:
dw $0001 : db $FC,$81,$F0,$0E,$71

RidleyTailTipSpritemap_6_A6DD04:
dw $0001 : db $FE,$81,$F3,$0E,$71

RidleyTailTipSpritemap_7_A6DD0B:
dw $0001 : db $00,$80,$F4,$0E,$71

RidleyTailTipSpritemap_8_A6DD12:
dw $0001 : db $00,$80,$F8,$0E,$71

RidleyTailTipSpritemap_9_A6DD19:
dw $0001 : db $00,$80,$FC,$0E,$F1

RidleyTailTipSpritemap_A_A6DD20:
dw $0001 : db $FE,$81,$FE,$0E,$F1

RidleyTailTipSpritemap_B_A6DD27:
dw $0001 : db $FC,$81,$00,$0E,$F1

RidleyTailTipSpritemap_C_A6DD2E:
dw $0001 : db $F9,$81,$00,$0E,$F1

RidleyTailTipSpritemap_D_A6DD35:
dw $0001 : db $F4,$81,$FF,$0E,$B1

RidleyTailTipSpritemap_E_A6DD3C:
dw $0001 : db $F2,$81,$FE,$0E,$B1

RidleyTailTipSpritemap_F_A6DD43:
dw $0001 : db $F0,$81,$FC,$0E,$B1

RidleyWingSpritemap_0_A6DD4A:
dw $0006 : db $2C,$00,$D7,$08,$31, $0C,$00,$EF,$18,$31, $1C,$80,$DF,$16,$31, $0C,$80,$DF,$14,$31, $1C,$80,$D7,$06,$31, $0C,$80,$D7,$04,$31

RidleyWingSpritemap_1_A6DD6A:
dw $0005 : db $2C,$00,$E4,$1D,$31, $1C,$80,$E4,$1B,$31, $0C,$80,$E4,$19,$31, $1C,$80,$DC,$0B,$31, $0C,$80,$DC,$09,$31

RidleyWingSpritemap_2_A6DD85:
dw $0003 : db $2C,$00,$F0,$28,$31, $1C,$80,$E8,$36,$31, $0C,$80,$E8,$34,$31

RidleyWingSpritemap_3_A6DD96:
dw $0003 : db $2C,$00,$E8,$28,$B1, $1C,$80,$E8,$36,$B1, $0C,$80,$E8,$34,$B1

RidleyWingSpritemap_4_A6DDA7:
dw $0005 : db $2C,$00,$F2,$1D,$B1, $1C,$80,$EA,$1B,$B1, $0C,$80,$EA,$19,$B1, $1C,$80,$F2,$0B,$B1, $0C,$80,$F2,$09,$B1

RidleyWingSpritemap_5_A6DDC2:
dw $0006 : db $2C,$00,$FF,$08,$B1, $0C,$00,$E7,$18,$B1, $1C,$80,$EF,$16,$B1, $0C,$80,$EF,$14,$B1, $1C,$80,$F7,$06,$B1, $0C,$80,$F7,$04,$B1

RidleyWingSpritemap_6_A6DDE2:
dw $0006 : db $CC,$01,$D7,$08,$71, $EC,$01,$EF,$18,$71, $D4,$81,$DF,$16,$71, $E4,$81,$DF,$14,$71, $D4,$81,$D7,$06,$71, $E4,$81,$D7,$04,$71

RidleyWingSpritemap_7_A6DE02:
dw $0005 : db $CC,$01,$E4,$1D,$71, $D4,$81,$E4,$1B,$71, $E4,$81,$E4,$19,$71, $D4,$81,$DC,$0B,$71, $E4,$81,$DC,$09,$71

RidleyWingSpritemap_8_A6DE1D:
dw $0003 : db $CC,$01,$F0,$28,$71, $D4,$81,$E8,$36,$71, $E4,$81,$E8,$34,$71

RidleyWingSpritemap_9_A6DE2E:
dw $0003 : db $CC,$01,$E8,$28,$F1, $D4,$81,$E8,$36,$F1, $E4,$81,$E8,$34,$F1

RidleyWingSpritemap_A_A6DE3F:
dw $0005 : db $CC,$01,$F2,$1D,$F1, $D4,$81,$EA,$1B,$F1, $E4,$81,$EA,$19,$F1, $D4,$81,$F2,$0B,$F1, $E4,$81,$F2,$09,$F1

RidleyWingSpritemap_B_A6DE5A:
dw $0006 : db $CC,$01,$FF,$08,$F1, $EC,$01,$E7,$18,$F1, $D4,$81,$EF,$16,$F1, $E4,$81,$EF,$14,$F1, $D4,$81,$F7,$06,$F1, $E4,$81,$F7,$04,$F1
}

; extended spritemaps
; use upper byte of extended spritemap size as indices to dma
; low nibble is head, high nibble is leg
org $A6E983
{
RidleyExtSpritemap_FacingLeft:
dw $0004, 15,22,RidleySpritemap_FacingLeft_Legs_NotExtended,RidleyHitbox_3_A6EB2F, -8,7,RidleySpritemap_FacingLeft_Hand,RidleyHitbox_6_A6EB59, 16,0,RidleySpritemap_FacingLeft_Torso,RidleyHitbox_7_A6EB67, -3,-24,RidleySpritemap_FacingLeft_Head_MouthClosed,RidleyHitbox_0_A6EAE1

RidleyExtSpritemap_FacingRight:
dw $0004, -15,22,RidleySpritemap_FacingRight_Legs_NotExtended,RidleyHitbox_E_A6EBF9, 8,7,RidleySpritemap_FacingRight_Hand,RidleyHitbox_11_A6EC23, -16,0,RidleySpritemap_FacingRight_Torso,RidleyHitbox_12_A6EC31, 3,-24,RidleySpritemap_FacingRight_Head_MouthClosed,RidleyHitbox_B_A6EBAB

RidleyExtSpritemap_FacingLeft_MouthHalfOpen:
dw $0104, 15,22,RidleySpritemap_FacingLeft_Legs_NotExtended,RidleyHitbox_3_A6EB2F, -8,7,RidleySpritemap_FacingLeft_Hand,RidleyHitbox_6_A6EB59, 16,0,RidleySpritemap_FacingLeft_Torso,RidleyHitbox_7_A6EB67, -3,-24,RidleySpritemap_FacingLeft_Head_MouthHalfOpen,RidleyHitbox_1_A6EAFB

RidleyExtSpritemap_FacingLeft_MouthOpen:
dw $0204, 15,22,RidleySpritemap_FacingLeft_Legs_NotExtended,RidleyHitbox_3_A6EB2F, -8,7,RidleySpritemap_FacingLeft_Hand,RidleyHitbox_6_A6EB59, 16,0,RidleySpritemap_FacingLeft_Torso,RidleyHitbox_7_A6EB67, -3,-24,RidleySpritemap_FacingLeft_Head_MouthOpen,RidleyHitbox_2_A6EB15

RidleyExtSpritemap_FacingRight_MouthHalfOpen:
dw $0104, -15,22,RidleySpritemap_FacingRight_Legs_NotExtended,RidleyHitbox_E_A6EBF9, 8,7,RidleySpritemap_FacingRight_Hand,RidleyHitbox_11_A6EC23, -16,0,RidleySpritemap_FacingRight_Torso,RidleyHitbox_12_A6EC31, 3,-24,RidleySpritemap_FacingRight_Head_MouthHalfOpen,RidleyHitbox_C_A6EBC5

RidleyExtSpritemap_FacingRight_MouthOpen:
dw $0204, -15,22,RidleySpritemap_FacingRight_Legs_NotExtended,RidleyHitbox_E_A6EBF9, 8,7,RidleySpritemap_FacingRight_Hand,RidleyHitbox_11_A6EC23, -16,0,RidleySpritemap_FacingRight_Torso,RidleyHitbox_12_A6EC31, 3,-24,RidleySpritemap_FacingRight_Head_MouthOpen,RidleyHitbox_D_A6EBDF

RidleyExtSpritemap_FacingLeft_LegsHalfExtended:
dw $1004, 15,22,RidleySpritemap_FacingLeft_Legs_HalfExtended,RidleyHitbox_4_A6EB3D, -8,7,RidleySpritemap_FacingLeft_Hand,RidleyHitbox_6_A6EB59, 16,0,RidleySpritemap_FacingLeft_Torso,RidleyHitbox_7_A6EB67, -3,-24,RidleySpritemap_FacingLeft_Head_MouthClosed,RidleyHitbox_0_A6EAE1

RidleyExtSpritemap_FacingLeft_LegsExtended:
dw $2004, 15,22,RidleySpritemap_FacingLeft_Legs_Extended,RidleyHitbox_5_A6EB4B, -8,7,RidleySpritemap_FacingLeft_Hand,RidleyHitbox_6_A6EB59, 16,0,RidleySpritemap_FacingLeft_Torso,RidleyHitbox_7_A6EB67, -3,-24,RidleySpritemap_FacingLeft_Head_MouthClosed,RidleyHitbox_0_A6EAE1

RidleyExtSpritemap_FacingRight_LegsHalfExtended:
dw $1004, -15,22,RidleySpritemap_FacingRight_Legs_HalfExtended,RidleyHitbox_F_A6EC07, 8,7,RidleySpritemap_FacingRight_Hand,RidleyHitbox_11_A6EC23, -16,0,RidleySpritemap_FacingRight_Torso,RidleyHitbox_12_A6EC31, 3,-24,RidleySpritemap_FacingRight_Head_MouthClosed,RidleyHitbox_B_A6EBAB

RidleyExtSpritemap_FacingRight_LegsExtended:
dw $2004, -15,22,RidleySpritemap_FacingRight_Legs_Extended,RidleyHitbox_10_A6EC15, 8,7,RidleySpritemap_FacingRight_Hand,RidleyHitbox_11_A6EC23, -16,0,RidleySpritemap_FacingRight_Torso,RidleyHitbox_12_A6EC31, 3,-24,RidleySpritemap_FacingRight_Head_MouthClosed,RidleyHitbox_B_A6EBAB

RidleyExtSpritemap_FacingForward:
dw $0301, 0,-6,RidleySpritemap_FacingForward,RidleyHitbox_A_A6EB91

RidleyHitbox_0_A6EAE1:
dw $0002, -12,-26,11,13,$DF59,$DF8A, -24,3,-13,21,$DF59,$DF8A

RidleyHitbox_1_A6EAFB:
dw $0002, -41,-19,-21,-9,$DF59,$DF8A, -20,-29,11,5,$DF59,$DF8A

RidleyHitbox_2_A6EB15:
dw $0002, -37,-40,-14,-31,$DF59,$DF8A, -25,-31,9,6,$DF59,$DF8A

RidleyHitbox_3_A6EB2F:
dw $0001, -15,-10,7,2,$DF59,$DF8A

RidleyHitbox_4_A6EB3D:
dw $0001, -17,-9,6,15,$DF59,$DF8A

RidleyHitbox_5_A6EB4B:
dw $0001, -14,-1,10,23,$DF59,$DF8A

RidleyHitbox_6_A6EB59:
dw $0001, -15,-2,-1,8,$DF59,$DF8A

RidleyHitbox_7_A6EB67:
dw $0001, -16,-20,12,21,$DF59,$DF8A

;RidleyHitbox_8_A6EB75:
;dw $0001, -16,-20,12,21,$DF59,$DF8A

;RidleyHitbox_9_A6EB83:
;dw $0001, -16,-20,12,21,$DF59,$DF8A

RidleyHitbox_A_A6EB91:
dw $0002, -16,-32,16,34,$DF59,$DF8A, -8,-45,8,-33,$DF59,$DF8A

RidleyHitbox_B_A6EBAB:
dw $0002, -12,-25,11,13,$DF59,$DF8A, 12,5,24,20,$DF59,$DF8A

RidleyHitbox_C_A6EBC5:
dw $0002, -13,-29,20,5,$DF59,$DF8A, 21,-18,39,-8,$DF59,$DF8A

RidleyHitbox_D_A6EBDF:
dw $0002, -10,-31,25,8,$DF59,$DF8A, 13,-42,35,-32,$DF59,$DF8A

RidleyHitbox_E_A6EBF9:
dw $0001, -10,-10,17,2,$DF59,$DF8A

RidleyHitbox_F_A6EC07:
dw $0001, -9,-8,17,15,$DF59,$DF8A

RidleyHitbox_10_A6EC15:
dw $0001, -11,-8,14,23,$DF59,$DF8A

RidleyHitbox_11_A6EC23:
dw $0001, 1,-2,14,9,$DF59,$DF8A

RidleyHitbox_12_A6EC31:
dw $0001, -13,-22,14,21,$DF59,$DF8A

;RidleyHitbox_13_A6EC3F:
;dw $0001, -13,-22,14,21,$DF59,$DF8A

;RidleyHitbox_14_A6EC4D:
;dw $0001, -13,-22,14,21,$DF59,$DF8A
}

; spritemaps
{
RidleySpritemap_FacingLeft_Head_MouthClosed:
dw $0008 : db $E4,$01,$12,$8D,$31, $FC,$81,$02,$8B,$31, $F4,$81,$02,$8A,$31, $E4,$81,$02,$88,$31, $FC,$81,$F2,$86,$31, $EC,$81,$F2,$84,$31, $04,$80,$E2,$82,$31, $F4,$81,$E2,$80,$31

RidleySpritemap_FacingLeft_Head_MouthHalfOpen:
dw $000C : db $FE,$81,$F0,$8B,$31, $F6,$01,$08,$55,$31, $F6,$01,$00,$54,$31, $FE,$81,$00,$8E,$31, $F6,$81,$F0,$8A,$31, $EE,$01,$00,$9D,$31, $E6,$01,$00,$8D,$31, $E6,$81,$F0,$88,$31, $06,$80,$E0,$86,$31, $F6,$81,$E0,$84,$31, $E6,$81,$E0,$82,$31, $D6,$81,$E8,$80,$31

RidleySpritemap_FacingLeft_Head_MouthOpen:
dw $000F : db $E0,$01,$05,$8E,$31, $00,$00,$DD,$90,$31, $E8,$01,$05,$8F,$31, $F8,$01,$05,$9F,$31, $F0,$01,$05,$9E,$31, $08,$00,$05,$55,$31, $00,$00,$05,$54,$31, $D8,$01,$D5,$80,$31, $00,$80,$F5,$8C,$31, $F8,$81,$F5,$8B,$31, $E8,$81,$F5,$89,$31, $00,$80,$E5,$87,$31, $F0,$81,$E5,$85,$31, $F0,$81,$D5,$83,$31, $E0,$81,$D5,$81,$31

RidleySpritemap_FacingLeft_Legs_NotExtended:
dw $0004 : db $FA,$81,$FF,$66,$31, $EA,$81,$FF,$64,$31, $00,$80,$F0,$62,$31, $F0,$81,$F0,$60,$31

RidleySpritemap_FacingLeft_Legs_HalfExtended:
dw $0006 : db $F9,$01,$04,$57,$31, $F1,$01,$04,$56,$31, $F9,$81,$0B,$66,$31, $E9,$81,$0B,$64,$31, $FE,$81,$F4,$62,$31, $EE,$81,$F4,$60,$31

RidleySpritemap_FacingLeft_Legs_Extended:
dw $0006 : db $EF,$01,$08,$2D,$31, $F7,$81,$08,$2E,$31, $FD,$81,$13,$66,$31, $ED,$81,$13,$64,$31, $FE,$81,$F8,$62,$31, $EE,$81,$F8,$60,$31

RidleySpritemap_FacingLeft_Hand:
dw $0001 : db $F0,$81,$FC,$42,$31

RidleySpritemap_FacingLeft_Torso:
dw $0006 : db $E8,$81,$03,$40,$31, $F0,$81,$F8,$20,$31, $00,$80,$F8,$22,$31, $FE,$81,$06,$22,$31, $00,$80,$E8,$02,$31, $F0,$81,$E8,$00,$31

RidleySpritemap_FacingForward:
dw $0018 : db $00,$00,$20,$9D,$71, $10,$00,$20,$8C,$71, $10,$00,$18,$9C,$71, $08,$00,$20,$8D,$71, $10,$00,$00,$8E,$71, $08,$80,$F0,$85,$71, $00,$80,$D0,$80,$71, $08,$80,$E0,$82,$71, $00,$80,$10,$8A,$71, $00,$80,$00,$88,$71, $00,$80,$F0,$86,$71, $00,$80,$E0,$83,$71, $F8,$01,$20,$9D,$31, $E8,$01,$20,$8C,$31, $E8,$01,$18,$9C,$31, $F0,$01,$20,$8D,$31, $E8,$01,$00,$8E,$31, $E8,$81,$F0,$85,$31, $F0,$81,$D0,$80,$31, $E8,$81,$E0,$82,$31, $F0,$81,$10,$8A,$31, $F0,$81,$00,$88,$31, $F0,$81,$F0,$86,$31, $F0,$81,$E0,$83,$31

RidleySpritemap_FacingRight_Head_MouthClosed:
dw $0008 : db $14,$00,$12,$8D,$71, $F4,$81,$02,$8B,$71, $FC,$81,$02,$8A,$71, $0C,$80,$02,$88,$71, $F4,$81,$F2,$86,$71, $04,$80,$F2,$84,$71, $EC,$81,$E2,$82,$71, $FC,$81,$E2,$80,$71

RidleySpritemap_FacingRight_Head_MouthHalfOpen:
dw $000C : db $F2,$81,$F0,$8B,$71, $02,$00,$08,$55,$71, $02,$00,$00,$54,$71, $F2,$81,$00,$8E,$71, $FA,$81,$F0,$8A,$71, $0A,$00,$00,$9D,$71, $12,$00,$00,$8D,$71, $0A,$80,$F0,$88,$71, $EA,$81,$E0,$86,$71, $FA,$81,$E0,$84,$71, $0A,$80,$E0,$82,$71, $1A,$80,$E8,$80,$71

RidleySpritemap_FacingRight_Head_MouthOpen:
dw $000F : db $18,$00,$05,$8E,$71, $F8,$01,$DD,$90,$71, $10,$00,$05,$8F,$71, $00,$00,$05,$9F,$71, $08,$00,$05,$9E,$71, $F0,$01,$05,$55,$71, $F8,$01,$05,$54,$71, $20,$00,$D5,$80,$71, $F0,$81,$F5,$8C,$71, $F8,$81,$F5,$8B,$71, $08,$80,$F5,$89,$71, $F0,$81,$E5,$87,$71, $00,$80,$E5,$85,$71, $00,$80,$D5,$83,$71, $10,$80,$D5,$81,$71

RidleySpritemap_FacingRight_Legs_NotExtended:
dw $0004 : db $F6,$81,$FF,$66,$71, $06,$80,$FF,$64,$71, $F0,$81,$F0,$62,$71, $00,$80,$F0,$60,$71

RidleySpritemap_FacingRight_Legs_HalfExtended:
dw $0006 : db $FF,$01,$04,$57,$71, $07,$00,$04,$56,$71, $F7,$81,$0B,$66,$71, $07,$80,$0B,$64,$71, $F2,$81,$F4,$62,$71, $02,$80,$F4,$60,$71

RidleySpritemap_FacingRight_Legs_Extended:
dw $0006 : db $09,$00,$08,$2D,$71, $F9,$81,$08,$2E,$71, $F3,$81,$13,$66,$71, $03,$80,$13,$64,$71, $F2,$81,$F8,$62,$71, $02,$80,$F8,$60,$71

RidleySpritemap_FacingRight_Hand:
dw $0001 : db $00,$80,$FC,$42,$71

RidleySpritemap_FacingRight_Torso:
dw $0006 : db $08,$80,$03,$40,$71, $00,$80,$F8,$20,$71, $F0,$81,$F8,$22,$71, $F2,$81,$06,$22,$71, $F0,$81,$E8,$02,$71, $00,$80,$E8,$00,$71
}

; fireball (bank $8D)
org $8D80CA
{
RidleyFireballSpritemap_0_8D80CA:
dw $0001 : db $F8,$81,$F8,$4E,$31

RidleyFireballSpritemap_1_8D80D1:
dw $0001 : db $F8,$81,$F8,$6E,$F1

RidleyFireballSpritemap_2_8D80D8:
dw $0001 : db $F8,$81,$F8,$4E,$F1

RidleyFireballSpritemap_3_8D80DF:
dw $0001 : db $F8,$81,$F8,$6E,$31
}

; explosion because spritemaps are repointed
org $A6CA65
RidleyExplosionIList_LegLeft:
dw 1,RidleySpritemap_FacingLeft_Legs_NotExtended
dw $812F ; Sleep

RidleyExplosionIList_LegRight:
dw 1,RidleySpritemap_FacingRight_Legs_NotExtended
dw $812F ; Sleep

RidleyExplosionIList_HeadLeft:
dw 1,RidleySpritemap_FacingLeft_Head_MouthOpen
dw $812F ; Sleep

RidleyExplosionIList_HeadRight:
dw 1,RidleySpritemap_FacingRight_Head_MouthOpen
dw $812F ; Sleep

RidleyExplosionIList_TorsoLeft:
dw 1,RidleySpritemap_FacingLeft_Torso
dw $812F ; Sleep

RidleyExplosionIList_TorsoRight:
dw 1,RidleySpritemap_FacingRight_Torso
dw $812F ; Sleep

RidleyExplosionIList_HandLeft:
dw 1,RidleySpritemap_FacingLeft_Hand
dw $812F ; Sleep

RidleyExplosionIList_HandRight:
dw 1,RidleySpritemap_FacingRight_Hand
dw $812F ; Sleep

; graphics (any freespace, doesn't have to be in the same bank)
%BEGIN_FREESPACE(89)
RidleyHeadGFX: incbin "head_dma.gfx"
RidleyNeckGFX: incbin "neck_dma.gfx"
RidleyLegGFX: incbin "leg_dma.gfx"
RidleyTailTipGFX: incbin "tail_tip_dma.gfx"
%END_FREESPACE(89)
