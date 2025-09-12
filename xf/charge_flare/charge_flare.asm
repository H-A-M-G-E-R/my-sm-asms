; in bank $83

!FlareAnimPtr = $0CD6
!FlareAnimTimer = $0CD8
!FlareOamFrame = $0CDA

pushpc

org $90BAFC : JSL DoDatFlare : RTS
%padSafe($90BCBE)
org $90EB9F : JSL DoDatGrappleFlare : LDA $0AAC
org $9BC036
FireGrappleLong:
PHB : PHK : PLB
JSR $C51E
PLB : RTL
%padSafe($9BC0DB)

org $90BD41 ; hyper beam flare
LDA.W #HyperBeamFlareAnim : STA !FlareAnimPtr+0
LDA.W #ChargingSparksChargedAnim : STA !FlareAnimPtr+6
TDC : INC : STA !FlareAnimTimer+0 : STA !FlareAnimTimer+6
LDA #$FFFF : STA $0CD0
PLP : RTS

pullpc

DoDatFlare:
{
  PHB : PHK : PLB
  JSR CalculateFlarePos
  LDA $0CD0 : CMP.W #16 : BCC .rtl : BNE +
    LDA.W #ChargingBeamAnim : STA !FlareAnimPtr+0
    LDA.W #ChargingSparksBeginAnim : STA !FlareAnimPtr+6
    TDC : INC : STA !FlareAnimTimer+0 : STA !FlareAnimTimer+6
    LDA #$0008 : JSL $80902B ; play charging beam sound
  +
  CMP.W #60 : BNE +
    LDA.W #ChargingSparksChargedAnim : STA !FlareAnimPtr+6
    LDA #$0001 : STA !FlareAnimTimer+6
  +
  LDX #$0006
  JSR UpdateFlarePartAnim
  JSR DrawFlarePart
  TDC : TAX
  JSR UpdateFlarePartAnim
  JSR DrawFlarePart
.rtl
  PLB : RTL
}

DoDatGrappleFlare:
{
  PHB : PHK : PLB
  LDA $0CD0 : BEQ .rtl
  DEC : BNE +
    INC : STA !FlareAnimTimer+0
    LDA.W #ChargingBeamAnim_loop : STA !FlareAnimPtr+0
  +
  TDC : TAX
  JSR UpdateFlarePartAnim
  JSR DrawFlarePart
.rtl
  PLB : RTL
}

CalculateFlarePos:
{
  ; get spritemap Y offset
  LDA $0A1C : ASL : ASL : ASL : TAX
  LDA $91B62D,x : AND #$00FF : STA $18
  ; get arm cannon direction
  LDA $91B62C,x : AND #$00FF : CMP #$00FF : BEQ .noFlare
  AND #$000F : ASL : TAX
  ; x
  LDA $90C1A8,x : CLC : ADC $0AF6 : STA $0D1A
  ; y
  LDA $90C1C2,x : CLC : ADC $0AFA : SEC : SBC $18 : STA $0D1C
  LDA $0A1F : AND #$00FF : DEC : BEQ .running
  RTS

.running
  JSL $90A808
  RTS

.noFlare
  LDA #$8000 : STA $0D1A : STA $0D1C : RTS
}

UpdateFlarePartAnim:
{
  DEC !FlareAnimTimer,x : BNE .rts
  LDY !FlareAnimPtr,x
.loop
  LDA $0000,y : BPL .newFrame
  STA $12
  INY : INY
  PEA .loop-1 ; return to .loop
  JMP ($0012)

.newFrame
  STA !FlareAnimTimer,x
  LDA $0002,y
  STA !FlareOamFrame,x
  LDA $0004,y : JSL DoDmaDef
  TYA : CLC : ADC #$0006 : STA !FlareAnimPtr,x

.rts
  RTS
}

DoDmaDef:
{
  PHX
  PHY
  LDX $0330
  TAY
.loop
  ; size
  LDA $0000,y : AND #$00FF : BEQ .rtl
  XBA : LSR : LSR : LSR : STA $D0,x
  ; source
  LDA $0001,y
  STA $D2,x
  PHB : PHB : PLA
  STA $D4,x
  ; dest
  LDA $0003,y : AND #$00FF : ASL : ASL : ASL : ASL : ORA #$6000 : STA $D5,x
  TXA : ADC #$0007 : TAX : STA $0330
  INY : INY : INY : INY
  BRA .loop

.rtl
  PLY : PLX : RTL
}

