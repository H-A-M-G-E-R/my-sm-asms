; Torizo DMA Freeup, by H A M
; DMAs several of torizo's arm graphics to save sprite tile VRAM.
; Moves Bomb Torizo's crumbling chozo and Golden Torizo's egg graphics
; from extra enemy tiles to the end of normal enemy tiles.
; Repoints several of torizo's GFX in bank $AA to another bank's freespace to free up space in bank $AA.
; Uses freespace in any bank to store new GFX.
; Makes torizo's GFX be able to be freely repointed.
; Requires my Enemy Draw Hook ASM, cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842);
; and my Ridley DMA Freeup for the DoDMADef function.

; Instructions (SMART):
; Replace Export/Enemies/EEFF.gfx in your project folder with this one.
; Do the same for EF3F.gfx, EF7F.gfx and EFBF.gfx.

lorom

!EnemyDrawHook = $7E700A ; must be the same as the value in enemy_draw_hook.asm

!TorizoFrontUpperArmDMAIndex = $7E7814 ; unused torizo ram
!TorizoBackUpperArmDMAIndex = $7E7816
!TorizoHeadDMAIndex = $7E7818
!TorizoBeakDMAIndex = $7E781A

!TorizoEyeGFXPointer = $7E781C

;;; Code ;;;

org $AAC8B9 : JSR TorizoInitSetPreDrawHook ; hijack torizo init

org $AAB279 ; this was used to store some gfx
TorizoInitSetPreDrawHook:
{
  LDA.w #TorizoPreDrawHook : STA.l !EnemyDrawHook,x
  LDA #0*$20+TorizoEyeGFX : STA.l !TorizoEyeGFXPointer,x
  LDA #$C6BF ; restore from hijack
  RTS
}

TorizoPreDrawHook:
{
  LDY $0F8E,x ; spritemap pointer
  LDA $0001,y : AND #$00FF : BNE + ; high byte of size
  SEC : RTL ; draw normally

+
  ASL : ASL : STA $00 : TAY

  ; front upper arm
  LDA.w TorizoDMAIndexTable+0,y : AND #$00FF : BEQ .noFrontUpperArmDMA
  CMP.l !TorizoFrontUpperArmDMAIndex,x : BEQ .noFrontUpperArmDMA
    STA.l !TorizoFrontUpperArmDMAIndex,x : ASL : TAY
    LDA.w TorizoFrontUpperArmDMADefPointers-2,y : TAY
    JSL DoDMADef ; from my Ridley DMA Freeup
  .noFrontUpperArmDMA

  ; back upper arm
  LDY $00 : LDA.w TorizoDMAIndexTable+1,y : AND #$00FF : BEQ .noBackUpperArmDMA
  CMP.l !TorizoBackUpperArmDMAIndex,x : BEQ .noBackUpperArmDMA
    STA.l !TorizoBackUpperArmDMAIndex,x : ASL : TAY
    LDA.w TorizoBackUpperArmDMADefPointers-2,y : TAY
    JSL DoDMADef
  .noBackUpperArmDMA

  ; head
  LDY $00 : LDA.w TorizoDMAIndexTable+2,y : AND #$00FF : BEQ .noHeadDMA
  CMP.l !TorizoHeadDMAIndex,x : BEQ .noHeadDMA
    STA.l !TorizoHeadDMAIndex,x : ASL : TAY
    LDA.w TorizoHeadDMADefPointers-2,y : TAY
    JSL DoDMADef

    LDA.l !TorizoHeadDMAIndex,x : DEC : BNE .notIdle
    ; idle
    BIT $0FB6,x : BVS .blankHead
    ; eye
    LDY $0330
    LDA.w #2*$20 : STA $00D0,y
    LDA.w #(TorizoEyeGFX>>8)&$FF00 : STA $00D3,y
    LDA.l !TorizoEyeGFXPointer,x : STA $00D2,y
    LDA #$79C0 : STA $00D5,y
    TYA : CLC : ADC #$0007 : STA $0330
    BRA .noHeadDMA

  .blankHead
    ; face blown up
    LDY.w #TorizoHeadFaceBlownUpDMADef
    JSL DoDMADef
    SEC : RTL ; skip beak DMA (draw normally)

  .notIdle
    DEC : DEC : BNE .noHeadDMA
    ; facing forward
    ; force upper arm DMA after the animation finishes
    ; A is zero here
    STA.l !TorizoFrontUpperArmDMAIndex,x
    STA.l !TorizoBackUpperArmDMAIndex,x

    BIT $0FB6,x : BPL +
      ; gut blown up
      LDY.w #TorizoFacingForwardGutBlownUpDMADef
      JSL DoDMADef
    +
    BIT $0FB6,x : BVC +
      ; face blown up
      LDY.w #TorizoFacingForwardFaceBlownUpDMADef
      JSL DoDMADef
    +
  .noHeadDMA

  ; beak
  BIT $0FB6,x : BVS .noBeakDMA
  LDY $00 : LDA.w TorizoDMAIndexTable+3,y : AND #$00FF : BEQ .noBeakDMA
  CMP.l !TorizoBeakDMAIndex,x : BEQ .noBeakDMA
    STA.l !TorizoBeakDMAIndex,x : ASL : TAY
    LDA.w TorizoBeakDMADefPointers-2,y : TAY
    JSL DoDMADef
  .noBeakDMA

  SEC : RTL ; draw normally
}

; Front upper arm, back upper arm, mouth, beak
TorizoDMAIndexTable:
{
  db $00,$00,$00,$00
  db $00,$00,$03,$00
  db $04,$02,$01,$01
  db $03,$01,$01,$01
  db $02,$02,$01,$01
  db $01,$03,$01,$01
  db $02,$04,$01,$01
  db $02,$00,$01,$01
  db $01,$00,$02,$02
  db $02,$00,$02,$03
  db $03,$00,$02,$04
  db $03,$00,$02,$05
  db $03,$00,$02,$06
  db $03,$00,$01,$01
  db $01,$00,$01,$01
  db $01,$02,$01,$01
  db $01,$05,$01,$01
  db $02,$03,$01,$01
  db $03,$03,$01,$01
  db $05,$03,$01,$01
  db $05,$00,$01,$01
  db $02,$01,$01,$01
  db $02,$05,$01,$01
  db $04,$00,$01,$01
}

TorizoFrontUpperArmDMADefPointers:
{
  dw TorizoFrontUpperArmDMADef1
  dw TorizoFrontUpperArmDMADef2
  dw TorizoFrontUpperArmDMADef3
  dw TorizoFrontUpperArmDMADef4
  dw TorizoFrontUpperArmDMADef5
}

; size, src, dest
TorizoFrontUpperArmDMADef1:
{
  dw 4*$20 : dl 0*4*$20+TorizoUpperArmGFX : dw $7240
  dw 4*$20 : dl 1*4*$20+TorizoUpperArmGFX : dw $7340
  dw 0
}

TorizoFrontUpperArmDMADef2:
{
  dw 4*$20 : dl 2*4*$20+TorizoUpperArmGFX : dw $7240
  dw 4*$20 : dl 3*4*$20+TorizoUpperArmGFX : dw $7340
  dw 0
}

TorizoFrontUpperArmDMADef3:
{
  dw 4*$20 : dl 4*4*$20+TorizoUpperArmGFX : dw $7240
  dw 4*$20 : dl 5*4*$20+TorizoUpperArmGFX : dw $7340
  dw 0
}

TorizoFrontUpperArmDMADef4:
{
  dw 4*$20 : dl 6*4*$20+TorizoUpperArmGFX : dw $7240
  dw 4*$20 : dl 7*4*$20+TorizoUpperArmGFX : dw $7340
  dw 0
}

TorizoFrontUpperArmDMADef5:
{
  dw 4*$20 : dl 8*4*$20+TorizoUpperArmGFX : dw $7240
  dw 4*$20 : dl 9*4*$20+TorizoUpperArmGFX : dw $7340
  dw 0
}

TorizoBackUpperArmDMADefPointers:
{
  dw TorizoBackUpperArmDMADef1
  dw TorizoBackUpperArmDMADef2
  dw TorizoBackUpperArmDMADef3
  dw TorizoBackUpperArmDMADef4
  dw TorizoBackUpperArmDMADef5
}

; size, src, dest
TorizoBackUpperArmDMADef1:
{
  dw 4*$20 : dl 0*4*$20+TorizoUpperArmGFX : dw $7280
  dw 4*$20 : dl 1*4*$20+TorizoUpperArmGFX : dw $7380
  dw 0
}

TorizoBackUpperArmDMADef2:
{
  dw 4*$20 : dl 2*4*$20+TorizoUpperArmGFX : dw $7280
  dw 4*$20 : dl 3*4*$20+TorizoUpperArmGFX : dw $7380
  dw 0
}

TorizoBackUpperArmDMADef3:
{
  dw 4*$20 : dl 4*4*$20+TorizoUpperArmGFX : dw $7280
  dw 4*$20 : dl 5*4*$20+TorizoUpperArmGFX : dw $7380
  dw 0
}

TorizoBackUpperArmDMADef4:
{
  dw 4*$20 : dl 6*4*$20+TorizoUpperArmGFX : dw $7280
  dw 4*$20 : dl 7*4*$20+TorizoUpperArmGFX : dw $7380
  dw 0
}

TorizoBackUpperArmDMADef5:
{
  dw 4*$20 : dl 8*4*$20+TorizoUpperArmGFX : dw $7280
  dw 4*$20 : dl 9*4*$20+TorizoUpperArmGFX : dw $7380
  dw 0
}

TorizoHeadDMADefPointers:
{
  dw TorizoHeadDMADef1
  dw TorizoHeadDMADef2
  dw TorizoFacingForwardDMADef
}

TorizoHeadDMADef1:
{
  dw 4*$20 : dl 0*$20+TorizoHeadGFX : dw $78C0
  dw 0
}

TorizoHeadDMADef2:
{
  dw 4*$20 : dl 8*$20+TorizoHeadGFX : dw $78C0
  dw 4*$20 : dl 12*$20+TorizoHeadGFX : dw $79C0
  dw 0
}

TorizoFacingForwardDMADef:
{
  dw 8*$20 : dl 0*$20+TorizoFacingForwardGFX : dw $7240
  dw 8*$20 : dl 8*$20+TorizoFacingForwardGFX : dw $7340
  dw 0
}

TorizoFacingForwardGutBlownUpDMADef:
{
  dw 1*$20 : dl $04*$20+TorizoBellyFaceGFX : dw $7270
  dw 1*$20 : dl $06*$20+TorizoBellyFaceGFX : dw $7370
  dw 0
}

TorizoFacingForwardFaceBlownUpDMADef:
{
  dw 1*$20 : dl $05*$20+TorizoBellyFaceGFX : dw $7250
  dw 1*$20 : dl $07*$20+TorizoBellyFaceGFX : dw $7350
  dw 1*$20 : dl 4*$20+TorizoHeadGFX : dw $7280 ; clear top
  dw 0
}

