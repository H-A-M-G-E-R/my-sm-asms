!NewProjectile = $0B5E ; see "shoot.asm"

!end   = $FF
!none  = $00
!up    = $08
!down  = $04
!left  = $02
!right = $01
!jump  = $80
!shoot = $40
!aim   = $10

org $9181A9 ; Determine prospective pose from transition table
{
  ;;; Translate custom controller bindings to default bindings
  ; d-pad
  LDA $90 : AND #$000F : EOR #$FFFF : STA $12
  LDA $8C : AND #$000F : EOR #$FFFF : STA $13
  ; newly pressed shoot
  LDA !NewProjectile : BNE +
  LDA $8F : BIT $09B2 : BNE +
  BIT $09B8 : BEQ ++
  +
    LDA.W #!shoot : TRB $12
    LDA $8F
  ++
  ; newly pressed jump
  BIT $09B4 : BEQ +
    LDA.W #!jump : TRB $12
    LDA $8F
  +
  ; newly pressed aim
  BIT $09BE : BEQ +
    LDA.W #!aim : TRB $12
  +
  ; pressing shoot
  LDA !NewProjectile : BNE +
  LDA $8B : BIT $09B2 : BNE +
  BIT $09B8 : BEQ ++
  +
    LDA.W #!shoot : TRB $13
    LDA $8B
  ++
  ; pressing jump
  BIT $09B4 : BEQ +
    LDA.W #!jump : TRB $13
    LDA $8B
  +
  ; pressing aim
  BIT $09BE : BEQ +
    LDA.W #!aim : TRB $13
  +
  ; lookup the transition table
  LDA $0A1C : ASL : TAX
  LDA.W TransitionTable,x : BPL .clcRts ; return carry clear if no transition table
  TAY
.loop
  ; check if inputs match
  LDA $0000,y : AND $12 : BEQ .found
  ; next input
  INY : INY : INY
  ; loop if not eot
  LDA $0000,y : AND #$00FF : CMP #$00FF : BNE .loop

  ; lookup failed
  JSL $9182D9 ; Handle transition table lookup failure
.clcRts
  CLC : RTS

.found
  LDA $0002,y : AND #$00FF : CMP $0A1C : BEQ .samePose
    STA $0A28 ; new prospective pose
    STZ $0A56 ; cancel bomb jump
  .samePose
  SEC : RTS
}
CancelNewProjectile: ; see "shoot.asm"
{
  STZ !NewProjectile
  LDA $0A23
  CLC : RTS
}
%padSafe($9182D9)

org $919EE2 ; transition table
TransitionTable:
dw Tr00, Tr01, Tr02, Tr03, Tr04, Tr05, Tr06, Tr07, Tr08, Tr09, Tr0A, Tr0B, Tr0C, Tr0D, Tr0E, Tr0F
dw Tr10, Tr11, Tr12, Tr13, Tr14, Tr15, Tr16, Tr17, Tr18, Tr19, Tr1A, Tr1B, Tr1C, Tr1D, Tr1E, Tr1F
dw    0,    0,    0,    0,    0, Tr25, Tr26, Tr27, Tr28, Tr29, Tr2A, Tr2B, Tr2C, Tr2D, Tr2E,    0
dw    0, Tr31, Tr32,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0
dw    0, Tr41,    0,    0,    0, Tr45, Tr46,    0,    0, Tr49, Tr4A,    0,    0, Tr4D, Tr4E, Tr4F
dw Tr50, Tr51, Tr52, Tr53, Tr54,    0,    0,    0,    0,    0,    0, Tr5B, Tr5C,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0, Tr67, Tr68, Tr69, Tr6A, Tr6B, Tr6C, Tr6D, Tr6E, Tr6F
dw Tr70, Tr71, Tr72, Tr73, Tr74, Tr75, Tr76, Tr77, Tr78, Tr79, Tr7A, Tr7B, Tr7C, Tr7D, Tr7E, Tr7F
dw Tr80, Tr81, Tr82, Tr83, Tr84, Tr85, Tr86,    0,    0, Tr89, Tr8A, Tr8B, Tr8C, Tr8D, Tr8E,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, Tr9B,    0,    0,    0,    0
dw    0,    0,    0,    0, TrA4, TrA5, TrA6, TrA7,    0,    0,    0,    0,    0,    0,    0,    0
dw    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, TrBA, TrBB, TrBC, TrBD, TrBE, TrBF
dw TrC0, TrC1, TrC2, TrC3, TrC4,    0,    0, TrC7, TrC8,    0,    0,    0,    0,    0,    0, TrCF
dw TrD0, TrD1, TrD2,    0,    0,    0,    0,    0,    0,    0,    0, TrDB, TrDC,    0,    0, TrDF
dw TrE0, TrE1, TrE2, TrE3, TrE4, TrE5, TrE6, TrE7,    0,    0,    0,    0, TrEC, TrED, TrEE, TrEF
dw TrF0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,    0