; DB must be $83, also clobbers X
DrawFlarePart:
{
  LDY !FlareOamFrame,x : BPL .skip
  LDA $0D1A : CMP #$8000 : BEQ .skip
  SEC : SBC $0911 : STA $14
  LDA $0D1C : SEC : SBC $0915 : STA $12
  STZ $03 : STZ $00
  JSL $8B829A

.skip
  RTS
}

;;; Animations
ChargingBeamAnim:
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame0
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame1
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame0
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame1
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame4
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame5
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame4
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame1
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame8
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame4
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame8
dw 4,ChargingBeamOam_Frame11,ChargingBeamDma_Frame11

.loop
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame12
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame13
dw 4,ChargingBeamOam_Frame11,ChargingBeamDma_Frame11
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame8
dw FlareInst_Goto,.loop

ChargingSparksBeginAnim:
.loop
dw 2,ChargingSparksBegin_Frame0,ChargingSparksBeginDma
dw 2,ChargingSparksBegin_Frame1,ChargingSparksBeginDma
dw 2,ChargingSparksBegin_Frame2,ChargingSparksBeginDma
dw 2,ChargingSparksBegin_Frame3,ChargingSparksBeginDma
dw FlareInst_Goto,.loop

ChargingSparksChargedAnim:
.loop
dw 2,ChargingSparksCharged_Frame0,ChargingSparksChargedDma_Frame0
dw 2,ChargingSparksCharged_Frame1,ChargingSparksChargedDma_Frame1
dw 2,ChargingSparksCharged_Frame1,ChargingSparksChargedDma_Frame2
dw 2,ChargingSparksCharged_Frame3,ChargingSparksChargedDma_Frame3
dw 2,ChargingSparksCharged_Frame4,ChargingSparksChargedDma_Frame4
dw FlareInst_Goto,.loop

HyperBeamFlareAnim:
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame12
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame13
dw 4,ChargingBeamOam_Frame11,ChargingBeamDma_Frame11
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame8
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame5
dw 4,ChargingBeamOam_Frame4,ChargingBeamDma_Frame4
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame1
dw 4,ChargingBeamOam_Frame0,ChargingBeamDma_Frame0
dw FlareInst_EndHyperBeamFlare

;;; Instructions
FlareInst_Goto:
{
  LDA $0000,y : TAY : RTS  
}

FlareInst_EndHyperBeamFlare:
{
  STZ $0CD0
  STZ !FlareOamFrame+0 : STZ !FlareOamFrame+3 ; don't draw them this frame
  PLA : RTS ; terminate doing instruction list
}

;;; OAM
ChargingBeamOam_Frame0:
dw 1
%spritemapEntry(0, -4, -4, 0, 0, 3, 6, $42)

ChargingBeamOam_Frame4:
dw 4
%spritemapEntry(0, -8, -8, 0, 0, 3, 6, $42)
%spritemapEntry(0, 0, -8, 0, 1, 3, 6, $42)
%spritemapEntry(0, 0, 0, 1, 1, 3, 6, $42)
%spritemapEntry(0, -8, 0, 1, 0, 3, 6, $42)

ChargingBeamOam_Frame11:
dw 4
%spritemapEntry(1, -$10, -$10, 0, 0, 3, 6, $41)
%spritemapEntry(1, 0, -$10, 0, 1, 3, 6, $41)
%spritemapEntry(1, 0, 0, 1, 1, 3, 6, $41)
%spritemapEntry(1, -$10, 0, 1, 0, 3, 6, $41)

ChargingSparksBegin_Frame0:
dw 3
%spritemapEntry(0, $1F5, $F5, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $006, $F7, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1FC, $04, 0, 0, 3, 6, $3B)

ChargingSparksBegin_Frame1:
dw 3
%spritemapEntry(0, $1F7, $F7, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $004, $F9, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1FC, $02, 0, 0, 3, 6, $3B)

ChargingSparksBegin_Frame2:
dw 6
%spritemapEntry(0, $1F1, $EE, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $00C, $F3, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $1FD, $0C, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $1F9, $F8, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $002, $FB, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1FC, $00, 0, 0, 3, 6, $3B)

ChargingSparksBegin_Frame3:
dw 6
%spritemapEntry(0, $1F3, $F1, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $009, $F4, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $1FC, $09, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $1FA, $F9, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $001, $FC, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1FC, $FF, 0, 0, 3, 6, $3B)

