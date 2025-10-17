; bank $83

LedgeGrabCheck:
{
  ; return if not moving down
  LDA $0B36 : CMP #$0002 : BNE ++
  ; return if not hit wall
  LDA $0A1E : AND #$00FF : CMP $0DCE : BNE ++
  ; return if y speed < 1.0 (prevents regrabbing ledge immediately after falling)
  LDA $0B2E : BEQ ++
  ; return if not jumping, spin jumping nor falling
  LDA $0A1F : AND #$00FF : CMP #$0002 : BEQ +
  CMP #$0003 : BEQ +
  CMP #$0006 : BEQ +
++
  CLC : RTL
+
  ; return if not pressing forward
  LDA $0A1E : AND #$00FF : CMP #$0004 : BEQ +
    LDA $8B : BIT #$0100 : BNE ++ ; right
    CLC : RTL
  +
    LDA $8B : BIT #$0200 : BNE ++ ; left
    CLC : RTL
  ++
  JSR HangingOnLedgeCheck
  BCC +
    LDA #$0003 : STA $0DC6 ; solid vertical collision result = grabbed ledge
  +
  RTL
}

HangingOnLedgeCheck:
{
  ; save samus positions and hitbox
  LDA $0AFA : PHA : LDA $0AFC : PHA
  LDA $0AF6 : PHA : LDA $0AF8 : PHA
  LDA $0AFE : PHA : LDA $0B00 : PHA

  ; set ledge grab hitbox position
  LDA $0A1E : AND #$00FF : SEC : SBC #$0004 : STA $00 : BEQ +
    LDA $0AF6 : CLC : ADC $0AFE : DEC ; right
    BRA ++
  +
    LDA $0AF6 : SEC : SBC $0AFE : INC ; left
  ++
  STA $0AF6
  LDA $0AFA : SEC : SBC $0B00 : INC : STA $0AFA

  ; first collision check: check if there's no ceiling above
  LDA.w #-$12-2 : CLC : ADC $0B00 : STA $12 : STZ $14
  ; hitbox = 2x2 pixels
  TDC : INC : STA $0AFE : STA $0B00
  LDA.w #2|4 : STA $0B02 ; collision direction = up, disable special air/block collisions
  JSL $949763 ; Move Samus down by [$12].[$14], no solid enemy collision
  ROL : EOR #$0001 : ROR ; flip carry, carry clear if collision
  BCC .done

  ; second collision check: check if there's air above the ledge
  STZ $14
  LDA $00 : BNE +
    TDC : DEC : STA $12
    LDA.w #0|4 ; collision direction = left, disable special air/block collisions
    BRA ++
  +
    TDC : INC : STA $12
    LDA.w #1|4 ; collision direction = right, disable special air/block collisions
  ++
  STA $0B02
  JSL $94971E ; Move Samus right by [$12].[$14], no solid enemy collision
  ROL : EOR #$0001 : ROR ; flip carry, carry clear if collision
  BCC .done

  ; third collision check: check if there's solid at the ledge
  LDA $0B2C : CLC : ADC $0B5A : STA $14 : LDA $0B2E : ADC $0B5C : STA $12
  LDA #$0003 : STA $0B02 ; collision direction = down, enable special air/block collisions
  JSL $949763 ; Move Samus down by [$12].[$14], no solid enemy collision

.done
  ; restore hitboxes and x position
  PLA : STA $0B00 : PLA : STA $0AFE
  PLA : STA $0AF8 : PLA : STA $0AF6
  BCS .grabLedge
  ; not grabbing ledge, restore previous y position
  PLA : STA $0AFC : PLA : STA $0AFA
  RTS

.grabLedge
  ; grabbing ledge, align y position
  PLA : PLA
  LDA $0AFA : INC : CLC : ADC #$0012 : STA $0AFA
  SEC : RTS
}

