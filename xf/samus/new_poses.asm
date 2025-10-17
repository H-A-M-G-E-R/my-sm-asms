lorom

macro spritemapEntry(Size, XOffset, YOffset, YFlip, XFlip, Priority, Palette, Tile)
; Spritemap entry format is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = sprite X offset
;     y = sprite Y offset
;     Y = Y flip
;     X = X flip
;     p = priority (relative to background)
;     P = palette (often unused)
;     t = tile number
    dw <Size><<15|(<XOffset>&$1FF)
    db <YOffset>
    dw <YFlip><<15|<XFlip><<14|<Priority><<12|<Palette><<9|<Tile>
endmacro

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

;;; OAM
org 2*$5B+$929263
dw (SkiddingRightOamTableTop-$808D)/2, (SkiddingLeftOamTableTop-$808D)/2
dw (UsingAnElevatorRightOamTableTop-$808D)/2, (UsingAnElevatorLeftOamTableTop-$808D)/2
dw (HangingOnLedgeRightOamTableTop-$808D)/2, (HangingOnLedgeLeftOamTableTop-$808D)/2
dw (PullingUpFromHangingRightOamTableTop-$808D)/2, (PullingUpFromHangingLeftOamTableTop-$808D)/2
dw (PullingForwardFromHangingRightOamTableTop-$808D)/2, (PullingForwardFromHangingLeftOamTableTop-$808D)/2
dw (PullingIntoTunnelRightOamTableTop-$808D)/2, (PullingIntoTunnelLeftOamTableTop-$808D)/2

org 2*$5B+$92945D
dw (SkiddingRightOamTableBottom-$808D)/2, (SkiddingRightOamTableBottom-$808D)/2
dw (UsingAnElevatorOamTableBottom-$808D)/2, (UsingAnElevatorOamTableBottom-$808D)/2
dw (HangingOnLedgeRightOamTableBottom-$808D)/2, (HangingOnLedgeLeftOamTableBottom-$808D)/2
dw (PullingUpFromHangingRightOamTableBottom-$808D)/2, (PullingUpFromHangingLeftOamTableBottom-$808D)/2
dw (SkiddingRightOamTableBottom-$808D)/2, (SkiddingRightOamTableBottom-$808D)/2
dw (SkiddingRightOamTableBottom-$808D)/2, (SkiddingRightOamTableBottom-$808D)/2

org $92912D
SkiddingRightOamTableTop:
dw SamusOam_Right_Skidding_Frame0, SamusOam_Empty
dw SamusOam_Right_Skidding_Frame0
SkiddingLeftOamTableTop:
dw SamusOam_Left_Skidding_Frame0, SamusOam_Empty
dw SamusOam_Left_Skidding_Frame0

UsingAnElevatorRightOamTableTop:
dw SamusOam_Right_UsingAnElevator_Frame0, $9676, SamusOam_UsingAnElevator_Frame2, SamusOam_Empty,SamusOam_Empty
dw SamusOam_UsingAnElevator_Frame2
UsingAnElevatorLeftOamTableTop:
dw SamusOam_Left_UsingAnElevator_Frame0, $9676, SamusOam_UsingAnElevator_Frame2, SamusOam_Empty,SamusOam_Empty
dw SamusOam_UsingAnElevator_Frame2

UsingAnElevatorOamTableBottom:
dw SamusOam_Empty, $968C
SkiddingRightOamTableBottom:
dw SamusOam_Empty, SamusOam_Empty,SamusOam_Empty
dw SamusOam_Empty

SamusOam_Left_Skidding_Frame0:
dw $0008
%spritemapEntry(1, $1F7, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8, $DE+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F8, $E8+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8, $F8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $000, $F8+$16, 0, 0, 2, 4, $0C)
%spritemapEntry(0, $1F0, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F0, $F8+$16, 0, 0, 2, 4, $1A)
%spritemapEntry(1, $1F0, $DE+$16, 0, 0, 2, 4, $04)
SamusOam_Right_Skidding_Frame0:
dw $0008
%spritemapEntry(1, $1FA, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8, $DE+$16, 0, 1, 2, 4, $02)
%spritemapEntry(1, $1F8, $E8+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $F8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F8, $F8+$16, 0, 1, 2, 4, $0C)
%spritemapEntry(0, $008, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $008, $F8+$16, 0, 1, 2, 4, $1A)
%spritemapEntry(1, $001, $DD+$16, 0, 0, 2, 4, $04)