ChargingSparksCharged_Frame0:
dw 4
%spritemapEntry(0, $1F2, $F2, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $006, $F2, 0, 1, 3, 6, $3B)
%spritemapEntry(0, $006, $06, 1, 1, 3, 6, $3B)
%spritemapEntry(0, $1F2, $06, 1, 0, 3, 6, $3B)

ChargingSparksCharged_Frame1:
dw 4
%spritemapEntry(0, $1F3, $F3, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $005, $F3, 0, 1, 3, 6, $3B)
%spritemapEntry(0, $005, $05, 1, 1, 3, 6, $3B)
%spritemapEntry(0, $1F3, $05, 1, 0, 3, 6, $3B)

ChargingSparksCharged_Frame3:
dw 8
%spritemapEntry(0, $1F2, $F2, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $006, $F2, 0, 1, 3, 6, $3C)
%spritemapEntry(0, $006, $06, 1, 1, 3, 6, $3C)
%spritemapEntry(0, $1F2, $06, 1, 0, 3, 6, $3C)
%spritemapEntry(0, $1EE, $EE, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $00A, $EE, 0, 1, 3, 6, $3B)
%spritemapEntry(0, $00A, $0A, 1, 1, 3, 6, $3B)
%spritemapEntry(0, $1EE, $0A, 1, 0, 3, 6, $3B)

ChargingSparksCharged_Frame4:
dw 8
%spritemapEntry(0, $008, $F0, 1, 0, 3, 6, $3B)
%spritemapEntry(0, $008, $08, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1F0, $08, 0, 1, 3, 6, $3B)
%spritemapEntry(0, $1F0, $F0, 1, 1, 3, 6, $3B)
%spritemapEntry(0, $1F9, $F9, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $1FF, $F9, 0, 1, 3, 6, $3C)
%spritemapEntry(0, $1FF, $FF, 1, 1, 3, 6, $3C)
%spritemapEntry(0, $1F9, $FF, 1, 0, 3, 6, $3C)

;;; DMA definitions
ChargingBeamDma_Frame0:
db 1 : dw ChargingBeamGfx+0*20 : db $42
db 0

ChargingBeamDma_Frame1:
db 1 : dw ChargingBeamGfx+1*$20 : db $42
db 0

ChargingBeamDma_Frame4:
db 1 : dw ChargingBeamGfx+2*$20 : db $42
db 0

ChargingBeamDma_Frame5:
db 1 : dw ChargingBeamGfx+3*$20 : db $42
db 0

ChargingBeamDma_Frame8:
db 1 : dw ChargingBeamGfx+4*$20 : db $42
db 0

ChargingBeamDma_Frame11:
db 1 : dw ChargingBeamGfx+5*$20 : db $42
db 0

ChargingBeamDma_Frame12:
db 1 : dw ChargingBeamGfx+6*$20 : db $42
db 0

ChargingBeamDma_Frame13:
db 1 : dw ChargingBeamGfx+7*$20 : db $42
db 0

ChargingSparksBeginDma:
db 2 : dw ChargingSparksGfx+0*$20 : db $3B
db 0

ChargingSparksChargedDma_Frame0:
db 1 : dw ChargingSparksGfx+3*$20 : db $3B
db 0

ChargingSparksChargedDma_Frame1:
db 1 : dw ChargingSparksGfx+4*$20 : db $3B
db 0

ChargingSparksChargedDma_Frame2:
db 1 : dw ChargingSparksGfx+5*$20 : db $3B
db 0

ChargingSparksChargedDma_Frame3:
db 1 : dw ChargingSparksGfx+2*$20 : db $3B
db 1 : dw ChargingSparksGfx+6*$20 : db $3C
db 0

ChargingSparksChargedDma_Frame4:
db 1 : dw ChargingSparksGfx+2*$20 : db $3B
db 0

PowerBombDma_Frame0:
db 1 : dw PowerBombGfx+0*$20 : db $7B
db 0

PowerBombDma_Frame1:
db 1 : dw PowerBombGfx+1*$20 : db $7B
db 0

PowerBombDma_Frame2:
db 1 : dw PowerBombGfx+2*$20 : db $7B
db 0

PowerBombDmaPtrs:
dw PowerBombDma_Frame0, PowerBombDma_Frame1, PowerBombDma_Frame2

ChargingBeamGfx:
incbin "charge_flare_dma.gfx"

ChargingSparksGfx:
incbin "charge_sparks_dma.gfx"

PowerBombGfx:
incbin "power_bomb_dma.gfx"