Tr03: ; 3: Facing right - aiming up
db !jump, !up, $55 ; facing right - normal jump transition - aiming up
db !jump, !aim, $57 ; facing right - normal jump transition - aiming up-right
db !jump, !none, $4B ; facing right - normal jump transition
db !down, !aim, $F3 ; facing right - crouching transition - aiming up-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!shoot|!aim, $76 ; facing right - moonwalk - aiming up-right
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !left, $25 ; facing right - turning - standing
db !none, !aim, $05 ; facing right - aiming up-right
db !none, !up, $03 ; facing right - aiming up
db !none, !right, $09 ; moving right - not aiming
db !end

Tr05: ; 5: Facing right - aiming up-right
db !jump, !up, $55 ; facing right - normal jump transition - aiming up
db !jump, !aim, $57 ; facing right - normal jump transition - aiming up-right
db !jump, !none, $4B ; facing right - normal jump transition
db !down, !aim, $07 ; facing right - aiming down-right
db !none, !left|!shoot|!aim, $76 ; facing right - moonwalk - aiming up-right
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !left, $25 ; facing right - turning - standing
db !none, !aim, $05 ; facing right - aiming up-right
db !none, !right, $09 ; moving right - not aiming
db !end

Tr07: ; 7: Facing right - aiming down-right
db !jump, !up, $55 ; facing right - normal jump transition - aiming up
db !jump, !aim, $59 ; facing right - normal jump transition - aiming down-right
db !jump, !none, $4B ; facing right - normal jump transition
db !down, !aim, $F5 ; facing right - crouching transition - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!shoot|!aim, $78 ; facing right - moonwalk - aiming down-right
db !none, !right|!aim, $11 ; moving right - aiming down-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $05 ; facing right - aiming up-right
db !none, !aim, $07 ; facing right - aiming down-right
db !none, !right, $09 ; moving right - not aiming
db !end

Tr71: ; 71h: Facing right - crouching - aiming up-right
db !up, !aim, $F9 ; facing right - standing transition - aiming up-right
db !up, !none, $3B ; facing right - standing transition
db !left, !none, $43 ; facing right - turning - crouching
db !down, !none, $73 ; facing right - crouching - aiming down-right
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !right, $01 ; facing right - normal
db !none, !aim, $71 ; facing right - crouching - aiming up-right
db !end

Tr73: ; 73h: Facing right - crouching - aiming down-right
db !up, !aim, $71 ; facing right - crouching - aiming up-right
db !up, !none, $3B ; facing right - standing transition
db !left, !none, $43 ; facing right - turning - crouching
db !down, !none, $37 ; facing right - morphing transition
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !right, $01 ; facing right - normal
db !none, !aim, $73 ; facing right - crouching - aiming down-right
db !end

Tr04: ; 4: Facing left  - aiming up
db !jump, !up, $56 ; facing left  - normal jump transition - aiming up
db !jump, !aim, $58 ; facing left  - normal jump transition - aiming up-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !down, !aim, $F4 ; facing left  - crouching transition - aiming up-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!shoot|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !aim, $06 ; facing left  - aiming up-left
db !none, !up, $04 ; facing left  - aiming up
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr06: ; 6: Facing left  - aiming up-left
db !jump, !up, $56 ; facing left  - normal jump transition - aiming up
db !jump, !aim, $58 ; facing left  - normal jump transition - aiming up-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !down, !aim, $08 ; facing left  - aiming down-left
db !none, !right|!shoot|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !aim, $06 ; facing left  - aiming up-left
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr08: ; 8: Facing left  - aiming down-left
db !jump, !up, $56 ; facing left  - normal jump transition - aiming up
db !jump, !aim, $5A ; facing left  - normal jump transition - aiming down-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !down, !aim, $F6 ; facing left  - crouching transition - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!shoot|!aim, $77 ; facing left  - moonwalk - aiming down-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left|!aim, $12 ; moving left  - aiming down-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !up, $06 ; facing left  - aiming up-left
db !none, !aim, $08 ; facing left  - aiming down-left
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr72: ; 72h: Facing left  - crouching - aiming up-left
db !up, !aim, $FA ; facing left  - standing transition - aiming up-left
db !up, !none, $3C ; facing left  - standing transition
db !right, !none, $44 ; facing left  - turning - crouching
db !down, !none, $74 ; facing left  - crouching - aiming down-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !left, $02 ; facing left  - normal
db !none, !aim, $72 ; facing left  - crouching - aiming up-left
db !end

Tr74: ; 74h: Facing left  - crouching - aiming down-left
db !up, !aim, $72 ; facing left  - crouching - aiming up-left
db !up, !none, $3C ; facing left  - standing transition
db !right, !none, $44 ; facing left  - turning - crouching
db !down, !none, $38 ; facing left  - morphing transition
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !left, $02 ; facing left  - normal
db !none, !aim, $74 ; facing left  - crouching - aiming down-left
db !end

