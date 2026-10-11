; Ceres Door Tiles VRAM Repoint, by H A M
; Repoints Ceres door tiles VRAM from extra enemy tiles to normal enemy tiles.
; Also removes the hardcoding of palette index of it.
; Includes a preview tileset to make Ceres Ridley's room easier to edit.

; Requires my extended spritemap draw fix.

; Instructions (SMART):
; In enemy E23F's header, set manual graphics allocation to false.
; In enemy sets of Ceres rooms other than Ceres Ridley's, change palette index of enemy $E23F from $D002 to $0007.
; For Ceres Ridley's, change palette index to $0002.
; Ceres falling tile room's first enemy must be Ceres door.
; Replace tile tables of both Ceres Ridley tilesets with ceres_ridley_room_mode_1_preview/16x16tiles.ttb.

lorom

org $8FE54C ; in Main ASM - spawn Ceres pre elevator hall falling debris
JSL SpawnEnemyProjectileWithEnemy0GFX

org $A6A2FF ; fix quake x offset of ceres ridley door, and when scrolling
LDA $1840 : AND #$0003 : ASL : TAX
LDA $0FBA : CLC : ADC $A321,x : SEC : SBC $0911 : STA $14 ; x
BRA ContinueDrawingCeresRidleyDoor
assert pc() <= $A6A31F

org $A6A329 ; overwrite duplicate spritemap
ContinueDrawingCeresRidleyDoor:
{
  CLC : ADC #$0080 : BIT #$FE00 : BNE .rtl ; x offscreen check
  LDA $0FBE : SEC : SBC $0915 : STA $12 ; y
  LDA $0FD6 : STA $03 ; palette
  LDA $0FD8 : STA $00 ; base tile number
  LDY.w #CeresDoorSpritemap_6_A6FA13 ; closed, facing right
  JML DrawExtendedSpritemap

.rtl
  RTL
}
assert pc() <= $A6A353

; change ceres escape timer tiles base
org $A6C107 : LDA #$3502 ; tile index 102h, palette 5, high priority

; "EMERGENCY" text
org $A6C164 : dw $3906, $390E, $3906, $3913, $3908, $3906, $390F, $3904, $391A

; japanese text
org $A6C3F4
dw $3D20, $3D21, $3D22, $3D23, $3D24, $3D25, $3D26, $3D27, $3D2F, $3D28, $3D2F, $3D29
dw $3D30, $3D31, $3D32, $3D33, $3D34, $3D35, $3D36, $3D37, $3D3F, $3D38, $3D3F, $3D39
dw $3D29, $3D2A, $3D2B, $3D2C, $3D2D, $3D2E, $3D2F, $3D1C, $3D1D, $3D1E, $3D1F
dw $3D39, $3D3A, $3D3B, $3D3C, $3D3D, $3D3E, $3D3F, $3D40, $3D41, $3D42, $3D43

org $A6C4CB ; Escape timer sprite tile transfer entries
{
  ; Escape timer numbers
  dw $0200 : dl $B0C000 : dw $7E00
  dw $0120 : dl $B0C200 : dw $7F00
  ; Escape timer text
  dw $0200 : dl $B7DA00 : dw $7020
  dw $0200 : dl $B7DC00 : dw $7120
  dw $0200 : dl $B7DE00 : dw $7220
  dw $0200 : dl $B7E000 : dw $7320
  dw $0100 : dl $B7E200 : dw $7420
  dw $0000
}

org $A6F6C5 ; rewrite ceres door init
CeresDoorInit:
{
  LDX $0E54
  LDA $0FB4,x : ASL : TAY
  LDA $F72B,y : STA $0FA8,x
  LDA $F52C,y : STA $0F92,x
  JSR $F739 ; Load rotating elevator room pre-explosion door overlay tiles if needed
  LDA $093F : BEQ .notEscape
    ; escape color
    LDA $0F96,x : LSR : LSR : LSR : LSR : ORA #$0102 : TAX
    LDY #$F50E
    LDA #$000F
    JSL $A9D2F6
  .notEscape
  RTL
}

SpawnEnemyProjectileWithEnemy0GFX:
{
  LDX #$0000
  JML $868027 ; Spawn enemy projectile [Y] with parameter [A] using enemy [X] graphics
}

assert pc() <= $A6F72B

org $A6F756 : LDA #$7C00 ; change dest of ceres elevator room tiles to just before escape timer tiles

;;; Spritemaps ;;;

