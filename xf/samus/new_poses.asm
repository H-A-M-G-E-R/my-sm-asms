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
    dw <Size><<15|<XOffset>
    db <YOffset>
    dw <YFlip><<15|<XFlip><<14|<Priority><<12|<Palette><<9|<Tile>
endmacro

; Unused pose usage:
; $5B and $5C are for skidding
; $5D and $5E are for using an elevator

;;; Transition table

; same as running
org 2*$5B+$919EE2
dw read2(2*$09+$919EE2), read2(2*$0A+$919EE2)

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

padbyte $FF : pad $91B39D

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

org 2*$5B+$92D94E
dw SamusAnimationDefinition_SkiddingRight, SamusAnimationDefinition_SkiddingLeft
dw SamusAnimationDefinition_UsingAnElevatorRight, SamusAnimationDefinition_UsingAnElevatorLeft

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