SamusOam_Left_UsingAnElevator_Frame0:
dw $0004
%spritemapEntry(1, $1F8, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F8, $E8+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $000, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(1, $1F8, $F0+$18, 0, 0, 2, 4, $08)
SamusOam_UsingAnElevator_Frame2:
dw $0009
%spritemapEntry(1, $1F5, $F0+$18, 0, 0, 2, 4, $08)
%spritemapEntry(0, $005, $F0+$18, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $005, $F8+$18, 0, 0, 2, 4, $1A)
%spritemapEntry(1, $1F5, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $005, $D8+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $005, $E0+$18, 0, 0, 2, 4, $12)
%spritemapEntry(0, $1F5, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(0, $1FD, $E8+$18, 0, 0, 2, 4, $04)
%spritemapEntry(0, $005, $E8+$18, 0, 0, 2, 4, $05)
SamusOam_Right_UsingAnElevator_Frame0:
dw $0006
%spritemapEntry(0, $1F7, $E3+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F7, $EB+$18, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F8, $F0+$18, 0, 1, 2, 4, $08)
%spritemapEntry(1, $1F8, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F8, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(0, $000, $E8+$18, 0, 0, 2, 4, $04)
SamusOam_Empty:
dw $0000

SamusAnimationDefinition_SkiddingLeft:
db $17,$01,$0A,$05, $00,$00,$00,$00
db $17,$02,$0A,$05
SamusAnimationDefinition_SkiddingRight:
db $17,$03,$0A,$05, $00,$00,$00,$00
db $17,$04,$0A,$05

SamusAnimationDefinition_UsingAnElevatorLeft:
db $17,$06,$0A,$07, $00,$00,$00,$00, $17,$08,$0A,$09, $00,$00,$00,$00,$00,$00,$00,$00
db $17,$08,$0A,$09
SamusAnimationDefinition_UsingAnElevatorRight:
db $17,$0A,$0A,$07, $00,$00,$00,$00, $17,$08,$0A,$09, $00,$00,$00,$00,$00,$00,$00,$00
db $17,$08,$0A,$09

org $92B1C7 ; freespace
HangingOnLedgeRightOamTableTop:
dw SamusOam_Top_Right_HangingOnLedge_Frame0, SamusOam_Top_Right_HangingOnLedge_Frame1, SamusOam_Top_Right_HangingOnLedge_Frame2
dw SamusOam_Top_Right_HangingOnLedge_Frame1, SamusOam_Top_Right_HangingOnLedge_Frame1, SamusOam_Top_Right_HangingOnLedge_Frame5, SamusOam_Top_Right_HangingOnLedge_Frame1, SamusOam_Empty, SamusOam_Empty
dw SamusOam_Right_ReadyToJump_HangingOnLedge_Frame0

HangingOnLedgeRightOamTableBottom:
dw SamusOam_Bottom_Right_HangingOnLedge_Frame0, SamusOam_Bottom_Right_HangingOnLedge_Frame1, SamusOam_Bottom_Right_HangingOnLedge_Frame2
dw SamusOam_Bottom_Right_HangingOnLedge_Frame3, SamusOam_Bottom_Right_HangingOnLedge_Frame1, SamusOam_Bottom_Right_HangingOnLedge_Frame5, SamusOam_Bottom_Right_HangingOnLedge_Frame1, SamusOam_Empty, SamusOam_Empty
dw SamusOam_Empty

HangingOnLedgeLeftOamTableTop:
dw SamusOam_Top_Left_HangingOnLedge_Frame0, SamusOam_Top_Left_HangingOnLedge_Frame1, SamusOam_Top_Left_HangingOnLedge_Frame2
dw SamusOam_Top_Left_HangingOnLedge_Frame2, SamusOam_Top_Left_HangingOnLedge_Frame1, SamusOam_Top_Left_HangingOnLedge_Frame5, SamusOam_Top_Left_HangingOnLedge_Frame1, SamusOam_Empty, SamusOam_Empty
dw SamusOam_Left_ReadyToJump_HangingOnLedge_Frame0

HangingOnLedgeLeftOamTableBottom:
dw SamusOam_Bottom_Left_HangingOnLedge_Frame0, SamusOam_Bottom_Left_HangingOnLedge_Frame1, SamusOam_Bottom_Left_HangingOnLedge_Frame2
dw SamusOam_Bottom_Left_HangingOnLedge_Frame3, SamusOam_Bottom_Left_HangingOnLedge_Frame1, SamusOam_Bottom_Left_HangingOnLedge_Frame5, SamusOam_Bottom_Left_HangingOnLedge_Frame1, SamusOam_Empty, SamusOam_Empty
dw SamusOam_Empty

PullingUpFromHangingRightOamTableTop:
dw SamusOam_Top_Right_HangingOnLedge_Frame0, SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame1, SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame2

PullingUpFromHangingRightOamTableBottom:
dw SamusOam_Bottom_Right_HangingOnLedge_Frame0, SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame1, SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame2

PullingUpFromHangingLeftOamTableTop:
dw SamusOam_Top_Left_HangingOnLedge_Frame0, SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame1, SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame2

PullingUpFromHangingLeftOamTableBottom:
dw SamusOam_Bottom_Left_HangingOnLedge_Frame0, SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame1, SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame2

PullingForwardFromHangingRightOamTableTop:
dw SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame0, SamusOam_Right_PullingYourselfForwardFromHanging_Frame1, SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame2, SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame3

PullingForwardFromHangingLeftOamTableTop:
dw SamusOam_Left_PullingYourselfForwardFromHanging_Frame0, SamusOam_Left_PullingYourselfForwardFromHanging_Frame1, SamusOam_Left_PullingYourselfForwardFromHanging_Frame2, SamusOam_Left_PullingYourselfForwardFromHanging_Frame3

PullingIntoTunnelRightOamTableTop:
dw SamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0

PullingIntoTunnelLeftOamTableTop:
dw SamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0

SamusOam_Top_Right_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1FC, $D9+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $DF+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1FB, $D8+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame2:
dw $0002
%spritemapEntry(1, $1FA, $D9+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1FB, $D8+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E0+$17, 0, 1, 2, 4, $02)

SamusOam_Bottom_Right_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1F6, $ED+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $FD+$17, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F8, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $EF+$17, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_HangingOnLedge_Frame2:
dw $0003
%spritemapEntry(1, $1F8, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $EF+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F8, $EF+$17, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_HangingOnLedge_Frame3:
dw $0003
%spritemapEntry(0, $002, $EF+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1FA, $EF+$17, 0, 1, 2, 4, $0B)
%spritemapEntry(1, $1FA, $F7+$17, 0, 1, 2, 4, $08)

SamusOam_Bottom_Right_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F7, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $EF+$17, 0, 1, 2, 4, $0A)


SamusOam_Top_Left_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1F6+1, $D9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9+1, $DF+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F6+1, $D9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame2:
dw $0002
%spritemapEntry(1, $1F6+1, $DA+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F6+1, $DA+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E0+$17, 0, 0, 2, 4, $02)

SamusOam_Bottom_Left_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1FA+1, $ED+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $FD+$17, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F8+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8+1, $EF+$17, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_HangingOnLedge_Frame2:
dw $0003
%spritemapEntry(1, $1F8+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8+1, $EF+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $000+1, $EF+$17, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_HangingOnLedge_Frame3:
dw $0003
%spritemapEntry(0, $1F6+1, $EF+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FE+1, $EF+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(1, $1F6+1, $F7+$17, 0, 0, 2, 4, $08)

SamusOam_Bottom_Left_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F9+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $EF+$17, 0, 0, 2, 4, $0A)


SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame1:
dw $0002
%spritemapEntry(1, $1FA, $E0+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame2:
dw $0002
%spritemapEntry(1, $1FA, $E2+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $DF+$17, 0, 1, 2, 4, $02)

SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame1:
dw $0003
%spritemapEntry(1, $1F9, $EB+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $201, $FB+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F9, $FB+$17, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame2:
dw $0003
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0B)


SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame1:
dw $0002
%spritemapEntry(1, $1F6+1, $E2+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame2:
dw $0002
%spritemapEntry(1, $1F6+1, $E0+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $DF+$17, 0, 0, 2, 4, $02)

SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame1:
dw $0003
%spritemapEntry(1, $1F7+1, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F7+1, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FF+1, $FB+$17, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame2:
dw $0003
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201+1, $F8+$17, 0, 0, 2, 4, $0B)


SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame0:
dw $0006
%spritemapEntry(0, $1FF, $E4+$17, 0, 0, 2, 4, $04)
%spritemapEntry(0, $1FF, $EC+$17, 0, 0, 2, 4, $14)
%spritemapEntry(1, $1FA, $E1+$17, 0, 1, 2, 4, $00)
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0B)

SamusOam_Right_PullingYourselfForwardFromHanging_Frame1:
dw $0005
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $E9+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $000, $F1+$17, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F9, $E4+$17, 0, 1, 2, 4, $00)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0A)

SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame2:
dw $0005
%spritemapEntry(1, $001, $E9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FB, $E3+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F5, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F5, $F8+$17, 0, 1, 2, 4, $0B)

SamusOam_Top_Right_PullingYourselfForwardFromHanging_Frame3:
dw $0005
%spritemapEntry(1, $001, $E8+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9, $E0+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F5, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F5, $F8+$17, 0, 1, 2, 4, $0B)


SamusOam_Left_PullingYourselfForwardFromHanging_Frame0:
dw $0008
%spritemapEntry(0, $1F9+1, $E5+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F9+1, $ED+$17, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F6+1, $E1+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201+1, $F8+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $1F7+1, $E7+$17, 0, 1, 2, 4, $03)
%spritemapEntry(0, $1F7+1, $EF+$17, 0, 1, 2, 4, $13)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame1:
dw $0005
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(1, $1F7+1, $E4+$17, 0, 0, 2, 4, $00)
%spritemapEntry(0, $001+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F8+1, $E9+$17, 0, 1, 2, 4, $02)
%spritemapEntry(0, $1F8+1, $F1+$17, 0, 1, 2, 4, $12)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame2:
dw $0006
%spritemapEntry(1, $1F5+1, $E4+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FB+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $203+1, $F8+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $1ED+1, $F4+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F5+1, $F4+$17, 0, 0, 2, 4, $03)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame3:
dw $0005
%spritemapEntry(1, $1F7+1, $E0+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1EF+1, $E8+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FB+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $203+1, $F8+$17, 0, 0, 2, 4, $0B)


SamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0:
dw $0008
%spritemapEntry(0, $1FE, $EC+$17, 0, 0, 2, 4, $13)
%spritemapEntry(0, $1FE, $F4+$17, 0, 0, 2, 4, $14)
%spritemapEntry(0, $204, $E3+$17, 0, 1, 2, 4, $03)
%spritemapEntry(0, $1FC, $E3+$17, 0, 1, 2, 4, $04)
%spritemapEntry(1, $1FC, $EB+$17, 0, 1, 2, 4, $00)
%spritemapEntry(0, $1F4, $EA+$17, 0, 1, 2, 4, $02)
%spritemapEntry(0, $1F4, $F2+$17, 0, 1, 2, 4, $12)
%spritemapEntry(0, $1F4, $FA+$17, 0, 1, 2, 4, $06)

SamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0:
dw $0007
%spritemapEntry(0, $1F9+1, $F2+$17, 0, 0, 2, 4, $05)
%spritemapEntry(0, $1F4+1, $E3+$17, 0, 0, 2, 4, $03)
%spritemapEntry(0, $1FC+1, $E3+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F4+1, $EB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(0, $004+1, $EA+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $004+1, $F2+$17, 0, 0, 2, 4, $12)
%spritemapEntry(0, $004+1, $FA+$17, 0, 0, 2, 4, $06)


SamusOam_Right_ReadyToJump_HangingOnLedge_Frame0:
dw $0005
%spritemapEntry(1, $1F2, $DB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FA, $DB+$17, 0, 0, 2, 4, $01)
%spritemapEntry(1, $1F9, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201, $FB+$17, 0, 0, 2, 4, $0B)

SamusOam_Left_ReadyToJump_HangingOnLedge_Frame0:
dw $0005
%spritemapEntry(1, $1F6+1, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F6+1, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FE+1, $FB+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(1, $1F6+1, $DB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FE+1, $DB+$17, 0, 0, 2, 4, $01)


SamusAnimationDefinition_HangingOnLedgeRight:
db $17,$14,$0A,$19, $17,$15,$0A,$1A, $17,$16,$0A,$1B
db $17,$17,$0A,$1C, $17,$15,$0A,$1A, $17,$18,$0A,$1D, $17,$15,$0A,$1A, $00,$00,$FF,$FF, $00,$00,$FF,$FF
db $17,$2D,$0A,$2E

SamusAnimationDefinition_HangingOnLedgeLeft:
db $17,$14,$0A,$19, $17,$15,$0A,$1A, $17,$16,$0A,$1B
db $17,$17,$0A,$1C, $17,$15,$0A,$1A, $17,$18,$0A,$1D, $17,$15,$0A,$1A, $00,$00,$FF,$FF, $00,$00,$FF,$FF
db $17,$2F,$0A,$30

SamusAnimationDefinition_PullingUpFromHanging:
db $17,$14,$0A,$19, $17,$1E,$0A,$20, $17,$1F,$0A,$21

SamusAnimationDefinition_PullingForwardFromHangingRight:
db $17,$22,$0A,$28, $17,$23,$0A,$29, $17,$24,$0A,$2A, $17,$25,$0A,$2B

SamusAnimationDefinition_PullingForwardFromHangingLeft:
db $17,$22,$0A,$28, $17,$23,$0A,$29, $17,$26,$0A,$2A, $17,$27,$0A,$2B

SamusAnimationDefinition_PullingIntoTunnel:
db $17,$2C,$FF,$FF

;;; GFX
org $92D246 ; set $17 for top, $0A for bottom
dl SamusGfx_Top_Left_Skidding_Frame0 : dw 6*$20, 6*$20 ; 1
dl SamusGfx_Top_Left_ArmedSkidding_Frame0 : dw 6*$20, 6*$20 ; 2
dl SamusGfx_Top_Right_Skidding_Frame0 : dw 6*$20, 6*$20 ; 3
dl SamusGfx_Top_Right_Armed_Skidding_Frame0 : dw 6*$20, 6*$20 ; 4
dl SamusGfx_Bottom_Skidding_Frame0 : dw 5*$20, 3*$20 ; 5

dl SamusGfx_Top_Left_UsingAnElevator_Frame0 : dw 4*$20, 2*$20 ; 6
dl SamusGfx_Bottom_UsingAnElevator_Frame0 : dw 2*$20, 2*$20 ; 7
dl SamusGfx_Top_UsingAnElevator_Frame2 : dw 6*$20, 3*$20 ; 8
dl SamusGfx_Bottom_UsingAnElevator_Frame2 : dw 3*$20, 3*$20 ; 9
dl SamusGfx_Top_Right_UsingAnElevator_Frame0 : dw 5*$20, 3*$20 ; A

dl SamusGfx_Top_Right_Shooting_Frame0 : dw 5*$20, 4*$20 ; B
dl SamusGfx_Top_Left_Shooting_Frame0 : dw 5*$20, 5*$20 ; C
dl SamusGfx_Top_Right_DiagonalUp_Shooting_Frame0 : dw 4*$20, 5*$20 ; D
dl SamusGfx_Top_Left_DiagonalUp_Shooting_Frame0 : dw 5*$20, 5*$20 ; E
dl SamusGfx_Top_Right_DiagonalDown_Shooting_Frame0 : dw 5*$20, 4*$20 ; F
dl SamusGfx_Top_Left_DiagonalDown_Shooting_Frame0 : dw 6*$20, 4*$20 ; 10
dl SamusGfx_Bottom_DiagonalDown_Standing_Frame0 : dw 5*$20, 3*$20 ; 11
dl SamusGfx_Bottom_DiagonalDown_Standing_Frame1 : dw 5*$20, 3*$20 ; 12
dl SamusGfx_Bottom_DiagonalDown_Standing_Frame2 : dw 5*$20, 3*$20 ; 13

dl SamusGfx_Top_HangingOnLedge_Frame0 : dw 6*$20, 6*$20 ; 14
dl SamusGfx_Top_HangingOnLedge_Frame1 : dw 6*$20, 6*$20 ; 15
dl SamusGfx_Top_HangingOnLedge_Frame2 : dw 6*$20, 6*$20 ; 16
dl SamusGfx_Top_HangingOnLedge_Frame3 : dw 6*$20, 6*$20 ; 17
dl SamusGfx_Top_HangingOnLedge_Frame5 : dw 6*$20, 6*$20 ; 18
dl SamusGfx_Bottom_HangingOnLedge_Frame0 : dw 3*$20, 2*$20 ; 19
dl SamusGfx_Bottom_HangingOnLedge_Frame1 : dw 3*$20, 2*$20 ; 1A
dl SamusGfx_Bottom_HangingOnLedge_Frame2 : dw 4*$20, 2*$20 ; 1B
dl SamusGfx_Bottom_HangingOnLedge_Frame3 : dw 4*$20, 2*$20 ; 1C
dl SamusGfx_Bottom_HangingOnLedge_Frame5 : dw 3*$20, 2*$20 ; 1D

dl SamusGfx_Top_PullingYourselfUpFromHanging_Frame1 : dw 6*$20, 6*$20 ; 1E
dl SamusGfx_Top_PullingYourselfUpFromHanging_Frame2 : dw 6*$20, 6*$20 ; 1F
dl SamusGfx_Bottom_PullingYourselfUpFromHanging_Frame1 : dw 4*$20, 2*$20 ; 20
dl SamusGfx_Bottom_PullingYourselfUpFromHanging_Frame2 : dw 4*$20, 2*$20 ; 21

dl SamusGfx_Top_PullingYourselfForwardFromHanging_Frame0 : dw 5*$20, 5*$20 ; 22
dl SamusGfx_Top_PullingYourselfForwardFromHanging_Frame1 : dw 3*$20, 3*$20 ; 23
dl SamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 4*$20 ; 24
dl SamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 4*$20 ; 25
dl SamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 2*$20 ; 26
dl SamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 4*$20 ; 27
dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame0 : dw 4*$20, 2*$20 ; 28
dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame1 : dw 3*$20, 2*$20 ; 29
dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 2*$20 ; 2A
dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 2*$20 ; 2B

dl SamusGfx_Top_PullingYourselfIntoMorphBallTunnel_Frame0 : dw 7*$20, 5*$20 ; 2C

dl SamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0 : dw 3*$20, 3*$20 ; 2D
dl SamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0 : dw 4*$20, 2*$20 ; 2E
dl SamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0 : dw 3*$20, 3*$20 ; 2F
dl SamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0 : dw 4*$20, 2*$20 ; 30

skip align 2 offset 1 ; align so oam table addresses are odd

StandingRightOamTableTop:
dw $9830, $9830, $9830, $9830, SamusOam_Top_Right_Shooting_Frame0, $9830
StandingRightOamTableBottom:
dw $9846, $9846, $9846, $9846, $9846, $9846
StandingLeftOamTableTop:
dw $9857, $9857, $9857, $9857, SamusOam_Top_Left_Shooting_Frame0, $9857
StandingLeftOamTableBottom:
dw $986D, $986D, $986D, $986D, $986D, $986D

StandingRightDiagonalUpOamTableTop:
dw $98B8, $98B8, $98B8, $98B8, SamusOam_Top_Right_DiagonalUp_Shooting_Frame0, $98B8
StandingRightDiagonalUpOamTableBottom:
dw $988A, $988A, $988A, $988A, $988A, $988A
StandingLeftDiagonalUpOamTableTop:
dw $98C4, $98C4, $98C4, $98C4, SamusOam_Top_Left_DiagonalUp_Shooting_Frame0, $98C4
StandingLeftDiagonalUpOamTableBottom:
dw $98A7, $98A7, $98A7, $98A7, $98A7, $98A7

StandingRightDiagonalDownOamTableTop:
dw $98D0, $98D0, $98D0, $98D0, SamusOam_Top_Right_DiagonalDown_Shooting_Frame0, $98D0
StandingRightDiagonalDownOamTableBottom:
dw SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0, SamusOam_Bottom_Right_DiagonalDown_Standing_Frame1, SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0, SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0, $9846, SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0
StandingLeftDiagonalDownOamTableTop:
dw $98DC, $98DC, $98DC, $98DC, SamusOam_Top_Left_DiagonalDown_Shooting_Frame0, $98DC
StandingLeftDiagonalDownOamTableBottom:
dw SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0, SamusOam_Bottom_Left_DiagonalDown_Standing_Frame1, SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0, SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0, $986D, SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0

SamusOam_Top_Right_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $E3+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FB, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1FF, $D7+$16, 0, 1, 2, 4, $04)

SamusOam_Top_Left_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F4+1, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F4+1, $D7+$16, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1FC+1, $D7+$16, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1EE+1, $E3+$16, 0, 0, 2, 4, $03)

SamusOam_Top_Right_DiagonalUp_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $D9+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FA, $DA+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $00A, $E2+$16, 0, 0, 2, 4, $14)

SamusOam_Top_Left_DiagonalUp_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F6+1, $DA+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1EE+1, $DA+$16, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1EE+1, $E2+$16, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1ED+1, $D9+$16, 0, 0, 2, 4, $03)

SamusOam_Top_Right_DiagonalDown_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $E5+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F9, $DC+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $001, $EC+$16, 0, 0, 2, 4, $04)

