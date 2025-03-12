; Fixes bugs (moonwalking off a ledge, getting hit) caused by Samus's apparent direction not matching the internal direction,
; and adds footsteps to moonwalk.
lorom

!SamusXDirection = $0A1E
!Left = $0004
!Right = $0008

!SamusAnimFrame = $0A96
!SamusAnimTimer = $0A94

macro fix_x_direction(pose_id, direction)
	org 8*<pose_id>+$91B629 : db <direction>
endmacro

; change internal direction for moonwalk to facing direction
%fix_x_direction($49, !Left)  ; Facing left  - moonwalk
%fix_x_direction($4A, !Right) ; Facing right - moonwalk
%fix_x_direction($75, !Left)  ; Facing left  - moonwalk - aiming up-left
%fix_x_direction($76, !Right) ; Facing right - moonwalk - aiming up-right
%fix_x_direction($77, !Left)  ; Facing left  - moonwalk - aiming down-left
%fix_x_direction($78, !Right) ; Facing right - moonwalk - aiming down-right

org 2*$10+$90A34B ; repoint to new moonwalk movement handler
dw SamusMovement_Moonwalking

org $90F63A ; freespace in bank $90
SamusMovement_Moonwalking:
PHP ; needed for the jump to footstep stuff
JSR SwapDirection ; swap Samus's direction so the game thinks that she is moving backwards
JSR $8E64 ; Samus X movement
JSR $923F ; Samus Y movement - no speed calculations
JSR SwapDirection ; undo the swap
; footstep stuff
LDA !SamusAnimTimer : DEC : BNE .NoFootstep ; If [Samus animation frame timer] != 1: return
LDX !SamusAnimFrame : LDA.w MoonwalkFootstepFrames,x : AND #$00FF : BEQ .NoFootstep ; If [[moonwalk footstep frame table] + [Samus animation frame]] = 0: return
JMP $A401 ; Do footstep graphics and sound from running movement handler
.NoFootstep
PLP : RTS
MoonwalkFootstepFrames:
db 0,0,1,0,0,1

SwapDirection:
SEP #$30 ; ai8
LDX.b #!Right
LDA !SamusXDirection : CMP.b #!Left : BEQ .Left
LDX.b #!Left
.Left
STX !SamusXDirection
REP #$30 ; ai16
RTS

print pc