Tr0F: ; Fh: Moving right - aiming up-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !up|!aim, $0F ; moving right - aiming up-right
db !none, !up, $03 ; Facing right - aiming up (this edit makes the zazabi fight easier)
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !down|!right|!aim, $11 ; moving right - aiming down-right
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !down, $11 ; moving right - aiming down-right
db !none, !right, $0B ; moving right - gun extended
db !none, !left, $25 ; facing right - turning - standing
db !none, !aim, $05 ; facing right - aiming up-right
db !end

Tr11: ; 11h: Moving right - aiming down-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !up|!right|!aim, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !down|!right|!aim, $11 ; moving right - aiming down-right
db !none, !right|!aim, $11 ; moving right - aiming down-right
db !none, !up|!aim, $0F ; moving right - aiming up-right
db !none, !down, $F5 ; facing right - crouching transition - aiming down-right
db !none, !right, $0B ; moving right - gun extended
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aim, $07 ; facing right - aiming down-right
db !end

Tr10: ; 10h: Moving left  - aiming up-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !up|!aim, $10 ; moving left  - aiming up-left
db !none, !up, $04 ; Facing left - aiming up
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !down|!left|!aim, $12 ; moving left  - aiming down-left
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !down, $12 ; moving left  - aiming down-left
db !none, !left, $0C ; moving left  - gun extended
db !none, !right, $26 ; facing left  - turning - standing
db !none, !aim, $06 ; facing left  - aiming up-left
db !end

Tr12: ; 12h: Moving left  - aiming down-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !up|!left|!aim, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !down|!left|!aim, $12 ; moving left  - aiming down-left
db !none, !left|!aim, $12 ; moving left  - aiming down-left
db !none, !up|!aim, $10 ; moving left  - aiming up-left
db !none, !down, $F6 ; facing left  - crouching transition - aiming down-left
db !none, !left, $0C ; moving left  - gun extended
db !none, !right, $26 ; facing left  - turning - standing
db !none, !up, $04 ; facing left  - aiming up
db !none, !aim, $08 ; facing left  - aiming down-left
db !end

TrDB: ; DBh: Unused
TrDC: ; DCh: Unused
db !none, !right, $DE ; unused
db !none, !left, $DD ; unused
db !end

Tr00: ; 0: Facing forward - power suit
Tr9B: ; 9Bh: Facing forward - varia/gravity suit
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left, $25 ; facing right - turning - standing
db !end

TrE4: ; E4h: Facing right - landing from normal jump - aiming down-right
db !none, !aim, $07 ; facing right - aiming down-right

Tr01: ; 1: Facing right - normal
TrA4: ; A4h: Facing right - landing from normal jump
TrA6: ; A6h: Facing right - landing from spin jump
TrE0: ; E0h: Facing right - landing from normal jump - aiming up
TrE2: ; E2h: Facing right - landing from normal jump - aiming up-right
TrE6: ; E6h: Facing right - landing from normal jump - firing
db !jump, !up, $55 ; facing right - normal jump transition - aiming up
db !jump, !aim, $57 ; facing right - normal jump transition - aiming up-right
db !jump, !none, $4B ; facing right - normal jump transition
db !down, !aim, $F3 ; facing right - crouching transition - aiming up-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!shoot|!aim, $76 ; facing right - moonwalk - aiming up-right
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aim, $05 ; facing right - aiming up-right
db !none, !right, $09 ; moving right - not aiming
db !end

TrE5: ; E5h: Facing left  - landing from normal jump - aiming down-left
db !none, !aim, $08 ; facing left  - aiming down-left

Tr02: ; 2: Facing left  - normal
TrA5: ; A5h: Facing left  - landing from normal jump
TrA7: ; A7h: Facing left  - landing from spin jump
TrE1: ; E1h: Facing left  - landing from normal jump - aiming up
TrE3: ; E3h: Facing left  - landing from normal jump - aiming up-left
TrE7: ; E7h: Facing left  - landing from normal jump - firing
db !jump, !up, $56 ; facing left  - normal jump transition - aiming up
db !jump, !aim, $58 ; facing left  - normal jump transition - aiming up-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !down, !aim, $F4 ; facing left  - crouching transition - aiming up-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!shoot|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !up, $04 ; facing left  - aiming up
db !none, !aim, $06 ; facing left  - aiming up-left
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr09: ; 9: Moving right - not aiming
Tr0D: ; Dh: Moving right - aiming up (unused)
Tr5B: ; 5Bh: Facing right - skidding
db !jump, !none, $19 ; facing right - spin jump
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !down, $35 ; facing right - crouching transition
db !none, !right|!shoot, $0B ; moving right - gun extended
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aim, $05 ; facing right - aiming up-right
db !end

