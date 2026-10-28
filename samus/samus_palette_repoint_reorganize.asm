; Samus Palette Repoint & Reorganize, by H A M
; Repoints and reorganizes Samus palettes to another bank,
; makes every Samus palette suit-specific,
; and makes it easier to add a new suit:
; previously there are many suit type palette checks you'll have to hijack
; and now there's only one.
; Uses no freespace outside of the repointed palettes.

; Included is an example "extra" suit.
; The "extra" suit's palettes are duplicates of gravity's,
; but you can edit it.

asar 1.91
lorom

!BuffSuitEquipment = $0021 ; varia or gravity
!freespace = $E08000 ; freespace to repoint samus palettes

;;; Replace gravity suit palette checks with equipment checks ;;;

org $908096 : LDA $09A2 : BIT #$0020 ; Animate Samus - FX = none
org $90A439 : LDA $09A2 : BIT #$0020 ; Samus movement - spin jumping
org $91D9B2 : LDA $09A2 : BIT #$0020 ; Handle screw attacking / speed boosting palette
org $91C4BE : LDA $09A2 : BIT #$0020 ; Grapple beam handler

;;; Buff suit checks ;;;

org $90F1F5 : JSL SetFacingForwardPose : BRA $00 ; in Samus command 8: set up Samus for Ceres start

org $90F23C
SamusCommand9_SetUpSamusForZebesStart:
{
    LDY #$E1F4 : JSL $8DC4E9 ; reduced to one loading palette FX object
    JSL SetFacingForwardPose
    ; below is vanilla code (with a 2-byte space optimization)
    JSL $91DEBA ; Load Samus suit palette
    JSL $91F433 ; Initialise Samus pose
    LDA #$0003 : STA $0A94 ; Samus animation frame timer = 3
    DEC : STA $0A96 ; Samus animation frame = 2 (Samus appears)
    STZ $0DEC ; Samus appears fanfare timer = 0
    SEC : RTS
}
SetFacingForwardPose:
{
    LDA $09A2 : BIT.w #!BuffSuitEquipment : BNE .buff
    STZ $0A1C : RTL

.buff
    LDA #$009B : STA $0A1C : RTL
}
SetUpSamusForZebesLanding:
{
    INC $0998 ; Game state = 7 (main gameplay fading in)
    JSL SetFacingForwardPose
    JSL $91F433 ; Initialise Samus pose
    JSL $91FB08 ; Set Samus animation frame if pose changed
    PHP : JML $8280DC
}
assert pc() <= $90F28D

org $8280D6 : JML SetUpSamusForZebesLanding

org $91D551 : JSL SetFacingForwardPose : BRA + : org $91D567 : + ; in Varia suit pick up
org $91D629 : JSL SetFacingForwardPose : BRA + : org $91D63F : + ; in Gravity suit pick up

org $91E733 ; Update Samus pose due to change of equipment - standing
{
    LDX $0A1C
    JSL SetFacingForwardPose
    CPX $0A1C : BEQ +
    ; pose is different
    ; below is vanilla code (with a JSR : RTS -> JMP optimization)
    JSL $91F433 ; Initialise Samus pose
    JSL $91FB08 ; Set Samus animation frame if pose changed
    JMP $E719 ; Go to update Samus old pose

+
    RTS
}

;;; Palette routines ;;;

org $91DD5B ; Samus palette = 20h bytes from $9B:[$9B:[X] + [Samus suit palette index]]
SetSamusPal:
{
    ; was $9B:[X]
    PHB : PHP : REP #$30
    PHX : PHY
    TXA : CLC : ADC $0A74 : TAX : LDA.l !freespace&$FF0000,x : TAX
    LDY #$C180
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    PLY : PLX
    PLP : PLB : RTS
}

DetermineSuitPalIndexAndSetSamusPal_Long:
{
    JSL DetermineSuitPalIndex_Long
    ; fallthrough
}
SetSamusPal_Long:
{
    JSR SetSamusPal : RTL
}

;;; SUIT TYPE PALETTE LOGIC HERE ;;;
DetermineSuitPalIndex_Long:
{
    LDA $09A2 : BIT #$0010 : BNE .extra
    LDA $09A2 : BIT #$0020 : BNE .gravity
    LSR : BCS .varia
    STZ $0A74 : RTL

.varia
    LDA #$0002 : STA $0A74 : RTL

.gravity
    LDA #$0004 : STA $0A74 : RTL

.extra
    LDA #$0006 : STA $0A74 : RTL
}

; same for target
SetSamusTargetPal:
{
    PHB : PHP : REP #$30
    PHX : PHY
    TXA : CLC : ADC $0A74 : TAX : LDA.l !freespace&$FF0000,x : TAX
    LDY #$C380
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    PLY : PLX
    PLP : PLB : RTS
}

LoadSamusVisorColor:
{
    PHX ; X needs to be preserved for the $91D86F hijack
    LDX $0A74 : LDA.l SamusPalPointers_Visor,x
    CLC : ADC $01,s : TAX
    LDA.l !freespace&$FF0000,x
    PLX : RTL
}
assert pc() <= $91DE53

; replace Determine Samus suit palette index with the new function
org $90ECB6 : JSL DetermineSuitPalIndex_Long : RTS

; in Handle Samus palette
org $91D717
LDX.w #SamusPalPointers_Normal : JSR $DD5B
BRA + : org $91D721 : +

; in Handle beam charge palettes
org $91D75A
LDA $0A6E : CMP #$0004 : BNE +
LDA.w #SamusPalPointers_PseudoScrewAttack
BRA ++

org $91D76F
+
LDA.w #SamusPalPointers_Charging
++
STA $24

org $91D7D5
SamusPalPointers_Charging:
{
    dw SamusPalPointers_Charging0
    dw SamusPalPointers_Charging1
    dw SamusPalPointers_Charging2
    dw SamusPalPointers_Charging3
    dw SamusPalPointers_Charging2
    dw SamusPalPointers_Charging1
}
SamusPalPointers_PseudoScrewAttack:
{
    dw SamusPalPointers_Shinespark3
    dw SamusPalPointers_Shinespark3
    dw SamusPalPointers_Shinespark3
    dw SamusPalPointers_Normal
    dw SamusPalPointers_Normal
    dw SamusPalPointers_Normal
}

