; Draygon DMA Freeup, by H A M
; DMAs Draygon's tail tip graphics to save sprite tile VRAM.
; Draygon and her evirs don't use extra enemy tiles anymore.
; Uses freespace in bank $A5, and any bank to store new GFX.
; Requires my Enemy Draw Hook ASM and cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842).

; Instructions (SMART):
; Replace Export/Enemies/DE3F.gfx in your project folder with this one.
; Do the same for DE7F.gfx, DEBF.gfx and DEFF.gfx.

lorom

!EnemyDrawHook = $7E700A ; must be the same as the value in enemy_draw_hook.asm

!DraygonTailTipDMAIndex = $7E7808 ; unused draygon ram

;;; Code ;;;

org $A5C5A2 : JSR DraygonTailInitSetPreDrawHook ; hijack draygon tail init

; change evir vram address to $7D00
org $A58740 : LDA #$7D00 ; tiles transfer
; death sequence evir sprite objects
org $A5A091 : LDA #$0F00
org $A5A0B3 : LDA #$0F00
; fight intro evir sprite objects
org $A5A0EA : LDA #$0F00
org $A5A102 : LDA #$0F00
org $A5A11A : LDA #$0F00
org $A5A132 : LDA #$0F00

%BEGIN_FREESPACE(A5)
DraygonTailInitSetPreDrawHook:
{
  LDA.w #DraygonTailPreDrawHook : STA.l !EnemyDrawHook,x
  ; force DMA refresh
  STA.l !DraygonTailTipDMAIndex
  LDA #$0700 : RTS ; restore from hijack
}

DraygonTailPreDrawHook:
{
  ; DMA tail tip
  LDY $0F8E,x : LDA $0000,y : AND #$FF00
  CMP.l !DraygonTailTipDMAIndex : BEQ .noTailTipDMA
    STA.l !DraygonTailTipDMAIndex : TAY
    LDX $0330
    LDA #$0080 : STA $D0,x : STA $D0+7,x
    LDA.w #(DraygonTailTipGFX>>8)&$FF00 : STA $D3,x : STA $D3+7,x
    TYA : CLC : ADC.w #DraygonTailTipGFX : STA $D2,x
    CLC : ADC #$0080 : STA $D2+7,x
    LDA #$7960 : STA $D5,x
    LDA #$7A60 : STA $D5+7,x
    TXA : CLC : ADC #$000E : STA $0330
  .noTailTipDMA
  SEC : RTL ; draw normally
}
%END_FREESPACE(A5)

;;; Spritemaps ;;;

; use upper byte of extended spritemap size as indices to tail tip dma
org $A5A59D+1 : db $00

org $A5A477+1 : db $02
org $A5A55B+1 : db $02

org $A5A465+1 : db $03
org $A5A521+1 : db $03

org $A5A453+1 : db $04

org $A5A441+1 : db $05

org $A5A42F+1 : db $06
org $A5A489+1 : db $06
org $A5A4A3+1 : db $06
org $A5A4EF+1 : db $06

org $A5A41D+1 : db $07
org $A5A4C5+1 : db $07

org $A5A40B+1 : db $00
org $A5A90B+1 : db $00

org $A5A7E5+1 : db $02
org $A5A8C9+1 : db $02

org $A5A7D3+1 : db $03
org $A5A88F+1 : db $03

org $A5A7C1+1 : db $04

org $A5A7AF+1 : db $05

org $A5A79D+1 : db $06
org $A5A7F7+1 : db $06
org $A5A811+1 : db $06
org $A5A85D+1 : db $06

org $A5A78B+1 : db $07
org $A5A833+1 : db $07

org $A5A779+1 : db $00

