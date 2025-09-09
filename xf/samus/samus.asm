lorom

incsrc "new_poses.asm"

!screwAttack = $0008
!spaceJump = $0200
!gravitySuit = $0020

; we need to free up space in bank $91 for my new samus code and poses
org $91E776
UpdateSpinjumpDueToChangeOfEquipment:
{
  LDA $0A23 : PHA : AND #$FF00 : STA $0A23 ; push previous movement type then set it to standing
  JSL $91F433 ; Initialise Samus pose
  PLA : STA $0A23 ; restore previous movement type
  JSL $91FB08 ; Set Samus animation frame if pose changed
  JSR $E719 ; Update Samus previous pose
  RTS
}
padbyte $FF : pad $91E83A

org $91F624 ; Initialise Samus pose - spin jumping
SpinjumpInit:
{
  LDA $0A23 : AND #$00FF : CMP #$0003 : BEQ .alreadySpinning : CMP #$0014 : BNE .notAlreadySpinning ; If previously spinjumping or walljumping:
  .alreadySpinning
    LDA #$0001 : STA $0A9A ; New pose Samus animation frame = 1 (skip jumping from floor animation)
    LDA $0A1E : EOR $0A22 : AND #$00FF : BEQ .notAlreadySpinning ; if turning around:
    LDA $0B44 : CLC : ADC $0B48 : STA $0B48 : LDA $0B42 : ADC $0B46 : STA $0B46 ; add extra run speed to base speed
    JSL $91F18C ; cancel speed boosting
    STZ $0B44 : STZ $0B42 ; extra run speed = 0
    TDC : INC : STA $0B4A ; set x acceleration mode to turning around
  .notAlreadySpinning
  JSL UnderwaterCheck2 : BCS .underwater
  LDA $09A2 : BIT #!screwAttack : BNE .screwAttack
  BIT #!spaceJump : BNE .spaceJump
.underwater
  LDX #$0019 ; set pose to spinjump
  LDY #$0031 : BRA .playSound ; spinjump sound
.spaceJump
  LDX #$001B ; set pose to space jump
  LDY #$003E : BRA .playSound ; space jump sound
.screwAttack
  LDX #$0081 ; set pose to screw attack
  LDY #$0033 ; screw attack sound
.playSound
  BCS .checkIfFacingLeft ; if not underwater:
  LDA $0A23 : AND #$00FF : CMP #$0003 : BEQ .checkIfFacingLeft ; if not already spinning:
  TYA : JSL $809049 ; play sound
.checkIfFacingLeft
  LDA $0A1C : LSR : BCS + ; if facing left:
    INX ; set left-facing pose
  +
  STX $0A1C
  CLC : RTS
}
; underwater check: carry set if fully submerged underwater, clear otherwise
UnderwaterCheck:
{
  LDA $09A2 : BIT #!gravitySuit : BNE .overwater
  JSL $90EC58 ; $14 = Samus top boundary
.merge
  LDA $195E : BMI .lavaCheck
  CMP $14 : BPL .overwater
  LDA $197E : BIT #$0004 : BNE .overwater
.underwater
  SEC : RTL
.lavaCheck
  LDA $1962 : BMI .overwater
  CMP $14 : BMI .underwater
.overwater
  CLC : RTL
}
; underwater check 2: carry set if touching water, clear otherwise
UnderwaterCheck2:
{
  LDA $09A2 : BIT #!gravitySuit : BNE UnderwaterCheck_overwater
  JSL $90EC3E ; $12 = Samus bottom boundary
  LDA $12 : STA $14 : BRA UnderwaterCheck_merge ; $14 = [$12]
}

;;; new code
CanSamusSkid:
{
  LDA $0A1F : AND #$00FF : CMP #$0001 : BNE .rts ; return if movement type != running
  LDA $0B3E : AND #$FF00 : CMP #$0400 : BMI .rts ; skid if speedboosting
  LDX #$005B ; skid pose
  LDA $0A1E : AND #$00FF : CMP #$0008 : BEQ + ; if facing left:
    INX ; set left-facing pose
  +
  STX $0A1C ; Samus pose = skidding
  LDA $0AA8 : BEQ .unarmed
    LDA #$0002 ; new pose anim frame = 2 (armed)
  .unarmed
  STA $0A9A ; new pose anim frame = 0 (unarmed)
  JSL $91FB08 ; Set Samus animation frame if pose changed
.rts
  LDA $0B46 ; restore from hijack
  RTS
}
ToggleArmCannonWhileSkidding:
{
  LDA $0A1C : DEC : LSR : CMP.W #($005B-1)/2 : BNE .rtl
  ; Samus is skidding
  LDA $0AA8 : BEQ .unarmed
    LDA #$0002 ; anim frame = 2 (armed)
  .unarmed
  STA $0A96 ; anim frame = 0 (unarmed)
.rtl
  LDA $0A1C ; restore from hijack
  RTL
}
StoreShinesparkWhileSkidding:
{
  LDA $0A20 : DEC : LSR : CMP.W #($005B-1)/2 : BNE .notSkidding
  JMP $F7BB ; store shinespark

.notSkidding
  LDA $0B3E ; restore from hijack
  JMP $F7B3
}
padbyte $FF : pad $91F758