org $91D829+2
SamusPalPointers_HyperBeam:
{
    dw SamusPalPointers_HyperBeam9
    dw SamusPalPointers_HyperBeam8
    dw SamusPalPointers_HyperBeam7
    dw SamusPalPointers_HyperBeam6
    dw SamusPalPointers_HyperBeam5
    dw SamusPalPointers_HyperBeam4
    dw SamusPalPointers_HyperBeam3
    dw SamusPalPointers_HyperBeam2
    dw SamusPalPointers_HyperBeam1
    dw SamusPalPointers_HyperBeam0
}

; in Handle visor palette
org $91D86F : JSL LoadSamusVisorColor

; in Handle misc. Samus palette
org $91D8E3 : LDX.w #SamusPalPointers_Hurt
org $91D8F0 : LDX.w #SamusPalPointers_IntroGreyscale
org $91D95B : LDX.w #SamusPalPointers_SpeedBoosting3 : BRA $02 ; metroid drain

org $91D99E
SamusPalPointers_AcquiringHyperBeam:
{
    dw SamusPalPointers_HyperBeam9
    dw SamusPalPointers_HyperBeam8
    dw SamusPalPointers_HyperBeam7
    dw SamusPalPointers_HyperBeam6
    dw SamusPalPointers_HyperBeam5
    dw SamusPalPointers_HyperBeam4
    dw SamusPalPointers_HyperBeam3
    dw SamusPalPointers_HyperBeam2
    dw SamusPalPointers_HyperBeam1
    dw SamusPalPointers_HyperBeam0
}

; in Handle screw attacking / speed boosting palette
org $91DA1B : LDA.w #SamusPalPointers_ScrewAttack : BRA $01

org $91DA4A
SamusPalPointers_ScrewAttack:
{
    dw SamusPalPointers_ScrewAttack0
    dw SamusPalPointers_ScrewAttack1
    dw SamusPalPointers_ScrewAttack2
    dw SamusPalPointers_ScrewAttack3
    dw SamusPalPointers_ScrewAttack2
    dw SamusPalPointers_ScrewAttack1
}

org $91DA81 : LDA.w #SamusPalPointers_SpeedBoosting : BRA $01

org $91DAA9
SamusPalPointers_SpeedBoosting:
{
    dw SamusPalPointers_SpeedBoosting0
    dw SamusPalPointers_SpeedBoosting1
    dw SamusPalPointers_SpeedBoosting2
    dw SamusPalPointers_SpeedBoosting3
}

; in Handle speed booster shine palette
org $91DAE0 : LDA.w #SamusPalPointers_SpeedBoosterShine : BRA $01

org $91DB10
SamusPalPointers_SpeedBoosterShine:
{
    dw SamusPalPointers_SpeedBoosterShine0
    dw SamusPalPointers_SpeedBoosterShine1
    dw SamusPalPointers_SpeedBoosterShine2
    dw SamusPalPointers_SpeedBoosterShine3
    dw SamusPalPointers_SpeedBoosterShine2
    dw SamusPalPointers_SpeedBoosterShine1
}

; in Handle shinesparking palette
org $91DB45 : LDA.w #SamusPalPointers_Shinespark : BRA $01

org $91DB75
SamusPalPointers_Shinespark:
{
    dw SamusPalPointers_Shinespark0
    dw SamusPalPointers_Shinespark1
    dw SamusPalPointers_Shinespark2
    dw SamusPalPointers_Shinespark3
}

; in Handle crystal flash palette
org $91DC00
SamusPalPointers_CrystalFlashBody:
{
    ; [palette pointer], [timer]
    dw SamusPalPointers_CrystalFlashBody0,10
    dw SamusPalPointers_CrystalFlashBody1,10
    dw SamusPalPointers_CrystalFlashBody2,10
    dw SamusPalPointers_CrystalFlashBody3,10
    dw SamusPalPointers_CrystalFlashBody4,10
    dw SamusPalPointers_CrystalFlashBody5,10
    dw SamusPalPointers_CrystalFlashBody4,10
    dw SamusPalPointers_CrystalFlashBody3,10
    dw SamusPalPointers_CrystalFlashBody2,10
    dw SamusPalPointers_CrystalFlashBody1,10
}

SamusPalPointers_CrystalFlashBubble:
{
    dw SamusPalPointers_CrystalFlashBubble0
    dw SamusPalPointers_CrystalFlashBubble1
    dw SamusPalPointers_CrystalFlashBubble2
    dw SamusPalPointers_CrystalFlashBubble3
    dw SamusPalPointers_CrystalFlashBubble4
    dw SamusPalPointers_CrystalFlashBubble5
}

org $91DC34 ; Set crystal flash Samus colours
{
    PHB
    TYA : CLC : ADC $0A74 : TAX : LDA.l !freespace&$FF0000,x : TAX
    LDY #$C1C0
    LDA #$0013
    db $54,$7E,!freespace>>16 ; MVN
    PLB : RTS
}

org $91DC82 ; Set crystal flash bubble colours
{
    PHB
    TYA : CLC : ADC $0A74 : TAX : LDA.l !freespace&$FF0000,x : TAX
    LDY #$C1D4
    LDA #$000B
    db $54,$7E,!freespace>>16 ; MVN
    PLB : RTS
}

; in Handle x-ray palette
org $91DCD3 : JSL LoadSamusVisorColor
org $91DD09 : JSL LoadSamusVisorColor

; in Cancel speed boosting
org $91DE6A
JSL DetermineSuitPalIndex_Long
LDX.w #SamusPalPointers_Normal : JSR $DD5B
BRA + : org $91DE8D : +

; in Load Samus suit palette
org $91DEC0
JSL DetermineSuitPalIndex_Long
LDX.w #SamusPalPointers_Normal : JSR $DD5B
BRA + : org $91DEE3 : +

