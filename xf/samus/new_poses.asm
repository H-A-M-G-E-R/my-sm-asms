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
org 8*$5C+$91B629 : db $04,$01,$02,$07,$07,$00,$10,$00 ; Facing left - skidding
org 8*$5D+$91B629 : db $08,$00,$FF,$FF,$07,$00,$14,$00 ; Facing right - using an elevator
org 8*$5E+$91B629 : db $04,$00,$FF,$FF,$07,$00,$14,$00 ; Facing left - using an elevator

;;; Animation delays
org 2*$83+$91B010 ; change walljump animation delay tables to transition to spinjump pose as soon as the walljump animation ends, and also free up space for my new poses
dw WalljumpRightAnimationDelayTable, WalljumpLeftAnimationDelayTable

org 2*$5B+$91B010
dw SkiddingAnimationDelayTable, SkiddingAnimationDelayTable
dw UsingAnElevatorDelayTable, UsingAnElevatorDelayTable

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

StandingAnimationDelayTable:
db $12, $12, $12, $FF
db $04, $04, $FF ; shooting

%padSafe($91B39D)

;;; OAM
org 2*$5B+$929263
dw (SkiddingRightOamTableTop-$808D)/2, (SkiddingLeftOamTableTop-$808D)/2
dw (UsingAnElevatorRightOamTableTop-$808D)/2, (UsingAnElevatorLeftOamTableTop-$808D)/2

org 2*$5B+$92945D
dw (SkiddingRightOamTableBottom-$808D)/2, (SkiddingRightOamTableBottom-$808D)/2
dw (UsingAnElevatorOamTableBottom-$808D)/2, (UsingAnElevatorOamTableBottom-$808D)/2

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