; tail tip
org $A5B6C4
{
DraygonTailTipSpritemap_0:
dw $0003 : db $F8,$01,$F8,$A6,$27, $F8,$01,$F0,$96,$27, $F8,$81,$00,$98,$27

DraygonTailTipSpritemap_1:
dw $0003 : db $F8,$01,$F8,$A6,$27, $F8,$01,$F0,$96,$27, $F8,$81,$00,$98,$27

DraygonTailTipSpritemap_2:
dw $0004 : db $F4,$01,$F4,$A6,$27, $F4,$01,$EC,$96,$27, $F4,$01,$FC,$97,$27, $FC,$81,$FC,$98,$27

DraygonTailTipSpritemap_3:
dw $0002 : db $F0,$81,$F8,$96,$27, $00,$80,$F8,$98,$27

DraygonTailTipSpritemap_4:
dw $0003 : db $F8,$01,$00,$A7,$27, $F0,$01,$00,$A6,$27, $00,$80,$F8,$98,$27

DraygonTailTipSpritemap_5:
dw $0003 : db $F8,$01,$00,$A7,$27, $F0,$01,$00,$A6,$27, $00,$80,$F8,$98,$27

DraygonTailTipSpritemap_6:
dw $0003 : db $FC,$01,$04,$A7,$27, $F4,$01,$04,$A6,$27, $FC,$81,$F4,$98,$27

DraygonTailTipSpritemap_7:
dw $0002 : db $F8,$81,$00,$96,$27, $F8,$81,$F0,$98,$27

DraygonTailTipSpritemap_0_VHFlip:
dw $0003 : db $00,$00,$00,$A6,$E7, $00,$00,$08,$96,$E7, $F8,$81,$F0,$98,$E7

DraygonTailTipSpritemap_1_VHFlip:
dw $0003 : db $00,$00,$00,$A6,$E7, $00,$00,$08,$96,$E7, $F8,$81,$F0,$98,$E7

DraygonTailTipSpritemap_2_VHFlip:
dw $0004 : db $04,$00,$04,$A6,$E7, $04,$00,$0C,$96,$E7, $04,$00,$FC,$97,$E7, $F4,$81,$F4,$98,$E7

DraygonTailTipSpritemap_3_VHFlip:
dw $0002 : db $00,$80,$F8,$96,$E7, $F0,$81,$F8,$98,$E7

DraygonTailTipSpritemap_4_VHFlip:
dw $0003 : db $00,$00,$F8,$A7,$E7, $08,$00,$F8,$A6,$E7, $F0,$81,$F8,$98,$E7

DraygonTailTipSpritemap_5_VHFlip:
dw $0003 : db $00,$00,$F8,$A7,$E7, $08,$00,$F8,$A6,$E7, $F0,$81,$F8,$98,$E7

DraygonTailTipSpritemap_6_VHFlip:
dw $0003 : db $FC,$01,$F4,$A7,$E7, $04,$00,$F4,$A6,$E7, $F4,$81,$FC,$98,$E7

DraygonTailTipSpritemap_7_VHFlip:
dw $0002 : db $F8,$81,$F0,$96,$E7, $F8,$81,$00,$98,$E7
}

org $A5C33B
{
DraygonTailTipSpritemap_0_HFlip:
dw $0003 : db $00,$00,$F8,$A6,$67, $00,$00,$F0,$96,$67, $F8,$81,$00,$98,$67

DraygonTailTipSpritemap_1_HFlip:
dw $0003 : db $00,$00,$F8,$A6,$67, $00,$00,$F0,$96,$67, $F8,$81,$00,$98,$67

DraygonTailTipSpritemap_2_HFlip:
dw $0004 : db $04,$00,$F4,$A6,$67, $04,$00,$EC,$96,$67, $04,$00,$FC,$97,$67, $F4,$81,$FC,$98,$67

DraygonTailTipSpritemap_3_HFlip:
dw $0002 : db $00,$80,$F8,$96,$67, $F0,$81,$F8,$98,$67

DraygonTailTipSpritemap_4_HFlip:
dw $0003 : db $00,$00,$00,$A7,$67, $08,$00,$00,$A6,$67, $F0,$81,$F8,$98,$67

DraygonTailTipSpritemap_5_HFlip:
dw $0003 : db $00,$00,$00,$A7,$67, $08,$00,$00,$A6,$67, $F0,$81,$F8,$98,$67

DraygonTailTipSpritemap_6_HFlip:
dw $0003 : db $FC,$01,$04,$A7,$67, $04,$00,$04,$A6,$67, $F4,$81,$F4,$98,$67

DraygonTailTipSpritemap_7_HFlip:
dw $0002 : db $F8,$81,$00,$96,$67, $F8,$81,$F0,$98,$67

DraygonTailTipSpritemap_0_VFlip:
dw $0003 : db $F8,$01,$00,$A6,$A7, $F8,$01,$08,$96,$A7, $F8,$81,$F0,$98,$A7

DraygonTailTipSpritemap_1_VFlip:
dw $0003 : db $F8,$01,$00,$A6,$A7, $F8,$01,$08,$96,$A7, $F8,$81,$F0,$98,$A7

DraygonTailTipSpritemap_2_VFlip:
dw $0004 : db $F4,$01,$04,$A6,$A7, $F4,$01,$0C,$96,$A7, $F4,$01,$FC,$97,$A7, $FC,$81,$F4,$98,$A7

DraygonTailTipSpritemap_3_VFlip:
dw $0002 : db $F0,$81,$F8,$96,$A7, $00,$80,$F8,$98,$A7

DraygonTailTipSpritemap_4_VFlip:
dw $0003 : db $F8,$01,$F8,$A7,$A7, $F0,$01,$F8,$A6,$A7, $00,$80,$F8,$98,$A7

DraygonTailTipSpritemap_5_VFlip:
dw $0003 : db $F8,$01,$F8,$A7,$A7, $F0,$01,$F8,$A6,$A7, $00,$80,$F8,$98,$A7

DraygonTailTipSpritemap_6_VFlip:
dw $0003 : db $FC,$01,$F4,$A7,$A7, $F4,$01,$F4,$A6,$A7, $FC,$81,$FC,$98,$A7

DraygonTailTipSpritemap_7_VFlip:
dw $0002 : db $F8,$81,$F0,$96,$A7, $F8,$81,$00,$98,$A7
}