; in Load Samus suit target palette
org $91DEEC
JSL DetermineSuitPalIndex_Long
LDX.w #SamusPalPointers_Normal : JSR SetSamusTargetPal
BRA + : org $91DF0F : +

;;; Samus in heat palette fx object ;;;

org $8DF761
dw $C685 ; setup = RTS
dw SamusInHeatPalFXIList

org $8DE3BE ; sync palette with environmental heat glow
LDA.w SamusInHeatPalFXIListPointers,y : STA $1EBD,x : RTS

org $8DE3E0
SamusInHeatPalFXIListPointers:
{
    dw SamusInHeatPalFXIList_0
    dw SamusInHeatPalFXIList_1
    dw SamusInHeatPalFXIList_2
    dw SamusInHeatPalFXIList_3
    dw SamusInHeatPalFXIList_4
    dw SamusInHeatPalFXIList_5
    dw SamusInHeatPalFXIList_6
    dw SamusInHeatPalFXIList_7
    dw SamusInHeatPalFXIList_8
    dw SamusInHeatPalFXIList_9
    dw SamusInHeatPalFXIList_10
    dw SamusInHeatPalFXIList_11
    dw SamusInHeatPalFXIList_12
    dw SamusInHeatPalFXIList_13
    dw SamusInHeatPalFXIList_14
    dw SamusInHeatPalFXIList_15
}

SamusInHeatPalFXIList:
{
    dw $C5D4,$E379 ; Pre-instruction = $E379 (heat damage)
    SamusInHeatPalFXIList_0: dw PalFXInstr_TransferSamusPalAndWait,16,SamusPalPointers_Heat0
    SamusInHeatPalFXIList_1: dw PalFXInstr_TransferSamusPalAndWait,4,SamusPalPointers_Heat1
    SamusInHeatPalFXIList_2: dw PalFXInstr_TransferSamusPalAndWait,4,SamusPalPointers_Heat1
    SamusInHeatPalFXIList_3: dw PalFXInstr_TransferSamusPalAndWait,5,SamusPalPointers_Heat2
    SamusInHeatPalFXIList_4: dw PalFXInstr_TransferSamusPalAndWait,6,SamusPalPointers_Heat2
    SamusInHeatPalFXIList_5: dw PalFXInstr_TransferSamusPalAndWait,7,SamusPalPointers_Heat3
    SamusInHeatPalFXIList_6: dw PalFXInstr_TransferSamusPalAndWait,8,SamusPalPointers_Heat3
    SamusInHeatPalFXIList_7: dw PalFXInstr_TransferSamusPalAndWait,8,SamusPalPointers_Heat4
    SamusInHeatPalFXIList_8: dw PalFXInstr_TransferSamusPalAndWait,8,SamusPalPointers_Heat4
    SamusInHeatPalFXIList_9: dw PalFXInstr_TransferSamusPalAndWait,8,SamusPalPointers_Heat3
    SamusInHeatPalFXIList_10: dw PalFXInstr_TransferSamusPalAndWait,7,SamusPalPointers_Heat3
    SamusInHeatPalFXIList_11: dw PalFXInstr_TransferSamusPalAndWait,6,SamusPalPointers_Heat2
    SamusInHeatPalFXIList_12: dw PalFXInstr_TransferSamusPalAndWait,5,SamusPalPointers_Heat2
    SamusInHeatPalFXIList_13: dw PalFXInstr_TransferSamusPalAndWait,4,SamusPalPointers_Heat1
    SamusInHeatPalFXIList_14: dw PalFXInstr_TransferSamusPalAndWait,4,SamusPalPointers_Heat1
    SamusInHeatPalFXIList_15: dw PalFXInstr_TransferSamusPalAndWait,16,SamusPalPointers_Heat0
    dw $C61E,SamusInHeatPalFXIList_0   ; Go to SamusInHeatPalFXIList_0
}

PalFXInstr_TransferSamusPalAndWait:
{
    LDA $0000,y : STA $1ECD,x ; Palette FX object instruction timer = [[Y]]
    LDX $0002,y : JSL DetermineSuitPalIndexAndSetSamusPal_Long ; clobbers X, but $C589 will correct it
    PLA ; Terminate processing palette FX object
    JMP $C589 ; Go to $C589 (break out of instruction loop and Y += 4)
}
assert pc() <= $8DEAE2

;;; Loading palette fx object ;;;

org $8DDB62
SamusLoadingPalFXIList:
{
    dw $C648 : db 36 ; Timer = 24h
    -
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_Normal
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_SpeedBoosting3
        dw $C639,- ; Decrement timer and go to - if non-zero
    dw $C648 : db 3 ; Timer = 03h
    -
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_Normal
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_SpeedBoosting3
        dw $C639,- ; Decrement timer and go to - if non-zero
    dw $C648 : db 3 ; Timer = 03h
    -
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_Normal
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_SpeedBoosting2
        dw $C639,- ; Decrement timer and go to - if non-zero
    dw $C648 : db 2 ; Timer = 02h
    -
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_Normal
        dw PalFXInstr_TransferSamusPalAndWait,3,SamusPalPointers_SpeedBoosting1
        dw $C639,- ; Decrement timer and go to - if non-zero
    dw PalFXInstr_TransferSamusPalAndWait,1,SamusPalPointers_Normal
    dw $C5CF ; Delete
}
assert pc() <= $8DDF94

;;; Death ;;;

org $9BB4B6 ; Finish death animation flashing
{
    PHP : REP #$30
    PHB
    LDX $0A74 : LDA.l SamusPalPointers_DyingSuit0,x : TAX
    LDY #$C180
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    LDX $0A74 : LDA.l SamusPalPointers_DyingBody0,x : TAX
    LDY #$C1E0
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    PLB : JMP $B5AE
}

org $9BB5CE ; Write death animation sprite palettes
{
    PHB
    PHX
    LDA.w SamusPalPointers_DyingSuit,x : CLC : ADC $0A74 : TAX
    LDA.l !freespace&$FF0000,x : TAX
    LDY #$C180
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    PLX
    LDA.l SamusPalPointers_DyingBody,x : CLC : ADC $0A74 : TAX ; .l because MVN changed DB
    LDA.l !freespace&$FF0000,x : TAX
    LDY #$C1E0
    LDA #$001F
    db $54,$7E,!freespace>>16 ; MVN
    PLB : RTS
}