TorizoHeadFaceBlownUpDMADef:
{
  dw 4*$20 : dl 4*$20+TorizoHeadGFX : dw $78C0
  dw 4*$20 : dl 4*$20+TorizoHeadGFX : dw $79C0
  ; clear beak
  dw 2*$20 : dl 4*$20+TorizoHeadGFX : dw $7C00
  dw 2*$20 : dl 4*$20+TorizoHeadGFX : dw $7D00
  dw 0
}

TorizoBeakDMADefPointers:
{
  dw TorizoBeakDMADef1
  dw TorizoBeakDMADef2
  dw TorizoBeakDMADef3
  dw TorizoBeakDMADef4
  dw TorizoBeakDMADef5
  dw TorizoBeakDMADef6
}

TorizoBeakDMADef1:
{
  dw 2*$20 : dl 0*2*$20+TorizoBeakGFX : dw $7C00
  dw 2*$20 : dl 1*2*$20+TorizoBeakGFX : dw $7D00
  dw 0
}

TorizoBeakDMADef2:
{
  dw 2*$20 : dl 2*2*$20+TorizoBeakGFX : dw $7C00
  dw 0
}

TorizoBeakDMADef3:
{
  dw 2*$20 : dl 3*2*$20+TorizoBeakGFX : dw $7C00
  dw 2*$20 : dl 4*2*$20+TorizoBeakGFX : dw $7D00
  dw 0
}

TorizoBeakDMADef4:
{
  dw 2*$20 : dl 5*2*$20+TorizoBeakGFX : dw $7C00
  dw 2*$20 : dl 6*2*$20+TorizoBeakGFX : dw $7D00
  dw 0
}

TorizoBeakDMADef5:
{
  dw 2*$20 : dl 7*2*$20+TorizoBeakGFX : dw $7C00
  dw 2*$20 : dl 8*2*$20+TorizoBeakGFX : dw $7D00
  dw 0
}

TorizoBeakDMADef6:
{
  dw 2*$20 : dl 9*2*$20+TorizoBeakGFX : dw $7C00
  dw 2*$20 : dl 10*2*$20+TorizoBeakGFX : dw $7D00
  dw 0
}

;;; Instruction list changes ;;;

TorizoInst_SetEyeGFXPtr:
{
  LDA $0000,y : STA.l !TorizoEyeGFXPointer,x
  TDC : STA.l !TorizoHeadDMAIndex,x ; force DMA head
  ; same number of bytes as the instruction replaced:
  ; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5]
  TYA : CLC : ADC #$0007 : TAY
  RTL
}

TorizoInst_ForceUpdateHeadDMA:
{
  TDC : STA.l !TorizoHeadDMAIndex,x
  RTL
}

assert pc() <= $AAB879

org $AAB88F : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AAB89C : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AAB8A9 : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AAB8B6 : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX
org $AAB8CB : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AAB8D8 : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AAB8E5 : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AAB8F2 : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX
org $AACA10 : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AACA1D : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AACA2A : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AACA37 : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX
org $AACA4C : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AACA59 : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AACA66 : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AACA73 : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX
org $AAD137 : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AAD144 : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AAD151 : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AAD15E : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX
org $AAD1A5 : dw TorizoInst_SetEyeGFXPtr,0*$20+TorizoEyeGFX
org $AAD1B2 : dw TorizoInst_SetEyeGFXPtr,2*$20+TorizoEyeGFX
org $AAD1BF : dw TorizoInst_SetEyeGFXPtr,4*$20+TorizoEyeGFX
org $AAD1CC : dw TorizoInst_SetEyeGFXPtr,6*$20+TorizoEyeGFX

; blow up gut
; don't transfer turning around gut blown up GFX because it's not called while torizo turns around
org $AAB0F1
{
  dw $814B,$0040 : dl $00*$20+TorizoBellyFaceGFX : dw $7300
  dw $814B,$0040 : dl $02*$20+TorizoBellyFaceGFX : dw $7400
  dw $B09C,$C6FF ; Enemy function = $C6FF (normal movement)
  dw $C2D1 ; Clear animation lock
  dw $C2FD ; Go to [enemy gut explosion link instruction]
}

; blow up face
org $AAB161
{
  dw TorizoInst_ForceUpdateHeadDMA
  dw $B09C,$C6FF ; Enemy function = $C6FF (normal movement)
  dw $C2D1 ; Clear animation lock
  dw $C2F7 ; Return
}

; change crumbling chozo tiles dest in PLM instruction list to end of normal enemy tiles
org $84D376 : dw $87E5,$0400 : dl $ADB200 : dw $7E00 ; dest was $6E00

; golden torizo egg
org $AAC9CB : dw $814B,$0400 : dl $AFE200 : dw $7E00 ; dest was $6D00

; golden torizo releasing eggs
org $AAD035 : dw $814B,$0040 : dl $08*$20+TorizoBellyFaceGFX : dw $7300
org $AAD03E : dw $814B,$0040 : dl $0A*$20+TorizoBellyFaceGFX : dw $7400

org $AAD04B : dw $814B,$0040 : dl $0C*$20+TorizoBellyFaceGFX : dw $7300
org $AAD054 : dw $814B,$0040 : dl $0E*$20+TorizoBellyFaceGFX : dw $7400

org $AAD061 : dw $814B,$0040 : dl $10*$20+TorizoBellyFaceGFX : dw $7300
org $AAD06A : dw $814B,$0040 : dl $12*$20+TorizoBellyFaceGFX : dw $7400

org $AAD08F : dw $814B,$0040 : dl $10*$20+TorizoBellyFaceGFX : dw $7300
org $AAD098 : dw $814B,$0040 : dl $12*$20+TorizoBellyFaceGFX : dw $7400

org $AAD0A5 : dw $814B,$0040 : dl $0C*$20+TorizoBellyFaceGFX : dw $7300
org $AAD0AE : dw $814B,$0040 : dl $0E*$20+TorizoBellyFaceGFX : dw $7400

org $AAD0BB : dw $814B,$0040 : dl $08*$20+TorizoBellyFaceGFX : dw $7300
org $AAD0C4 : dw $814B,$0040 : dl $0A*$20+TorizoBellyFaceGFX : dw $7400

org $AAD0D1 : dw $814B,$0040 : dl $14*$20+TorizoBellyFaceGFX : dw $7300
org $AAD0DA : dw $814B,$0040 : dl $16*$20+TorizoBellyFaceGFX : dw $7400

;;; Spritemaps ;;;

; use upper byte of extended spritemap size as indices to dma index table
{
org $AAA4E6+1 : db $01
org $AAA4F0+1 : db $01
org $AAA4FA+1 : db $02
org $AAA51C+1 : db $03
org $AAA53E+1 : db $04
org $AAA560+1 : db $05
org $AAA582+1 : db $06
org $AAA5A4+1 : db $06
org $AAA5C6+1 : db $05
org $AAA5E8+1 : db $04
org $AAA60A+1 : db $03
org $AAA62C+1 : db $02
org $AAA64E+1 : db $07
org $AAA668+1 : db $08
org $AAA682+1 : db $09
org $AAA69C+1 : db $0A
org $AAA6B6+1 : db $0B
org $AAA6D0+1 : db $0C
org $AAA6EA+1 : db $0D
org $AAA704+1 : db $08
org $AAA71E+1 : db $09
org $AAA738+1 : db $0A
org $AAA752+1 : db $0B
org $AAA76C+1 : db $0C
org $AAA786+1 : db $0E
org $AAA7A0+1 : db $0F
org $AAA7C2+1 : db $05
org $AAA7E4+1 : db $05
org $AAA806+1 : db $10
org $AAA828+1 : db $05
org $AAA84A+1 : db $11
org $AAA86C+1 : db $12
org $AAA88E+1 : db $12
org $AAA8B0+1 : db $13
org $AAA8D2+1 : db $0E
org $AAA8EC+1 : db $07
org $AAA906+1 : db $0D
org $AAA920+1 : db $0D
org $AAA93A+1 : db $14
org $AAA954+1 : db $15
org $AAA976+1 : db $04
org $AAA998+1 : db $11
org $AAA9BA+1 : db $11
org $AAA9DC+1 : db $16
org $AAA9FE+1 : db $01
org $AAAA08+1 : db $01
org $AAAA12+1 : db $07
org $AAAA1C+1 : db $0E
org $AAAA26+1 : db $0E
org $AAAA30+1 : db $0E
org $AAAA3A+1 : db $07
org $AAAA4C+1 : db $0E
org $AAAA5E+1 : db $0E
org $AAAA70+1 : db $00
org $AAAA7A+1 : db $00
org $AAAA84+1 : db $00
org $AAAA8E+1 : db $00
org $AAAA98+1 : db $02
org $AAAABA+1 : db $03
org $AAAADC+1 : db $04
org $AAAAFE+1 : db $05
org $AAAB20+1 : db $06
org $AAAB42+1 : db $06
org $AAAB64+1 : db $05
org $AAAB86+1 : db $04
org $AAABA8+1 : db $03
org $AAABCA+1 : db $02
org $AAABEC+1 : db $07
org $AAAC06+1 : db $08
org $AAAC20+1 : db $09
org $AAAC3A+1 : db $0A
org $AAAC54+1 : db $0B
org $AAAC6E+1 : db $0C
org $AAAC88+1 : db $0D
org $AAACA2+1 : db $08
org $AAACBC+1 : db $09
org $AAACD6+1 : db $0A
org $AAACF0+1 : db $0B
org $AAAD0A+1 : db $0C
org $AAAD24+1 : db $0E
org $AAAD3E+1 : db $0F
org $AAAD60+1 : db $05
org $AAAD82+1 : db $05
org $AAADA4+1 : db $10
org $AAADC6+1 : db $05
org $AAADE8+1 : db $11
org $AAAE0A+1 : db $12
org $AAAE2C+1 : db $12
org $AAAE4E+1 : db $13
org $AAAE70+1 : db $0E
org $AAAE8A+1 : db $07
org $AAAEA4+1 : db $0D
org $AAAEBE+1 : db $0D
org $AAAED8+1 : db $14
org $AAAEF2+1 : db $15
org $AAAF14+1 : db $04
org $AAAF36+1 : db $11
org $AAAF58+1 : db $11
org $AAAF7A+1 : db $16
org $AAAF9C+1 : db $07
org $AAAFA6+1 : db $0E
org $AAAFB0+1 : db $0E
org $AAAFBA+1 : db $0E
org $AAAFC4+1 : db $07
org $AAAFD6+1 : db $0E
org $AAAFE8+1 : db $0E
org $AAAFFA+1 : db $07
org $AAB014+1 : db $0D
org $AAB02E+1 : db $17
org $AAB048+1 : db $07
org $AAB062+1 : db $0D
org $AAB07C+1 : db $17
}

