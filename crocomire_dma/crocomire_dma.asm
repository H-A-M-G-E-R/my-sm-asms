; Crocomire DMA Freeup, by H A M
; DMAs Crocomire's arm graphics to save sprite tile VRAM.
; Overwrites blinking eye tiles with melting tiles when he dies.
; He doesn't use extra enemy tiles anymore.
; Uses freespace in bank $A4, and any bank to store new GFX.
; Requires my Enemy Draw Hook ASM, cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842);
; and my Ridley DMA Freeup for the DoDMADef function.

; Instructions (SMART):
; Replace Export/Enemies/DDBF.gfx in your project folder with this one.
; Do the same for DDFF.gfx.
; In enemy DDBF's header, set manual graphics allocation to false.
; In Crocomire's room enemy set, change palette of enemy $DDBF from $D007 to $0007.

lorom

!EnemyDrawHook = $7E700A ; must be the same as the value in enemy_draw_hook.asm

!CrocomireArmDMAIndex = $7E7804 ; unused crocomire ram (uhh why doesn't he use normal extra enemy ram)
!CrocomireMeltingTilesLoadingOffset = $7E7806

org $A48A86 : JSR CrocomireInitSetPreDrawHook ; hijack crocomire init
org $A4F686 : JSR CrocomireInitSetPreDrawHook ; hijack tongue init

org $A48C14+$E : dw CrocomireMainAI_DeathSequenceE ; hijack death sequence index Eh

org $A499CB+8 : dw $FFFF ; don't overwrite last row when loading skeleton tiles

%BEGIN_FREESPACE(A4)
; also tongue because it becomes the arm when crocomire melts
CrocomireInitSetPreDrawHook:
{
  LDX $0E54
  LDA.w #CrocomirePreDrawHook : STA.l !EnemyDrawHook,x
  ; force DMA refresh
  STA.l !CrocomireArmDMAIndex
  RTS
}

CrocomirePreDrawHook:
{
  ; DMA arm
  LDY $0F8E,x ; spritemap pointer
  LDA $0001,y : AND #$00FF ; high byte of size
  BEQ .noArmDMA
  CMP.l !CrocomireArmDMAIndex : BEQ .noArmDMA
    STA.l !CrocomireArmDMAIndex : ASL : TAX
    LDY.w CrocomireArmDMADefPointers-2,x
    JSL DoDMADef ; from my Ridley DMA Freeup
  .noArmDMA
  SEC : RTL ; draw normally
}

CrocomireArmDMADefPointers:
{
  dw CrocomireArmDMADef1
  dw CrocomireArmDMADef2
  dw CrocomireArmDMADef3
  dw CrocomireArmDMADef4
}

; size, src, dest
CrocomireArmDMADef1:
{
  dw 5*$20 : dl 0*5*$20+CrocomireArmGFX : dw $7080
  dw 5*$20 : dl 1*5*$20+CrocomireArmGFX : dw $7180
  dw 0
}

CrocomireArmDMADef2:
{
  dw 4*$20 : dl 2*5*$20+CrocomireArmGFX : dw $7080
  dw 4*$20 : dl 3*5*$20+CrocomireArmGFX : dw $7180
  dw 0
}

CrocomireArmDMADef3:
{
  dw 4*$20 : dl 4*5*$20+CrocomireArmGFX : dw $7080
  dw 4*$20 : dl 5*5*$20+CrocomireArmGFX : dw $7180
  dw 0
}

CrocomireArmDMADef4:
{
  dw 5*$20 : dl 6*5*$20+CrocomireArmGFX : dw $7080
  dw 5*$20 : dl 7*5*$20+CrocomireArmGFX : dw $7180
  dw 0
}

CrocomireMainAI_DeathSequenceE:
{
  LDA.l !CrocomireMeltingTilesLoadingOffset : CMP #$0008 : BEQ .stopLoading
    TAY
    LDX $0330
    LDA.w #$10*$20 : STA $D0,x
    LDA.w #(CrocomireMeltingGFX>>8)&$FF00 : STA $D3,x
    LDA.w .src,y : STA $D2,x
    LDA.w .dst,y : STA $D5,x
    TXA : CLC : ADC #$0007 : STA $0330
    TYA : INC : INC : STA.l !CrocomireMeltingTilesLoadingOffset
  .stopLoading
  JMP $91BA ; back to original code

.src
  dw $00*$20+CrocomireMeltingGFX
  dw $10*$20+CrocomireMeltingGFX
  dw $20*$20+CrocomireMeltingGFX
  dw $30*$20+CrocomireMeltingGFX

.dst
  dw $7600
  dw $7700
  dw $7800
  dw $7900
}

%END_FREESPACE(A4)

;;; Spritemaps ;;;

; use upper byte of extended spritemap size as indices to arm dma
{
org $A4BFC4+1 : db $04
org $A4BFF6+1 : db $02
org $A4C028+1 : db $04
org $A4C05A+1 : db $01
org $A4C08C+1 : db $01
org $A4C0BE+1 : db $02
org $A4C0F0+1 : db $04
org $A4C122+1 : db $02
org $A4C154+1 : db $04
org $A4C186+1 : db $01
org $A4C1B8+1 : db $01
org $A4C1EA+1 : db $02
org $A4C21C+1 : db $01
org $A4C24E+1 : db $01
org $A4C280+1 : db $01
org $A4C2B2+1 : db $02
org $A4C2EC+1 : db $02
org $A4C326+1 : db $02
org $A4C360+1 : db $02
org $A4C39A+1 : db $02
org $A4C3D4+1 : db $02
org $A4C40E+1 : db $02
org $A4C448+1 : db $02
org $A4C47A+1 : db $04
org $A4C4AC+1 : db $04
org $A4C4DE+1 : db $03
org $A4C510+1 : db $04
org $A4C542+1 : db $01
org $A4C574+1 : db $02
org $A4C5AE+1 : db $02
org $A4C5E8+1 : db $02
org $A4C6A4+1 : db $04
org $A4C6DE+1 : db $02
org $A4C718+1 : db $04
org $A4C752+1 : db $01
org $A4C78C+1 : db $01
org $A4C7C6+1 : db $02
org $A4C800+1 : db $04
org $A4C83A+1 : db $02
org $A4C874+1 : db $04
org $A4C8AE+1 : db $01
org $A4C8E8+1 : db $01
org $A4C922+1 : db $02
org $A4C95C+1 : db $04
org $A4C996+1 : db $04
org $A4C9D0+1 : db $03
org $A4CA0A+1 : db $04
org $A4CA44+1 : db $01
org $A4CACE+1 : db $04
org $A4CAD8+1 : db $04
org $A4CAE2+1 : db $03
org $A4CAEC+1 : db $04
org $A4CAF6+1 : db $01
}

org $A4CE92
{
CrocomireSpritemap_0_A4CE92:
dw $0009 : db $C3,$81,$1A,$E4,$31, $B3,$81,$1E,$E6,$31, $00,$00,$07,$0A,$31, $F0,$01,$FF,$1A,$31, $F0,$81,$07,$08,$31, $F8,$81,$F7,$0B,$31, $EC,$81,$0B,$E0,$31, $DE,$81,$12,$E0,$31, $D0,$81,$19,$E0,$31

CrocomireSpritemap_1_A4CEC1:
dw $0009 : db $B1,$81,$13,$E4,$31, $A1,$81,$13,$E6,$31, $F8,$01,$09,$1A,$31, $F0,$01,$F9,$0A,$31, $E8,$81,$01,$08,$31, $F8,$81,$F9,$0B,$31, $DE,$81,$05,$E8,$31, $CE,$81,$0F,$EA,$31, $C0,$81,$0F,$E8,$31

CrocomireSpritemap_2_A4CEF0:
dw $0007 : db $CC,$81,$1C,$E4,$31, $BC,$81,$1E,$E6,$31, $F8,$81,$08,$08,$31, $F8,$81,$F8,$0A,$31, $F6,$81,$0D,$E0,$31, $E8,$81,$14,$E0,$31, $DA,$81,$1B,$E0,$31

CrocomireSpritemap_3_A4CF15:
dw $0009 : db $00,$00,$08,$1A,$71, $08,$00,$F8,$0A,$71, $08,$80,$00,$08,$71, $F8,$81,$F8,$0B,$71, $D5,$81,$11,$E4,$31, $C5,$81,$11,$E6,$31, $02,$80,$03,$E8,$31, $F2,$81,$0D,$EA,$31, $E4,$81,$0D,$E8,$31

CrocomireSpritemap_4_A4CF44:
dw $0007 : db $C0,$81,$0C,$E4,$31, $B0,$81,$0C,$E6,$31, $F8,$81,$08,$08,$31, $F8,$81,$F8,$0A,$31, $F0,$81,$0C,$E2,$31, $E0,$81,$0C,$E2,$31, $D0,$81,$0C,$E2,$31

CrocomireSpritemap_5_A4CF69:
dw $0008 : db $02,$00,$09,$17,$31, $FA,$01,$09,$16,$31, $F2,$01,$09,$15,$31, $EA,$01,$09,$14,$31, $E2,$01,$09,$13,$31, $F2,$81,$F9,$2D,$31, $F6,$81,$F9,$4B,$31, $01,$80,$F9,$2B,$31

CrocomireSpritemap_6_A4CF93:
dw $0008 : db $05,$00,$09,$17,$31, $FD,$01,$09,$16,$31, $F5,$01,$09,$15,$31, $ED,$01,$09,$14,$31, $E5,$01,$09,$13,$31, $F5,$81,$F9,$2D,$31, $F7,$81,$F9,$4B,$31, $01,$80,$F9,$2B,$31

CrocomireSpritemap_7_A4CFBD:
dw $0008 : db $08,$00,$09,$17,$31, $00,$00,$09,$16,$31, $F8,$01,$09,$15,$31, $F0,$01,$09,$14,$31, $E8,$01,$09,$13,$31, $F8,$81,$F9,$2D,$31, $F9,$81,$F9,$4B,$31, $00,$80,$F9,$2B,$31

CrocomireSpritemap_8_A4CFE7:
dw $0008 : db $0C,$00,$09,$17,$31, $04,$00,$09,$16,$31, $FC,$01,$09,$15,$31, $F4,$01,$09,$14,$31, $EC,$01,$09,$13,$31, $FC,$81,$F9,$2D,$31, $FC,$81,$F9,$4B,$31, $00,$80,$F9,$2B,$31

CrocomireSpritemap_9_A4D011:
dw $0008 : db $03,$80,$F9,$2D,$31, $02,$80,$F9,$4B,$71, $11,$00,$09,$17,$31, $09,$00,$09,$16,$31, $01,$00,$09,$15,$31, $F9,$01,$09,$14,$31, $F1,$01,$09,$13,$31, $01,$80,$F9,$2B,$71

CrocomireSpritemap_10_A4D03B:
dw $0008 : db $09,$80,$F9,$2D,$31, $06,$80,$F9,$4B,$71, $18,$00,$09,$17,$31, $10,$00,$09,$16,$31, $08,$00,$09,$15,$31, $00,$00,$09,$14,$31, $F8,$01,$09,$13,$31, $01,$80,$F9,$2B,$71

CrocomireSpritemap_11_A4D065:
dw $0008 : db $10,$80,$F9,$2D,$31, $0B,$80,$F9,$4B,$71, $20,$00,$09,$17,$31, $18,$00,$09,$16,$31, $10,$00,$09,$15,$31, $08,$00,$09,$14,$31, $00,$00,$09,$13,$31, $03,$80,$F9,$2B,$71

CrocomireSpritemap_12_A4D08F:
dw $0008 : db $09,$80,$F8,$2D,$31, $06,$80,$F8,$4B,$71, $18,$00,$09,$17,$31, $10,$00,$08,$16,$31, $08,$00,$08,$15,$31, $00,$00,$09,$14,$31, $F8,$01,$09,$13,$31, $01,$80,$F9,$2B,$71

CrocomireSpritemap_13_A4D0B9:
dw $0008 : db $03,$80,$F5,$2D,$31, $02,$80,$F5,$4B,$71, $11,$00,$06,$17,$31, $09,$00,$05,$16,$31, $01,$00,$05,$15,$31, $F9,$01,$07,$14,$31, $F1,$01,$07,$13,$31, $01,$80,$F9,$2B,$71

CrocomireSpritemap_14_A4D0E3:
dw $0008 : db $0C,$00,$06,$17,$31, $04,$00,$05,$16,$31, $FC,$01,$05,$15,$31, $F4,$01,$07,$14,$31, $EC,$01,$07,$13,$31, $FC,$81,$F5,$2D,$31, $FC,$81,$F5,$4B,$31, $00,$80,$F9,$2B,$31

CrocomireSpritemap_15_A4D10D:
dw $0008 : db $08,$00,$06,$17,$31, $00,$00,$05,$16,$31, $F8,$01,$05,$15,$31, $F0,$01,$07,$14,$31, $E8,$01,$07,$13,$31, $F8,$81,$F5,$2D,$31, $F9,$81,$F5,$4B,$31, $00,$80,$F9,$2B,$31

CrocomireSpritemap_16_A4D137:
dw $0008 : db $05,$00,$07,$17,$31, $FD,$01,$06,$16,$31, $F5,$01,$06,$15,$31, $ED,$01,$08,$14,$31, $E5,$01,$08,$13,$31, $F5,$81,$F6,$2D,$31, $F7,$81,$F6,$4B,$31, $01,$80,$F9,$2B,$31

CrocomireSpritemap_17_A4D161:
dw $0008 : db $02,$00,$08,$17,$31, $FA,$01,$07,$16,$31, $F2,$01,$07,$15,$31, $EA,$01,$08,$14,$31, $E2,$01,$08,$13,$31, $F2,$81,$F7,$2D,$31, $F6,$81,$F7,$4B,$31, $01,$80,$F9,$2B,$31

CrocomireSpritemap_18_A4D18B:
dw $0008 : db $0C,$00,$04,$17,$31, $04,$00,$05,$16,$31, $FC,$01,$05,$15,$31, $F4,$01,$05,$14,$31, $EC,$01,$05,$13,$31, $FC,$81,$F5,$2D,$31, $FC,$81,$F5,$4B,$31, $00,$80,$F9,$2B,$31

CrocomireSpritemap_19_A4D1B5:
dw $0008 : db $0C,$00,$04,$17,$31, $04,$00,$05,$16,$31, $FC,$01,$05,$15,$31, $F4,$01,$05,$14,$31, $EC,$01,$05,$13,$31, $FC,$81,$F5,$2D,$31, $FC,$81,$F3,$4B,$31, $00,$80,$F5,$2B,$31

CrocomireSpritemap_20_A4D1DF:
dw $0008 : db $0C,$00,$04,$17,$31, $04,$00,$05,$16,$31, $FC,$01,$05,$15,$31, $F4,$01,$05,$14,$31, $EC,$01,$05,$13,$31, $FC,$81,$F5,$2D,$31, $FC,$81,$F1,$4B,$31, $00,$80,$F1,$2B,$31

CrocomireSpritemap_21_A4D209:
dw $0009 : db $2D,$80,$1A,$E4,$71, $3D,$80,$1E,$E6,$71, $F8,$01,$07,$0A,$71, $08,$00,$FF,$1A,$71, $00,$80,$07,$08,$71, $F8,$81,$F7,$0B,$71, $04,$80,$0B,$E0,$71, $12,$80,$12,$E0,$71, $20,$80,$19,$E0,$71

CrocomireSpritemap_22_A4D238:
dw $0009 : db $3F,$80,$13,$E4,$71, $4F,$80,$13,$E6,$71, $00,$00,$09,$1A,$71, $08,$00,$F9,$0A,$71, $08,$80,$01,$08,$71, $F8,$81,$F9,$0B,$71, $12,$80,$05,$E8,$71, $22,$80,$0F,$EA,$71, $30,$80,$0F,$E8,$71

CrocomireSpritemap_23_A4D267:
dw $0007 : db $24,$80,$1C,$E4,$71, $34,$80,$1E,$E6,$71, $F8,$81,$08,$08,$71, $F8,$81,$F8,$0A,$71, $FA,$81,$0D,$E0,$71, $08,$80,$14,$E0,$71, $16,$80,$1B,$E0,$71

CrocomireSpritemap_24_A4D28C:
dw $0009 : db $F8,$01,$08,$1A,$31, $F0,$01,$F8,$0A,$31, $E8,$81,$00,$08,$31, $F8,$81,$F8,$0B,$31, $1B,$80,$11,$E4,$71, $2B,$80,$11,$E6,$71, $EE,$81,$03,$E8,$71, $FE,$81,$0D,$EA,$71, $0C,$80,$0D,$E8,$71

CrocomireSpritemap_25_A4D2BB:
dw $0007 : db $E6,$81,$FA,$08,$31, $F6,$81,$FA,$0A,$31, $AD,$81,$FA,$E4,$31, $9D,$81,$FA,$E6,$31, $DD,$81,$FA,$E2,$31, $CD,$81,$FA,$E2,$31, $BD,$81,$FA,$E2,$31

CrocomireSpritemap_26_A4D2E0:
dw $0009 : db $00,$00,$F0,$1A,$F1, $08,$00,$00,$0A,$F1, $08,$80,$F0,$08,$F1, $F8,$81,$F8,$0B,$F1, $3D,$80,$DB,$E4,$71, $4D,$80,$DB,$E6,$71, $10,$80,$EC,$E8,$F1, $20,$80,$E2,$EA,$F1, $2E,$80,$E2,$E8,$F1

CrocomireSpritemap_27_A4D30F:
dw $0007 : db $0A,$80,$FA,$08,$71, $FA,$81,$FA,$0A,$71, $43,$80,$FA,$E4,$71, $53,$80,$FA,$E6,$71, $13,$80,$FA,$E2,$71, $23,$80,$FA,$E2,$71, $33,$80,$FA,$E2,$71

CrocomireSpritemap_28_A4D334:
dw $0009 : db $F8,$01,$08,$1A,$31, $F0,$01,$F8,$0A,$31, $E8,$81,$00,$08,$31, $F8,$81,$F8,$0B,$31, $1B,$80,$F6,$E4,$71, $2B,$80,$F6,$E6,$71, $EE,$81,$07,$E8,$F1, $FE,$81,$FD,$EA,$F1, $0C,$80,$FD,$E8,$F1

CrocomireSpritemap_29_A4D363:
dw $0007 : db $F8,$81,$08,$08,$71, $F8,$81,$F8,$0A,$71, $2A,$80,$FA,$E4,$71, $3A,$80,$FA,$E6,$71, $FD,$81,$0B,$E8,$F1, $0D,$80,$01,$EA,$F1, $1B,$80,$01,$E8,$F1

CrocomireSpritemap_30_A4D388:
dw $0009 : db $00,$00,$08,$1A,$71, $08,$00,$F8,$0A,$71, $08,$80,$00,$08,$71, $F8,$81,$F8,$0B,$71, $D5,$81,$F6,$E4,$31, $C5,$81,$F6,$E6,$31, $02,$80,$07,$E8,$B1, $F2,$81,$FD,$EA,$B1, $E4,$81,$FD,$E8,$B1

CrocomireSpritemap_31_A4D3B7:
dw $0009 : db $F8,$01,$F0,$1A,$B1, $F0,$01,$00,$0A,$B1, $E8,$81,$F0,$08,$B1, $F8,$81,$F8,$0B,$B1, $B3,$81,$DB,$E4,$31, $A3,$81,$DB,$E6,$31, $E0,$81,$EC,$E8,$B1, $D0,$81,$E2,$EA,$B1, $C2,$81,$E2,$E8,$B1

CrocomireSpritemap_32_A4D3E6:
dw $0004 : db $00,$00,$F8,$00,$71, $00,$00,$00,$00,$F1, $F8,$01,$00,$00,$B1, $F8,$01,$F8,$00,$31

CrocomireSpritemap_33_A4D3FC:
dw $0004 : db $00,$00,$F8,$01,$71, $00,$00,$00,$01,$F1, $F8,$01,$00,$01,$B1, $F8,$01,$F8,$01,$31

CrocomireSpritemap_34_A4D412:
dw $0004 : db $00,$00,$00,$02,$F1, $00,$00,$F8,$02,$71, $F8,$01,$00,$02,$B1, $F8,$01,$F8,$02,$31

CrocomireSpritemap_35_A4D428:
dw $0004 : db $00,$00,$00,$03,$F1, $00,$00,$F8,$03,$71, $F8,$01,$00,$03,$B1, $F8,$01,$F8,$03,$31

CrocomireSpritemap_36_A4D43E:
dw $0004 : db $08,$00,$00,$07,$21, $00,$00,$00,$06,$21, $F8,$01,$00,$05,$21, $F8,$01,$F8,$04,$21

CrocomireSpritemap_37_A4D454:
dw $0003 : db $08,$00,$00,$12,$21, $00,$00,$00,$11,$21, $F8,$01,$00,$10,$21

CrocomireSpritemap_38_A4D465:
dw $0004 : db $08,$00,$F8,$07,$A1, $00,$00,$F8,$06,$A1, $F8,$01,$F8,$05,$A1, $F8,$01,$00,$04,$A1

CrocomireSpritemap_39_A4D47B:
dw $0003 : db $08,$00,$F8,$12,$A1, $00,$00,$F8,$11,$A1, $F8,$01,$F8,$10,$A1

CrocomireSpritemap_40_A4D48C:
dw $0001 : db $F8,$81,$F8,$CC,$31

CrocomireSpritemap_41_A4D493:
dw $0006 : db $E0,$01,$00,$7F,$31, $E0,$01,$F8,$6F,$31, $E8,$01,$00,$7C,$31, $E8,$01,$F8,$6C,$31, $F0,$81,$F0,$66,$31, $00,$80,$F0,$60,$31

CrocomireSpritemap_42_A4D4B3:
dw $0006 : db $E0,$01,$00,$90,$31, $E0,$01,$F8,$80,$31, $E8,$01,$00,$7C,$31, $E8,$01,$F8,$6C,$31, $F0,$81,$F0,$66,$31, $00,$80,$F0,$60,$31

CrocomireSpritemap_43_A4D4D3:
dw $0006 : db $E8,$01,$00,$7D,$31, $E8,$01,$F8,$6D,$31, $E0,$01,$00,$91,$31, $E0,$01,$F8,$81,$31, $F0,$81,$F0,$66,$31, $00,$80,$F0,$60,$31

CrocomireSpritemap_44_A4D4F3:
dw $0004 : db $00,$80,$F0,$60,$31, $F0,$81,$F0,$68,$31, $E8,$01,$00,$7E,$31, $E8,$01,$F8,$6E,$31

CrocomireSpritemap_45_A4D509:
dw $0002 : db $00,$80,$F0,$62,$31, $F0,$81,$F0,$6A,$31

CrocomireSpritemap_46_A4D515:
dw $0001 : db $00,$80,$F0,$64,$31
}

; corpse
{
org $A4E1FE+1 : db $04
org $A4E228+1 : db $02
org $A4E252+1 : db $04
org $A4E27C+1 : db $03
org $A4E2A6+1 : db $01
org $A4E2D0+1 : db $01
org $A4E2FA+1 : db $01
org $A4E324+1 : db $01
org $A4E34E+1 : db $04
org $A4E378+1 : db $03
org $A4E3A2+1 : db $03
org $A4E3CC+1 : db $03
org $A4E3F6+1 : db $03
}

org $A4E99F
{
CrocomireCorpseSpritemap_21_A4E99F:
dw $0009 : db $C3,$81,$1A,$E4,$21, $B3,$81,$1E,$E6,$21, $00,$00,$07,$0A,$21, $F0,$01,$FF,$1A,$21, $F0,$81,$07,$08,$21, $F8,$81,$F7,$0B,$21, $EC,$81,$0B,$E0,$21, $DE,$81,$12,$E0,$21, $D0,$81,$19,$E0,$21

CrocomireCorpseSpritemap_22_A4E9CE:
dw $0009 : db $B1,$81,$13,$E4,$21, $A1,$81,$13,$E6,$21, $F8,$01,$09,$1A,$21, $F0,$01,$F9,$0A,$21, $E8,$81,$01,$08,$21, $F8,$81,$F9,$0B,$21, $DE,$81,$05,$E8,$21, $CE,$81,$0F,$EA,$21, $C0,$81,$0F,$E8,$21

CrocomireCorpseSpritemap_23_A4E9FD:
dw $0007 : db $CC,$81,$1C,$E4,$21, $BC,$81,$1E,$E6,$21, $F8,$81,$08,$08,$21, $F8,$81,$F8,$0A,$21, $F6,$81,$0D,$E0,$21, $E8,$81,$14,$E0,$21, $DA,$81,$1B,$E0,$21

CrocomireCorpseSpritemap_24_A4EA22:
dw $0009 : db $00,$00,$08,$1A,$61, $08,$00,$F8,$0A,$61, $08,$80,$00,$08,$61, $F8,$81,$F8,$0B,$61, $D5,$81,$11,$E4,$21, $C5,$81,$11,$E6,$21, $02,$80,$03,$E8,$21, $F2,$81,$0D,$EA,$21, $E4,$81,$0D,$E8,$21

CrocomireCorpseSpritemap_25_A4EA51:
dw $0007 : db $C0,$81,$0C,$E4,$21, $B0,$81,$0C,$E6,$21, $F8,$81,$08,$08,$21, $F8,$81,$F8,$0A,$21, $F0,$81,$0C,$E2,$21, $E0,$81,$0C,$E2,$21, $D0,$81,$0C,$E2,$21

CrocomireCorpseSpritemap_26_A4EA76:
dw $0008 : db $02,$00,$09,$17,$21, $FA,$01,$09,$16,$21, $F2,$01,$09,$15,$21, $EA,$01,$09,$14,$21, $E2,$01,$09,$13,$21, $F2,$81,$F9,$2D,$21, $F6,$81,$F9,$4B,$21, $01,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_27_A4EAA0:
dw $0008 : db $05,$00,$09,$17,$21, $FD,$01,$09,$16,$21, $F5,$01,$09,$15,$21, $ED,$01,$09,$14,$21, $E5,$01,$09,$13,$21, $F5,$81,$F9,$2D,$21, $F7,$81,$F9,$4B,$21, $01,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_28_A4EACA:
dw $0008 : db $08,$00,$09,$17,$21, $00,$00,$09,$16,$21, $F8,$01,$09,$15,$21, $F0,$01,$09,$14,$21, $E8,$01,$09,$13,$21, $F8,$81,$F9,$2D,$21, $F9,$81,$F9,$4B,$21, $00,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_29_A4EAF4:
dw $0008 : db $0C,$00,$09,$17,$21, $04,$00,$09,$16,$21, $FC,$01,$09,$15,$21, $F4,$01,$09,$14,$21, $EC,$01,$09,$13,$21, $FC,$81,$F9,$2D,$21, $FC,$81,$F9,$4B,$21, $00,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_30_A4EB1E:
dw $0008 : db $03,$80,$F9,$2D,$21, $02,$80,$F9,$4B,$61, $11,$00,$09,$17,$21, $09,$00,$09,$16,$21, $01,$00,$09,$15,$21, $F9,$01,$09,$14,$21, $F1,$01,$09,$13,$21, $01,$80,$F9,$2B,$61

CrocomireCorpseSpritemap_31_A4EB48:
dw $0008 : db $09,$80,$F9,$2D,$21, $06,$80,$F9,$4B,$61, $18,$00,$09,$17,$21, $10,$00,$09,$16,$21, $08,$00,$09,$15,$21, $00,$00,$09,$14,$21, $F8,$01,$09,$13,$21, $01,$80,$F9,$2B,$61

CrocomireCorpseSpritemap_32_A4EB72:
dw $0008 : db $10,$80,$F9,$2D,$21, $0B,$80,$F9,$4B,$61, $20,$00,$09,$17,$21, $18,$00,$09,$16,$21, $10,$00,$09,$15,$21, $08,$00,$09,$14,$21, $00,$00,$09,$13,$21, $03,$80,$F9,$2B,$61

CrocomireCorpseSpritemap_33_A4EB9C:
dw $0008 : db $09,$80,$F8,$2D,$21, $06,$80,$F8,$4B,$61, $18,$00,$09,$17,$21, $10,$00,$08,$16,$21, $08,$00,$08,$15,$21, $00,$00,$09,$14,$21, $F8,$01,$09,$13,$21, $01,$80,$F9,$2B,$61

CrocomireCorpseSpritemap_34_A4EBC6:
dw $0008 : db $03,$80,$F5,$2D,$21, $02,$80,$F5,$4B,$61, $11,$00,$06,$17,$21, $09,$00,$05,$16,$21, $01,$00,$05,$15,$21, $F9,$01,$07,$14,$21, $F1,$01,$07,$13,$21, $01,$80,$F9,$2B,$61

CrocomireCorpseSpritemap_35_A4EBF0:
dw $0008 : db $0C,$00,$06,$17,$21, $04,$00,$05,$16,$21, $FC,$01,$05,$15,$21, $F4,$01,$07,$14,$21, $EC,$01,$07,$13,$21, $FC,$81,$F5,$2D,$21, $FC,$81,$F5,$4B,$21, $00,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_36_A4EC1A:
dw $0008 : db $08,$00,$06,$17,$21, $00,$00,$05,$16,$21, $F8,$01,$05,$15,$21, $F0,$01,$07,$14,$21, $E8,$01,$07,$13,$21, $F8,$81,$F5,$2D,$21, $F9,$81,$F5,$4B,$21, $00,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_37_A4EC44:
dw $0008 : db $05,$00,$07,$17,$21, $FD,$01,$06,$16,$21, $F5,$01,$06,$15,$21, $ED,$01,$08,$14,$21, $E5,$01,$08,$13,$21, $F5,$81,$F6,$2D,$21, $F7,$81,$F6,$4B,$21, $01,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_38_A4EC6E:
dw $0008 : db $02,$00,$08,$17,$21, $FA,$01,$07,$16,$21, $F2,$01,$07,$15,$21, $EA,$01,$08,$14,$21, $E2,$01,$08,$13,$21, $F2,$81,$F7,$2D,$21, $F6,$81,$F7,$4B,$21, $01,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_39_A4EC98:
dw $0008 : db $0C,$00,$04,$17,$21, $04,$00,$05,$16,$21, $FC,$01,$05,$15,$21, $F4,$01,$05,$14,$21, $EC,$01,$05,$13,$21, $FC,$81,$F5,$2D,$21, $FC,$81,$F5,$4B,$21, $00,$80,$F9,$2B,$21

CrocomireCorpseSpritemap_40_A4ECC2:
dw $0008 : db $0C,$00,$04,$17,$21, $04,$00,$05,$16,$21, $FC,$01,$05,$15,$21, $F4,$01,$05,$14,$21, $EC,$01,$05,$13,$21, $FC,$81,$F5,$2D,$21, $FC,$81,$F3,$4B,$21, $00,$80,$F5,$2B,$21

CrocomireCorpseSpritemap_41_A4ECEC:
dw $0008 : db $0C,$00,$04,$17,$21, $04,$00,$05,$16,$21, $FC,$01,$05,$15,$21, $F4,$01,$05,$14,$21, $EC,$01,$05,$13,$21, $FC,$81,$F5,$2D,$21, $FC,$81,$F1,$4B,$21, $00,$80,$F1,$2B,$21

CrocomireCorpseSpritemap_42_A4ED16:
dw $0009 : db $2D,$80,$1A,$E4,$63, $3D,$80,$1E,$E6,$63, $F8,$01,$07,$0A,$63, $08,$00,$FF,$1A,$63, $00,$80,$07,$08,$63, $F8,$81,$F7,$0B,$63, $04,$80,$0B,$E0,$63, $12,$80,$12,$E0,$63, $20,$80,$19,$E0,$63

CrocomireCorpseSpritemap_43_A4ED45:
dw $0009 : db $3F,$80,$13,$E4,$63, $4F,$80,$13,$E6,$63, $00,$00,$09,$1A,$63, $08,$00,$F9,$0A,$63, $08,$80,$01,$08,$63, $F8,$81,$F9,$0B,$63, $12,$80,$05,$E8,$63, $22,$80,$0F,$EA,$63, $30,$80,$0F,$E8,$63

CrocomireCorpseSpritemap_44_A4ED74:
dw $0007 : db $24,$80,$1C,$E4,$63, $34,$80,$1E,$E6,$63, $F8,$81,$08,$08,$63, $F8,$81,$F8,$0A,$63, $FA,$81,$0D,$E0,$63, $08,$80,$14,$E0,$63, $16,$80,$1B,$E0,$63

CrocomireCorpseSpritemap_45_A4ED99:
dw $0009 : db $F8,$01,$08,$1A,$23, $F0,$01,$F8,$0A,$23, $E8,$81,$00,$08,$23, $F8,$81,$F8,$0B,$23, $1B,$80,$11,$E4,$63, $2B,$80,$11,$E6,$63, $EE,$81,$03,$E8,$63, $FE,$81,$0D,$EA,$63, $0C,$80,$0D,$E8,$63

CrocomireCorpseSpritemap_46_A4EDC8:
dw $0007 : db $E6,$81,$FA,$08,$21, $F6,$81,$FA,$0A,$21, $AD,$81,$FA,$E4,$21, $9D,$81,$FA,$E6,$21, $DD,$81,$FA,$E2,$21, $CD,$81,$FA,$E2,$21, $BD,$81,$FA,$E2,$21

CrocomireCorpseSpritemap_47_A4EDED:
dw $0009 : db $00,$00,$F0,$1A,$E3, $08,$00,$00,$0A,$E3, $08,$80,$F0,$08,$E3, $F8,$81,$F8,$0B,$E3, $3D,$80,$DB,$E4,$63, $4D,$80,$DB,$E6,$63, $10,$80,$EC,$E8,$E3, $20,$80,$E2,$EA,$E3, $2E,$80,$E2,$E8,$E3

CrocomireCorpseSpritemap_48_A4EE1C:
dw $0007 : db $0A,$80,$FA,$08,$63, $FA,$81,$FA,$0A,$63, $43,$80,$FA,$E4,$63, $53,$80,$FA,$E6,$63, $13,$80,$FA,$E2,$63, $23,$80,$FA,$E2,$63, $33,$80,$FA,$E2,$63

CrocomireCorpseSpritemap_49_A4EE41:
dw $0009 : db $F8,$01,$08,$1A,$23, $F0,$01,$F8,$0A,$23, $E8,$81,$00,$08,$23, $F8,$81,$F8,$0B,$23, $1B,$80,$F6,$E4,$63, $2B,$80,$F6,$E6,$63, $EE,$81,$07,$E8,$E3, $FE,$81,$FD,$EA,$E3, $0C,$80,$FD,$E8,$E3

CrocomireCorpseSpritemap_50_A4EE70:
dw $0007 : db $F8,$81,$08,$08,$63, $F8,$81,$F8,$0A,$63, $2A,$80,$FA,$E4,$63, $3A,$80,$FA,$E6,$63, $FD,$81,$0B,$E8,$E3, $0D,$80,$01,$EA,$E3, $1B,$80,$01,$E8,$E3

CrocomireCorpseSpritemap_51_A4EE95:
dw $0009 : db $00,$00,$08,$1A,$61, $08,$00,$F8,$0A,$61, $08,$80,$00,$08,$61, $F8,$81,$F8,$0B,$61, $D5,$81,$F6,$E4,$21, $C5,$81,$F6,$E6,$21, $02,$80,$07,$E8,$A1, $F2,$81,$FD,$EA,$A1, $E4,$81,$FD,$E8,$A1

CrocomireCorpseSpritemap_52_A4EEC4:
dw $0009 : db $F8,$01,$F0,$1A,$A1, $F0,$01,$00,$0A,$A1, $E8,$81,$F0,$08,$A1, $F8,$81,$F8,$0B,$A1, $B3,$81,$DB,$E4,$21, $A3,$81,$DB,$E6,$21, $E0,$81,$EC,$E8,$A1, $D0,$81,$E2,$EA,$A1, $C2,$81,$E2,$E8,$A1

CrocomireCorpseSpritemap_53_A4EEF3:
dw $0004 : db $00,$00,$F8,$00,$61, $00,$00,$00,$00,$E1, $F8,$01,$00,$00,$A1, $F8,$01,$F8,$00,$21

CrocomireCorpseSpritemap_54_A4EF09:
dw $0004 : db $00,$00,$F8,$01,$61, $00,$00,$00,$01,$E1, $F8,$01,$00,$01,$A1, $F8,$01,$F8,$01,$21

CrocomireCorpseSpritemap_55_A4EF1F:
dw $0004 : db $00,$00,$00,$02,$E1, $00,$00,$F8,$02,$61, $F8,$01,$00,$02,$A1, $F8,$01,$F8,$02,$21

CrocomireCorpseSpritemap_56_A4EF35:
dw $0004 : db $00,$00,$00,$03,$E1, $00,$00,$F8,$03,$61, $F8,$01,$00,$03,$A1, $F8,$01,$F8,$03,$21

CrocomireCorpseSpritemap_57_A4EF4B:
dw $0004 : db $08,$00,$00,$07,$21, $00,$00,$00,$06,$21, $F8,$01,$00,$05,$21, $F8,$01,$F8,$04,$21

CrocomireCorpseSpritemap_58_A4EF61:
dw $0003 : db $08,$00,$00,$12,$21, $00,$00,$00,$11,$21, $F8,$01,$00,$10,$21

CrocomireCorpseSpritemap_59_A4EF72:
dw $0004 : db $08,$00,$F8,$07,$A1, $00,$00,$F8,$06,$A1, $F8,$01,$F8,$05,$A1, $F8,$01,$00,$04,$A1

CrocomireCorpseSpritemap_60_A4EF88:
dw $0003 : db $08,$00,$F8,$12,$A1, $00,$00,$F8,$11,$A1, $F8,$01,$F8,$10,$A1

CrocomireCorpseSpritemap_61_A4EF99:
dw $0001 : db $F8,$81,$F8,$CC,$21

CrocomireCorpseSpritemap_62_A4EFA0:
dw $0006 : db $E0,$01,$00,$7F,$21, $E0,$01,$F8,$6F,$21, $E8,$01,$00,$7C,$21, $E8,$01,$F8,$6C,$21, $F0,$81,$F0,$66,$21, $00,$80,$F0,$60,$21

CrocomireCorpseSpritemap_63_A4EFC0:
dw $0006 : db $E0,$01,$00,$90,$21, $E0,$01,$F8,$80,$21, $E8,$01,$00,$7C,$21, $E8,$01,$F8,$6C,$21, $F0,$81,$F0,$66,$21, $00,$80,$F0,$60,$21

CrocomireCorpseSpritemap_64_A4EFE0:
dw $0006 : db $E8,$01,$00,$7D,$21, $E8,$01,$F8,$6D,$21, $E0,$01,$00,$91,$21, $E0,$01,$F8,$81,$21, $F0,$81,$F0,$66,$21, $00,$80,$F0,$60,$21

CrocomireCorpseSpritemap_65_A4F000:
dw $0004 : db $00,$80,$F0,$60,$21, $F0,$81,$F0,$68,$21, $E8,$01,$00,$7E,$21, $E8,$01,$F8,$6E,$21

CrocomireCorpseSpritemap_66_A4F016:
dw $0002 : db $00,$80,$F0,$62,$21, $F0,$81,$F0,$6A,$21

CrocomireCorpseSpritemap_67_A4F022:
dw $0001 : db $00,$80,$F0,$64,$21
}

; projectile (bank $8D)
org $8D802A
{
CrocomireProjectileSpritemap_0:
dw $0004 : db $00,$00,$F8,$00,$71, $00,$00,$00,$00,$F1, $F8,$01,$00,$00,$B1, $F8,$01,$F8,$00,$31

CrocomireProjectileSpritemap_1:
dw $0004 : db $00,$00,$F8,$01,$71, $00,$00,$00,$01,$F1, $F8,$01,$00,$01,$B1, $F8,$01,$F8,$01,$31

CrocomireProjectileSpritemap_2:
dw $0004 : db $00,$00,$00,$02,$F1, $00,$00,$F8,$02,$71, $F8,$01,$00,$02,$B1, $F8,$01,$F8,$02,$31

CrocomireProjectileSpritemap_3:
dw $0004 : db $00,$00,$00,$03,$F1, $00,$00,$F8,$03,$71, $F8,$01,$00,$03,$B1, $F8,$01,$F8,$03,$31
}

; graphics (any freespace, doesn't have to be in the same bank)
%BEGIN_FREESPACE(89)
CrocomireArmGFX: incbin "arm_dma.gfx"
CrocomireMeltingGFX: incbin "crocomire_melting.gfx"
%END_FREESPACE(89)