org $9BB7D3
SamusPalPointers_DyingSuit:
{
    dw SamusPalPointers_DyingSuit0
    dw SamusPalPointers_DyingSuitFlash
    dw SamusPalPointers_DyingSuit1
    dw SamusPalPointers_DyingSuit2
    dw SamusPalPointers_DyingSuit3
    dw SamusPalPointers_DyingSuit4
    dw SamusPalPointers_DyingSuit5
    dw SamusPalPointers_DyingSuit6
    dw SamusPalPointers_DyingSuit7
    dw SamusPalPointers_DyingAllWhite
}
SamusPalPointers_DyingBody:
{
    dw SamusPalPointers_DyingBody0
    dw SamusPalPointers_DyingBody0
    dw SamusPalPointers_DyingBody1
    dw SamusPalPointers_DyingBody2
    dw SamusPalPointers_DyingBody3
    dw SamusPalPointers_DyingBody4
    dw SamusPalPointers_DyingBody5
    dw SamusPalPointers_DyingBody6
    dw SamusPalPointers_DyingBody7
    dw SamusPalPointers_DyingAllWhite
}

;;; Palettes ;;;

org $E08000 ; freespace
SamusPal_Power_Normal: dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_Charging0: dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_Charging1: dw $0C63,$0D4A,$0FBD,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$0ED6,$0DAD,$0E73,$1D47,$0CD5,$0C6F
SamusPal_Power_Charging2: dw $1CE7,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Power_Charging3: dw $2D6B,$2E10,$2FBD,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$2F18,$2E52,$2ED6,$3A0E,$2DB8,$2D73
SamusPal_Power_DyingSuit0: dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_DyingSuit1: dw $0C63,$0D4A,$0FBD,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$0ED6,$0DAD,$0E73,$1D47,$0CD5,$0C6F
SamusPal_Power_DyingSuit2: dw $1CE7,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Power_DyingSuit3: dw $2D6B,$2E10,$2FBD,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$2F18,$2E52,$2ED6,$3A0E,$2DB8,$2D73
SamusPal_Power_DyingSuit4: dw $3DEF,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6
SamusPal_Power_DyingSuit5: dw $4E73,$4ED6,$4FDE,$5675,$63F3,$5B16,$6FBF,$6B7A,$6358,$4EBD,$4F7B,$4EF7,$4F5A,$52D4,$4E9A,$4E78
SamusPal_Power_DyingSuit6: dw $5EF7,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA
SamusPal_Power_DyingSuit7: dw $6F7B,$6F9C,$6FDE,$6F7B,$73FB,$739C,$77DF,$77BD,$73BC,$6F7E,$6FBD,$6F9C,$6FBD,$6F9B,$6F7D,$6F7C
SamusPal_Power_SpeedBoosting0: dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_SpeedBoosting1: dw $2003,$28CE,$37BD,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$36B5,$356B,$2A16,$3904,$2874,$280D
SamusPal_Power_SpeedBoosting2: dw $2003,$516E,$4BBD,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$4AB5,$496B,$52B6,$61A4,$5114,$50AD
SamusPal_Power_SpeedBoosting3: dw $0000,$52AE,$5FBD,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$5F55,$5E0B,$53F6,$62E4,$5254,$51ED
SamusPal_Power_SpeedBoosterShine0: dw $0000,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_SpeedBoosterShine1: dw $0000,$1DAD,$1FBD,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1EF7,$1E10,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Power_SpeedBoosterShine2: dw $0000,$3E73,$3FDE,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$3F5A,$3EB5,$3F18,$4671,$3E39,$3DF6
SamusPal_Power_SpeedBoosterShine3: dw $0000,$5F39,$5FDE,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$5F9C,$5F5A,$5F7B,$6338,$5F1C,$5EFA
SamusPal_Power_Shinespark0: dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_Shinespark1: dw $3800,$01AD,$03FF,$294F,$4FEA,$36F2,$6BFF,$5FFC,$4798,$017C,$0318,$0210,$02B5,$264E,$15BE,$1557
SamusPal_Power_Shinespark2: dw $3800,$0273,$17FF,$1615,$3BF0,$23B8,$57FF,$4BFF,$3BFE,$025D,$037B,$02B5,$0318,$1314,$027F,$021D
SamusPal_Power_Shinespark3: dw $3800,$0339,$23FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF,$63FF,$031E,$03DE,$035A,$037B,$3BFE,$2BBF,$2B5F
SamusPal_Power_ScrewAttack0: dw $3800,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_ScrewAttack1: dw $3800,$01A8,$03F8,$1545,$43E0,$22E8,$57FF,$4BF2,$3B8E,$01FB,$0355,$020B,$0356,$1244,$01B4,$014D
SamusPal_Power_ScrewAttack2: dw $3800,$0248,$03F3,$1685,$4FE0,$23E8,$57FF,$4BF2,$3BEE,$033B,$03F5,$02AB,$03F6,$1384,$02F4,$028D
SamusPal_Power_ScrewAttack3: dw $3800,$02E8,$03EE,$3FC5,$63E0,$4BE8,$7FFF,$73F2,$63EE,$2BFB,$03F0,$034B,$2BF6,$3BE4,$2BF4,$2BED
SamusPal_Power_Heat0: dw $0010,$0108,$03BD,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$02B5,$016B,$0252,$1104,$0074,$000D
SamusPal_Power_Heat1: dw $0004,$0109,$03BD,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$02B6,$016C,$0253,$1105,$0075,$000E
SamusPal_Power_Heat2: dw $0005,$010A,$03BE,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$02B7,$016D,$0254,$1106,$0076,$000F
SamusPal_Power_Heat3: dw $0007,$010B,$03BE,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$02B8,$016E,$0255,$1107,$0077,$0010
SamusPal_Power_Heat4: dw $0008,$010D,$03BE,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$02BA,$0170,$0257,$1109,$0079,$0012