; spritemaps
org $AA8A96
{
TorizoSpritemap_0_AA8A96:
dw $0004 : db $0C,$00,$F4,$8F,$23, $04,$00,$F4,$8E,$23, $F4,$81,$F4,$8C,$23, $F4,$81,$04,$C0,$23

TorizoSpritemap_1_AA8AAC:
dw $0004 : db $F8,$01,$04,$C1,$23, $F0,$01,$04,$C0,$23, $00,$80,$F4,$8E,$23, $F0,$81,$F4,$8C,$23

TorizoSpritemap_2_AA8AC2:
dw $0003 : db $E8,$81,$FC,$C0,$23, $00,$80,$F4,$8E,$23, $F0,$81,$F4,$8C,$23

TorizoSpritemap_3_AA8AD3:
dw $0003 : db $E8,$81,$FC,$C0,$23, $00,$80,$F4,$8E,$23, $F0,$81,$F4,$8C,$23

TorizoSpritemap_4_AA8AE4:
dw $0003 : db $E8,$81,$FC,$C0,$23, $00,$80,$F4,$8E,$23, $F0,$81,$F4,$8C,$23

TorizoSpritemap_5_AA8AF5:
dw $0008 : db $E0,$01,$F4,$72,$23, $E8,$01,$F4,$71,$23, $F0,$01,$0C,$D0,$23, $F0,$01,$04,$D1,$23, $F0,$01,$FC,$C1,$23, $E8,$01,$FC,$C0,$23, $00,$80,$F4,$8E,$23, $F0,$81,$F4,$8C,$23

TorizoSpritemap_6_AA8B1F:
dw $0013 : db $F5,$01,$18,$3A,$23, $03,$00,$18,$3A,$63, $FC,$01,$00,$38,$63, $F8,$01,$D8,$28,$23, $F5,$01,$28,$3B,$23, $F5,$01,$20,$2B,$23, $F5,$01,$10,$2A,$23, $F6,$01,$08,$39,$23, $F7,$01,$00,$29,$23, $F0,$81,$F0,$26,$23, $F0,$81,$E0,$24,$23, $00,$00,$D8,$28,$63, $03,$00,$28,$3B,$63, $03,$00,$20,$2B,$63, $03,$00,$10,$2A,$63, $02,$00,$08,$39,$63, $01,$00,$00,$29,$63, $00,$80,$F0,$26,$63, $00,$80,$E0,$24,$63

TorizoSpritemap_7_AA8B80:
dw $001B : db $00,$00,$F8,$DC,$63, $00,$00,$F0,$08,$63, $F8,$01,$F8,$DC,$23, $F8,$01,$F0,$08,$23, $03,$00,$18,$3A,$63, $F5,$01,$18,$3A,$23, $F0,$01,$E8,$F4,$23, $F0,$01,$E0,$24,$23, $00,$00,$E8,$DD,$63, $00,$00,$E0,$CD,$63, $F8,$01,$E8,$DD,$23, $F8,$01,$E0,$CD,$23, $08,$00,$E8,$F4,$63, $08,$00,$E0,$24,$63, $FC,$01,$00,$38,$63, $F5,$01,$28,$3B,$23, $F5,$01,$20,$2B,$23, $F5,$01,$10,$2A,$23, $F6,$01,$08,$39,$23, $F7,$01,$00,$29,$23, $F0,$81,$F0,$26,$23, $03,$00,$28,$3B,$63, $03,$00,$20,$2B,$63, $03,$00,$10,$2A,$63, $02,$00,$08,$39,$63, $01,$00,$00,$29,$63, $00,$80,$F0,$26,$63

TorizoSpritemap_8_AA8C09:
dw $0001 : db $FC,$01,$FC,$70,$6B

TorizoSpritemap_9_AA8C10:
dw $0001 : db $FC,$01,$FC,$63,$6B

TorizoSpritemap_10_AA8C17:
dw $0001 : db $FC,$01,$FC,$67,$6B

TorizoSpritemap_11_AA8C1E:
dw $0001 : db $FC,$01,$FC,$6A,$6B

TorizoSpritemap_12_AA8C25:
dw $0001 : db $F8,$81,$F8,$2E,$6B

TorizoSpritemap_13_AA8C2C:
dw $0001 : db $F8,$81,$F8,$04,$23

TorizoSpritemap_14_AA8C33:
dw $001A : db $E9,$01,$FA,$1B,$23, $E1,$01,$FA,$1A,$23, $FC,$81,$EE,$26,$23, $F8,$81,$FB,$24,$63, $F2,$01,$15,$62,$23, $EA,$01,$15,$61,$23, $E2,$01,$15,$60,$23, $E7,$81,$F7,$58,$E3, $EF,$81,$FF,$47,$E3, $F9,$01,$12,$94,$23, $F1,$01,$12,$93,$23, $F1,$81,$02,$73,$23, $05,$00,$16,$0F,$23, $0D,$00,$16,$1C,$23, $0D,$00,$0E,$1F,$23, $FD,$81,$06,$0D,$23, $07,$00,$E3,$8F,$23, $FF,$01,$E3,$8E,$23, $EF,$81,$E3,$8C,$23, $EF,$81,$F3,$C0,$23, $08,$80,$06,$42,$23, $F8,$81,$06,$40,$23, $08,$80,$F6,$22,$23, $F8,$81,$F6,$20,$23, $08,$80,$E6,$02,$23, $F8,$81,$E6,$00,$23

TorizoSpritemap_15_AA8CB7:
dw $001A : db $FD,$81,$F9,$24,$23, $FD,$81,$EC,$26,$23, $E3,$01,$03,$5F,$63, $EB,$01,$03,$4C,$63, $EF,$01,$04,$4F,$63, $F7,$01,$04,$4E,$63, $FF,$01,$04,$4D,$63, $FB,$01,$10,$96,$23, $F3,$01,$10,$95,$23, $F3,$81,$00,$75,$23, $02,$00,$01,$AE,$A3, $FA,$01,$01,$AD,$A3, $FA,$81,$09,$A6,$A3, $FB,$01,$15,$62,$23, $F3,$01,$15,$61,$23, $EB,$01,$15,$60,$23, $06,$00,$E4,$8F,$23, $FE,$01,$E4,$8E,$23, $EE,$81,$E4,$8C,$23, $EE,$81,$F4,$C0,$23, $07,$80,$07,$42,$23, $F7,$81,$07,$40,$23, $07,$80,$F7,$22,$23, $F7,$81,$F7,$20,$23, $07,$80,$E7,$02,$23, $F7,$81,$E7,$00,$23

TorizoSpritemap_16_AA8D3B:
dw $001B : db $E7,$81,$0D,$6C,$63, $FA,$81,$F4,$24,$23, $FA,$81,$E7,$26,$23, $EE,$81,$07,$58,$63, $F5,$81,$FF,$47,$63, $FB,$01,$16,$98,$23, $F3,$01,$16,$97,$23, $F3,$81,$06,$77,$23, $01,$00,$1B,$62,$23, $F9,$01,$1B,$61,$23, $F1,$01,$1B,$60,$23, $07,$00,$0B,$0C,$A3, $FF,$01,$0B,$0B,$A3, $F7,$01,$0B,$0A,$A3, $07,$00,$03,$0C,$23, $FF,$01,$03,$0B,$23, $F7,$01,$03,$0A,$23, $06,$00,$DE,$8F,$23, $FE,$01,$DE,$8E,$23, $EE,$81,$DE,$8C,$23, $EE,$81,$EE,$C0,$23, $07,$80,$01,$42,$23, $F7,$81,$01,$40,$23, $07,$80,$F1,$22,$23, $F7,$81,$F1,$20,$23, $07,$80,$E1,$02,$23, $F7,$81,$E1,$00,$23

TorizoSpritemap_17_AA8DC4:
dw $0019 : db $FB,$81,$F1,$24,$23, $FB,$81,$E4,$26,$23, $E6,$81,$0A,$6C,$63, $ED,$81,$05,$58,$63, $F4,$81,$FD,$47,$63, $02,$80,$FB,$A9,$23, $02,$00,$0B,$BB,$23, $FA,$01,$0B,$AF,$23, $FA,$81,$FB,$A8,$23, $06,$00,$D9,$8F,$23, $FE,$01,$D9,$8E,$23, $EE,$81,$D9,$8C,$23, $EE,$81,$E9,$C0,$23, $07,$80,$FC,$42,$23, $F7,$81,$FC,$40,$23, $07,$80,$EC,$22,$23, $F7,$81,$EC,$20,$23, $07,$80,$DC,$02,$23, $F7,$81,$DC,$00,$23, $01,$00,$1B,$98,$23, $F9,$01,$1B,$97,$23, $F9,$81,$0B,$77,$23, $08,$00,$21,$62,$23, $00,$00,$21,$61,$23, $F8,$01,$21,$60,$23

TorizoSpritemap_18_AA8E43:
dw $0019 : db $FD,$01,$D3,$8F,$23, $F5,$01,$D3,$8E,$23, $E5,$81,$E3,$C0,$23, $E5,$81,$D3,$8C,$23, $01,$00,$0F,$AC,$23, $F9,$01,$0F,$AB,$23, $F9,$81,$FF,$A4,$23, $03,$00,$28,$62,$23, $FB,$01,$28,$61,$23, $F3,$01,$28,$60,$23, $02,$00,$21,$96,$23, $FA,$01,$21,$95,$23, $FA,$81,$11,$75,$23, $FB,$01,$0E,$AE,$25, $F3,$01,$0E,$AD,$25, $F3,$81,$FE,$A6,$25, $FD,$81,$15,$8A,$25, $F5,$81,$0D,$79,$25, $FF,$81,$1F,$A2,$25, $FE,$81,$F7,$42,$23, $EE,$81,$F7,$40,$23, $FE,$81,$E7,$22,$23, $EE,$81,$E7,$20,$23, $FE,$81,$D7,$02,$23, $EE,$81,$D7,$00,$23

TorizoSpritemap_19_AA8EC2:
dw $001A : db $FD,$01,$D4,$8F,$23, $F5,$01,$D4,$8E,$23, $E5,$81,$E4,$C0,$23, $E5,$81,$D4,$8C,$23, $FC,$01,$0E,$AE,$63, $04,$00,$0E,$AD,$63, $FC,$81,$FE,$A6,$63, $13,$00,$28,$62,$23, $0B,$00,$28,$61,$23, $03,$00,$28,$60,$23, $0D,$00,$22,$98,$23, $05,$00,$22,$97,$23, $05,$80,$12,$77,$23, $F6,$81,$FC,$A9,$25, $F6,$01,$0C,$BB,$25, $EE,$01,$0C,$AF,$25, $EE,$81,$FC,$A8,$25, $F2,$81,$1F,$A2,$25, $EF,$01,$1F,$97,$25, $EF,$81,$0F,$77,$25, $FE,$81,$F8,$42,$23, $EE,$81,$F8,$40,$23, $FE,$81,$E8,$22,$23, $EE,$81,$E8,$20,$23, $FE,$81,$D8,$02,$23, $EE,$81,$D8,$00,$23

TorizoSpritemap_20_AA8F46:
dw $001C : db $FD,$01,$D5,$8F,$23, $F5,$01,$D5,$8E,$23, $E5,$81,$E5,$C0,$23, $E5,$81,$D5,$8C,$23, $1A,$00,$28,$62,$23, $12,$00,$28,$61,$23, $0A,$00,$28,$60,$23, $FD,$01,$10,$AE,$63, $05,$00,$10,$AD,$63, $FD,$81,$00,$A6,$63, $0F,$80,$1C,$8A,$23, $07,$80,$14,$79,$23, $EB,$01,$28,$62,$25, $E3,$01,$28,$61,$25, $DB,$01,$28,$60,$25, $F7,$81,$FE,$A9,$25, $F7,$01,$0E,$BB,$25, $EF,$01,$0E,$AF,$25, $EF,$81,$FE,$A8,$25, $EF,$01,$22,$94,$25, $E7,$01,$22,$93,$25, $E7,$81,$12,$73,$25, $FE,$81,$F9,$42,$23, $EE,$81,$F9,$40,$23, $FE,$81,$E9,$22,$23, $EE,$81,$E9,$20,$23, $FE,$81,$D9,$02,$23, $EE,$81,$D9,$00,$23

TorizoSpritemap_21_AA8FD4:
dw $0016 : db $EB,$01,$28,$62,$23, $E3,$01,$28,$61,$23, $DB,$01,$28,$60,$23, $F7,$81,$FE,$A9,$23, $F7,$01,$0E,$BB,$23, $EF,$01,$0E,$AF,$23, $EF,$81,$FE,$A8,$23, $EF,$01,$22,$94,$23, $E7,$01,$22,$93,$23, $E7,$81,$12,$73,$23, $FC,$01,$0D,$AE,$65, $04,$00,$0D,$AD,$65, $FC,$81,$FD,$A6,$65, $0D,$80,$16,$8A,$25, $05,$80,$0E,$79,$25, $13,$80,$1F,$A0,$25, $FE,$81,$F9,$42,$23, $EE,$81,$F9,$40,$23, $FE,$81,$E9,$22,$23, $EE,$81,$E9,$20,$23, $FE,$81,$D9,$02,$23, $EE,$81,$D9,$00,$23

TorizoSpritemap_22_AA9044:
dw $0015 : db $FB,$01,$0F,$AE,$23, $F3,$01,$0F,$AD,$23, $F3,$81,$FF,$A6,$23, $F0,$01,$28,$62,$23, $E8,$01,$28,$61,$23, $E0,$01,$28,$60,$23, $F4,$01,$23,$94,$23, $EC,$01,$23,$93,$23, $EC,$81,$13,$73,$23, $09,$80,$1E,$A0,$25, $FF,$01,$10,$AC,$25, $F7,$01,$10,$AB,$25, $F7,$81,$00,$A4,$25, $05,$80,$18,$8A,$25, $FD,$81,$10,$79,$25, $FE,$81,$F8,$42,$23, $EE,$81,$F8,$40,$23, $FE,$81,$E8,$22,$23, $EE,$81,$E8,$20,$23, $FE,$81,$D8,$02,$23, $EE,$81,$D8,$00,$23

TorizoSpritemap_23_AA90AF:
dw $0015 : db $01,$00,$0F,$AC,$23, $F9,$01,$0F,$AB,$23, $F9,$81,$FF,$A4,$23, $03,$00,$28,$62,$23, $FB,$01,$28,$61,$23, $F3,$01,$28,$60,$23, $02,$00,$21,$96,$23, $FA,$01,$21,$95,$23, $FA,$81,$11,$75,$23, $FB,$01,$0E,$AE,$25, $F3,$01,$0E,$AD,$25, $F3,$81,$FE,$A6,$25, $FD,$81,$15,$8A,$25, $F5,$81,$0D,$79,$25, $FF,$81,$1F,$A2,$25, $FE,$81,$F7,$42,$23, $EE,$81,$F7,$40,$23, $FE,$81,$E7,$22,$23, $EE,$81,$E7,$20,$23, $FE,$81,$D7,$02,$23, $EE,$81,$D7,$00,$23

TorizoSpritemap_24_AA911A:
dw $0016 : db $FC,$01,$0E,$AE,$63, $04,$00,$0E,$AD,$63, $FC,$81,$FE,$A6,$63, $13,$00,$28,$62,$23, $0B,$00,$28,$61,$23, $03,$00,$28,$60,$23, $0D,$00,$22,$98,$23, $05,$00,$22,$97,$23, $05,$80,$12,$77,$23, $F6,$81,$FC,$A9,$25, $F6,$01,$0C,$BB,$25, $EE,$01,$0C,$AF,$25, $EE,$81,$FC,$A8,$25, $F2,$81,$1F,$A2,$25, $EF,$01,$1F,$97,$25, $EF,$81,$0F,$77,$25, $FE,$81,$F8,$42,$23, $EE,$81,$F8,$40,$23, $FE,$81,$E8,$22,$23, $EE,$81,$E8,$20,$23, $FE,$81,$D8,$02,$23, $EE,$81,$D8,$00,$23

TorizoSpritemap_25_AA918A:
dw $0016 : db $FC,$01,$0E,$AE,$63, $04,$00,$0E,$AD,$63, $FC,$81,$FE,$A6,$63, $0D,$80,$17,$8A,$23, $05,$80,$0F,$79,$23, $13,$80,$20,$A0,$23, $EB,$01,$28,$62,$25, $E3,$01,$28,$61,$25, $DB,$01,$28,$60,$25, $F7,$81,$FE,$A9,$25, $F7,$01,$0E,$BB,$25, $EF,$01,$0E,$AF,$25, $EF,$81,$FE,$A8,$25, $EF,$01,$22,$94,$25, $E7,$01,$22,$93,$25, $E7,$81,$12,$73,$25, $FE,$81,$F9,$42,$23, $EE,$81,$F9,$40,$23, $FE,$81,$E9,$22,$23, $EE,$81,$E9,$20,$23, $FE,$81,$D9,$02,$23, $EE,$81,$D9,$00,$23

TorizoSpritemap_26_AA91FA:
dw $0015 : db $0A,$80,$1D,$A0,$23, $00,$00,$0F,$AC,$23, $F8,$01,$0F,$AB,$23, $F8,$81,$FF,$A4,$23, $06,$80,$17,$8A,$23, $FE,$81,$0F,$79,$23, $FD,$01,$0F,$AE,$25, $F5,$01,$0F,$AD,$25, $F5,$81,$FF,$A6,$25, $F2,$01,$28,$62,$25, $EA,$01,$28,$61,$25, $E2,$01,$28,$60,$25, $F6,$01,$23,$94,$25, $EE,$01,$23,$93,$25, $EE,$81,$13,$73,$25, $FE,$81,$F8,$42,$23, $EE,$81,$F8,$40,$23, $FE,$81,$E8,$22,$23, $EE,$81,$E8,$20,$23, $FE,$81,$D8,$02,$23, $EE,$81,$D8,$00,$23

TorizoSpritemap_27_AA9265:
dw $0015 : db $FB,$01,$0E,$AE,$23, $F3,$01,$0E,$AD,$23, $F3,$81,$FE,$A6,$23, $FD,$81,$15,$8A,$23, $F5,$81,$0D,$79,$23, $FF,$81,$1F,$A2,$23, $01,$00,$0F,$AC,$25, $F9,$01,$0F,$AB,$25, $F9,$81,$FF,$A4,$25, $03,$00,$28,$62,$25, $FB,$01,$28,$61,$25, $F3,$01,$28,$60,$25, $02,$00,$21,$96,$25, $FA,$01,$21,$95,$25, $FA,$81,$11,$75,$25, $FE,$81,$F7,$42,$23, $EE,$81,$F7,$40,$23, $FE,$81,$E7,$22,$23, $EE,$81,$E7,$20,$23, $FE,$81,$D7,$02,$23, $EE,$81,$D7,$00,$23

TorizoSpritemap_28_AA92D0:
dw $0016 : db $F7,$81,$FC,$A9,$23, $F7,$01,$0C,$BB,$23, $EF,$01,$0C,$AF,$23, $EF,$81,$FC,$A8,$23, $F3,$81,$1F,$A2,$23, $F0,$01,$1F,$97,$23, $F0,$81,$0F,$77,$23, $FE,$01,$0E,$AE,$65, $06,$00,$0E,$AD,$65, $FE,$81,$FE,$A6,$65, $15,$00,$28,$62,$25, $0D,$00,$28,$61,$25, $05,$00,$28,$60,$25, $0F,$00,$22,$98,$25, $07,$00,$22,$97,$25, $07,$80,$12,$77,$25, $FE,$81,$F8,$42,$23, $EE,$81,$F8,$40,$23, $FE,$81,$E8,$22,$23, $EE,$81,$E8,$20,$23, $FE,$81,$D8,$02,$23, $EE,$81,$D8,$00,$23

TorizoSpritemap_29_AA9340:
dw $0007 : db $10,$00,$25,$7B,$63, $10,$00,$1D,$6B,$63, $05,$80,$FB,$24,$23, $10,$00,$16,$64,$23, $10,$00,$0E,$54,$23, $10,$00,$06,$44,$23, $F8,$81,$F8,$26,$63

TorizoSpritemap_30_AA9365:
dw $0005 : db $FA,$81,$23,$6C,$23, $01,$80,$02,$24,$23, $02,$00,$1F,$66,$63, $02,$80,$0F,$45,$63, $F8,$81,$F8,$26,$23

TorizoSpritemap_31_AA9380:
dw $0005 : db $F0,$81,$28,$6C,$23, $F9,$01,$24,$66,$63, $F9,$81,$14,$45,$63, $FC,$81,$05,$24,$23, $F8,$81,$F8,$26,$63

TorizoSpritemap_32_AA939B:
dw $0005 : db $E7,$81,$24,$6C,$23, $F8,$81,$06,$24,$23, $EC,$81,$1B,$58,$63, $F4,$81,$13,$47,$63, $F8,$81,$F8,$26,$23

TorizoSpritemap_33_AA93B6:
dw $0005 : db $DE,$81,$19,$6C,$23, $F4,$81,$05,$24,$63, $E4,$01,$16,$5C,$63, $EC,$81,$0E,$4A,$63, $F8,$81,$F8,$26,$23

TorizoSpritemap_34_AA93D1:
dw $0007 : db $EF,$81,$02,$24,$63, $CE,$01,$0B,$5F,$63, $D6,$01,$0B,$4C,$63, $DA,$01,$0B,$4F,$63, $E2,$01,$0B,$4E,$63, $EA,$01,$0B,$4D,$63, $F8,$81,$F8,$26,$63

TorizoSpritemap_35_AA93F6:
dw $0005 : db $D4,$81,$F6,$6E,$E3, $EF,$81,$02,$24,$63, $DB,$81,$FA,$58,$E3, $E3,$81,$02,$47,$E3, $F8,$81,$F8,$26,$63

TorizoSpritemap_36_AA9411:
dw $0007 : db $E6,$01,$DD,$7B,$A3, $E6,$01,$E5,$6B,$A3, $EA,$81,$F8,$24,$63, $E6,$01,$EB,$64,$E3, $E6,$01,$F3,$54,$E3, $E6,$01,$FB,$44,$E3, $F8,$81,$F8,$26,$23

TorizoSpritemap_37_AA9436:
dw $0007 : db $0F,$00,$25,$7B,$65, $0F,$00,$1D,$6B,$65, $05,$80,$FB,$28,$25, $10,$00,$16,$64,$25, $10,$00,$0E,$54,$25, $10,$00,$06,$44,$25, $F8,$81,$F8,$2A,$65

TorizoSpritemap_38_AA945B:
dw $0005 : db $FA,$81,$23,$6C,$25, $01,$80,$02,$28,$25, $02,$00,$1F,$66,$65, $02,$80,$0F,$45,$65, $F8,$81,$F8,$2A,$25

TorizoSpritemap_39_AA9476:
dw $0005 : db $F0,$81,$28,$6C,$25, $F9,$01,$24,$66,$65, $F9,$81,$14,$45,$65, $FC,$81,$05,$28,$25, $F8,$81,$F8,$2A,$65

TorizoSpritemap_40_AA9491:
dw $0005 : db $E6,$81,$23,$6C,$25, $F8,$81,$06,$28,$25, $EC,$81,$1B,$58,$65, $F4,$81,$13,$47,$65, $F8,$81,$F8,$2A,$25

TorizoSpritemap_41_AA94AC:
dw $0005 : db $DC,$81,$19,$6C,$25, $F4,$81,$05,$28,$65, $E4,$01,$16,$5C,$65, $EC,$81,$0E,$4A,$65, $F8,$81,$F8,$2A,$25

TorizoSpritemap_42_AA94C7:
dw $0007 : db $EF,$81,$02,$28,$65, $CB,$01,$0B,$5F,$65, $D3,$01,$0B,$4C,$65, $DA,$01,$0B,$4F,$65, $E2,$01,$0B,$4E,$65, $EA,$01,$0B,$4D,$65, $F8,$81,$F8,$2A,$65

TorizoSpritemap_43_AA94EC:
dw $0005 : db $D3,$81,$F4,$6E,$E5, $EF,$81,$02,$28,$65, $DB,$81,$FA,$58,$E5, $E3,$81,$02,$47,$E5, $F8,$81,$F8,$2A,$65

TorizoSpritemap_44_AA9507:
dw $0007 : db $E6,$01,$DD,$7B,$A5, $E6,$01,$E5,$6B,$A5, $EA,$81,$F8,$28,$65, $E6,$01,$EB,$64,$E5, $E6,$01,$F3,$54,$E5, $E6,$01,$FB,$44,$E5, $F8,$81,$F8,$2A,$25

TorizoSpritemap_45_AA952C:
dw $0018 : db $EE,$81,$F3,$30,$23, $F9,$81,$FD,$A9,$23, $F9,$01,$0D,$BB,$23, $F1,$01,$0D,$AF,$23, $F1,$81,$FD,$A8,$23, $FA,$81,$15,$8A,$23, $F2,$81,$0D,$79,$23, $05,$00,$20,$62,$23, $FD,$01,$20,$61,$23, $F5,$01,$20,$60,$23, $F5,$81,$FD,$A9,$25, $F5,$01,$0D,$BB,$25, $ED,$01,$0D,$AF,$25, $ED,$81,$FD,$A8,$25, $F6,$81,$15,$8A,$25, $EE,$81,$0D,$79,$25, $01,$00,$20,$62,$25, $F9,$01,$20,$61,$25, $F1,$01,$20,$60,$25, $EE,$81,$E3,$10,$23, $FE,$81,$FB,$42,$23, $FE,$81,$EB,$22,$23, $FE,$81,$DB,$02,$23, $EE,$81,$DB,$00,$23

TorizoSpritemap_46_AA95A6:
dw $0013 : db $EE,$81,$F2,$30,$23, $FC,$01,$0F,$AE,$23, $F4,$01,$0F,$AD,$23, $F4,$81,$FF,$A6,$23, $02,$80,$22,$A0,$23, $FD,$81,$19,$8A,$23, $F5,$81,$11,$79,$23, $EE,$81,$FA,$40,$23, $EE,$81,$E2,$10,$23, $FE,$81,$FA,$42,$23, $FE,$81,$EA,$22,$23, $FE,$81,$DA,$02,$23, $EE,$81,$DA,$00,$23, $F8,$01,$10,$AC,$65, $00,$00,$10,$AB,$65, $F8,$81,$00,$A4,$65, $09,$80,$24,$A0,$25, $04,$80,$1B,$8A,$25, $FC,$81,$13,$79,$25

TorizoSpritemap_47_AA9607:
dw $0015 : db $EE,$81,$F2,$30,$23, $03,$80,$27,$A2,$23, $06,$80,$27,$A2,$23, $F8,$01,$10,$AB,$23, $00,$00,$10,$AC,$23, $F8,$81,$00,$A4,$23, $FD,$81,$13,$77,$23, $05,$00,$23,$98,$23, $FD,$01,$23,$97,$23, $FB,$01,$10,$AB,$25, $03,$00,$10,$AC,$25, $FB,$81,$00,$A4,$25, $00,$80,$13,$77,$25, $08,$00,$23,$98,$25, $00,$00,$23,$97,$25, $EE,$81,$FA,$40,$23, $EE,$81,$E2,$10,$23, $FE,$81,$FA,$42,$23, $FE,$81,$EA,$22,$23, $FE,$81,$DA,$02,$23, $EE,$81,$DA,$00,$23

TorizoSpritemap_48_AA9672:
dw $0018 : db $1A,$00,$28,$62,$25, $12,$00,$28,$61,$25, $0A,$00,$28,$60,$25, $EB,$01,$28,$62,$23, $E3,$01,$28,$61,$23, $DB,$01,$28,$60,$23, $F7,$81,$FE,$A9,$23, $F7,$01,$0E,$BB,$23, $EF,$01,$0E,$AF,$23, $EF,$81,$FE,$A8,$23, $EF,$01,$22,$94,$23, $E7,$01,$22,$93,$23, $E7,$81,$12,$73,$23, $FD,$01,$10,$AE,$65, $05,$00,$10,$AD,$65, $FD,$81,$00,$A6,$65, $0F,$80,$1C,$8A,$25, $07,$80,$14,$79,$25, $FE,$81,$F9,$42,$23, $EE,$81,$F9,$40,$23, $FE,$81,$E9,$22,$23, $EE,$81,$E9,$20,$23, $FE,$81,$D9,$02,$23, $EE,$81,$D9,$00,$23

TorizoSpritemap_49_AA96EC:
dw $0018 : db $1A,$00,$28,$62,$23, $12,$00,$28,$61,$23, $0A,$00,$28,$60,$23, $FD,$01,$10,$AE,$63, $05,$00,$10,$AD,$63, $FD,$81,$00,$A6,$63, $0F,$80,$1C,$8A,$23, $07,$80,$14,$79,$23, $EB,$01,$28,$62,$25, $E3,$01,$28,$61,$25, $DB,$01,$28,$60,$25, $F7,$81,$FE,$A9,$25, $F7,$01,$0E,$BB,$25, $EF,$01,$0E,$AF,$25, $EF,$81,$FE,$A8,$25, $EF,$01,$22,$94,$25, $E7,$01,$22,$93,$25, $E7,$81,$12,$73,$25, $FE,$81,$F9,$42,$23, $EE,$81,$F9,$40,$23, $FE,$81,$E9,$22,$23, $EE,$81,$E9,$20,$23, $FE,$81,$D9,$02,$23, $EE,$81,$D9,$00,$23

TorizoSpritemap_50_AA9766:
dw $0006 : db $00,$80,$0C,$42,$23, $F0,$81,$0C,$40,$23, $00,$80,$FC,$22,$23, $F0,$81,$FC,$20,$23, $00,$80,$EC,$02,$23, $F0,$81,$EC,$00,$23

TorizoSpritemap_51_AA9786:
dw $0004 : db $EC,$01,$F4,$8F,$63, $F4,$01,$F4,$8E,$63, $FC,$81,$F4,$8C,$63, $FC,$81,$04,$C0,$63

TorizoSpritemap_52_AA979C:
dw $0004 : db $00,$00,$04,$C1,$63, $08,$00,$04,$C0,$63, $F0,$81,$F4,$8E,$63, $00,$80,$F4,$8C,$63

TorizoSpritemap_53_AA97B2:
dw $0003 : db $08,$80,$FC,$C0,$63, $F0,$81,$F4,$8E,$63, $00,$80,$F4,$8C,$63

TorizoSpritemap_54_AA97C3:
dw $0003 : db $08,$80,$FC,$C0,$63, $F0,$81,$F4,$8E,$63, $00,$80,$F4,$8C,$63

TorizoSpritemap_55_AA97D4:
dw $0003 : db $08,$80,$FC,$C0,$63, $F0,$81,$F4,$8E,$63, $00,$80,$F4,$8C,$63

TorizoSpritemap_56_AA97E5:
dw $0008 : db $18,$00,$F4,$72,$63, $10,$00,$F4,$71,$63, $08,$00,$0C,$D0,$63, $08,$00,$04,$D1,$63, $08,$00,$FC,$C1,$63, $10,$00,$FC,$C0,$63, $F0,$81,$F4,$8E,$63, $00,$80,$F4,$8C,$63

TorizoSpritemap_57_AA980F:
dw $0013 : db $F5,$01,$10,$3A,$23, $03,$00,$10,$3A,$63, $FC,$01,$F8,$38,$63, $F8,$01,$D0,$28,$23, $F5,$01,$20,$3B,$23, $F5,$01,$18,$2B,$23, $F5,$01,$08,$2A,$23, $F6,$01,$00,$39,$23, $F7,$01,$F8,$29,$23, $F0,$81,$E8,$26,$23, $F0,$81,$D8,$24,$23, $00,$00,$D0,$28,$63, $03,$00,$20,$3B,$63, $03,$00,$18,$2B,$63, $03,$00,$08,$2A,$63, $02,$00,$00,$39,$63, $01,$00,$F8,$29,$63, $00,$80,$E8,$26,$63, $00,$80,$D8,$24,$63

TorizoSpritemap_58_AA9870:
dw $001B : db $00,$00,$F0,$DC,$63, $00,$00,$E8,$08,$63, $F8,$01,$F0,$DC,$23, $F8,$01,$E8,$08,$23, $03,$00,$10,$3A,$63, $F5,$01,$10,$3A,$23, $F0,$01,$E0,$F4,$23, $F0,$01,$D8,$24,$23, $00,$00,$E0,$DD,$63, $00,$00,$D8,$CD,$63, $F8,$01,$E0,$DD,$23, $F8,$01,$D8,$CD,$23, $08,$00,$E0,$F4,$63, $08,$00,$D8,$24,$63, $FC,$01,$F8,$38,$63, $F5,$01,$20,$3B,$23, $F5,$01,$18,$2B,$23, $F5,$01,$08,$2A,$23, $F6,$01,$00,$39,$23, $F7,$01,$F8,$29,$23, $F0,$81,$E8,$26,$23, $03,$00,$20,$3B,$63, $03,$00,$18,$2B,$63, $03,$00,$08,$2A,$63, $02,$00,$00,$39,$63, $01,$00,$F8,$29,$63, $00,$80,$E8,$26,$63

TorizoSpritemap_59_AA98F9:
dw $0001 : db $FC,$01,$FC,$70,$6B

TorizoSpritemap_60_AA9900:
dw $0001 : db $FC,$01,$FC,$63,$6B

TorizoSpritemap_61_AA9907:
dw $0001 : db $FC,$01,$FC,$67,$6B

TorizoSpritemap_62_AA990E:
dw $0001 : db $FC,$01,$FC,$6A,$6B

TorizoSpritemap_63_AA9915:
dw $0001 : db $F8,$81,$F8,$2C,$67

TorizoSpritemap_64_AA991C:
dw $0001 : db $F8,$81,$F8,$2E,$6B

TorizoSpritemap_65_AA9923:
dw $0001 : db $F8,$81,$F8,$04,$63

TorizoSpritemap_66_AA992A:
dw $0006 : db $F8,$01,$08,$52,$EB, $00,$00,$08,$52,$AB, $F8,$01,$F8,$92,$2B, $F8,$01,$F0,$82,$2B, $00,$00,$F8,$92,$6B, $00,$00,$F0,$82,$6B

TorizoSpritemap_67_AA994A:
dw $001B : db $0F,$00,$FA,$1B,$63, $17,$00,$FA,$1A,$63, $17,$00,$FA,$1A,$63, $F4,$81,$EE,$26,$63, $F8,$81,$FB,$24,$23, $06,$00,$15,$62,$63, $0E,$00,$15,$61,$63, $16,$00,$15,$60,$63, $09,$80,$F7,$58,$A3, $01,$80,$FF,$47,$A3, $FF,$01,$12,$94,$63, $07,$00,$12,$93,$63, $FF,$81,$02,$73,$63, $F3,$01,$16,$0F,$63, $EB,$01,$16,$1C,$63, $EB,$01,$0E,$1F,$63, $F3,$81,$06,$0D,$63, $F1,$01,$E3,$8F,$63, $F9,$01,$E3,$8E,$63, $01,$80,$E3,$8C,$63, $01,$80,$F3,$C0,$63, $E8,$81,$06,$42,$63, $F8,$81,$06,$40,$63, $E8,$81,$F6,$22,$63, $F8,$81,$F6,$20,$63, $E8,$81,$E6,$02,$63, $F8,$81,$E6,$00,$63

TorizoSpritemap_68_AA99D3:
dw $001A : db $F3,$81,$F9,$24,$63, $F3,$81,$EC,$26,$63, $15,$00,$03,$5F,$23, $0D,$00,$03,$4C,$23, $09,$00,$04,$4F,$23, $01,$00,$04,$4E,$23, $F9,$01,$04,$4D,$23, $FD,$01,$10,$96,$63, $05,$00,$10,$95,$63, $FD,$81,$00,$75,$63, $F6,$01,$01,$AE,$E3, $FE,$01,$01,$AD,$E3, $F6,$81,$09,$A6,$E3, $FD,$01,$15,$62,$63, $05,$00,$15,$61,$63, $0D,$00,$15,$60,$63, $F2,$01,$E4,$8F,$63, $FA,$01,$E4,$8E,$63, $02,$80,$E4,$8C,$63, $02,$80,$F4,$C0,$63, $E9,$81,$07,$42,$63, $F9,$81,$07,$40,$63, $E9,$81,$F7,$22,$63, $F9,$81,$F7,$20,$63, $E9,$81,$E7,$02,$63, $F9,$81,$E7,$00,$63

TorizoSpritemap_69_AA9A57:
dw $001B : db $09,$80,$0D,$6C,$23, $F6,$81,$F4,$24,$63, $F6,$81,$E7,$26,$63, $02,$80,$07,$58,$23, $FB,$81,$FF,$47,$23, $FD,$01,$16,$98,$63, $05,$00,$16,$97,$63, $FD,$81,$06,$77,$63, $F7,$01,$1B,$62,$63, $FF,$01,$1B,$61,$63, $07,$00,$1B,$60,$63, $F1,$01,$0B,$0C,$E3, $F9,$01,$0B,$0B,$E3, $01,$00,$0B,$0A,$E3, $F1,$01,$03,$0C,$63, $F9,$01,$03,$0B,$63, $01,$00,$03,$0A,$63, $F2,$01,$DE,$8F,$63, $FA,$01,$DE,$8E,$63, $02,$80,$DE,$8C,$63, $02,$80,$EE,$C0,$63, $E9,$81,$01,$42,$63, $F9,$81,$01,$40,$63, $E9,$81,$F1,$22,$63, $F9,$81,$F1,$20,$63, $E9,$81,$E1,$02,$63, $F9,$81,$E1,$00,$63

TorizoSpritemap_70_AA9AE0:
dw $0019 : db $F5,$81,$F1,$24,$63, $F5,$81,$E4,$26,$63, $0A,$80,$0A,$6C,$23, $03,$80,$05,$58,$23, $FC,$81,$FD,$47,$23, $EE,$81,$FB,$A9,$63, $F6,$01,$0B,$BB,$63, $FE,$01,$0B,$AF,$63, $F6,$81,$FB,$A8,$63, $F2,$01,$D9,$8F,$63, $FA,$01,$D9,$8E,$63, $02,$80,$D9,$8C,$63, $02,$80,$E9,$C0,$63, $E9,$81,$FC,$42,$63, $F9,$81,$FC,$40,$63, $E9,$81,$EC,$22,$63, $F9,$81,$EC,$20,$63, $E9,$81,$DC,$02,$63, $F9,$81,$DC,$00,$63, $F7,$01,$1B,$98,$63, $FF,$01,$1B,$97,$63, $F7,$81,$0B,$77,$63, $F0,$01,$21,$62,$63, $F8,$01,$21,$61,$63, $00,$00,$21,$60,$63

TorizoSpritemap_71_AA9B5F:
dw $0019 : db $FB,$01,$D3,$8F,$63, $03,$00,$D3,$8E,$63, $0B,$80,$E3,$C0,$63, $0B,$80,$D3,$8C,$63, $F7,$01,$0F,$AC,$63, $FF,$01,$0F,$AB,$63, $F7,$81,$FF,$A4,$63, $F5,$01,$28,$62,$63, $FD,$01,$28,$61,$63, $05,$00,$28,$60,$63, $F6,$01,$21,$96,$63, $FE,$01,$21,$95,$63, $F6,$81,$11,$75,$63, $FD,$01,$0E,$AE,$65, $05,$00,$0E,$AD,$65, $FD,$81,$FE,$A6,$65, $F3,$81,$15,$8A,$65, $FB,$81,$0D,$79,$65, $F1,$81,$1F,$A2,$65, $F2,$81,$F7,$42,$63, $02,$80,$F7,$40,$63, $F2,$81,$E7,$22,$63, $02,$80,$E7,$20,$63, $F2,$81,$D7,$02,$63, $02,$80,$D7,$00,$63

TorizoSpritemap_72_AA9BDE:
dw $001A : db $FB,$01,$D4,$8F,$63, $03,$00,$D4,$8E,$63, $0B,$80,$E4,$C0,$63, $0B,$80,$D4,$8C,$63, $FC,$01,$0E,$AE,$23, $F4,$01,$0E,$AD,$23, $F4,$81,$FE,$A6,$23, $E5,$01,$28,$62,$63, $ED,$01,$28,$61,$63, $F5,$01,$28,$60,$63, $EB,$01,$22,$98,$63, $F3,$01,$22,$97,$63, $EB,$81,$12,$77,$63, $FA,$81,$FC,$A9,$65, $02,$00,$0C,$BB,$65, $0A,$00,$0C,$AF,$65, $02,$80,$FC,$A8,$65, $FE,$81,$1F,$A2,$65, $09,$00,$1F,$97,$65, $01,$80,$0F,$77,$65, $F2,$81,$F8,$42,$63, $02,$80,$F8,$40,$63, $F2,$81,$E8,$22,$63, $02,$80,$E8,$20,$63, $F2,$81,$D8,$02,$63, $02,$80,$D8,$00,$63

TorizoSpritemap_73_AA9C62:
dw $001C : db $FB,$01,$D5,$8F,$63, $03,$00,$D5,$8E,$63, $0B,$80,$E5,$C0,$63, $0B,$80,$D5,$8C,$63, $DE,$01,$28,$62,$63, $E6,$01,$28,$61,$63, $EE,$01,$28,$60,$63, $FB,$01,$10,$AE,$23, $F3,$01,$10,$AD,$23, $F3,$81,$00,$A6,$23, $E1,$81,$1C,$8A,$63, $E9,$81,$14,$79,$63, $0D,$00,$28,$62,$65, $15,$00,$28,$61,$65, $1D,$00,$28,$60,$65, $F9,$81,$FE,$A9,$65, $01,$00,$0E,$BB,$65, $09,$00,$0E,$AF,$65, $01,$80,$FE,$A8,$65, $09,$00,$22,$94,$65, $11,$00,$22,$93,$65, $09,$80,$12,$73,$65, $F2,$81,$F9,$42,$63, $02,$80,$F9,$40,$63, $F2,$81,$E9,$22,$63, $02,$80,$E9,$20,$63, $F2,$81,$D9,$02,$63, $02,$80,$D9,$00,$63

TorizoSpritemap_74_AA9CF0:
dw $0002 : db $F8,$01,$FC,$80,$2B, $00,$00,$FC,$80,$6B

TorizoSpritemap_75_AA9CFC:
dw $0004 : db $F8,$01,$00,$90,$2B, $F8,$01,$F8,$80,$2B, $00,$00,$00,$90,$6B, $00,$00,$F8,$80,$6B

TorizoSpritemap_76_AA9D12:
dw $0003 : db $F8,$81,$F4,$80,$6B, $F8,$01,$04,$99,$2B, $00,$00,$04,$99,$6B

TorizoSpritemap_77_AA9D23:
dw $0003 : db $00,$00,$06,$80,$6B, $F8,$01,$06,$80,$2B, $F8,$81,$F2,$2E,$2B

TorizoSpritemap_78_AA9D34:
dw $0016 : db $0D,$00,$28,$62,$63, $15,$00,$28,$61,$63, $1D,$00,$28,$60,$63, $F9,$81,$FE,$A9,$63, $01,$00,$0E,$BB,$63, $09,$00,$0E,$AF,$63, $01,$80,$FE,$A8,$63, $09,$00,$22,$94,$63, $11,$00,$22,$93,$63, $09,$80,$12,$73,$63, $FC,$01,$0D,$AE,$25, $F4,$01,$0D,$AD,$25, $F4,$81,$FD,$A6,$25, $E3,$81,$16,$8A,$65, $EB,$81,$0E,$79,$65, $DD,$81,$1F,$A0,$65, $F2,$81,$F9,$42,$63, $02,$80,$F9,$40,$63, $F2,$81,$E9,$22,$63, $02,$80,$E9,$20,$63, $F2,$81,$D9,$02,$63, $02,$80,$D9,$00,$63

TorizoSpritemap_79_AA9DA4:
dw $0015 : db $FD,$01,$0F,$AE,$63, $05,$00,$0F,$AD,$63, $FD,$81,$FF,$A6,$63, $08,$00,$28,$62,$63, $10,$00,$28,$61,$63, $18,$00,$28,$60,$63, $04,$00,$23,$94,$63, $0C,$00,$23,$93,$63, $04,$80,$13,$73,$63, $E7,$81,$1E,$A0,$65, $F9,$01,$10,$AC,$65, $01,$00,$10,$AB,$65, $F9,$81,$00,$A4,$65, $EB,$81,$18,$8A,$65, $F3,$81,$10,$79,$65, $F2,$81,$F8,$42,$63, $02,$80,$F8,$40,$63, $F2,$81,$E8,$22,$63, $02,$80,$E8,$20,$63, $F2,$81,$D8,$02,$63, $02,$80,$D8,$00,$63

TorizoSpritemap_80_AA9E0F:
dw $0015 : db $F7,$01,$0F,$AC,$63, $FF,$01,$0F,$AB,$63, $F7,$81,$FF,$A4,$63, $F5,$01,$28,$62,$63, $FD,$01,$28,$61,$63, $05,$00,$28,$60,$63, $F6,$01,$21,$96,$63, $FE,$01,$21,$95,$63, $F6,$81,$11,$75,$63, $FD,$01,$0E,$AE,$65, $05,$00,$0E,$AD,$65, $FD,$81,$FE,$A6,$65, $F3,$81,$15,$8A,$65, $FB,$81,$0D,$79,$65, $F1,$81,$1F,$A2,$65, $F2,$81,$F7,$42,$63, $02,$80,$F7,$40,$63, $F2,$81,$E7,$22,$63, $02,$80,$E7,$20,$63, $F2,$81,$D7,$02,$63, $02,$80,$D7,$00,$63

TorizoSpritemap_81_AA9E7A:
dw $0016 : db $FC,$01,$0E,$AE,$23, $F4,$01,$0E,$AD,$23, $F4,$81,$FE,$A6,$23, $E5,$01,$28,$62,$63, $ED,$01,$28,$61,$63, $F5,$01,$28,$60,$63, $EB,$01,$22,$98,$63, $F3,$01,$22,$97,$63, $EB,$81,$12,$77,$63, $FA,$81,$FC,$A9,$65, $02,$00,$0C,$BB,$65, $0A,$00,$0C,$AF,$65, $02,$80,$FC,$A8,$65, $FE,$81,$1F,$A2,$65, $09,$00,$1F,$97,$65, $01,$80,$0F,$77,$65, $F2,$81,$F8,$42,$63, $02,$80,$F8,$40,$63, $F2,$81,$E8,$22,$63, $02,$80,$E8,$20,$63, $F2,$81,$D8,$02,$63, $02,$80,$D8,$00,$63

TorizoSpritemap_82_AA9EEA:
dw $0016 : db $FC,$01,$0E,$AE,$23, $F4,$01,$0E,$AD,$23, $F4,$81,$FE,$A6,$23, $E3,$81,$17,$8A,$63, $EB,$81,$0F,$79,$63, $DD,$81,$20,$A0,$63, $0D,$00,$28,$62,$65, $15,$00,$28,$61,$65, $1D,$00,$28,$60,$65, $F9,$81,$FE,$A9,$65, $01,$00,$0E,$BB,$65, $09,$00,$0E,$AF,$65, $01,$80,$FE,$A8,$65, $09,$00,$22,$94,$65, $11,$00,$22,$93,$65, $09,$80,$12,$73,$65, $F2,$81,$F9,$42,$63, $02,$80,$F9,$40,$63, $F2,$81,$E9,$22,$63, $02,$80,$E9,$20,$63, $F2,$81,$D9,$02,$63, $02,$80,$D9,$00,$63

TorizoSpritemap_83_AA9F5A:
dw $0015 : db $E6,$81,$1D,$A0,$63, $F8,$01,$0F,$AC,$63, $00,$00,$0F,$AB,$63, $F8,$81,$FF,$A4,$63, $EA,$81,$17,$8A,$63, $F2,$81,$0F,$79,$63, $FB,$01,$0F,$AE,$65, $03,$00,$0F,$AD,$65, $FB,$81,$FF,$A6,$65, $06,$00,$28,$62,$65, $0E,$00,$28,$61,$65, $16,$00,$28,$60,$65, $02,$00,$23,$94,$65, $0A,$00,$23,$93,$65, $02,$80,$13,$73,$65, $F2,$81,$F8,$42,$63, $02,$80,$F8,$40,$63, $F2,$81,$E8,$22,$63, $02,$80,$E8,$20,$63, $F2,$81,$D8,$02,$63, $02,$80,$D8,$00,$63

TorizoSpritemap_84_AA9FC5:
dw $0015 : db $FD,$01,$0E,$AE,$63, $05,$00,$0E,$AD,$63, $FD,$81,$FE,$A6,$63, $F3,$81,$15,$8A,$63, $FB,$81,$0D,$79,$63, $F1,$81,$1F,$A2,$63, $F7,$01,$0F,$AC,$65, $FF,$01,$0F,$AB,$65, $F7,$81,$FF,$A4,$65, $F5,$01,$28,$62,$65, $FD,$01,$28,$61,$65, $05,$00,$28,$60,$65, $F6,$01,$21,$96,$65, $FE,$01,$21,$95,$65, $F6,$81,$11,$75,$65, $F2,$81,$F7,$42,$63, $02,$80,$F7,$40,$63, $F2,$81,$E7,$22,$63, $02,$80,$E7,$20,$63, $F2,$81,$D7,$02,$63, $02,$80,$D7,$00,$63

TorizoSpritemap_85_AAA030:
dw $0016 : db $F9,$81,$FC,$A9,$63, $01,$00,$0C,$BB,$63, $09,$00,$0C,$AF,$63, $01,$80,$FC,$A8,$63, $FD,$81,$1F,$A2,$63, $08,$00,$1F,$97,$63, $00,$80,$0F,$77,$63, $FA,$01,$0E,$AE,$25, $F2,$01,$0E,$AD,$25, $F2,$81,$FE,$A6,$25, $E3,$01,$28,$62,$65, $EB,$01,$28,$61,$65, $F3,$01,$28,$60,$65, $E9,$01,$22,$98,$65, $F1,$01,$22,$97,$65, $E9,$81,$12,$77,$65, $F2,$81,$F8,$42,$63, $02,$80,$F8,$40,$63, $F2,$81,$E8,$22,$63, $02,$80,$E8,$20,$63, $F2,$81,$D8,$02,$63, $02,$80,$D8,$00,$63

TorizoSpritemap_86_AAA0A0:
dw $0007 : db $E8,$01,$25,$7B,$23, $E8,$01,$1D,$6B,$23, $EB,$81,$FB,$24,$63, $E8,$01,$16,$64,$63, $E8,$01,$0E,$54,$63, $E8,$01,$06,$44,$63, $F8,$81,$F8,$26,$23

TorizoSpritemap_87_AAA0C5:
dw $0005 : db $F6,$81,$23,$6C,$63, $EF,$81,$02,$24,$63, $F6,$01,$1F,$66,$23, $EE,$81,$0F,$45,$23, $F8,$81,$F8,$26,$63

TorizoSpritemap_88_AAA0E0:
dw $0005 : db $00,$80,$28,$6C,$63, $FF,$01,$24,$66,$23, $F7,$81,$14,$45,$23, $F4,$81,$05,$24,$63, $F8,$81,$F8,$26,$23

TorizoSpritemap_89_AAA0FB:
dw $0005 : db $09,$80,$24,$6C,$63, $F8,$81,$06,$24,$63, $04,$80,$1B,$58,$23, $FC,$81,$13,$47,$23, $F8,$81,$F8,$26,$63

TorizoSpritemap_90_AAA116:
dw $0005 : db $12,$80,$19,$6C,$63, $FC,$81,$05,$24,$23, $14,$00,$16,$5C,$23, $04,$80,$0E,$4A,$23, $F8,$81,$F8,$26,$63

TorizoSpritemap_91_AAA131:
dw $0007 : db $01,$80,$02,$24,$23, $2A,$00,$0B,$5F,$23, $22,$00,$0B,$4C,$23, $1E,$00,$0B,$4F,$23, $16,$00,$0B,$4E,$23, $0E,$00,$0B,$4D,$23, $F8,$81,$F8,$26,$23

TorizoSpritemap_92_AAA156:
dw $0005 : db $1C,$80,$F6,$6E,$A3, $01,$80,$02,$24,$23, $15,$80,$FA,$58,$A3, $0D,$80,$02,$47,$A3, $F8,$81,$F8,$26,$23

TorizoSpritemap_93_AAA171:
dw $0007 : db $12,$00,$DD,$7B,$E3, $12,$00,$E5,$6B,$E3, $06,$80,$F8,$24,$23, $12,$00,$EB,$64,$A3, $12,$00,$F3,$54,$A3, $12,$00,$FB,$44,$A3, $F8,$81,$F8,$26,$63

TorizoSpritemap_94_AAA196:
dw $0007 : db $E9,$01,$25,$7B,$25, $E9,$01,$1D,$6B,$25, $EB,$81,$FB,$28,$65, $E8,$01,$16,$64,$65, $E8,$01,$0E,$54,$65, $E8,$01,$06,$44,$65, $F8,$81,$F8,$2A,$25

TorizoSpritemap_95_AAA1BB:
dw $0005 : db $F6,$81,$23,$6C,$65, $EF,$81,$02,$28,$65, $F6,$01,$1F,$66,$25, $EE,$81,$0F,$45,$25, $F8,$81,$F8,$2A,$65

TorizoSpritemap_96_AAA1D6:
dw $0005 : db $00,$80,$28,$6C,$65, $FF,$01,$24,$66,$25, $F7,$81,$14,$45,$25, $F4,$81,$05,$28,$65, $F8,$81,$F8,$2A,$25

TorizoSpritemap_97_AAA1F1:
dw $0005 : db $0A,$80,$23,$6C,$65, $F8,$81,$06,$28,$65, $04,$80,$1B,$58,$25, $FC,$81,$13,$47,$25, $F8,$81,$F8,$2A,$65

TorizoSpritemap_98_AAA20C:
dw $0005 : db $14,$80,$19,$6C,$65, $FC,$81,$05,$28,$25, $14,$00,$16,$5C,$25, $04,$80,$0E,$4A,$25, $F8,$81,$F8,$2A,$65

TorizoSpritemap_99_AAA227:
dw $0007 : db $01,$80,$02,$28,$25, $2D,$00,$0B,$5F,$25, $25,$00,$0B,$4C,$25, $1E,$00,$0B,$4F,$25, $16,$00,$0B,$4E,$25, $0E,$00,$0B,$4D,$25, $F8,$81,$F8,$2A,$25

TorizoSpritemap_100_AAA24C:
dw $0005 : db $1D,$80,$F4,$6E,$A5, $01,$80,$02,$28,$25, $15,$80,$FA,$58,$A5, $0D,$80,$02,$47,$A5, $F8,$81,$F8,$2A,$25

TorizoSpritemap_101_AAA267:
dw $0007 : db $12,$00,$DD,$7B,$E5, $12,$00,$E5,$6B,$E5, $06,$80,$F8,$28,$25, $12,$00,$EB,$64,$A5, $12,$00,$F3,$54,$A5, $12,$00,$FB,$44,$A5, $F8,$81,$F8,$2A,$65

TorizoSpritemap_102_AAA28C:
dw $0018 : db $02,$80,$F3,$30,$63, $F7,$81,$FD,$A9,$63, $FF,$01,$0D,$BB,$63, $07,$00,$0D,$AF,$63, $FF,$81,$FD,$A8,$63, $F6,$81,$15,$8A,$63, $FE,$81,$0D,$79,$63, $F3,$01,$20,$62,$63, $FB,$01,$20,$61,$63, $03,$00,$20,$60,$63, $FB,$81,$FD,$A9,$65, $03,$00,$0D,$BB,$65, $0B,$00,$0D,$AF,$65, $03,$80,$FD,$A8,$65, $FA,$81,$15,$8A,$65, $02,$80,$0D,$79,$65, $F7,$01,$20,$62,$65, $FF,$01,$20,$61,$65, $07,$00,$20,$60,$65, $02,$80,$E3,$10,$63, $F2,$81,$FB,$42,$63, $F2,$81,$EB,$22,$63, $F2,$81,$DB,$02,$63, $02,$80,$DB,$00,$63

TorizoSpritemap_103_AAA306:
dw $0013 : db $02,$80,$F2,$30,$63, $FC,$01,$0F,$AE,$63, $04,$00,$0F,$AD,$63, $FC,$81,$FF,$A6,$63, $EE,$81,$22,$A0,$63, $F3,$81,$19,$8A,$63, $FB,$81,$11,$79,$63, $02,$80,$FA,$40,$63, $02,$80,$E2,$10,$63, $F2,$81,$FA,$42,$63, $F2,$81,$EA,$22,$63, $F2,$81,$DA,$02,$63, $02,$80,$DA,$00,$63, $00,$00,$10,$AC,$25, $F8,$01,$10,$AB,$25, $F8,$81,$00,$A4,$25, $E7,$81,$24,$A0,$65, $EC,$81,$1B,$8A,$65, $F4,$81,$13,$79,$65

TorizoSpritemap_104_AAA367:
dw $0015 : db $02,$80,$F2,$30,$63, $ED,$81,$27,$A2,$63, $EA,$81,$27,$A2,$63, $00,$00,$10,$AB,$63, $F8,$01,$10,$AC,$63, $F8,$81,$00,$A4,$63, $F3,$81,$13,$77,$63, $F3,$01,$23,$98,$63, $FB,$01,$23,$97,$63, $FD,$01,$10,$AB,$65, $F5,$01,$10,$AC,$65, $F5,$81,$00,$A4,$65, $F0,$81,$13,$77,$65, $F0,$01,$23,$98,$65, $F8,$01,$23,$97,$65, $02,$80,$FA,$40,$63, $02,$80,$E2,$10,$63, $F2,$81,$FA,$42,$63, $F2,$81,$EA,$22,$63, $F2,$81,$DA,$02,$63, $02,$80,$DA,$00,$63

TorizoSpritemap_105_AAA3D2:
dw $0018 : db $DE,$01,$28,$62,$65, $E6,$01,$28,$61,$65, $EE,$01,$28,$60,$65, $0D,$00,$28,$62,$63, $15,$00,$28,$61,$63, $1D,$00,$28,$60,$63, $F9,$81,$FE,$A9,$63, $01,$00,$0E,$BB,$63, $09,$00,$0E,$AF,$63, $01,$80,$FE,$A8,$63, $09,$00,$22,$94,$63, $11,$00,$22,$93,$63, $09,$80,$12,$73,$63, $FB,$01,$10,$AE,$25, $F3,$01,$10,$AD,$25, $F3,$81,$00,$A6,$25, $E1,$81,$1C,$8A,$65, $E9,$81,$14,$79,$65, $F2,$81,$F9,$42,$63, $02,$80,$F9,$40,$63, $F2,$81,$E9,$22,$63, $02,$80,$E9,$20,$63, $F2,$81,$D9,$02,$63, $02,$80,$D9,$00,$63

TorizoSpritemap_106_AAA44C:
dw $0018 : db $DE,$01,$28,$62,$63, $E6,$01,$28,$61,$63, $EE,$01,$28,$60,$63, $FB,$01,$10,$AE,$23, $F3,$01,$10,$AD,$23, $F3,$81,$00,$A6,$23, $E1,$81,$1C,$8A,$63, $E9,$81,$14,$79,$63, $0D,$00,$28,$62,$65, $15,$00,$28,$61,$65, $1D,$00,$28,$60,$65, $F9,$81,$FE,$A9,$65, $01,$00,$0E,$BB,$65, $09,$00,$0E,$AF,$65, $01,$80,$FE,$A8,$65, $09,$00,$22,$94,$65, $11,$00,$22,$93,$65, $09,$80,$12,$73,$65, $F2,$81,$F9,$42,$63, $02,$80,$F9,$40,$63, $F2,$81,$E9,$22,$63, $02,$80,$E9,$20,$63, $F2,$81,$D9,$02,$63, $02,$80,$D9,$00,$63

TorizoSpritemap_107_AAA4C6:
dw $0006 : db $F0,$81,$0C,$42,$63, $00,$80,$0C,$40,$63, $F0,$81,$FC,$22,$63, $00,$80,$FC,$20,$63, $F0,$81,$EC,$02,$63, $00,$80,$EC,$00,$63
}