Tr0A: ; Ah: Moving left  - not aiming
Tr0E: ; Eh: Moving left  - aiming up (unused)
Tr5C: ; 5Bh: Facing left - skidding
db !jump, !none, $1A ; facing left  - spin jump
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !down, $36 ; facing left  - crouching transition
db !none, !left|!shoot, $0C ; moving left  - gun extended
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !none, !up, $04 ; facing left  - aiming up
db !none, !aim, $06 ; facing left  - aiming up-left
db !end

Tr0B: ; Bh: Moving right - gun extended
db !jump, !none, $19 ; facing right - spin jump
db !none, !right|!aim, $0F ; moving right - aiming up-right
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !none, !down, $35 ; facing right - crouching transition
db !none, !right, $0B ; moving right - gun extended
db !none, !left, $25 ; facing right - turning - standing
db !none, !up, $03 ; facing right - aiming up
db !none, !aim, $05 ; facing right - aiming up-right
db !end

Tr0C: ; Ch: Moving left  - gun extended
db !jump, !none, $1A ; facing left  - spin jump
db !none, !left|!aim, $10 ; moving left  - aiming up-left
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !none, !down, $36 ; facing left  - crouching transition
db !none, !left, $0C ; moving left  - gun extended
db !none, !right, $26 ; facing left  - turning - standing
db !none, !up, $04 ; facing left  - aiming up
db !none, !aim, $06 ; facing left  - aiming up-left
db !end

Tr13: ; 13h: Facing right - normal jump - not aiming - not moving - gun extended
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aim, $69 ; facing right - normal jump - aiming up-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr14: ; 14h: Facing left  - normal jump - not aiming - not moving - gun extended
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !up|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr15: ; 15h: Facing right - normal jump - aiming up
Tr4D: ; 4Dh: Facing right - normal jump - not aiming - not moving - gun not extended
Tr51: ; 51h: Facing right - normal jump - not aiming - moving forward
Tr69: ; 69h: Facing right - normal jump - aiming up-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aim, $69 ; facing right - normal jump - aiming up-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4D ; facing right - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr6B: ; 6Bh: Facing right - normal jump - aiming down-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4D ; facing right - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr16: ; 16h: Facing left  - normal jump - aiming up
Tr4E: ; 4Eh: Facing left  - normal jump - not aiming - not moving - gun not extended
Tr52: ; 52h: Facing left  - normal jump - not aiming - moving forward
Tr6A: ; 6Ah: Facing left  - normal jump - aiming up-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !up|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4E ; facing left  - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr6C: ; 6Ch: Facing left  - normal jump - aiming down-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !up|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $4E ; facing left  - normal jump - not aiming - not moving - gun not extended
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr17: ; 17h: Facing right - normal jump - aiming down
db !jump, !none, $19 ; facing right - spin jump
db !down, !none, $37 ; facing right - morphing transition
db !none, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right|!jump|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !left, $2F ; facing right - turning - jumping
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down, $17 ; facing right - normal jump - aiming down
db !none, !aim, $6B ; facing right - normal jump - aiming down-right
db !none, !right, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !jump, $17 ; facing right - normal jump - aiming down
db !none, !shoot, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !end

Tr18: ; 18h: Facing left  - normal jump - aiming down
db !jump, !none, $1A ; facing left  - spin jump
db !down, !none, $38 ; facing left  - morphing transition
db !none, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !none, !up|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left|!jump|!aim, $6A ; facing left  - normal jump - aiming up-left
db !none, !right, $30 ; facing left  - turning - jumping
db !none, !up, $16 ; facing left  - normal jump - aiming up
db !none, !down, $18 ; facing left  - normal jump - aiming down
db !none, !aim, $6C ; facing left  - normal jump - aiming down-left
db !none, !left, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !jump|!shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !jump, $18 ; facing left  - normal jump - aiming down
db !none, !shoot, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !end

Tr19: ; 19h: Facing right - spin jump
db !shoot, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !shoot, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !shoot, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !shoot, !aim, $69 ; facing right - normal jump - aiming up-right
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !right, $19 ; facing right - spin jump
db !none, !left, $1A ; facing left  - spin jump
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !end

Tr1A: ; 1Ah: Facing left  - spin jump
db !shoot, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !aim, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !left, $1A ; facing left  - spin jump
db !none, !right, $19 ; facing right - spin jump
db !none, !up|!aim, $6A ; facing left - normal jump - aiming up-right
db !none, !up, $16 ; facing left - normal jump - aiming up
db !none, !down|!aim, $6C ; facing left - normal jump - aiming down-right
db !none, !down, $18 ; facing left - normal jump - aiming down
db !end

Tr1B: ; 1Bh: Facing right - space jump
db !shoot, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !shoot, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !shoot, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !shoot, !aim, $69 ; facing right - normal jump - aiming up-right
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !right, $1B ; facing right - space jump
db !none, !left, $1C ; facing left  - space jump
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !end