SamusPal_Varia_Normal: dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_Charging0: dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_Charging1: dw $0C63,$0D4A,$0F1F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$0DFE,$0CF0,$0E73,$1D47,$0CD5,$0C6F
SamusPal_Varia_Charging2: dw $1CE7,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Varia_Charging3: dw $2D6B,$2E10,$2F5F,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$2E7E,$2DD4,$2ED6,$3A0E,$2DB8,$2D73
SamusPal_Varia_DyingSuit0: dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_DyingSuit1: dw $0C63,$0D4A,$0F1F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$0DFE,$0CF0,$0E73,$1D47,$0CD5,$0C6F
SamusPal_Varia_DyingSuit2: dw $1CE7,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Varia_DyingSuit3: dw $2D6B,$2E10,$2F5F,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$2E7E,$2DD4,$2ED6,$3A0E,$2DB8,$2D73
SamusPal_Varia_DyingSuit4: dw $3DEF,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6
SamusPal_Varia_DyingSuit5: dw $4E73,$4ED6,$4F9F,$5675,$63F3,$5B16,$6FBF,$6B7A,$6358,$4EBD,$4F1E,$4E98,$4F5A,$52D4,$4E9A,$4E78
SamusPal_Varia_DyingSuit6: dw $5EF7,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA
SamusPal_Varia_DyingSuit7: dw $6F7B,$6F9C,$6FDF,$6F7B,$73FB,$739C,$77DF,$77BD,$73BC,$6F7E,$6F9E,$6F7C,$6FBD,$6F9B,$6F7D,$6F7C
SamusPal_Varia_SpeedBoosting0: dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_SpeedBoosting1: dw $2003,$2908,$2AFF,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$29BE,$288E,$2A4D,$3904,$2874,$280D
SamusPal_Varia_SpeedBoosting2: dw $2003,$5108,$52FF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$51BE,$508E,$3E4D,$61A4,$5114,$50AD
SamusPal_Varia_SpeedBoosting3: dw $0000,$79A8,$7B9F,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$765E,$752E,$524D,$62E4,$5254,$51ED
SamusPal_Varia_SpeedBoosterShine0: dw $0000,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_SpeedBoosterShine1: dw $0000,$1DAD,$1F3F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$1E3E,$1D52,$1EB5,$29AA,$1D56,$1CF1
SamusPal_Varia_SpeedBoosterShine2: dw $0000,$3E73,$3F7F,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$3EDE,$3E36,$3F18,$4671,$3E39,$3DF6
SamusPal_Varia_SpeedBoosterShine3: dw $0000,$5F39,$5FBF,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$5F5E,$5F1A,$5F7B,$6338,$5F1C,$5EFA
SamusPal_Varia_Shinespark0: dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_Shinespark1: dw $3800,$01AD,$039F,$294F,$4FEA,$36F2,$6BFF,$5FFC,$4798,$15FF,$025E,$0133,$02F7,$264E,$15BE,$1557
SamusPal_Varia_Shinespark2: dw $3800,$0252,$03FF,$1615,$3BF0,$23B8,$57FF,$4BFF,$3BFE,$02BF,$02FE,$01D8,$039C,$1314,$027F,$021D
SamusPal_Varia_Shinespark3: dw $3800,$02F7,$17FF,$3F5F,$63FA,$4BFF,$7FFF,$73FF,$63FF,$2BFF,$039E,$027D,$03FF,$3BFE,$2BBF,$2B5F
SamusPal_Varia_ScrewAttack0: dw $3800,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_ScrewAttack1: dw $3800,$01A8,$039F,$1545,$43E0,$22E8,$57FF,$4BF2,$3B8E,$01FB,$025E,$012E,$02F2,$1244,$01B4,$014D
SamusPal_Varia_ScrewAttack2: dw $3800,$0248,$039A,$1685,$4FE0,$23E8,$57FF,$4BF2,$3BEE,$033B,$02FE,$01CE,$0392,$1384,$02F4,$028D
SamusPal_Varia_ScrewAttack3: dw $3800,$02E8,$0394,$3FC5,$63E0,$4BE8,$7FFF,$73F2,$63EE,$2BFB,$039E,$026E,$03F2,$3BE4,$2BF4,$2BED
SamusPal_Varia_Heat0: dw $0010,$0108,$02FF,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$01BE,$008E,$0252,$1104,$0074,$000D
SamusPal_Varia_Heat1: dw $0004,$0109,$02FF,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$01BE,$008F,$0253,$1105,$0075,$000E
SamusPal_Varia_Heat2: dw $0005,$010A,$02FF,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$01BE,$0090,$0254,$1106,$0076,$000F
SamusPal_Varia_Heat3: dw $0007,$010B,$02FF,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$01BE,$0091,$0255,$1107,$0077,$0010
SamusPal_Varia_Heat4: dw $0008,$010D,$02FF,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$01BF,$0093,$0257,$1109,$0079,$0012

SamusPal_Gravity_Normal: dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
SamusPal_Gravity_Charging0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_Charging1: dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F
SamusPal_Gravity_Charging2: dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Gravity_Charging3: dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73
SamusPal_Gravity_DyingSuit0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_DyingSuit1: dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F
SamusPal_Gravity_DyingSuit2: dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Gravity_DyingSuit3: dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73
SamusPal_Gravity_DyingSuit4: dw $4A6F,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6
SamusPal_Gravity_DyingSuit5: dw $56D3,$4EB8,$673F,$5675,$63F3,$5B16,$6FBF,$6B7A,$6358,$4EBD,$6EDA,$5EB7,$4F3B,$52D4,$4E9A,$4E78
SamusPal_Gravity_DyingSuit6: dw $6337,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA
SamusPal_Gravity_DyingSuit7: dw $6F9B,$6F7C,$77BF,$6F7B,$73FB,$739C,$77DF,$77BD,$73BC,$6F7E,$779D,$737C,$6FBD,$6F9B,$6F7D,$6F7C
SamusPal_Gravity_SpeedBoosting0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_SpeedBoosting1: dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D
SamusPal_Gravity_SpeedBoosting2: dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD
SamusPal_Gravity_SpeedBoosting3: dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
SamusPal_Gravity_SpeedBoosterShine0: dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_SpeedBoosterShine1: dw $0000,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Gravity_SpeedBoosterShine2: dw $0000,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6
SamusPal_Gravity_SpeedBoosterShine3: dw $0000,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA
SamusPal_Gravity_Shinespark0: dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_Shinespark1: dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC,$4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557
SamusPal_Gravity_Shinespark2: dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF,$3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D
SamusPal_Gravity_Shinespark3: dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF,$63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F
SamusPal_Gravity_ScrewAttack0: dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Gravity_ScrewAttack1: dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2,$3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D
SamusPal_Gravity_ScrewAttack2: dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2,$3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D
SamusPal_Gravity_ScrewAttack3: dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2,$63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED
SamusPal_Gravity_Heat0: dw $0010,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
SamusPal_Gravity_Heat1: dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
SamusPal_Gravity_Heat2: dw $0005,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
SamusPal_Gravity_Heat3: dw $0007,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
SamusPal_Gravity_Heat4: dw $0008,$010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012

