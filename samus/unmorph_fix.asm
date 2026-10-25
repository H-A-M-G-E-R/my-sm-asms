; There are 3 problems that make unmorphing glitchy:
; Collision direction is set to Fh when checking for collision,
; while slopes expect the correct collision direction.
; If Samus collides with surface either above or below,
; the collision check for the opposite surface is one Y radius difference further to the surface than intended.
; Finally, the "block collision detection due to change of pose"
; doesn't check for every block below in some situations.

lorom

; Move no special reaction flag in $0B02 to 0004h to preserve collision direction
org $949686 : ORA #$0004
org $9496EC : ORA #$0004

; Set collision direction to prevent getting stuck in slopes
org $91FE4C : JSL BlockCollisionDueToChangeOfPose_Up
org $91FE64 : JSL BlockCollisionDueToChangeOfPose_Down

%BEGIN_FREESPACE(94)
BlockCollisionDueToChangeOfPose_Up:
{
    LDA #$0002 : STA $0B02
    JMP $96AB
}

BlockCollisionDueToChangeOfPose_Down:
{
    LDA #$0003 : STA $0B02
    JMP $96AB
}

Hijack91FF2B:
{
    ; new pose radius
    LDA $0B00 : PHA
    CLC : ADC $0A3A : STA $0B00
    JSL BlockCollisionDueToChangeOfPose_Down
    PLA : RTL
}

Hijack91FF58:
{
    LDA $0B00 : PHA
    CLC : ADC $0A3A : STA $0B00
    JSL BlockCollisionDueToChangeOfPose_Up
    PLA : RTL
}
%END_FREESPACE(94)

org $91FF2B : JSL Hijack91FF2B
org $91FF58 : JSL Hijack91FF58