Tr1C: ; 1Ch: Facing left  - space jump
db !shoot, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !aim, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !left, $1C ; facing left  - space jump
db !none, !right, $1B ; facing right - space jump
db !none, !up|!aim, $6A ; facing left - normal jump - aiming up-right
db !none, !up, $16 ; facing left - normal jump - aiming up
db !none, !down|!aim, $6C ; facing left - normal jump - aiming down-right
db !none, !down, $18 ; facing left - normal jump - aiming down
db !end

Tr1D: ; 1Dh: Facing right - morph ball - no springball - on ground
Tr1E: ; 1Eh: Moving right - morph ball - no springball - on ground
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $3D ; facing right - unmorphing transition

Tr1F: ; 1Fh: Moving left  - morph ball - no springball - on ground
Tr41: ; 41h: Facing left  - morph ball - no springball - on ground
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $1E ; moving right - morph ball - no springball - on ground
db !none, !left, $1F ; moving left  - morph ball - no springball - on ground
db !end

Tr25: ; 25h: Facing right - turning - standing
db !none, !left|!jump, $1A ; facing left  - spin jump
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr26: ; 26h: Facing left  - turning - standing
db !none, !right|!jump, $19 ; facing right - spin jump
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr27: ; 27h: Facing right - crouching
Tr85: ; 85h: Facing right - crouching - aiming up
db !up, !aim, $F9 ; facing right - standing transition - aiming up-right
db !up, !none, $3B ; facing right - standing transition
db !left, !none, $43 ; facing right - turning - crouching
db !down, !none, $37 ; facing right - morphing transition
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !right, $01 ; facing right - normal
db !none, !aim, $71 ; facing right - crouching - aiming up-right
db !end

Tr28: ; 28h: Facing left  - crouching
Tr86: ; 86h: Facing left  - crouching - aiming up
db !up, !aim, $FA ; facing left  - standing transition - aiming up-left
db !up, !none, $3C ; facing left  - standing transition
db !right, !none, $44 ; facing left  - turning - crouching
db !down, !none, $38 ; facing left  - morphing transition
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !left, $02 ; facing left  - normal
db !none, !aim, $72 ; facing left  - crouching - aiming up-left
db !end

Tr29: ; 29h: Facing right - falling
Tr2B: ; 2Bh: Facing right - falling - aiming up
Tr6D: ; 6Dh: Facing right - falling - aiming up-right
Tr6F: ; 6Fh: Facing right - falling - aiming down-right
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !up|!aim, $6D ; facing right - falling - aiming up-right
db !none, !down|!aim, $6F ; facing right - falling - aiming down-right
db !none, !left, $87 ; facing right - turning - falling
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !aim, $6D ; facing right - falling - aiming up-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $29 ; facing right - falling
db !end

Tr2A: ; 2Ah: Facing left  - falling
Tr2C: ; 2Ch: Facing left  - falling - aiming up
Tr6E: ; 6Eh: Facing left  - falling - aiming up-left
Tr70: ; 70h: Facing left  - falling - aiming down-left
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !up|!aim, $6E ; facing left  - falling - aiming up-left
db !none, !down|!aim, $70 ; facing left  - falling - aiming down-left
db !none, !right, $88 ; facing left  - turning - falling
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !aim, $6E ; facing left  - falling - aiming up-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $2A ; facing left  - falling
db !end

Tr2D: ; 2Dh: Facing right - falling - aiming down
db !jump, !none, $19 ; facing right - spin jump
db !down, !none, $37 ; facing right - morphing transition
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !up|!aim, $6D ; facing right - falling - aiming up-right
db !none, !down|!aim, $6F ; facing right - falling - aiming down-right
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !left, $87 ; facing right - turning - falling
db !none, !aim, $6F ; facing right - falling - aiming down-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $29 ; facing right - falling
db !end

Tr2E: ; 2Eh: Facing left  - falling - aiming down
db !jump, !none, $1A ; facing left  - spin jump
db !down, !none, $38 ; facing left  - morphing transition
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !up|!aim, $6E ; facing left  - falling - aiming up-left
db !none, !down|!aim, $70 ; facing left  - falling - aiming down-left
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !right, $88 ; facing left  - turning - falling
db !none, !aim, $70 ; facing left  - falling - aiming down-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $2A ; facing left  - falling
db !end

Tr31: ; 31h: Facing right - morph ball - no springball - in air
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $3D ; facing right - unmorphing transition

Tr32: ; 32h: Facing left  - morph ball - no springball - in air
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $31 ; facing right - morph ball - no springball - in air
db !none, !left, $32 ; facing left  - morph ball - no springball - in air
db !end