SamusPal_Extra_Normal: dw $3800,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
SamusPal_Extra_Charging0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_Charging1: dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F
SamusPal_Extra_Charging2: dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Extra_Charging3: dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73
SamusPal_Extra_DyingSuit0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_DyingSuit1: dw $2143,$0D30,$463F,$2068,$43E3,$29EA,$5B9F,$4EF3,$4270,$0D1B,$5D55,$390C,$0E37,$1D47,$0CD5,$0C6F
SamusPal_Extra_DyingSuit2: dw $2DA7,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Extra_DyingSuit3: dw $3A0B,$2DF4,$56BF,$396E,$53EB,$4270,$63BF,$5B36,$52D4,$2DDC,$6618,$4DD1,$2EB9,$3A0E,$2DB8,$2D73
SamusPal_Extra_DyingSuit4: dw $4A6F,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6
SamusPal_Extra_DyingSuit5: dw $56D3,$4EB8,$673F,$5675,$63F3,$5B16,$6FBF,$6B7A,$6358,$4EBD,$6EDA,$5EB7,$4F3B,$52D4,$4E9A,$4E78
SamusPal_Extra_DyingSuit6: dw $6337,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA
SamusPal_Extra_DyingSuit7: dw $6F9B,$6F7C,$77BF,$6F7B,$73FB,$739C,$77DF,$77BD,$73BC,$6F7E,$779D,$737C,$6FBD,$6F9B,$6F7D,$6F7C
SamusPal_Extra_SpeedBoosting0: dw $14E0,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_SpeedBoosting1: dw $2003,$28CE,$6E1F,$3C05,$63E0,$49A8,$7F9F,$72D2,$624E,$28BB,$7D14,$58AA,$2A16,$3904,$2874,$280D
SamusPal_Extra_SpeedBoosting2: dw $2003,$516E,$7EBF,$64A5,$7FE0,$7248,$7FFF,$7F72,$7EEE,$555B,$7DB4,$7D4A,$52B6,$61A4,$5114,$50AD
SamusPal_Extra_SpeedBoosting3: dw $0000,$52AE,$7FFF,$65E5,$7FE0,$7388,$7FFF,$7FF2,$7FEE,$569B,$7EF4,$7E8A,$53F6,$62E4,$5254,$51ED
SamusPal_Extra_SpeedBoosterShine0: dw $0000,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_SpeedBoosterShine1: dw $0000,$1D92,$4E7F,$2CEB,$4BE7,$362D,$5F9F,$5715,$4AB2,$1D7C,$61B6,$416F,$1E78,$29AA,$1D56,$1CF1
SamusPal_Extra_SpeedBoosterShine2: dw $0000,$3E56,$5EFF,$49F2,$5BEF,$4ED3,$6BBF,$6358,$5B16,$3E5D,$6A79,$5654,$3EFA,$4671,$3E39,$3DF6
SamusPal_Extra_SpeedBoosterShine3: dw $0000,$5F1A,$6F7F,$62F8,$6BF7,$6759,$73DF,$6F9B,$6B7A,$5F1E,$733C,$6B19,$5F7C,$6338,$5F1C,$5EFA
SamusPal_Extra_Shinespark0: dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_Shinespark1: dw $3800,$1618,$575F,$294F,$4FEA,$36F2,$6BFF,$5FFC,$4798,$15FF,$6E5E,$45F4,$175F,$264E,$15BE,$1557
SamusPal_Extra_Shinespark2: dw $3800,$02DE,$43FF,$1615,$3BF0,$23B8,$57FF,$4BFF,$3BFE,$02BF,$5B1F,$32BA,$03FF,$1314,$027F,$021D
SamusPal_Extra_Shinespark3: dw $3800,$2BFF,$6BFF,$3F5F,$63FA,$4BFF,$7FFF,$73FF,$63FF,$2BFF,$7FFF,$5BFF,$2BFF,$3BFE,$2BBF,$2B5F
SamusPal_Extra_ScrewAttack0: dw $3800,$00CE,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0216,$1104,$0074,$000D
SamusPal_Extra_ScrewAttack1: dw $3800,$020E,$435F,$1545,$43E0,$22E8,$57FF,$4BF2,$3B8E,$01FB,$5A54,$31EA,$0356,$1244,$01B4,$014D
SamusPal_Extra_ScrewAttack2: dw $3800,$034E,$43FF,$1685,$4FE0,$23E8,$57FF,$4BF2,$3BEE,$033B,$5B94,$332A,$03F6,$1384,$02F4,$028D
SamusPal_Extra_ScrewAttack3: dw $3800,$2BEE,$6BFF,$3FC5,$63E0,$4BE8,$7FFF,$73F2,$63EE,$2BFB,$7FF4,$5BEA,$2BF6,$3BE4,$2BF4,$2BED
SamusPal_Extra_Heat0: dw $0010,$0108,$421F,$1405,$3BE0,$21A8,$579F,$4AD2,$3A4E,$00BB,$5914,$30AA,$0274,$1104,$0074,$000D
SamusPal_Extra_Heat1: dw $0004,$0109,$421F,$1406,$3BE1,$25CA,$579F,$4AD3,$3A4F,$00BC,$5915,$30AB,$0253,$1105,$0075,$000E
SamusPal_Extra_Heat2: dw $0005,$010A,$421F,$1407,$3BE2,$25CC,$579F,$4AD4,$3A50,$00BC,$5916,$30AC,$0254,$1106,$0076,$000F
SamusPal_Extra_Heat3: dw $0007,$010B,$421F,$1408,$3BE3,$29EE,$579F,$4AD5,$3A51,$00BD,$5917,$30AD,$0255,$1107,$0077,$0010
SamusPal_Extra_Heat4: dw $0008,$010D,$421F,$140A,$3BE5,$2E0F,$579F,$4AD7,$3A53,$00BD,$5919,$30AF,$0257,$1109,$0079,$0012

