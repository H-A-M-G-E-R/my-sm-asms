; Tourian Statue DMA Freeup, by H A M
; Repoints Tourian statue ghost GFX to share with the statue GFX to not use extended enemy tiles,
; and DMAs eye glow GFX to free up tiles for one enemy that uses 4 8px rows.
; Also makes the ghost GFX editable, if using SMART.

; Uses freespace in bank $86, and any bank to store new GFX.

; Instructions (SMART):
; Replace Export/Enemies/EFFF.gfx in your project folder with this one.
; Remove enemy $F03F (delete F03F.xml, F03F.gfx and F03F.tpl) (we don't need that anymore)
; In the statue room, remove enemy $F03F from the enemy set (Enemy Graphics),
; and remove the library background command that transfers to VRAM $6D00 (<Data Type="COPY">)
; An example statue room is provided with the above edits, use this as a reference.

lorom

org $86BA6A+4 : dw TourianStatueEyeGlowInstList ; repoint instruction list in eye glow enemy projectile header

org $86B7B3 ; overwrite old eye glow instruction list
TourianStatueEyeGlowInst_TransferGFX:
{
  PHX
  LDX $0330
  LDA.w #2*$20 : STA $D0,x : STA $D0+7,x
  LDA.w #(TourianStatueEyeGlowGFX>>8)&$FF00 : STA $D3,x : STA $D3+7,x
  LDA $0000,y : STA $D2,x
  CLC : ADC.w #2*$20 : STA $D2+7,x
  LDA #$76E0 : STA $D5,x
  LDA #$77E0 : STA $D5+7,x
  TXA : CLC : ADC #$000E : STA $0330
  PLX
  INY : INY
  RTS
}
assert pc() <= $86B7EA

%BEGIN_FREESPACE(86)
TourianStatueEyeGlowInstList:
{
  dw TourianStatueEyeGlowInst_TransferGFX,6*4*$20+TourianStatueEyeGlowGFX
  dw 8,TourianStatueSpritemap_EyeGlow8
  dw TourianStatueEyeGlowInst_TransferGFX,5*4*$20+TourianStatueEyeGlowGFX
  dw 8,TourianStatueSpritemap_EyeGlow7
  dw TourianStatueEyeGlowInst_TransferGFX,4*4*$20+TourianStatueEyeGlowGFX
  dw 8,TourianStatueSpritemap_EyeGlow6
  dw TourianStatueEyeGlowInst_TransferGFX,3*4*$20+TourianStatueEyeGlowGFX
  dw 7,TourianStatueSpritemap_EyeGlow5
  dw TourianStatueEyeGlowInst_TransferGFX,2*4*$20+TourianStatueEyeGlowGFX
  dw 7,TourianStatueSpritemap_EyeGlow4
  dw TourianStatueEyeGlowInst_TransferGFX,1*4*$20+TourianStatueEyeGlowGFX
  dw 7,TourianStatueSpritemap_EyeGlow3
  dw TourianStatueEyeGlowInst_TransferGFX,0*4*$20+TourianStatueEyeGlowGFX
  dw 6,TourianStatueSpritemap_EyeGlow2
  dw 6,TourianStatueSpritemap_EyeGlow1
  dw 5,TourianStatueSpritemap_EyeGlow0
  dw 48,$8000
  dw $8312 : db $19 ; Queue sound 19h, sound library 2, max queued sounds allowed = 6 (Tourian statue unlocking particle)
  dw $B7F5 ; Tourian statue unlocking earthquake
  dw $B7EA ; Spawn Tourian statue unlocking particle enemy projectile
  dw $B7EA ; Spawn Tourian statue unlocking particle enemy projectile
  dw $B7EA ; Spawn Tourian statue unlocking particle enemy projectile
  dw $B7EA ; Spawn Tourian statue unlocking particle enemy projectile
  dw $8154 ; Delete
}
%END_FREESPACE(86)

org $8D90A2
{
TourianStatueSpritemap_UnlockingParticleTail0:
dw $0001 : db $FC,$01,$FC,$BA,$3F

TourianStatueSpritemap_UnlockingParticleTail1:
dw $0001 : db $FC,$01,$FC,$BB,$3F

TourianStatueSpritemap_UnlockingParticleTail2:
dw $0001 : db $FC,$01,$FC,$BC,$3F

TourianStatueSpritemap_UnlockingParticleTail3:
dw $0001 : db $FC,$01,$FC,$BD,$3F

TourianStatueSpritemap_EyeGlow0:
dw $0001 : db $FC,$01,$FC,$6E,$3F

TourianStatueSpritemap_EyeGlow1:
dw $0001 : db $FC,$01,$FC,$6F,$3F

TourianStatueSpritemap_EyeGlow2:
dw $0001 : db $FC,$01,$FC,$7E,$3F

TourianStatueSpritemap_EyeGlow3:
dw $0001 : db $F8,$81,$F8,$6E,$3F

TourianStatueSpritemap_EyeGlow4:
dw $0001 : db $F8,$81,$F8,$6E,$3F

TourianStatueSpritemap_EyeGlow5:
dw $0001 : db $F8,$81,$F8,$6E,$3F

TourianStatueSpritemap_EyeGlow6:
dw $0001 : db $F8,$81,$F8,$6E,$3F

TourianStatueSpritemap_EyeGlow7:
dw $0006 : db $03,$00,$04,$6E,$FF, $03,$00,$FC,$7E,$7F, $03,$00,$F4,$6E,$7F, $FC,$01,$04,$6F,$BF, $F4,$01,$04,$6E,$BF, $F4,$81,$F4,$6E,$3F

TourianStatueSpritemap_EyeGlow8:
dw $0004 : db $00,$80,$00,$8E,$7F, $F0,$81,$00,$8E,$3F, $00,$80,$F0,$6E,$7F, $F0,$81,$F0,$6E,$3F

TourianStatueSpritemap_UnlockingParticle0:
dw $0001 : db $FC,$01,$FC,$B3,$3F

TourianStatueSpritemap_UnlockingParticle1:
dw $0001 : db $FC,$01,$FC,$B3,$7F

TourianStatueSpritemap_UnlockingParticle2:
dw $0001 : db $FC,$01,$FC,$B3,$BF

TourianStatueSpritemap_UnlockingParticle3:
dw $0001 : db $FC,$01,$FC,$B3,$FF

TourianStatueSpritemap_Soul0:
dw $0004 : db $00,$00,$00,$B6,$3F, $F8,$01,$00,$B5,$3F, $FC,$01,$08,$B4,$3F, $F8,$81,$F8,$AE,$3F

TourianStatueSpritemap_Soul1:
dw $0004 : db $FC,$01,$08,$B9,$3F, $00,$00,$00,$B8,$3F, $F8,$01,$00,$B7,$3F, $F8,$81,$F8,$AE,$3F

TourianStatueSpritemap_BaseDecoration:
dw $0007 : db $28,$80,$F8,$9C,$1F, $18,$80,$F8,$9A,$1F, $08,$80,$F8,$98,$1F, $F8,$81,$F8,$96,$1F, $E8,$81,$F8,$94,$1F, $D8,$81,$F8,$92,$1F, $C8,$81,$F8,$90,$1F

TourianStatueSpritemap_Ridley:
dw $0017 : db $E5,$81,$18,$44,$23, $E5,$81,$08,$2C,$23, $F5,$81,$18,$46,$23, $0D,$00,$20,$7D,$23, $0D,$00,$18,$6D,$23, $05,$00,$18,$48,$23, $15,$80,$08,$42,$23, $05,$80,$08,$40,$23, $F5,$81,$08,$2E,$23, $D5,$81,$08,$2A,$23, $15,$80,$F8,$28,$23, $05,$80,$F8,$26,$23, $F5,$81,$F8,$24,$23, $E5,$81,$F8,$22,$23, $D5,$81,$F8,$20,$23, $15,$80,$E8,$0E,$23, $05,$80,$E8,$0C,$23, $F5,$81,$E8,$0A,$23, $E5,$81,$E8,$08,$23, $15,$80,$D8,$06,$23, $05,$80,$D8,$04,$23, $F5,$81,$D8,$02,$23, $E5,$81,$D8,$00,$23

TourianStatueSpritemap_Phantoon:
dw $0013 : db $08,$00,$1C,$87,$25, $00,$00,$1C,$86,$25, $F8,$01,$1C,$85,$25, $F0,$01,$1C,$84,$25, $00,$00,$04,$83,$25, $00,$00,$FC,$81,$25, $F8,$01,$04,$82,$25, $F8,$01,$FC,$80,$25, $08,$80,$EC,$61,$25, $E8,$81,$EC,$4D,$25, $08,$80,$FC,$65,$25, $08,$80,$0C,$6B,$25, $F8,$81,$0C,$69,$25, $E8,$81,$0C,$67,$25, $E8,$81,$FC,$63,$25, $00,$80,$EC,$60,$25, $F0,$81,$EC,$4E,$25, $00,$80,$DC,$4B,$25, $F0,$81,$DC,$49,$25
}

; graphics (any freespace)
%BEGIN_FREESPACE(89)
TourianStatueEyeGlowGFX: incbin "eye_glow_dma.gfx"
%END_FREESPACE(89)