; bomb torizo statue breaking (bank $8D)
org $8D8DFB
{
BombTorizoStatueBreakingSpritemap_0_8D8DFB:
dw $0001 : db $F8,$81,$F8,$E0,$2F

BombTorizoStatueBreakingSpritemap_1_8D8E02:
dw $0001 : db $F8,$81,$F8,$E2,$2F

BombTorizoStatueBreakingSpritemap_2_8D8E09:
dw $0001 : db $F8,$81,$F8,$E4,$2F

BombTorizoStatueBreakingSpritemap_3_8D8E10:
dw $0001 : db $F8,$81,$F8,$E6,$2F

BombTorizoStatueBreakingSpritemap_4_8D8E17:
dw $0001 : db $F8,$81,$F8,$E8,$2F

BombTorizoStatueBreakingSpritemap_5_8D8E1E:
dw $0001 : db $F8,$81,$F8,$EA,$2F

BombTorizoStatueBreakingSpritemap_6_8D8E25:
dw $0001 : db $F8,$81,$F8,$EC,$2F

BombTorizoStatueBreakingSpritemap_7_8D8E2C:
dw $0001 : db $F8,$81,$F8,$EE,$2F

BombTorizoStatueBreakingSpritemap_8_8D8E33:
dw $0001 : db $F8,$81,$F8,$E0,$6F

BombTorizoStatueBreakingSpritemap_9_8D8E3A:
dw $0001 : db $F8,$81,$F8,$E2,$6F

BombTorizoStatueBreakingSpritemap_10_8D8E41:
dw $0001 : db $F8,$81,$F8,$E4,$6F

BombTorizoStatueBreakingSpritemap_11_8D8E48:
dw $0001 : db $F8,$81,$F8,$E6,$6F

BombTorizoStatueBreakingSpritemap_12_8D8E4F:
dw $0001 : db $F8,$81,$F8,$E8,$6F

BombTorizoStatueBreakingSpritemap_13_8D8E56:
dw $0001 : db $F8,$81,$F8,$EA,$6F

BombTorizoStatueBreakingSpritemap_14_8D8E5D:
dw $0001 : db $F8,$81,$F8,$EC,$6F

BombTorizoStatueBreakingSpritemap_15_8D8E64:
dw $0001 : db $F8,$81,$F8,$EE,$6F
}