SamusPal_HyperBeam0: dw $0000,$2119,$319E,$1096,$35BF,$1CF9,$319E,$2D7D,$295B,$253B,$211A,$18D7,$211A,$14B7,$18D8,$1096
SamusPal_HyperBeam1: dw $0000,$1639,$2ABE,$09B6,$2EDF,$1619,$2ABE,$26BD,$1E7B,$1E5B,$1A3A,$0DF7,$1A3A,$0DD7,$11F8,$09B6
SamusPal_HyperBeam2: dw $0000,$0F39,$23DE,$02D6,$23FF,$0B39,$23DE,$1FBD,$177B,$137B,$135A,$06F7,$135A,$02F7,$0B18,$02D6
SamusPal_HyperBeam3: dw $0000,$0F2F,$23D3,$02CB,$23F4,$0B2E,$23D3,$1FB2,$1771,$1370,$134F,$06ED,$134F,$02EC,$0B0D,$02CB
SamusPal_HyperBeam4: dw $0000,$0F23,$23C8,$02C0,$23E8,$0B22,$23C8,$1FA7,$1765,$1364,$1344,$06E1,$1344,$02E0,$0B02,$02C0
SamusPal_HyperBeam5: dw $0000,$3284,$4329,$2221,$4749,$2E83,$4329,$4308,$3AC6,$36C5,$32A5,$2A42,$32A5,$2641,$2A63,$2221
SamusPal_HyperBeam6: dw $0400,$51E5,$6289,$4181,$66AA,$4DE4,$6289,$5E68,$5A27,$5626,$5205,$49A3,$5205,$45A2,$49C3,$4181
SamusPal_HyperBeam7: dw $0000,$554D,$69D2,$48CA,$69F2,$512C,$69D2,$65B1,$5D8F,$596E,$594E,$4D0B,$594E,$48EA,$510C,$48CA
SamusPal_HyperBeam8: dw $7FFF,$5876,$691A,$4812,$6D1B,$5455,$691A,$68FA,$60B8,$5C97,$5896,$5034,$5896,$4C13,$5054,$4812
SamusPal_HyperBeam9: dw $3800,$3CB8,$4D5D,$2C55,$517D,$38B7,$4D5D,$493C,$44FA,$40F9,$3CD9,$3476,$3CD9,$3075,$3497,$2C55
SamusPal_Hurt: dw $0000,$6739,$6F9C,$5EF7,$7BFF,$6739,$77BD,$6F9C,$6B7B,$6B7B,$6B7B,$5F18,$6B7B,$5F18,$6739,$5F18
SamusPal_IntroGreyscale: dw $3800,$2DAD,$52D6,$1084,$77FF,$2DAD,$677B,$52D6,$4252,$4252,$4252,$1908,$4252,$1908,$2DAD,$1908

SamusPal_Visor:
dw $3BE0,$5FF0,$7FFF ; Palette transition when x-ray is widening
dw $43FF,$2F5A,$1AB5 ; Full x-ray beam, or in room with layer blending configuration = 28h/2Ah (with colour math backdrop)

SamusPal_CrystalFlashBody0: dw $3800,$4210,$4210,$4210,$4210,$4210,$4210,$4210,$4210,$4210
SamusPal_CrystalFlashBody1: dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73
SamusPal_CrystalFlashBody2: dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7
SamusPal_CrystalFlashBody3: dw $3800,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B,$6F7B
SamusPal_CrystalFlashBody4: dw $3800,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7,$5EF7
SamusPal_CrystalFlashBody5: dw $3800,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73,$4E73
SamusPal_CrystalFlashBubble0: dw $7FFF,$7BDF,$77BF,$6F7F,$6B5F,$673F
SamusPal_CrystalFlashBubble1: dw $673F,$7FFF,$7BDF,$77BF,$6F7F,$6B5F
SamusPal_CrystalFlashBubble2: dw $6B5F,$673F,$7FFF,$7BDF,$77BF,$6F7F
SamusPal_CrystalFlashBubble3: dw $6F7F,$6B5F,$673F,$7FFF,$7BDF,$77BF
SamusPal_CrystalFlashBubble4: dw $77BF,$6F7F,$6B5F,$673F,$7FFF,$7BDF
SamusPal_CrystalFlashBubble5: dw $7FFF,$77BF,$6F7F,$6B5F,$673F,$7FFF

