; Custom Enemy Grapple AI, by H A M
; Allows enemies to have a custom grapple AI.
; Preserves other AI flags when setting grapple AI.
; Also fixes an edge case that if an enemy has just become intangible in its AI,
; it doesn't ignore grapple.
; Uses no freespace in bank $A0.

; Notes:

; $A09E9A (enemy / grapple beam collision detection) is called in 3 routines:
; Grapple beam function - firing
; Grapple beam function - connected - locked in place
; Grapple beam function - connected - swinging
; Make sure to account for that in your custom enemy grapple reaction.

; Make sure to return A after your custom enemy grapple reaction to these values:
; 0: no collision
; 1: latch on
; 3: cancel grapple

org $A09E9A ; rewrite routine
;; Returns:
;;     A: Grapple reaction index
;;     {
;;         0: Enemy grapple AI = $8000 - no interaction. Also unfreezes enemies(!)
;;         1: Enemy grapple AI = $8005 - Samus latches on
;;         2: Enemy grapple AI = $800A - kill enemy
;;         3: Enemy grapple AI = $800F - cancel grapple beam
;;         4: Enemy grapple AI = $8014 - Samus latches on - no invincibility
;;         5: Enemy grapple AI = $8019 - Samus latches on - paralyse enemy
;;         6: Enemy grapple AI = $801E - hurt Samus
;;         If no collision, 0
;;         Otherwise: Chosen by [[enemy grapple AI] - 2] (custom grapple reaction)
;;     }
;;     $12: Collided enemy ID if collision, otherwise 0

; Grapple reaction indices 1/4/5 set the grapple beam's end position to the enemy's position,
; unless the enemy has custom grapple AI.
; Collision detection ignores the extended hitbox format
EnemyGrappleCollision:
{
    PHB : PHX : PHY
    TDC : TAY ; Interactive enemy indices index = 0
    .loop
        LDA $17EC,y ; A = [interactive enemy index]
        BPL + ; If [enemy index] >= 8000h:
        STZ $12 ; Collided enemy ID = 0
        TDC ; Grapple reaction index = 0
        PLY : PLX : PLB : RTL

    +
        STA $0E54 : TAX ; X = enemy index = [A]
        LDA $0FA0,x : BNE .next ; If [enemy invincibility timer] != 0: go to BRANCH_NEXT
        LDA $0F86,x : BIT #$0400 : BNE .next ; If enemy is intangible: go to BRANCH_NEXT (fix)

        ; If |[enemy X position] - [grapple beam end X position]| - [enemy X radius] >= 8: go to BRANCH_NEXT
        LDA $0F7A,x : SEC : SBC $0D08 : BPL + : EOR #$FFFF : INC : +
        SEC : SBC $0F82,x : BCC +
        CMP #$0008 : BCS .next
    +
        ; If |[enemy Y position] - [grapple beam end Y position]| - [enemy Y radius] < 8: go to BRANCH_HIT
        LDA $0F7A,x : SEC : SBC $0D08 : BPL + : EOR #$FFFF : INC : +
        SEC : SBC $0F82,x : BCC .hit
        CMP #$0008 : BCC .hit

    .next
        INY : INY ; Interactive enemy indices index += 2
        BRA .loop

.hit
    LDA $0F8A,x : ORA #$0001 : STA $0F8A,x ; Enemy AI handler |= grapple (was =)
    TDC : TAY ; Y = 0
    ; Map non-custom grapple AI to grapple reaction index
    LDA $0F78,x : STA $12 ; $12 = [enemy ID]
    TAX : LDA $A0001A,x
    CMP #$8000 : BEQ .grappleIndexDetermined
    INY ; Y = 1
    CMP #$8005 : BEQ .grappleIndexDetermined
    INY ; Y = 2
    CMP #$800A : BEQ .grappleIndexDetermined
    INY ; Y = 3
    CMP #$800F : BEQ .grappleIndexDetermined
    INY ; Y = 4
    CMP #$8014 : BEQ .grappleIndexDetermined
    INY ; Y = 5
    ;CMP #$8019 : BEQ .grappleIndexDetermined ; unused grapple AI
    INY ; Y = 6
    CMP #$801E : BEQ .grappleIndexDetermined
    ; Execute custom grapple reaction
    DEC : DEC : TAY
    LDX $0E54 : LDA $0FA6-1,x : STA $1785 : PHA : PLB : PLB
    LDA $0000,y : STA $1784
    JSL $A0A025 ; Execute [$1784]
.return
    PLY : PLX : PLB : RTL

.grappleIndexDetermined
    DEY : BEQ .attach
    CPY.w #$0004-1 : BEQ .attach
    ;CPY.w #$0005-1 : BEQ .attach
    INY : TYA : BRA .return

.attach
    ; Grapple beam end position = [enemy position]
    LDX $0E54
    LDA $0F7A,x : STA $0D08
    LDA $0F7E,x : STA $0D0C
    TYA : BRA .return
}
assert pc() <= $A09F6D

;;; Example custom grapple AI: grapple repels metroids

org $A3FFF0
dw MetroidGrappleReaction ; pointer to grapple reaction
GotoMetroidGrappleAI: ; FFF2 (the grapple ai)
JMP MetroidGrappleAI

%BEGIN_FREESPACE(A3) ; freespace marker from cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842)
MetroidGrappleReaction:
{
    LDA $0F8A,x : AND #$FFFE : STA $0F8A,x ; unset grapple ai
    BIT #$0004 : BNE .return ; return if frozen
    LDA $0D32 : CMP #$C703 : BNE .return ; return if [grapple function] != firing
    ; repel metroid
    ; metroid X velocity = [grapple beam extension X velocity]
    STZ $0FA8,x : STZ $0FAA,x
    LDA $0D22 : BPL +
        DEC $0FAA,x
    +
    STA $0FA9,x
    ; metroid X velocity = [grapple beam extension X velocity]
    STZ $0FAC,x : STZ $0FAE,x
    LDA $0D24 : BPL +
        DEC $0FAE,x
    +
    STA $0FAD,x

.return
    LDA #$0003 ; grapple reaction index = cancel grapple beam
    RTL
}

MetroidGrappleAI: ; expected to never be executed because its grapple reaction unsets grapple ai
{
    RTL
}
%END_FREESPACE(A3)