SamusOam_Top_Left_DiagonalDown_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F7+1, $DB+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1EF+1, $EB+$16, 0, 0, 2, 4, $04)
%spritemapEntry(0, $1F7+1, $EB+$16, 0, 0, 2, 4, $05)
%spritemapEntry(1, $1EE+1, $E4+$16, 0, 0, 2, 4, $02)

SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0:
dw 5
%spritemapEntry(1, $1F6, $E8+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FE, $F8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F6, $F8+$16, 0, 1, 2, 4, $0C)
%spritemapEntry(0, $006, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $006, $F8+$16, 0, 1, 2, 4, $1A)

SamusOam_Bottom_Right_DiagonalDown_Standing_Frame1:
dw 5
%spritemapEntry(1, $1F6, $F0+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $006, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $006, $F8+$16, 0, 1, 2, 4, $1A)
%spritemapEntry(0, $1FE, $E8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F6, $E8+$16, 0, 1, 2, 4, $0C)

SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0:
dw 5
%spritemapEntry(1, $1FA+1, $E8+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FA+1, $F8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $002+1, $F8+$16, 0, 0, 2, 4, $0C)
%spritemapEntry(0, $1F2+1, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F2+1, $F8+$16, 0, 0, 2, 4, $1A)

SamusOam_Bottom_Left_DiagonalDown_Standing_Frame1:
dw 5
%spritemapEntry(1, $1FA+1, $F0+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F2+1, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F2+1, $F8+$16, 0, 0, 2, 4, $1A)
%spritemapEntry(0, $1FA+1, $E8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $002+1, $E8+$16, 0, 0, 2, 4, $0C)