; projectiles (bank $8D)
org $8D8A0F
{
DraygonProjectileSpritemap_0_8D8A0F:
dw $0001 : db $F8,$81,$F8,$64,$21

DraygonProjectileSpritemap_1_8D8A16:
dw $0001 : db $F8,$81,$F8,$6A,$11

DraygonProjectileSpritemap_2_8D8A1D:
dw $0001 : db $F8,$81,$F8,$5E,$11

DraygonProjectileSpritemap_3_8D8A24:
dw $0001 : db $F8,$81,$F8,$5C,$11

DraygonProjectileSpritemap_4_8D8A2B:
dw $0001 : db $F8,$81,$F8,$4A,$11

DraygonProjectileSpritemap_5_8D8A32:
dw $0001 : db $FC,$01,$FC,$8A,$21

DraygonProjectileSpritemap_6_8D8A39:
dw $0001 : db $FC,$01,$FC,$89,$21

DraygonProjectileSpritemap_7_8D8A40:
dw $0001 : db $FC,$01,$FC,$88,$21

DraygonProjectileSpritemap_8_8D8A47:
dw $0001 : db $F8,$81,$F8,$76,$21

DraygonProjectileSpritemap_9_8D8A4E:
dw $0001 : db $FC,$01,$FC,$8B,$21

DraygonProjectileSpritemap_10_8D8A55:
dw $0001 : db $FC,$01,$FC,$A5,$21

DraygonProjectileSpritemap_11_8D8A5C:
dw $0001 : db $FC,$01,$FC,$A4,$21

DraygonProjectileSpritemap_12_8D8A63:
dw $0001 : db $F8,$81,$F8,$7C,$21

DraygonProjectileSpritemap_13_8D8A6A:
dw $0001 : db $F8,$81,$F8,$7E,$21

DraygonProjectileSpritemap_14_8D8A71:
dw $0001 : db $FC,$01,$FC,$8A,$3B

DraygonProjectileSpritemap_15_8D8A78:
dw $0001 : db $FC,$01,$FC,$89,$3B

DraygonProjectileSpritemap_16_8D8A7F:
dw $0001 : db $FC,$01,$FC,$88,$3B

DraygonProjectileSpritemap_17_8D8A86:
dw $0001 : db $F8,$81,$F8,$76,$3B

DraygonProjectileSpritemap_18_8D8A8D:
dw $0001 : db $F8,$81,$F8,$7C,$33

DraygonProjectileSpritemap_19_8D8A94:
dw $0004 : db $02,$00,$02,$8F,$33, $F6,$01,$02,$8E,$33, $02,$00,$F6,$7F,$33, $F6,$01,$F6,$7E,$33

DraygonProjectileSpritemap_20_8D8AAA:
dw $0001 : db $F8,$81,$F8,$9A,$3B

DraygonProjectileSpritemap_21_8D8AB1:
dw $0001 : db $F8,$81,$F8,$9C,$3B

DraygonProjectileSpritemap_22_8D8AB8:
dw $0001 : db $F8,$81,$F8,$9E,$3B
}

; foaming at mouth sprite object (bank $B4)
org $B4DD51
{
DraygonFoamingAtMouthSpritemap_0_B4DD51:
dw $0001 : db $F8,$81,$F8,$B0,$35

DraygonFoamingAtMouthSpritemap_1_B4DD58:
dw $0001 : db $F8,$81,$F4,$B2,$35

DraygonFoamingAtMouthSpritemap_2_B4DD5F:
dw $0001 : db $F8,$81,$F0,$B4,$35

DraygonFoamingAtMouthSpritemap_3_B4DD66:
dw $0001 : db $F8,$81,$EC,$B6,$35

DraygonFoamingAtMouthSpritemap_4_B4DD6D:
dw $0001 : db $F8,$81,$E8,$B8,$35

DraygonFoamingAtMouthSpritemap_5_B4DD74:
dw $0001 : db $F8,$81,$E4,$BA,$35

DraygonFoamingAtMouthSpritemap_6_B4DD7B:
dw $0001 : db $F8,$81,$E0,$BC,$35

DraygonFoamingAtMouthSpritemap_7_B4DD82:
dw $0001 : db $F8,$81,$DC,$BE,$35
}

; graphics (any freespace, doesn't have to be in the same bank)
%BEGIN_FREESPACE(89)
DraygonTailTipGFX: incbin "tail_tip_dma.gfx"
%END_FREESPACE(89)
