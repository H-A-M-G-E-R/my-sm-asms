!NewProjectile = $0B5E ; was pose transition shot direction

; Samus current state handler - normal
org $90E695
{
  PHP : PHB : PHK : PLB : REP #$30
  LDA #$FFFF : STA $0A28 : STA $0A2A : STA $0A2C ; prospective pose
  STZ $0A2E : STZ $0A30 : STZ $0A32 ; prospective pose change command = none
  JSR $EC22 ; Set Samus radius
  JSR $DCDD ; Handle HUD specific behaviour (must be done before pose input handler for shooting)
  JSR $E90F ; Execute [Samus pose input handler]
  JSR $ECB6 ; Determine Samus suit palette index
  JSR $9C5B ; Determine Samus Y acceleration
  JSL $949B60 ; Samus block inside handling
  JSR $EB02 ; Reset movement and pose change variables
  PLB : PLP : RTL
}

org $90DCFB : PLP : RTS ; don't handle projectiles in Handle HUD specific behaviour

org $8A91E0 ; Game state 8 (main gameplay)
PHP : REP #$30
JSL $A08EB6 ; Determine which enemies to process
JSL $898065 ; Palette FX object handler
JSL $90E692 ; Samus current state handler
JSL $A09785 ; Samus / projectile interaction handling
JSL $A0A306 ; Process enemy power bomb interaction
JSL $A08FD4 ; Main enemy routine
JSL $A09894 ; Enemy projectile / Samus collision handling
JSL $A0996C ; Enemy projectile / projectile handling
JSL $868104 ; Enemy projectile handler
JSL SamusNewStateHandlerAndProjectiles ; Samus new state handler and handle projectiles
JSL $8481B2 ; PLM handler
JSL $878064 ; Animated tiles objects handler
JSL $9094EC ; Main scrolling routine
JSL $A0884D ; Draw Samus, projectiles, enemies and enemy projectiles
JSL $A09726 ; Handle queuing enemy BG2 tilemap VRAM transfer
JSL $809AD3 ; Handle HUD tilemap
JSL $80A3AB ; Calculate layer 2 position and BG scrolls and update BG graphics when scrolling
JSL $8FE52E ; Execute room main ASM
JSL $8A9556 ; Handle Samus running out of health and increment game time
JSL $A08687 ; Handle room shaking
JSL $A09169 ; Decrement Samus hurt timers and clear active enemy indices
PLP : RTS

org $90BB01 ; freed up in charge_flare/charge_flare.asm
SamusNewStateHandlerAndProjectiles:
{
  JSL SamusNewStateHandler
}
HandleProjectilesLong:
{
  LDA $0A78 : BNE .timeIsFrozen
  PHB : PHK : PLB
  JSR HandleNewProjectile
  JSR $AECE ; handle projectiles
  PLB
.timeIsFrozen
  RTL
}
SamusNewStateHandler:
{
  JMP ($0A44)
}
HandleNewProjectile:
{
  LDA !NewProjectile : CMP #$0005 : BCS .isBomb ; branch if new projectile is a bomb
  LDA $0A1C : ASL : ASL : ASL : TAX : LDA $91B62C,x : AND #$00FF : BIT #$00F0 : BNE .rts ; return if Samus is in a pose that she can't fire
  LDA !NewProjectile : BEQ .rts
.isBomb
  ASL : TAX : JSR (.table-2,x)
  STZ !NewProjectile
.rts
  RTS

.table
  dw NewUnchargedShot ; 1: uncharged shot
  dw NewChargedShot ; 2: charged shot
  dw NewMissile ; 3: missile
  dw NewGrapple ; 4
  dw NewBomb ; 5
  dw NewPowerBomb ; 6
  dw NewBombSpread ; 7: bomb spread
}
NewUnchargedShot:
{
  STZ $0CD0 : JSR $BCBE ; Beam charge counter = 0, clear charge beam animation state
  PHP : JMP $B887
}
NewChargedShot:
{
  STZ $0CD0 : JSR $BCBE
  PHP : JMP $B986
}
NewMissile:
{
  PHP : JMP $BE76
}
NewGrapple:
{
  LDA $0CD0 : BEQ +
  STZ $0CD0 : JSR $BCBE
  JSL $91DEBA
+
  JSL FireGrappleLong : RTS ; (see "charge_flare/charge_flare.asm")
}
NewBomb:
{
  PHP : LDX #$000A
  JMP $BFD2
}
NewPowerBomb:
{
  PHP : LDA $09CE
  JMP $C02B
}
NewBombSpread:
{
  JSL $91DEBA ; Load Samus suit palette
  LDA #$0002 : JSL $80902B ; bomb spread set sound (silence)
  JMP $D849
}

