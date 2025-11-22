lorom

; Unused pose usage:
; $5B and $5C are for skidding
; $5D and $5E are for using an elevator
; $5F and $60 are for hanging on ledge
; $61 and $62 are for pulling up from hanging

;;; Pose definitions
;                       ______________________ $B629: Pose X direction
;                      |    ___________________ $B62A: Movement type
;                      |   |    ________________ $B62B: New pose if not affected by buttons
;                      |   |   |    _____________ $B62C: Direction shots are fired. High nybble set means can't fire and grapple beam is cancelled
;                      |   |   |   |    __________ $B62D: Y offset of Samus GFX and projectile origin (but not Samus hitbox)
;                      |   |   |   |   |    _______ $B62E: Unused
;                      |   |   |   |   |   |    ____ $B62F: Y radius
;                      |   |   |   |   |   |   |    _ $B630: Unused
;                      |   |   |   |   |   |   |   |
org 8*$5B+$91B629 : db $08,$01,$01,$02,$07,$00,$10,$00 ; Facing right - skidding
org 8*$5C+$91B629 : db $04,$01,$02,$07,$07,$00,$10,$00 ; Facing left  - skidding
org 8*$5D+$91B629 : db $08,$00,$FF,$FF,$07,$00,$14,$00 ; Facing right - using an elevator
org 8*$5E+$91B629 : db $04,$00,$FF,$FF,$07,$00,$14,$00 ; Facing left  - using an elevator
org 8*$5F+$91B629 : db $08,$07,$FF,$02,$07,$00,$10,$00 ; Facing right - hanging on ledge
org 8*$60+$91B629 : db $04,$07,$FF,$07,$07,$00,$10,$00 ; Facing left  - hanging on ledge
org 8*$61+$91B629 : db $08,$09,$FF,$02,$07,$00,$07,$00 ; Facing right - pulling up from hanging
org 8*$62+$91B629 : db $04,$09,$FF,$07,$07,$00,$07,$00 ; Facing left  - pulling up from hanging
org 8*$63+$91B629 : db $08,$09,$FF,$02,$0B,$00,$0C,$00 ; Facing right - pulling forward from hanging
org 8*$64+$91B629 : db $04,$09,$FF,$07,$0B,$00,$0C,$00 ; Facing left  - pulling forward from hanging
org 8*$65+$91B629 : db $08,$09,$FF,$02,$07,$00,$07,$00 ; Facing right - pulling into tunnel
org 8*$66+$91B629 : db $04,$09,$FF,$07,$07,$00,$07,$00 ; Facing left  - pulling into tunnel

;;; Animation delays
org 2*$83+$91B010 ; change walljump animation delay tables to transition to spinjump pose as soon as the walljump animation ends, and also free up space for my new poses
dw WalljumpRightAnimationDelayTable, WalljumpLeftAnimationDelayTable

org 2*$5B+$91B010
dw SkiddingAnimationDelayTable, SkiddingAnimationDelayTable
dw UsingAnElevatorDelayTable, UsingAnElevatorDelayTable
dw HangingOnLedgeDelayTable, HangingOnLedgeDelayTable
dw PullingUpFromHangingDelayTable, PullingUpFromHangingDelayTable
dw PullingForwardFromHangingDelayTableRight, PullingForwardFromHangingDelayTableLeft
dw PullingIntoTunnelDelayTableRight, PullingIntoTunnelDelayTableLeft

org 2*1+$91B010
dw StandingAnimationDelayTable, StandingAnimationDelayTable ; forward
dw StandingAnimationDelayTable, StandingAnimationDelayTable ; up
dw StandingAnimationDelayTable, StandingAnimationDelayTable ; diagonal up
dw StandingAnimationDelayTable, StandingAnimationDelayTable ; diagonal down

; jumping
org 2*$13+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; forward, not moving
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; up
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; down

org 2*$4D+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; not aiming

org 2*$51+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; forward, moving

org 2*$69+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; diagonal up
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; diagonal down

; falling
org 2*$2B+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; up
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; down

org 2*$67+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; forward

org 2*$6D+$91B010
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; diagonal up
dw MidAirAnimationDelayTable, MidAirAnimationDelayTable ; diagonal down


org $91B36C
WalljumpRightAnimationDelayTable:
db $05, $05, $FD,$19
WalljumpLeftAnimationDelayTable:
db $05, $05, $FD,$1A

SkiddingAnimationDelayTable:
db $10, $FF ; unarmed
db $10, $FF ; armed

UsingAnElevatorDelayTable:
db $06, $06, $10, $FE,$01
db $04, $FD,$00 ; transition to facing forward pose after finishing riding the elevator

HangingOnLedgeDelayTable:
db $02, $02, $02
db $10, $10, $10, $10, $FE,$04
db $10, $FE,$01

PullingUpFromHangingDelayTable:
db $03, $03, $03, $FE,$01

PullingForwardFromHangingDelayTableRight:
db $04, $06, $02, $02, $FD,$01

PullingForwardFromHangingDelayTableLeft:
db $04, $06, $02, $02, $FD,$02

; see "transition_table.asm" for the rest of them

%padSafe($91B39D)

org $8BF760 ; not much freespace for new samus tiles
SamusGfx_Top_Left_Skidding_Frame0:
incbin "gfx/Top_Left_Skidding_Frame0.gfx":0..6*$20
incbin "gfx/Top_Left_Skidding_Frame0.gfx":$200..$200+6*$20
SamusGfx_Top_Left_ArmedSkidding_Frame0:
incbin "gfx/Top_Left_Armed_Skidding_Frame0.gfx":0..6*$20
incbin "gfx/Top_Left_Armed_Skidding_Frame0.gfx":$200..$200+6*$20
SamusGfx_Top_Right_Skidding_Frame0:
incbin "gfx/Top_Right_Skidding_Frame0.gfx":0..6*$20
incbin "gfx/Top_Right_Skidding_Frame0.gfx":$200..$200+6*$20
SamusGfx_Top_Right_Armed_Skidding_Frame0:
incbin "gfx/Top_Right_Armed_Skidding_Frame0.gfx":0..6*$20
incbin "gfx/Top_Right_Armed_Skidding_Frame0.gfx":$200..$200+6*$20
SamusGfx_Bottom_Skidding_Frame0:
incbin "gfx/Bottom_Skidding_Frame0.gfx":0..5*$20
incbin "gfx/Bottom_Skidding_Frame0.gfx":$200..$200+3*$20