HangingOnLedgeMovementHandler:
{
  STZ $0DC6 ; Samus solid vertical collision result = no change
  ; kill X speed
  JSL $91DE53 ; Cancel speed boosting
  STZ $0B42 : STZ $0B44 : STZ $0B46 : STZ $0B4 : STZ $0B4A
  ; kill y speed
  STZ $0B2E : STZ $0B2C
  STZ $0B20 ; Morph ball bounce state = not bouncing
  LDA #$0002 : STA $0B36 ; make falling from hanging on ledge work properly

  ; check ready to jump anim frame (pressing opposite direction)
  LDA $0A1D : AND #$0C00 : LSR : LSR : AND $8B : BEQ +
    ; set ready to jump frame
    LDA #$0009 : STA $0A96
    BRA ++
  +
    ; unset ready to jump frame
    LDA $0A96 : CMP #$0009 : BCC ++
    LDA.w #3-1 : STA $0A96
    TDC : INC : STA $0A94
  ++

  ; drop if horizontal shaking
  LDA $183E : ASL : ASL : ASL : TAX
  LDA $A0872D,x : BEQ +
  LDA $1840 : CMP.w #29 : BCC +
    LDA #$0002 : STA $0DC6 ; solid vertical collision result = falling, downwards movement solid collision result = airborne
    RTL
  +

  ; check if still hanging on ledge
  TDC : INC : STA $0B2E ; y speed = 1
  JSR HangingOnLedgeCheck
  STZ $0B2E ; y speed = 0
  BCS +
    LDA #$0002 : STA $0DC6 ; solid vertical collision result = falling, downwards movement solid collision result = airborne
    RTL
  +
  LDA $0A28 : DEC : LSR : CMP.w #($61-1)/2 : BNE +
    ; prospective pose == pulling up from hanging
    JSR LedgePullCollisionCheck
    BCS +
      ; can't pull ledge
      LDA $8B : AND $09B4 : BEQ .notPressingJump
      ; pressed jump, prospective pose = jump
      LDY #$004D
      LDA $0A1E : AND #$00FF : CMP #$0004 : BNE ++
        INY
      ++
      STY $0A28
      RTL

      .notPressingJump
      TDC : DEC : STA $0A28 ; cancel prospective pose
  +
  RTL
}

LedgePullCollisionCheck:
{
  ; check if there's no ceiling above
  LDA.w #-$F : STA $12 : STZ $14
  JSL $9496AB ; Block collision detection due to change of pose
  BCC +
    CLC : RTS
  +
  ; save samus positions and hitbox
  LDA $0AF6 : PHA : LDA $0AF8 : PHA
  LDA $0AFA : PHA : LDA $0AFC : PHA
  LDA $0B00 : PHA

  ; now check the blocks in front
  LDA $0AFA : SEC : SBC.w #$12+$C : STA $0AFA
  LDA #$000C : STA $0B00
  LDA $0A1E : AND #$00FF : CMP #$0004 : BEQ +
    TDC : INC : BRA ++
  +
    TDC : DEC
  ++
  STA $12 : STZ $14
  JSL $94967F ; Wall jump block collision detection
  BCS +
    SEC
    BRA .done
  +
  ; check if morph equipped
  LDA $09A2 : BIT #$0004 : BEQ .noMorph
    ; now check if morph ball fits in the tunnel
    LDA $0AFA : CLC : ADC.w #$C-7 : STA $0AFA
    LDA #$0007 : STA $0B00
    LDA $0A1E : AND #$00FF : CMP #$0004 : BEQ +
      TDC : INC : BRA ++
    +
      TDC : DEC
    ++
    JSL $94967F
    BCS +
      SEC
      BRA .done
    +
  .noMorph
  CLC
.done
  ; restore samus positions and hitbox
  PLA : STA $0B00
  PLA : STA $0AFC : PLA : STA $0AFA
  PLA : STA $0AF8 : PLA : STA $0AF6
  RTS
}

PullingFromHangingMovementHandler:
{
  STZ $0DC6 ; Samus solid vertical collision result = no change

  ; remove animation slowdown in liquids, just like fusion
  LDA $0A1C : ASL : TAX
  LDA $91B010,x : CLC : ADC $0A96 : TAX
  LDA $910000,x : AND #$00FF : BIT #$0080 : BNE +
  CMP $0A94 : BPL +
    STA $0A94
  +

  LDA $0A1C : DEC : LSR : CMP.w #($65-1)/2 : BEQ .pullingIntoTunnel
  CMP.w #($63-1)/2 : BNE + : JMP .pullingForward : +
  TDC : INC : STA $0B36 ; y direction = up
  LDA $0A96 : CMP #$0002 : BNE .notDonePullingUp
  LDA $0A94 : DEC : BNE .notDonePullingUp
  ; check if it's a tunnel
  LDA $0AFA : SEC : SBC.w #$C-7+1 : STA $0AFA
  LDA $0A1E : AND #$00FF : CMP #$0004 : BEQ +
    TDC : INC : BRA ++
  +
    TDC : DEC
  ++
  STA $12 : STZ $14
  JSL $94967F ; Wall jump block collision detection
  BCS .isTunnel

  ; not a tunnel
  LDA $0B14 : SEC : SBC.w #$C-$7 : STA $0B14 ; change previous y position to correct scrolling
  LDY #$0063 ; super special prospective pose = pulling forward from hanging
  BRA .merge

.isTunnel
  LDA $0AFA : CLC : ADC.w #$C-$7 : STA $0AFA
  LDY #$0065 ; super special prospective pose = pulling into tunnel

.merge
  LDA $0A1E : AND #$00FF : CMP #$0004 : BNE ++
    INY
  ++
  STY $0A2C
  LDA #$0003 : STA $0A32 ; super special prospective pose change command = transition animation finished
  RTL

.notDonePullingUp
  LDA.w #-3 : STA $12 : STZ $14
  JSL MoveSamusUp_l ; $9093EC
  RTL

.pullingIntoTunnel
  STZ $0B36 ; y direction = none (prevent morph ball bounce sound playing)
  LDA #$0002 : STA $12 : STZ $14
  JML MoveSamusHorizontally_l ; $908EA9

.pullingForward
  STZ $0B36 ; y direction = none
  TDC : INC : STA $12 : STZ $14
  JSL MoveSamusHorizontally_l ; $908EA9
  LDA $0A96 : CMP #$0003 : BNE +
  LDA $0A94 : DEC : BNE +
    LDA $0AFA : SEC : SBC.w #$10-$C : STA $0AFA
    LDA $0B14 : SEC : SBC.w #$10-$C : STA $0B14
  +
  RTL
}