SetNewProjectileToUnchargedShot:
TDC : INC : STA !NewProjectile : RTS
SetNewProjectileToChargedShot:
LDA #$0002 : STA !NewProjectile : RTS
SetNewProjectileToBomb:
LDA #$0005 : STA !NewProjectile : PLP : RTS
SetNewProjectileToPowerBomb:
LDA #$0006 : STA !NewProjectile : PLP : RTS
SetNewProjectileToBombSpread:
LDA #$0007 : STA !NewProjectile : RTS

DoRShot:
{
  ; return if grappling
  LDA $0D32 : CMP #$C4F0 : BNE .rts
  JSR $BCBE ; Clear charge beam animation state
  ; branch if [charge counter] < 60
  LDA $0CD0
  STZ $0CD0 ; Beam charge counter = 0
  CMP.W #60
  BMI .dontDoIt
  LDA #$8002 : STA !NewProjectile ; new projectile = charged shot
  RTS

.dontDoIt
  JSL $91DEBA ; Load Samus suit palette
.rts
  RTS
}
assert pc() <= $90BCBE

org $90B80D ; HUD selection handler - nothing / power bombs
HudSelectionHandler_Nothing:
{
  LDA $0CD0 : STA $0DC2 ; Previous beam charge counter = [beam charge counter]
  LDA $0CCC : ORA !NewProjectile : BNE .cooldown ; branch if cooldown timer != 0 or if already have a new projectile
  LDA $0A76 : BNE .hyperOrNoCharge ; branch if hyper
  LDA $09A6 : BIT #$1000 : BNE .charge ; branch if charge equipped
.hyperOrNoCharge
  LDA $8B : AND $09B2 : BEQ .rts ; branch if not pressing shoot
-
  JMP SetNewProjectileToUnchargedShot

.charge
  LDA $8F : AND $09B2 : BNE - ; fire uncharged shot if newly pressing shoot
  LDA $8B : AND $09B2 : BEQ .releasedShoot
.incrementCharge
  LDA $0CD0 : CMP.W #120 : BPL .sba
  INC $0CD0
  RTS

.releasedShoot
  LDA $0CD0 : CMP.W #60 : BMI .notFullyCharged
  JMP SetNewProjectileToChargedShot

.notFullyCharged
  CMP.W #16 : BPL -
  STZ $0CD0 : JMP $BCBE

.sba
  JSR $CCC0 : BCC .rts
  STZ $0CD0 : JSR $BCBE
  JSL $91DEBA
.rts
  RTS

.cooldown
  LDA $09A6 : BIT #$1000 : BEQ .rts
  LDA $8B : AND $09B2 : BEQ .rts
  BRA .incrementCharge
}
%padSafe($90B887)

org $90BE62 ; HUD selection handler - missiles / super missiles
{
  LDA $8F : BIT $09B2 : BEQ + ; if newly pressing shoot:
  LDA #$0003 : STA !NewProjectile
+
  RTS
}
assert pc() <= $90BE76

org $9BC4F0 ; Grapple beam function - inactive
{
  LDA $8F : BIT $09B2 : BEQ + ; if newly pressing shoot:
  LDA #$0004 : STA !NewProjectile
+
  RTS
}
assert pc() <= $9BC51E