org $90F41E
SamusCommand1C:
{
  LDA #$0A1F : AND #$00FF : CMP #$0003 : BEQ + : CMP #$0014 : BNE ++ ; if spinjumping or walljumping:
+
  JSL UnderwaterCheck : BCS ++ ; If not underwater:
  LDA $09A2 : BIT #!screwAttack : BNE .screwAttack
  BIT #!spaceJump : BNE .spaceJump
  LDA #$0031
-
  JSL $80902B ; play sound
++
  CLC : RTS
.spaceJump
  LDA #$003E : BRA -
.screwAttack
  LDA #$0033 : BRA -
}

org $91FA7A : LDA #$0032 : JSL $809021 : CLC : RTS ; goodbye walljump dust (and stop spinjump sound when starting walljump)
org $90EE64 : RTS ; and speed boost dust

org 2*$14+$91E6E1
dw $E732 ; RTS out the routine to update animation frame while unpausing while walljumping

org $91EBCA : BRA $01 ; restore that dumb animation of samus running against the wall, but no more arm pump
org $91EADE ; i don't need that "Check if prospective pose runs into a wall" routine anymore
padbyte $FF : pad $91EB88

org $90A4FD : BRA $02 ; pseudo screw works underwater just like in fusion

; change some routines to account for skidding
org $91F50C ; Initialise Samus pose - running
{
  LDA $0A23 : AND #$00FF : DEC : BNE .notPreviouslyRunning
  LDA $0A20 : DEC : LSR : CMP.W #($005B-1)/2 : BEQ .notPreviouslyRunning
  LDA #$8000 : STA $0A9A
.notPreviouslyRunning
  CLC : RTS
}

org $9084EF ; in Handle normal animation delay
{
  JSR IsSamusInRunAnimation
  BCC + : BRA ++
  org $9084FF : ++
  org $90851D : +
}

org $908538 ; in Handle speed booster animation delay
{
  LDA $8B : BIT $09B6 : BEQ +
    JMP $85DA
  +
  JSR IsSamusInRunAnimation
  BCS +
    JMP $85DA
  +
  BRA + : org $908558 : +
}

; yeah $90:841D..848A are free now
org $90841D
SetSamusUsingElevatorPose:
{
  LDA $0A1E : PHA ; save pose X direction
  JSL $91E3F6
  LDX #$005D ; using an elevator pose
  PLA : AND #$00FF : CMP #$0008 : BEQ + ; if facing left:
    INX ; set left-facing pose
  +
  STX $0A1C
  JML $91FB08 ; Set Samus animation frame if pose changed
}
; A must be Bh here
FinishSamusUsingElevatorPose:
{
  LDA $0A1C : DEC : LSR : CMP.W #($005D-1)/2 : BNE .rts ; sanity check for elevator pose
  LDA #$0004 : STA $0A96 : STZ $0A94 ; set anim frame (finished riding elevator)
.rts
  LDA #$EB52
  RTS
}
IsSamusFacingForward:
{
  LDA $0A1C : BEQ .facingForward
  CMP #$009B : BEQ .facingForward
  DEC : LSR : CMP.W #($005D-1)/2 : BEQ .facingForward
  CLC : RTL
.facingForward:
  SEC : RTL
}
IsSamusInRunAnimation:
{
  LDA $0B3C : BEQ .notRunning
  LDA $0A1F : AND #$00FF : DEC : BNE .notRunning
  LDA $0A1C : DEC : LSR : CMP.W #($005B-1)/2 : BEQ .notRunning
  SEC : RTS
.notRunning
  CLC : RTS
}
padbyte $FF : pad $90848B

org $90A386 ; in Samus movement - standing
JSL IsSamusFacingForward
BCS + : BRA ++
org $90A392 : + : LDA $0E18
org $90A3AD : ++

;;; Hijacks
org $918069 ; in Normal Samus pose input handler - [Samus movement type] = running
JSR $81A9

org $91EC50 ; in Prospective pose change command 1 - decelerate
JSR CanSamusSkid

org $91F7B0 ; in Initialise Samus pose - crouching transition
JMP StoreShinesparkWhileSkidding

org $908011 ; in Animate Samus
JSL ToggleArmCannonWhileSkidding
BRA $00 : DEC : LSR : CMP.W #($004D-1)/2

org $90F1C8 ; in Samus command 7: set up Samus for elevator
JSL SetSamusUsingElevatorPose

org $90F295 ; in Samus command Bh: unlock Samus from facing forward
JSR FinishSamusUsingElevatorPose