Tr45: ; 45h: Unused
db !none, !left|!shoot, $45 ; unused
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr46: ; 46h: Unused
db !none, !right|!shoot, $46 ; unused
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr49: ; 49h: Facing left  - moonwalk
Tr75: ; 75h: Facing left  - moonwalk - aiming up-left
db !none, !down|!shoot|!aim, $77 ; facing left  - moonwalk - aiming down-left
db !none, !down, $36 ; facing left  - crouching transition
db !jump, !none, $C0 ; facing left  - moonwalking - turn/jump right
db !none, !right|!shoot|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr77: ; 77h: Facing left  - moonwalk - aiming down-left
db !none, !up|!shoot|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !down, $36 ; facing left  - crouching transition
db !jump, !none, $C0 ; facing left  - moonwalking - turn/jump right
db !none, !right|!shoot|!aim, $77 ; facing left  - moonwalk - aiming down-left
db !none, !right|!shoot, $49 ; facing left  - moonwalk
db !none, !left, $0A ; moving left  - not aiming
db !none, !right, $26 ; facing left  - turning - standing
db !end

Tr4A: ; 4Ah: Facing right - moonwalk
Tr76: ; 76h: Facing right - moonwalk - aiming up-right
db !none, !down|!shoot|!aim, $78 ; facing right - moonwalk - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !jump, !none, $BF ; facing right - moonwalking - turn/jump left
db !none, !left|!shoot|!aim, $76 ; facing right - moonwalk - aiming up-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr78: ; 78h: Facing right - moonwalk - aiming down-right
db !none, !up|!shoot|!aim, $76 ; facing right - moonwalk - aiming up-right
db !down, !none, $35 ; facing right - crouching transition
db !jump, !none, $BF ; facing right - moonwalking - turn/jump left
db !none, !left|!shoot|!aim, $78 ; facing right - moonwalk - aiming down-right
db !none, !left|!shoot, $4A ; facing right - moonwalk
db !none, !right, $09 ; moving right - not aiming
db !none, !left, $25 ; facing right - turning - standing
db !end

Tr4F: ; 4Fh: Facing left  - damage boost
db !none, !left|!jump, $52 ; facing left  - normal jump - not aiming - moving forward
db !none, !right|!jump, $4F ; facing left  - damage boost
db !none, !jump, $4E ; facing left  - normal jump - not aiming - not moving - gun not extended
db !end

Tr50: ; 50h: Facing right - damage boost
db !none, !left|!jump, $50 ; facing right - damage boost
db !none, !right|!jump, $51 ; facing right - normal jump - not aiming - moving forward
db !none, !jump, $4D ; facing right - normal jump - not aiming - not moving - gun not extended
db !end

Tr53: ; 53h: Facing right - knockback
db !none, !left|!jump, $50 ; facing right - damage boost
db !end

Tr54: ; 54h: Facing left  - knockback
db !none, !right|!jump, $4F ; facing left  - damage boost
db !end

Tr67: ; 67h: Facing right - falling - gun extended
db !jump, !none, $19 ; facing right - spin jump
db !none, !up|!right, $6D ; facing right - falling - aiming up-right
db !none, !down|!right, $6F ; facing right - falling - aiming down-right
db !none, !up, $2B ; facing right - falling - aiming up
db !none, !down, $2D ; facing right - falling - aiming down
db !none, !left, $87 ; facing right - turning - falling
db !none, !aim, $6D ; facing right - falling - aiming up-right
db !none, !shoot, $67 ; facing right - falling - gun extended
db !none, !right, $67 ; facing right - falling - gun extended
db !end

Tr68: ; 68h: Facing left  - falling - gun extended
db !jump, !none, $1A ; facing left  - spin jump
db !none, !up|!left, $6E ; facing left  - falling - aiming up-left
db !none, !down|!left, $70 ; facing left  - falling - aiming down-left
db !none, !up, $2C ; facing left  - falling - aiming up
db !none, !down, $2E ; facing left  - falling - aiming down
db !none, !right, $88 ; facing left  - turning - falling
db !none, !aim, $6E ; facing left  - falling - aiming up-left
db !none, !shoot, $68 ; facing left  - falling - gun extended
db !none, !left, $68 ; facing left  - falling - gun extended
db !end

Tr79: ; 79h: Facing right - morph ball - spring ball - on ground
Tr7B: ; 7Bh: Moving right - morph ball - spring ball - on ground
db !up, !none, $3D ; facing right - unmorphing transition
db !jump, !none, $7F ; facing right - morph ball - spring ball - in air

Tr7A: ; 7Ah: Facing left  - morph ball - spring ball - on ground
Tr7C: ; 7Ch: Moving left  - morph ball - spring ball - on ground
db !up, !none, $3E ; facing left  - unmorphing transition
db !jump, !none, $80 ; facing left  - morph ball - spring ball - in air
db !none, !right, $7B ; moving right - morph ball - spring ball - on ground
db !none, !left, $7C ; moving left  - morph ball - spring ball - on ground
db !end

Tr7D: ; 7Dh: Facing right - morph ball - spring ball - falling
db !up, !none, $3D ; facing right - unmorphing transition

Tr7E: ; 7Eh: Facing left  - morph ball - spring ball - falling
db !up, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $7D ; facing right - morph ball - spring ball - falling
db !none, !left, $7E ; facing left  - morph ball - spring ball - falling
db !end