org $90BFCF ; in HUD selection handler - morph ball
JMP SetNewProjectileToBomb
org $90C028 ; also in HUD selection handler - morph ball
JMP SetNewProjectileToPowerBomb

org $90C0D7 ; in Charge bomb spread or reserve slot to fire bomb
JSR SetNewProjectileToBombSpread
CLC : RTS

org $90C541
JSR DoRShot
CLC : RTS

org $90DD05 ; HUD selection handler
dw $DD3D ; 0: Standing
dw $DD3D ; 1: Running
dw $DD3D ; 2: Normal jumping
dw $DD3D ; 3: Spin jumping
dw $BF9D ; 4: Morph ball - on ground
dw $DD3D ; 5: Crouching
dw $DD3D ; 6: Falling
dw $BF9D ; 7: Unused. Glitchy morph ball / spin jump
dw $BF9D ; 8: Morph ball - falling
dw $BF9D ; 9: Unused
dw $DD3D ; Ah: Knockback / crystal flash ending
dw $DD6F ; Bh: Unused
dw $DD6F ; Ch: Unused
dw $DDB6 ; Dh: Unused
dw $DD3D ; Eh: Turning around - on ground
dw $DD3D ; Fh: Crouching/standing/morphing/unmorphing transition
dw $DD3D ; 10h: Moonwalking
dw $BF9D ; 11h: Spring ball - on ground
dw $BF9D ; 12h: Spring ball - in air
dw $BF9D ; 13h: Spring ball - falling
dw $DD3D ; 14h: Wall jumping
dw $DD3D ; 15h: Ran into a wall
dw $DD6F ; 16h: Grappling
dw $DD3D ; 17h: Turning around - jumping
dw $DD3D ; 18h: Turning around - falling
dw $DD3D ; 19h: Damage boost
dw $DD3D ; 1Ah: Grabbed by Draygon
dw $DDB6 ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks

org $9181A9 ; in Determine prospective pose from transition table
;JMP PressingNothingCheck
BRA $02

org $9181F4 ; Translate custom controller bindings to default bindings
{
  ; d-pad
  LDA $8F : AND #$0F00 : EOR #$FFFF : STA $12
  LDA $8B : AND #$0F00 : EOR #$FFFF : STA $14
  ; newly pressed shoot
  LDA !NewProjectile : BNE +
  LDA $8F : BIT $09B2 : BNE +
  BIT $09B8 : BEQ ++
  +
    LDA #$0040 : TRB $12
    LDA $8F
  ++
  ; newly pressed jump
  BIT $09B4 : BEQ +
    LDA #$0080 : TRB $12
    LDA $8F
  +
  ; newly pressed aim
  BIT $09BE : BEQ +
    LDA #$0010 : TRB $12
  +
  ; pressing shoot
  LDA !NewProjectile : BNE +
  LDA $8B : BIT $09B2 : BNE +
  BIT $09B8 : BEQ ++
  +
    LDA #$0040 : TRB $14
    LDA $8B
  ++
  ; pressing jump
  BIT $09B4 : BEQ +
    LDA #$0080 : TRB $14
    LDA $8B
  +
  ; pressing aim
  BIT $09BE : BEQ +
    LDA #$0010 : TRB $14
  +
  RTS
}
CancelNewProjectile:
{
  STZ !NewProjectile
  LDA $0A23
  CLC : RTS
}
%padSafe($9182D9)

org 2*$A+$91F4A2 : dw CancelNewProjectile ; cancel new projectile when initing knockback pose
org $91F9F4 : JSR CancelNewProjectile ; morph ball init
org $91FA56 : JSR CancelNewProjectile ; spring ball init

;;; remove pose transition shot direction stuff
org $90BA5F ; in Initialise projectile position / direction
BRA + : org $90BA6C : +

org $90EB20 : BRA $01 ; in Reset movement and pose change variables

org $91F5CF : CLC : RTS ; in Initialise Samus pose - normal jumping

org $91F8F3 ; in Initialise Samus pose - turning around - on ground (for turning after moonwalk)
BRA + : org $91F906 : +