SamusPal_DyingSuitFlash: dw $03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF,$03FF
SamusPal_DyingBody0: dw $21A8,$02FF,$0217,$0150,$0089,$7FFF,$3A9F,$2A19,$1DB4,$114F,$090B,$4E73,$4210,$318C,$2108,$1084
SamusPal_DyingBody1: dw $29EA,$0F1F,$0E38,$0D91,$0CEB,$7FFF,$42BF,$3239,$29F5,$1D91,$154D,$5294,$4631,$39CE,$294A,$1CE7
SamusPal_DyingBody2: dw $362D,$1F3F,$1E79,$1DF3,$1D4E,$7FFF,$4ADF,$3E7A,$3636,$29F3,$25B0,$5AD6,$4E73,$4210,$35AD,$294A
SamusPal_DyingBody3: dw $4270,$2F5F,$2EBA,$2E35,$2DD1,$7FFF,$531F,$46BB,$4278,$3A35,$3212,$5EF7,$56B5,$4E73,$4210,$39CE
SamusPal_DyingBody4: dw $4ED3,$3F7F,$3EFB,$3E97,$3E34,$7FFF,$5B3F,$52FC,$4ED9,$4697,$4275,$6739,$5EF7,$56B5,$4E73,$4631
SamusPal_DyingBody5: dw $5B16,$4F9F,$4F3C,$4EF9,$4E96,$7FFF,$635F,$5F3C,$5B1A,$52F9,$52D7,$6B5A,$6739,$5EF7,$5AD6,$5294
SamusPal_DyingBody6: dw $6759,$5FBF,$5F7D,$5F3B,$5F19,$7FFF,$6B9F,$677D,$675C,$633B,$5F3A,$739C,$6F7B,$6B5A,$6739,$6318
SamusPal_DyingBody7: dw $739C,$6FDF,$6FBE,$6F9D,$6F7C,$7FFF,$73BF,$73BE,$739D,$6F9D,$6F9C,$77BD,$77BD,$739C,$739C,$6F7B
SamusPal_DyingAllWhite: dw $77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD,$77BD

; Edit this macro if you want to add another extra suit.
macro makeSamusPalPointers(name)
    SamusPalPointers_<name>:
    dw SamusPal_Power_<name>, SamusPal_Varia_<name>, SamusPal_Gravity_<name>, SamusPal_Extra_<name> ; Add ,SamusPal_Extra2_<name> here.
endmacro

; Make sure it has the same number of entries as the above macro.
macro makeSamusPalPointers_SameForAll(name)
    SamusPalPointers_<name>:
    dw SamusPal_<name>, SamusPal_<name>, SamusPal_<name>, SamusPal_<name>
endmacro

%makeSamusPalPointers("Normal")
%makeSamusPalPointers("Charging0")
%makeSamusPalPointers("Charging1")
%makeSamusPalPointers("Charging2")
%makeSamusPalPointers("Charging3")
%makeSamusPalPointers("DyingSuit0")
%makeSamusPalPointers("DyingSuit1")
%makeSamusPalPointers("DyingSuit2")
%makeSamusPalPointers("DyingSuit3")
%makeSamusPalPointers("DyingSuit4")
%makeSamusPalPointers("DyingSuit5")
%makeSamusPalPointers("DyingSuit6")
%makeSamusPalPointers("DyingSuit7")
%makeSamusPalPointers("SpeedBoosting0")
%makeSamusPalPointers("SpeedBoosting1")
%makeSamusPalPointers("SpeedBoosting2")
%makeSamusPalPointers("SpeedBoosting3")
%makeSamusPalPointers("SpeedBoosterShine0")
%makeSamusPalPointers("SpeedBoosterShine1")
%makeSamusPalPointers("SpeedBoosterShine2")
%makeSamusPalPointers("SpeedBoosterShine3")
%makeSamusPalPointers("Shinespark0")
%makeSamusPalPointers("Shinespark1")
%makeSamusPalPointers("Shinespark2")
%makeSamusPalPointers("Shinespark3")
%makeSamusPalPointers("ScrewAttack0")
%makeSamusPalPointers("ScrewAttack1")
%makeSamusPalPointers("ScrewAttack2")
%makeSamusPalPointers("ScrewAttack3")
%makeSamusPalPointers("Heat0")
%makeSamusPalPointers("Heat1")
%makeSamusPalPointers("Heat2")
%makeSamusPalPointers("Heat3")
%makeSamusPalPointers("Heat4")

; If you want to make it suit-specific, change it to %makeSamusPalPointers and add SamusPal_Power_<name>, etc...
%makeSamusPalPointers_SameForAll("HyperBeam0")
%makeSamusPalPointers_SameForAll("HyperBeam1")
%makeSamusPalPointers_SameForAll("HyperBeam2")
%makeSamusPalPointers_SameForAll("HyperBeam3")
%makeSamusPalPointers_SameForAll("HyperBeam4")
%makeSamusPalPointers_SameForAll("HyperBeam5")
%makeSamusPalPointers_SameForAll("HyperBeam6")
%makeSamusPalPointers_SameForAll("HyperBeam7")
%makeSamusPalPointers_SameForAll("HyperBeam8")
%makeSamusPalPointers_SameForAll("HyperBeam9")
%makeSamusPalPointers_SameForAll("Hurt")
%makeSamusPalPointers_SameForAll("IntroGreyscale")

%makeSamusPalPointers_SameForAll("Visor")

%makeSamusPalPointers_SameForAll("CrystalFlashBody0")
%makeSamusPalPointers_SameForAll("CrystalFlashBody1")
%makeSamusPalPointers_SameForAll("CrystalFlashBody2")
%makeSamusPalPointers_SameForAll("CrystalFlashBody3")
%makeSamusPalPointers_SameForAll("CrystalFlashBody4")
%makeSamusPalPointers_SameForAll("CrystalFlashBody5")

%makeSamusPalPointers_SameForAll("CrystalFlashBubble0")
%makeSamusPalPointers_SameForAll("CrystalFlashBubble1")
%makeSamusPalPointers_SameForAll("CrystalFlashBubble2")
%makeSamusPalPointers_SameForAll("CrystalFlashBubble3")
%makeSamusPalPointers_SameForAll("CrystalFlashBubble4")
%makeSamusPalPointers_SameForAll("CrystalFlashBubble5")

%makeSamusPalPointers_SameForAll("DyingSuitFlash")
%makeSamusPalPointers_SameForAll("DyingBody0")
%makeSamusPalPointers_SameForAll("DyingBody1")
%makeSamusPalPointers_SameForAll("DyingBody2")
%makeSamusPalPointers_SameForAll("DyingBody3")
%makeSamusPalPointers_SameForAll("DyingBody4")
%makeSamusPalPointers_SameForAll("DyingBody5")
%makeSamusPalPointers_SameForAll("DyingBody6")
%makeSamusPalPointers_SameForAll("DyingBody7")
%makeSamusPalPointers_SameForAll("DyingAllWhite")