SamusAnimationDefinition_StandingRight:
db $01,$00,$01,$00, $01,$01,$01,$01, $01,$02,$01,$02, $00,$00,$00,$00
db $17,$0B,$01,$02, $01,$00,$01,$00

SamusAnimationDefinition_StandingLeft:
db $01,$00,$01,$00, $01,$01,$01,$01, $01,$02,$01,$02, $00,$00,$00,$00
db $17,$0C,$01,$02, $01,$00,$01,$00

SamusAnimationDefinition_StandingRightDiagonalUp:
db $01,$04,$01,$05, $01,$06,$01,$03, $01,$05,$01,$04, $00,$00,$00,$00
db $17,$0D,$01,$04, $01,$04,$01,$05

SamusAnimationDefinition_StandingLeftDiagonalUp:
db $01,$06,$01,$05, $01,$04,$01,$03, $01,$05,$01,$04, $00,$00,$00,$00
db $17,$0E,$01,$04, $01,$06,$01,$05

SamusAnimationDefinition_StandingRightDiagonalDown:
db $01,$09,$0A,$11, $01,$0A,$0A,$12, $01,$08,$0A,$13, $00,$00,$00,$00
db $17,$0F,$01,$02, $01,$09,$0A,$11

SamusAnimationDefinition_StandingLeftDiagonalDown:
db $01,$08,$0A,$11, $01,$09,$0A,$12, $01,$0A,$0A,$13, $00,$00,$00,$00
db $17,$10,$01,$02, $01,$08,$0A,$11