; Ceres door
org $A6F921
{
CeresDoorSpritemap_0_A6F921:
dw $000C : db $F8,$81,$18,$10,$E1, $F8,$81,$08,$14,$61, $F8,$81,$F8,$14,$61, $F8,$81,$E8,$10,$61, $08,$80,$28,$CA,$21, $F8,$81,$28,$C8,$21, $08,$80,$18,$C4,$A1, $08,$80,$08,$C6,$A1, $08,$80,$F8,$C6,$21, $08,$80,$E8,$C4,$21, $08,$80,$D8,$C2,$21, $F8,$81,$D8,$C0,$21

CeresDoorSpritemap_1_A6F95F:
dw $0008 : db $F8,$01,$18,$01,$E1, $F8,$01,$10,$03,$E1, $F8,$01,$E0,$01,$61, $F8,$01,$E8,$03,$61, $F8,$01,$00,$22,$E1, $F8,$01,$08,$12,$E1, $F8,$01,$F8,$22,$61, $F8,$01,$F0,$12,$61

CeresDoorSpritemap_2_A6F989:
dw $0008 : db $F8,$01,$10,$23,$E1, $F8,$01,$18,$13,$E1, $F8,$01,$E8,$23,$61, $F8,$01,$E0,$13,$61, $FA,$01,$00,$22,$E1, $FA,$01,$08,$12,$E1, $FA,$01,$F8,$22,$61, $FA,$01,$F0,$12,$61

CeresDoorSpritemap_3_A6F9B3:
dw $0006 : db $F8,$01,$18,$00,$E1, $F8,$01,$E0,$00,$61, $FC,$01,$00,$22,$E1, $FC,$01,$08,$12,$E1, $FC,$01,$F8,$22,$61, $FC,$01,$F0,$12,$61

CeresDoorSpritemap_4_A6F9D3:
dw $0006 : db $F8,$01,$E0,$02,$61, $F8,$01,$18,$02,$E1, $FE,$01,$00,$22,$E1, $FE,$01,$08,$12,$E1, $FE,$01,$F8,$22,$61, $FE,$01,$F0,$12,$61

CeresDoorSpritemap_5_A6F9F3:
dw $0006 : db $FA,$01,$18,$02,$E1, $FA,$01,$E0,$02,$61, $FF,$01,$00,$22,$E1, $FF,$01,$08,$12,$E1, $FF,$01,$F8,$22,$61, $FF,$01,$F0,$12,$61

CeresDoorSpritemap_6_A6FA13:
dw $0008 : db $00,$00,$18,$01,$A1, $00,$00,$E0,$01,$21, $00,$00,$10,$03,$A1, $00,$00,$E8,$03,$21, $00,$00,$00,$22,$A1, $00,$00,$08,$12,$A1, $00,$00,$F8,$22,$21, $00,$00,$F0,$12,$21

CeresDoorSpritemap_7_A6FA3D:
dw $0008 : db $00,$00,$10,$23,$A1, $00,$00,$18,$13,$A1, $00,$00,$E8,$23,$21, $00,$00,$E0,$13,$21, $FE,$01,$00,$22,$A1, $FE,$01,$08,$12,$A1, $FE,$01,$F8,$22,$21, $FE,$01,$F0,$12,$21

CeresDoorSpritemap_8_A6FA67:
dw $0006 : db $00,$00,$18,$00,$A1, $00,$00,$E0,$00,$21, $FC,$01,$00,$22,$A1, $FC,$01,$08,$12,$A1, $FC,$01,$F8,$22,$21, $FC,$01,$F0,$12,$21

CeresDoorSpritemap_9_A6FA87:
dw $0006 : db $00,$00,$18,$02,$A1, $00,$00,$E0,$02,$21, $FA,$01,$00,$22,$A1, $FA,$01,$08,$12,$A1, $FA,$01,$F8,$22,$21, $FA,$01,$F0,$12,$21

CeresDoorSpritemap_10_A6FAA7:
dw $0006 : db $FE,$01,$18,$02,$A1, $FE,$01,$E0,$02,$21, $F9,$01,$00,$22,$A1, $F9,$01,$08,$12,$A1, $F9,$01,$F8,$22,$21, $F9,$01,$F0,$12,$21

CeresDoorSpritemap_11_A6FAC7:
dw $0001 : db $08,$00,$08,$20,$20

CeresDoorSpritemap_12_A6FACE:
dw $0013 : db $F8,$81,$40,$16,$01, $F8,$81,$20,$18,$01, $F8,$81,$D0,$18,$81, $18,$80,$20,$1E,$01, $F8,$81,$80,$16,$01, $F8,$81,$A0,$16,$01, $F8,$81,$B0,$16,$01, $F8,$81,$90,$16,$01, $F8,$81,$C0,$16,$01, $18,$80,$40,$1E,$01, $18,$80,$30,$1E,$01, $08,$80,$40,$1E,$01, $08,$80,$30,$1E,$01, $08,$80,$20,$1E,$01, $F8,$81,$30,$16,$01, $F8,$81,$00,$14,$81, $F8,$81,$10,$10,$81, $F8,$81,$F0,$14,$01, $F8,$81,$E0,$10,$01

CeresDoorSpritemap_13_A6FB2F:
dw $000D : db $F8,$81,$80,$16,$01, $F8,$81,$90,$16,$01, $F8,$81,$A0,$16,$01, $F8,$81,$B0,$16,$01, $F8,$81,$C0,$16,$01, $F8,$81,$D0,$16,$01, $F8,$81,$E0,$16,$01, $F8,$81,$F0,$16,$01, $F8,$81,$00,$16,$01, $F8,$81,$10,$16,$01, $F8,$81,$20,$16,$01, $F8,$81,$40,$18,$81, $F8,$81,$30,$16,$01
}

; falling debris enemy projectile
org $8D8ABF
{
CeresFallingDebris_Light:
dw $0001 : db $F8,$81,$F8,$1A,$21

CeresFallingDebris_Dark:
dw $0001 : db $F8,$81,$F8,$1C,$21
}
