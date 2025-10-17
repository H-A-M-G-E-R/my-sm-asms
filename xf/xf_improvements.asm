; Patches for Meta's X-Fusion hack (https://metroidconstruction.com/hack.php?id=837) that makes it feel a bit more like Fusion.
; Patch it (or xf_improvements.ips) on xf_v1.2_gba-eng-fre-jap-ger.
; The improved SPC engine with my new sounds is from (https://github.com/H-A-M-G-E-R/SM-SPC/tree/xf).
asar 1.91

lorom

macro padSafe(addr)
  assert pc() <= <addr>
  padbyte $FF : pad <addr>
endmacro

org $90C2D1 ; beam speeds
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0700,$0700*3/4
    dw $0700,$0700*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0700,$0700*3/4
    dw $0700,$0700*3/4
    dw $0700,$0700*3/4 ; disruptor
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4

org $90AF12 ; don't accelerate non-wave beams
LDA $0C04,x : AND #$000F : ASL : TAX
JSR ($AF36,x)
JMP $B16A

org $90B103 ; don't accelerate wave beams
LDA $0C04,x : AND #$000F : ASL : TAX
JSR ($B127,x)
JMP $B16A

org $90C254 ; uncharged beam cooldowns
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07

org $90C264 ; charged beam cooldowns
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07

org $938268 : BRA + : org $9382A6 : + ; no beam flicker

;;; touch AI rewrite
org $A0A4A1
    LDA $0A6E : BNE ContactDamage
    TXY ; Y = [enemy index]
    LDA $0F78,x : TAX : LDA $A00006,x : JSL $A08996 : JSL $91DF51 ; deal suit-adjusted damage to samus
    LDA.w #60 : STA $18A8 ; iframes = 60
    LDA.w #5 : STA $18AA ; knockback timer = 5
    TDC : TAX ; knockback direction = left
    LDA $0AF6 : CMP $0F7A,y : BMI +
        INX ; knockback direction = right
    +
    STX $0A54
    RTS

ContactDamage:
    PHX ; push [enemy index] to stack
    ASL : TAX
    LDA.l ContactDamageTable-2,x : STA $26 ; $26 = contact damage
    TXA : LSR : CMP #$0004 : BNE + ; end charge when hitting an enemy with pseudo screw
        LDA $09A2 : BIT #$0080 : BEQ ++
            LDA #400 : STA $26
        ++
        LDA #$0004 : JSL $90F084 ; End charge beam
        LDA #$0005
    +
    CLC : ADC #$000F : STA $14 ; vulnerability index = Fh + [contact damage index] if not pseudo-screwing, 14h if pseudo screwing
    PLX ; pull [enemy index] from stack
    LDA $0F78,x : TAX : LDA $A0003C,x
    CLC : ADC $14 : TAX : LDA $B40000,x : AND #$007F
    STA $28 ; $28 = contact vulnerability
    JSL $A0B6FF ; $2A = contact damage * contact vulnerability
    LSR $2A : BEQ NoDamage ; half calculated damage
    JSR SetEnemyToBeHurt ; see EnemyTileLoadingRewrite1_03.asm, also sets X to [enemy index]
    LDA $0F8C,x : SEC : SBC $2A : BCS + ; deal damage to enemy
        TDC
    +
    STA $0F8C,x
    JSL QueueEnemyCry
    NoDamage:
    RTS

QueueEnemyCry:
    LDX $0E54
    LDA $0F9E,x : BNE + ; queue enemy cry if not frozen
    LDA $0F78,x : TAX : LDA $A0000E,x : BEQ +
        JSL $8090B7
    +
    LDX $0E54
    RTL

ContactDamageTable:
    dw 500,300,2000,200 ; speed boosting, shinesparking, screw attacking, pseudo screwing respectively

%padSafe($A0A597)

; prevents iframes from dropping to 0 when there are enemies present and samus is speedboosting/shinesparking/(pseudo) screwing
org $A09A90 : BRA + : org $A09A9A : + ; for extended spritemap
org $A0A096 : BRA + : org $A0A0B8 : + ; for non-extended spritemap

; lower iframes from 96 to 60
org $A09864 : LDA.w #60
org $A09923 : LDA.w #60

org $A09FC4 ; enemy grapple death
{
  JSL QueueEnemyCry
  TXY : LDA $0F78,x : TAX : LDA $A00022,x : TYX
  JSL $A0A3AF
  LDX $0E54
  RTL
}
%padSafe($A09FDF)

; fix an enemy set causing wrong frozen palette
org $B48282
  dw $F0C0,$0001
  dw $D380,$0002
  dw $D400,$0007
  dw $FFFF

; TEST (invincibility)
;org $90EAF0 : BRA $00
;org $8A9590 : BRA + : org $8A95B2 : +

incsrc "samus/samus.asm"

incsrc "compressed_fx_tilemaps.asm"

incsrc "common_oam_repoint.asm"

incsrc "shoot.asm"

incsrc "extended_spritemap_draw_fix.asm"

incsrc "spc.asm"

incsrc "EnemyTileLoadingRewrite1_03.asm"

incsrc "faster startup.asm"