Tr7F: ; 7Fh: Facing right - morph ball - spring ball - in air
db !up, !none, $3D ; facing right - unmorphing transition

Tr80: ; 80h: Facing left  - morph ball - spring ball - in air
db !up, !none, $3E ; facing left  - unmorphing transition
db !none, !right, $7F ; facing right - morph ball - spring ball - in air
db !none, !left, $80 ; facing left  - morph ball - spring ball - in air
db !end

Tr81: ; 81h: Facing right - screw attack
db !shoot, !down|!right, $6B ; facing right - normal jump - aiming down-right
db !shoot, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !shoot, !up|!right, $69 ; facing right - normal jump - aiming up-right
db !shoot, !aim, $69 ; facing right - normal jump - aiming up-right
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !none, !right, $81 ; facing right - screw attack
db !none, !left, $82 ; facing left  - screw attack
db !none, !up|!aim, $69 ; facing right - normal jump - aiming up-right
db !none, !up, $15 ; facing right - normal jump - aiming up
db !none, !down|!aim, $6B ; facing right - normal jump - aiming down-right
db !none, !down, $17 ; facing right - normal jump - aiming down
db !end

Tr82: ; 82h: Facing left  - screw attack
db !shoot, !down|!left, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !down|!aim, $6C ; facing left  - normal jump - aiming down-left
db !shoot, !up|!left, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !aim, $6A ; facing left  - normal jump - aiming up-left
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !none, !left, $82 ; facing left  - screw attack
db !none, !right, $81 ; facing right - screw attack
db !none, !up|!aim, $6A ; facing left - normal jump - aiming up-right
db !none, !up, $16 ; facing left - normal jump - aiming up
db !none, !down|!aim, $6C ; facing left - normal jump - aiming down-right
db !none, !down, $18 ; facing left - normal jump - aiming down
db !end

Tr83: ; 83h: Facing right - wall jump
db !shoot, !none, $13 ; facing right - normal jump - not aiming - not moving - gun extended
db !down, !none, $37 ; facing right - morphing transition
db !none, !left, $1A ; facing left  - spin jump
db !none, !jump, $83 ; facing right - wall jump
db !end

Tr84: ; 84h: Facing left  - wall jump
db !shoot, !none, $14 ; facing left  - normal jump - not aiming - not moving - gun extended
db !down, !none, $38 ; facing left  - morphing transition
db !none, !right, $19 ; facing right - spin jump
db !none, !jump, $84 ; facing left  - wall jump
db !end

Tr89: ; 89h: Facing right - ran into a wall
TrCF: ; CFh: Facing right - ran into a wall - aiming up-right
TrD1: ; D1h: Facing right - ran into a wall - aiming down-right
db !jump, !none, $4B ; facing right - normal jump transition
db !none, !up|!right, $0F ; moving right - aiming up-right
db !none, !down|!right, $11 ; moving right - aiming down-right
db !down, !none, $35 ; facing right - crouching transition
db !none, !left|!aim, $76 ; facing right - moonwalk - aiming up-right
db !none, !up, $03 ; facing right - aiming up
db !none, !aim, $05 ; facing right - aiming up-right
db !none, !left, $25 ; facing right - turning - standing
db !none, !right, $09 ; moving right - not aiming
db !end

Tr8A: ; 8Ah: Facing left  - ran into a wall
TrD0: ; D0h: Facing left  - ran into a wall - aiming up-left
TrD2: ; D2h: Facing left  - ran into a wall - aiming down-left
db !jump, !none, $4C ; facing left  - normal jump transition
db !none, !up|!left, $10 ; moving left  - aiming up-left
db !none, !down|!left, $12 ; moving left  - aiming down-left
db !down, !none, $36 ; facing left  - crouching transition
db !none, !right|!aim, $75 ; facing left  - moonwalk - aiming up-left
db !none, !up, $04 ; facing left  - aiming up
db !none, !aim, $06 ; facing left  - aiming up-left
db !none, !right, $26 ; facing left  - turning - standing
db !none, !left, $0A ; moving left  - not aiming
db !end

Tr8B: ; 8Bh: Facing right - turning - standing - aiming up
Tr8D: ; 8Dh: Facing right - turning - standing - aiming down-right
TrBF: ; BFh: Facing right - moonwalking - turn/jump left
TrC1: ; C1h: Facing right - moonwalking - turn/jump left  - aiming up-right
TrC3: ; C3h: Facing right - moonwalking - turn/jump left  - aiming down-right
db !jump, !left, $1A ; facing left  - spin jump
db !jump, !none, $4C ; facing left  - normal jump transition
db !end

Tr8C: ; 8Ch: Facing left  - turning - standing - aiming up
Tr8E: ; 8Eh: Facing left  - turning - standing - aiming down-left
TrC0: ; C0h: Facing left  - moonwalking - turn/jump right
TrC2: ; C2h: Facing left  - moonwalking - turn/jump right - aiming up-left
TrC4: ; C4h: Facing left  - moonwalking - turn/jump right - aiming down-left
db !jump, !right, $19 ; facing right - spin jump
db !jump, !none, $4B ; facing right - normal jump transition
db !end

