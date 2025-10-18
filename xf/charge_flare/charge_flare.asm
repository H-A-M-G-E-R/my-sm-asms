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

org $90BA83 ; fire projectile at position calculated by CalculateArmCannonPos
LDA $0C04,y : AND #$000F : ASL : TAX ; projectile direction
LDA $0D1A : CLC : ADC.l ProjectileXOffsets,x : STA $0B64,y
LDA $0D1C : CLC : ADC.l ProjectileYOffsets,x : STA $0B78,y
CLC : RTS

ProjectileXOffsets:
  dw 0 ; up, facing right
  dw -4 ; up-right
  dw -5 ; right
  dw -4 ; down-right
  dw 0 ; down, facing right
  dw 0 ; down, facing left
  dw 4 ; down-left
  dw 5 ; left
  dw 4 ; up-left
  dw 0 ; up, facing left

ProjectileYOffsets:
  dw 5 ; up, facing right
  dw 4 ; up-right
  dw 0 ; right
  dw -4 ; down-right
  dw -5 ; down, facing right
  dw -5 ; down, facing left
  dw -4 ; down-left
  dw 0 ; left
  dw 4 ; up-left
  dw 5 ; up, facing left

%padSafe($90BAF7)

org $9BC570 ; in Grapple beam function - fire / go to cancel
JSL CalculateArmCannonPosWhileFiringGrapple
LDA $0D16 : STA $0D08 ; grapple end x position
LDA $0D18 : STA $0D0C ; grapple end y position
JMP $C606
%padSafe($9BC606)

org $9BBEEB ; remove "Set Samus animation frame and position for connecting grapple stuck in place" (seems to be useless and cause that offset glitch)
%padSafe($9BBF1B)
org $91EFBC
JMP $EF53

org $9BBF1B ; Update grapple beam start position during grapple fire
CalculateArmCannonPosWhileFiringGrapple:
{
  PHP : PHB : PHK : PLB : REP #$30
  JSL CalculateArmCannonPos_noGrappleCheck
  LDA $0D34 : ASL : TAX ; grapple direction
  LDA $0D1A : CLC : ADC.w GrappleXOffsets,x : STA $0D16 ; grapple start x position
  SEC : SBC $0AF6 : STA $0D02 ; grapple start x offset
  LDA $0D1C : CLC : ADC.w GrappleYOffsets,x : STA $0D18 ; grapple start y position
  SEC : SBC $0AFA : STA $0D04 ; grapple start y offset
  PLB : PLP : RTL
}

GrappleXOffsets:
  dw 0 ; up, facing right
  dw -10 ; up-right
  dw -14 ; right
  dw -10 ; down-right
  dw 0 ; down, facing right
  dw 0 ; down, facing left
  dw 10 ; down-left
  dw 14 ; left
  dw 10 ; up-left
  dw 0 ; up, facing left

GrappleYOffsets:
  dw 14 ; up, facing right
  dw 10 ; up-right
  dw 0 ; right
  dw -10 ; down-right
  dw -14 ; down, facing right
  dw -14 ; down, facing left
  dw -10 ; down-left
  dw 0 ; left
  dw 10 ; up-left
  dw 14 ; up, facing left

%padSafe($9BBFA5)

pullpc

DoDatFlare:
{
  PHB : PHK : PLB
  JSL CalculateArmCannonPos ; so the flare won't appear at the wrong place after door transitions
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

CalculateArmCannonPos:
{
  ; return if grappling
  LDA $0D32 : CMP #$C4F0 : BNE .rtl

.noGrappleCheck
  ; get spritemap Y offset
  LDA $0A1C : ASL : ASL : ASL : TAX
  LDA $91B62D,x : AND #$00FF : STA $18
  ; get pose-specific arm cannon position
  ; [[ArmCannonPosTable + [pose] * 2] + [anim frame] * 2]
  TXY
  LDA $0A1C : ASL : TAX : LDA.l ArmCannonPosTable,x : BPL .fallback
  CLC : ADC $0A96 : ADC $0A96 : TAX
  ; x
  LDA.l ArmCannonPosTable&$FF0000,x : JSR .signExtend : CLC : ADC $0AF6 : STA $0D1A
  ; y
  LDA.l (ArmCannonPosTable&$FF0000)+1,x : JSR .signExtend : CLC : ADC $0AFA : SEC : SBC $18 : STA $0D1C
.rtl
  RTL

.fallback
  ; fallback
  ; get arm cannon direction
  TYX
  LDA $91B62C,x : AND #$00FF : CMP #$00FF : BEQ .noFlare
  AND #$000F : ASL : TAX
  ; x
  LDA $90C1A8,x : CLC : ADC $0AF6 : STA $0D1A
  ; y
  LDA $90C1C2,x : CLC : ADC $0AFA : SEC : SBC $18 : STA $0D1C
  LDA $0A1F : AND #$00FF : DEC : BEQ .running
  RTL

.running
  PHB : PEA $9000 : PLB : PLB
  JSL $90A808
  PLB
  RTL

.noFlare
  LDA #$8000 : STA $0D1A : STA $0D1C : RTL

.signExtend
  AND #$00FF : BIT #$0080 : BEQ +
    ORA #$FF00
  +
  RTS

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

ArmCannonPosTable:
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, .a5B, .a5C,    0,    0, .a5F
dw .a60, .a61, .a62, .a63, .a64, .a65, .a66,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0

.a5B ; Facing right - skidding
db 13,-26+22

.a5C ; Facing left  - skidding
db -11+1,-28+22

.a5F ; Facing right - hanging on ledge
db 10,-35+23, 9,-38+23, 8,-37+23
db  9,-38+23, 9,-38+23, 9,-38+23, 9,-38+23, 0,0, 0,0
db  8,-30+23

.a60 ; Facing left  - hanging on ledge
db -8+1,-32+23, -8+1,-35+23, -8+1,-35+23
db -8+1,-35+23, -8+1,-35+23, -8+1,-35+23, -8+1,-35+23, 0,0, 0,0
db -8+1,-32+23

.a61 ; Facing right - pulling up from hanging
db 10,-35+23, 9,-28+23, 9,-15+23

.a62 ; Facing left  - pulling up from hanging
db -8+1,-32+23, -8+1,-24+23, -6+1,-16+23

.a63 ; Facing right - pulling forward from hanging
db 7,-13+23, 7,-9+23, 10,-8+23, 14,-10+23 ; the last frame is 22,-10 in fusion

.a64 ; Facing left  - pulling forward from hanging
db -7+1,-12+23, -6+1,-10+23, -10+1,-9+23, -14+1,-10+23 ; the last frame is -22,-10 in fusion

.a65 ; Facing right - pulling into tunnel
db 4,-7+23

.a66 ; Facing left  - pulling into tunnel
db -4+1,-7+23

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
%spritemapEntry(0, $1F3, $F1, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $009, $F4, 0, 0, 3, 6, $3B)
%spritemapEntry(0, $1FC, $09, 0, 0, 3, 6, $3B)
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
%spritemapEntry(0, $1F6, $F6, 0, 0, 3, 6, $3C)
%spritemapEntry(0, $002, $F6, 0, 1, 3, 6, $3C)
%spritemapEntry(0, $002, $02, 1, 1, 3, 6, $3C)
%spritemapEntry(0, $1F6, $02, 1, 0, 3, 6, $3C)
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