pushpc

org $9090E2 ; Samus Y movement - with speed calculations
SamusYMovementWihSpeedCalculations:
{
  PHP : REP #$30
  JSL LedgeGrabCheck
  BCS .rts
  LDA $0B2C : STA $14 : LDA $0B2E : STA $12
  LDA $0B36 : CMP #$0002 : BEQ .movingDown
    LDA $14 : SEC : SBC $0B32 : STA $0B2C
    LDA $12 : SBC $0B34 : STA $0B2E
    BRA +
  .movingDown
    LDA $12 : CMP #$0005 : BEQ +
    LDA $14 : CLC : ADC $0B32 : STA $0B2C
    LDA $12 : ADC $0B34 : STA $0B2E
  +
  LDA $0B36 : CMP #$0002 : BEQ +
    LDA $12 : EOR #$FFFF : STA $12
    LDA $14 : EOR #$FFFF : INC : STA $14
    BNE +
    INC $12
  +
  LDA $0B5A : CLC : ADC $14 : STA $14
  LDA $0B5C : ADC $12 : STA $12
  BMI .moveUp
  JSR $9440 ; Move Samus down by [$12].[$14]
.rts
  PLP : RTS

.moveUp
  JSR $93EC ; Move Samus up by -[$12].[$14]
  PLP : RTS
}

;;; movement type 7: hanging on ledge
org $9081A4+7 : db $00 ; water splash type = diving splash
org $90864E+2*7 : dw $8686 ; always draw bottom
org $908C5C+2*7 : dw $8C94 ; spritemap position = normal
org $90A34B+2*7 : dw GotoHangingOnLedgeMovementHandler ; movement handler, see "shoot.asm"
org $90DE82+2*7 : dw $DEFA ; Knockback transition - normal
org $90DFB5+2*7 : dw $DFED ; Set up bomb jump - standing / crouching
org $90E65A+7 : db $04 ; downwards movement solid collision result - falling = no change
org $90E676+7 : db $04 ; downwards movement solid collision result - landing = no change
org $918332+7 : db $02 ; prospective pose change command = stop
org $918014+2*7 : dw $8066 ; Normal Samus pose input handler = normal
org $91E6E1+2*7 : dw $E732 ; Update Samus pose due to change of equipment: RTS
org $91ED6A+2*7 : dw $EDB0 ; Determine knockback direction - normal
org $91F4A2+2*7 : dw $F4DA ; Initialise Samus pose: clear carry
org $91FBCF+2*7 : dw $FC07 ; Handle jump transition: RTS
org $9BB420+7 : db $05 ; Set Samus death sequence pose
org $9BB8B8+7 : db $00 ; don't cancel grapple

;;; movement type 9: pulling from hanging
org $9081A4+9 : db $00 ; water splash type = diving splash
org $90864E+2*9 : dw $8686 ; always draw bottom
org $908C5C+2*9 : dw $8C94 ; spritemap position = normal
org $90A34B+2*9 : dw GotoPullingFromHangingMovementHandler ; movement handler, see "shoot.asm"
org $90DE82+2*9 : dw $DEFA ; Knockback transition - normal
org $90DFB5+2*9 : dw $DFED ; Set up bomb jump - standing / crouching
org $90E65A+9 : db $04 ; downwards movement solid collision result - falling = no change
org $90E676+9 : db $04 ; downwards movement solid collision result - landing = no change
org $918332+9 : db $02 ; prospective pose change command = stop
org $918014+2*9 : dw $8066 ; Normal Samus pose input handler = normal
org $91E6E1+2*9 : dw $E732 ; Update Samus pose due to change of equipment: RTS
org $91ED6A+2*9 : dw $EDB0 ; Determine knockback direction - normal
org $91F4A2+2*9 : dw $F4DA ; Initialise Samus pose: clear carry
org $91FBCF+2*9 : dw $FC07 ; Handle jump transition: RTS
org $9BB420+9 : db $05 ; Set Samus death sequence pose
org $9BB8B8+9 : db $00 ; don't cancel grapple

org $90EB23
STZ $0DCE : BRA + : org $90EB2D : + ; reset speed killed flag in "Reset movement and pose change variables"

pullpc