TrBA: ; BAh: Facing left  - grabbed by Draygon - not moving - not aiming
TrBB: ; BBh: Facing left  - grabbed by Draygon - not moving - aiming up-left
TrBC: ; BCh: Facing left  - grabbed by Draygon - firing
TrBD: ; BDh: Facing left  - grabbed by Draygon - not moving - aiming down-left
TrBE: ; BEh: Facing left  - grabbed by Draygon - moving
db !none, !up|!left|!shoot, $BB ; facing left  - grabbed by Draygon - not moving - aiming up-left
db !none, !down|!left|!shoot, $BD ; facing left  - grabbed by Draygon - not moving - aiming down-left
db !none, !shoot, $BC ; facing left  - grabbed by Draygon - firing
db !none, !left, $BE ; facing left  - grabbed by Draygon - moving
db !none, !right, $BE ; facing left  - grabbed by Draygon - moving
db !none, !up, $BE ; facing left  - grabbed by Draygon - moving
db !none, !down, $BE ; facing left  - grabbed by Draygon - moving
db !end

TrC7: ; C7h: Facing right - vertical shinespark windup
db !none, !aim|!left, $CE ; facing left  - shinespark - diagonal
db !none, !aim, $CD ; facing right - shinespark - diagonal
db !none, !up|!left, $CE ; facing left  - shinespark - diagonal
db !none, !up|!right, $CD ; facing right - shinespark - diagonal
db !none, !up, $CB ; facing right - shinespark - vertical
db !none, !left, $CA ; facing left  - shinespark - horizontal
db !none, !right, $C9 ; facing right - shinespark - horizontal
db !end

TrC8: ; C8h: Facing left  - vertical shinespark windup
db !none, !aim|!right, $CD ; facing right - shinespark - diagonal
db !none, !aim, $CE ; facing left  - shinespark - diagonal
db !none, !up|!right, $CD ; facing right - shinespark - diagonal
db !none, !up|!left, $CE ; facing left  - shinespark - diagonal
db !none, !up, $CC ; facing left  - shinespark - vertical
db !none, !right, $C9 ; facing right - shinespark - horizontal
db !none, !left, $CA ; facing left  - shinespark - horizontal
db !end

TrDF: ; DFh: Unused
db !up, !none, $DE ; unused
db !end

TrEC: ; ECh: Facing right - grabbed by Draygon - not moving - not aiming
TrED: ; EDh: Facing right - grabbed by Draygon - not moving - aiming up-right
TrEE: ; EEh: Facing right - grabbed by Draygon - firing
TrEF: ; EFh: Facing right - grabbed by Draygon - not moving - aiming down-right
TrF0: ; F0h: Facing right - grabbed by Draygon - moving
db !none, !up|!right|!shoot, $ED ; facing right - grabbed by Draygon - not moving - aiming up-right
db !none, !down|!right|!shoot, $EF ; facing right - grabbed by Draygon - not moving - aiming down-right
db !none, !shoot, $EE ; facing right - grabbed by Draygon - firing
db !none, !left, $F0 ; facing right - grabbed by Draygon - moving
db !none, !right, $F0 ; facing right - grabbed by Draygon - moving
db !none, !up, $F0 ; facing right - grabbed by Draygon - moving
db !none, !down, $F0 ; facing right - grabbed by Draygon - moving
db !end

DoShootAnim:
{
  LDA !NewProjectile : BEQ .ret ; return if no new projectile

  ; scan through list for shooting anims
  LDX #$0000
.loop
  LDA.W .list,x : BEQ .ret ; branch if terminator
  AND #$00FF : CMP $0A1C : BEQ .found
  INX : INX : BRA .loop

.found
  ; set shoot anim frame
  LDA.W .list+1,x : AND #$00FF : STA $0A9A
  LDA $0A20 : PHA : STZ $0A20
  JSL $91FB08
  PLA : STA $0A20
.ret
  ; restore from hijack
  STZ $0DC6 : PLB : PLP : RTL

.list
  db $01, $04 ; 1: Facing right - normal
  db $02, $04 ; 2: Facing left - normal
  ;db $03, $04 ; 3: Facing right - aiming up
  ;db $04, $04 ; 4: Facing left  - aiming up
  ;db $05, $04 ; 5: Facing right - aiming up-right
  ;db $06, $04 ; 6: Facing left  - aiming up-left
  ;db $07, $04 ; 7: Facing right - aiming down-right
  ;db $08, $04 ; 8: Facing left  - aiming down-left
  dw $0000
}

%padSafe($91AFE4)

org $91EC10 : JMP DoShootAnim
org $90A3AD : BRA + : org $90A3CA : +