; golden torizo egg (bank $8D)
org $8D8F17
{
GoldenTorizoEggSpritemap_0_8D8F17:
dw $0001 : db $F8,$81,$F8,$04,$2B

GoldenTorizoEggSpritemap_1_8D8F1E:
dw $0001 : db $F8,$81,$F8,$06,$2B

GoldenTorizoEggSpritemap_2_8D8F25:
dw $0001 : db $F8,$81,$F8,$08,$2B

GoldenTorizoEggSpritemap_3_8D8F2C:
dw $0001 : db $F8,$81,$F8,$E0,$2B

GoldenTorizoEggSpritemap_4_8D8F33:
dw $0001 : db $F8,$81,$F6,$E2,$23

GoldenTorizoEggSpritemap_5_8D8F3A:
dw $0001 : db $F8,$81,$F6,$E4,$23

GoldenTorizoEggSpritemap_6_8D8F41:
dw $0001 : db $F8,$81,$F6,$E6,$23

GoldenTorizoEggSpritemap_7_8D8F48:
dw $0001 : db $F8,$81,$F6,$E8,$23

GoldenTorizoEggSpritemap_8_8D8F4F:
dw $0001 : db $F8,$81,$F6,$EA,$23

GoldenTorizoEggSpritemap_9_8D8F56:
dw $0001 : db $F8,$81,$F6,$EC,$23

GoldenTorizoEggSpritemap_10_8D8F5D:
dw $0002 : db $00,$00,$FE,$FF,$23, $F8,$01,$FE,$FE,$23

GoldenTorizoEggSpritemap_11_8D8F69:
dw $0002 : db $00,$00,$FE,$EF,$23, $F8,$01,$FE,$EE,$23

GoldenTorizoEggSpritemap_12_8D8F75:
dw $0001 : db $F8,$81,$F8,$04,$6B

GoldenTorizoEggSpritemap_13_8D8F7C:
dw $0001 : db $F8,$81,$F8,$06,$6B

GoldenTorizoEggSpritemap_14_8D8F83:
dw $0001 : db $F8,$81,$F8,$08,$6B

GoldenTorizoEggSpritemap_15_8D8F8A:
dw $0001 : db $F8,$81,$F8,$E0,$6B

GoldenTorizoEggSpritemap_16_8D8F91:
dw $0001 : db $F8,$81,$F6,$E2,$63

GoldenTorizoEggSpritemap_17_8D8F98:
dw $0001 : db $F8,$81,$F6,$E4,$63

GoldenTorizoEggSpritemap_18_8D8F9F:
dw $0001 : db $F8,$81,$F6,$E6,$63

GoldenTorizoEggSpritemap_19_8D8FA6:
dw $0001 : db $F8,$81,$F6,$E8,$63

GoldenTorizoEggSpritemap_20_8D8FAD:
dw $0001 : db $F8,$81,$F6,$EA,$63

GoldenTorizoEggSpritemap_21_8D8FB4:
dw $0001 : db $F8,$81,$F6,$EC,$63

GoldenTorizoEggSpritemap_22_8D8FBB:
dw $0002 : db $00,$00,$FE,$FF,$63, $F8,$01,$FE,$FE,$63

GoldenTorizoEggSpritemap_23_8D8FC7:
dw $0002 : db $00,$00,$FE,$EF,$63, $F8,$01,$FE,$EE,$63
}

; graphics (any freespace, doesn't have to be in the same bank)
%BEGIN_FREESPACE(AC)
TorizoUpperArmGFX: incbin "upper_arm_dma.gfx"
TorizoHeadGFX: incbin "head_dma.gfx"
TorizoBeakGFX: incbin "beak_dma.gfx"
TorizoFacingForwardGFX: incbin "facing_forward_dma.gfx"

; repoint vanilla gfx here to free up space in bank $AA
TorizoEyeGFX: incbin "eye.gfx"
TorizoBellyFaceGFX: incbin "belly_face.gfx"
%END_FREESPACE(AC)