assert pc() <= $92D7D0

org 2*$5B+$92D94E
dw SamusAnimationDefinition_SkiddingRight, SamusAnimationDefinition_SkiddingLeft
dw SamusAnimationDefinition_UsingAnElevatorRight, SamusAnimationDefinition_UsingAnElevatorLeft
dw SamusAnimationDefinition_HangingOnLedgeRight, SamusAnimationDefinition_HangingOnLedgeLeft
dw SamusAnimationDefinition_PullingUpFromHanging, SamusAnimationDefinition_PullingUpFromHanging
dw SamusAnimationDefinition_PullingForwardFromHangingRight, SamusAnimationDefinition_PullingForwardFromHangingLeft
dw SamusAnimationDefinition_PullingIntoTunnel, SamusAnimationDefinition_PullingIntoTunnel

; shooting frames
org 2*1+$929263
dw (StandingRightOamTableTop-$808D)/2 ; was $2C0
dw (StandingLeftOamTableTop-$808D)/2 ; was $2CA

org 2*1+$92945D
dw (StandingRightOamTableBottom-$808D)/2 ; was $2C5
dw (StandingLeftOamTableBottom-$808D)/2 ; was $2CF

org 2*5+$929263
dw (StandingRightDiagonalUpOamTableTop-$808D)/2 ; was $2E0
dw (StandingLeftDiagonalUpOamTableTop-$808D)/2 ; was $2E6
dw (StandingRightDiagonalDownOamTableTop-$808D)/2 ; was $2EC
dw (StandingLeftDiagonalDownOamTableTop-$808D)/2 ; was $2F2

org 2*5+$92945D
dw (StandingRightDiagonalUpOamTableBottom-$808D)/2 ; was $2E3
dw (StandingLeftDiagonalUpOamTableBottom-$808D)/2 ; was $2E9
dw (StandingRightDiagonalDownOamTableBottom-$808D)/2 ; was $2EF
dw (StandingLeftDiagonalDownOamTableBottom-$808D)/2 ; was $2F5

org 2*1+$92D94E
dw SamusAnimationDefinition_StandingRight, SamusAnimationDefinition_StandingLeft

org 2*5+$92D94E
dw SamusAnimationDefinition_StandingRightDiagonalUp, SamusAnimationDefinition_StandingLeftDiagonalUp
dw SamusAnimationDefinition_StandingRightDiagonalDown, SamusAnimationDefinition_StandingLeftDiagonalDown

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
