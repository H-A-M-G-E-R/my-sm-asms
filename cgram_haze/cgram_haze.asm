; Scrolling CGRAM Haze, by H A M
; Adds a haze HDMA object that writes to CGRAM, scrolls,
; and works with power bombs, X-ray and BG3 tilemaps such as lava.
; Uses only one HDMA channel.

; Requires cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842).
lorom

; HDMA object variables
!CGRAMHazePrevLayerPointerOffset = $1914
!CGRAMHazePrevLayerThickness = $1920
!CGRAMHazeDetermineYScrollFunction = $192C
!CGRAMHazeVar0 = $1938
!CGRAMHazeVar1 = $1944 ; not cleared when spawned
!CGRAMHazeVar2 = $1950 ; not cleared when spawned

!CGRAMHazeHDMAThresholds = $7E9D00
!CGRAMHazeHDMATable = $7E9DDA ; $300*2/7

function rgb555(r,g,b) = r|(g<<5)|(b<<10)

;;; Examples ;;;

; init asms

org $8FFE00
SpawnExampleHaze1:
{
  LDA.w #ExampleHaze1 : STA $00
  LDA.w #ExampleHaze1>>8 : STA $01
  JSL SpawnCGRAMHazeHDMAObject
  LDA.w #CGRAMHazeDetermineYScroll_Layer1 : STA !CGRAMHazeDetermineYScrollFunction,x
  RTS
}

org $8FFE20
SpawnExampleLavaHaze:
{
  LDA.w #ExampleLavaHaze : STA $00
  LDA.w #ExampleLavaHaze>>8 : STA $01
  JSL SpawnCGRAMHazeHDMAObject
  LDA.w #CGRAMHazeDetermineYScroll_LavaAcid : STA !CGRAMHazeDetermineYScrollFunction,x
  RTS
}

; data

; cgram haze hdma tables can be in any bank
; scanline count for each layer must not exceed 80h
; no repeat mode (81h..FFh)
%BEGIN_FREESPACE(85)
ExampleHaze1:
{
  db $5F : dw $1B00, rgb555(8,0,0) ; palette 1 color Bh
  db $60 : dw $1B00, rgb555(8,0,0)
  db $50 : dw $1B00, rgb555(8,8,0)
  db $40 : dw $1B00, rgb555(0,8,0)
  db $30 : dw $1B00, rgb555(0,8,8)
  db $20 : dw $1B00, rgb555(0,0,8)
  db $10 : dw $1B00, rgb555(8,0,8)
  db $01 : dw $1B00, rgb555(8,0,0)
  db $00
}

ExampleLavaHaze:
{
  db $80 : dw $1B00, rgb555(0,0,0)
  db $70 : dw $1B00, rgb555(0,0,0)
  db $01 : dw $1B00, rgb555($1F*1/16, $0B*1/16, $03*1/16)
  db $01 : dw $1B00, rgb555($1F*2/16, $0B*2/16, $03*2/16)
  db $01 : dw $1B00, rgb555($1F*3/16, $0B*3/16, $03*3/16)
  db $01 : dw $1B00, rgb555($1F*4/16, $0B*4/16, $03*4/16)
  db $01 : dw $1B00, rgb555($1F*5/16, $0B*5/16, $03*5/16)
  db $01 : dw $1B00, rgb555($1F*6/16, $0B*6/16, $03*6/16)
  db $01 : dw $1B00, rgb555($1F*7/16, $0B*7/16, $03*7/16)
  db $01 : dw $1B00, rgb555($1F*8/16, $0B*8/16, $03*8/16)
  db $01 : dw $1B00, rgb555($1F*9/16, $0B*9/16, $03*9/16)
  db $01 : dw $1B00, rgb555($1F*10/16, $0B*10/16, $03*10/16)
  db $01 : dw $1B00, rgb555($1F*11/16, $0B*11/16, $03*11/16)
  db $01 : dw $1B00, rgb555($1F*12/16, $0B*12/16, $03*12/16)
  db $01 : dw $1B00, rgb555($1F*13/16, $0B*13/16, $03*13/16)
  db $01 : dw $1B00, rgb555($1F*14/16, $0B*14/16, $03*14/16)
  db $01 : dw $1B00, rgb555($1F*15/16, $0B*15/16, $03*15/16)
  db $01 : dw $1B00, rgb555($1F*16/16, $0B*16/16, $03*16/16)
  db $00
}
%END_FREESPACE(85)

;;; Code ;;;

org $82E6EB : BRA + : org $82E6FF : + ; skip clearing of $7E:9C00..9FFF after door transition (after setup asm for some reason)

%BEGIN_FREESPACE(85) ; any lorom bank ($80..BF)
SpawnCGRAMHazeHDMAObject:
{
  PHP : REP #$30
  PHB : PEA $7E7E : PLB : PLB

  ; copy table
  LDY #$0000
  .loop
    LDA [$00],y : STA.w !CGRAMHazeHDMATable+10,y ; scanline count
    AND #$00FF : BEQ .break
    INY : LDA [$00],y : STA.w !CGRAMHazeHDMATable+10,y ; index
    INY : INY : LDA [$00],y : STA.w !CGRAMHazeHDMATable+10,y ; color
    INY : INY : BRA .loop
  .break
  ; copy first so negative y scroll values work
  LDA #$0080 : STA.w !CGRAMHazeHDMATable+0 : STA.w !CGRAMHazeHDMATable+5
  LDA.w !CGRAMHazeHDMATable+11 : STA.w !CGRAMHazeHDMATable+1 : STA.w !CGRAMHazeHDMATable+6
  LDA.w !CGRAMHazeHDMATable+13 : STA.w !CGRAMHazeHDMATable+3 : STA.w !CGRAMHazeHDMATable+8

  ; thresholds
  LDX #$0000 : TXY
  LDA.w #-$100 : STA $03 ; start at y scroll = -100h
  CLC
  .loop2
    LDA.w !CGRAMHazeHDMATable,y : AND #$00FF : BEQ .break2
    ADC $03 : STA $03 : STA !CGRAMHazeHDMAThresholds,x
    TYA : CLC : ADC #$0005 : TAY
    INX : INX : BRA .loop2
  .break2
  LDA #$7FFF : STA !CGRAMHazeHDMAThresholds-2,x ; terminator

  ; spawn HDMA object
  JSL $888435
  db $03, $21 : dw CGRAMHazeInstList ; direct HDMA to CGADD and CGDATA, transfer pattern = +0 +0 +1 +1

  ; !CGRAMHazePrevLayerPointerOffset is already set to 0 when spawning HDMA object
  TAX : LDA #$0080 : STA !CGRAMHazePrevLayerThickness,x

  PLB : PLP : RTL
}

CGRAMHazeInstList:
{
  dw $8655 : db !CGRAMHazeHDMATable>>16 ; HDMA table bank = $7E
  dw $8570 : dl CGRAMHazePreInstruction ; Pre-instruction
  dw 1,!CGRAMHazeHDMATable
  dw $8682 ; Sleep
}

CGRAMHazePreInstruction:
{
  PHP : REP #$30
  LDY $18B2 ; hdma object index

  ; restore thickness for previous layer
  LDX !CGRAMHazePrevLayerPointerOffset,y
  LDA !CGRAMHazePrevLayerThickness,y : STA !CGRAMHazeHDMATable,x

  ; determine y scroll
  LDA !CGRAMHazeDetermineYScrollFunction,y : STA $00
  JSR .executeFunction

  ; scan thresholds table
  LDX #$0000
  .loop
    CMP !CGRAMHazeHDMAThresholds,x : BMI .break
    INX : INX : BRA .loop
  .break

  ; get on-screen scanline count of layer at scroll
  SEC : SBC !CGRAMHazeHDMAThresholds,x : EOR #$FFFF : INC
  CMP #$0081 : BCC +
    LDA #$0080
  +
  STA $00

  ; write to hdma table
  TXA : LSR : STA $02 : ASL : ASL : ADC $02 : TAX ; index to hdma table (X * 2.5)
  LDA !CGRAMHazeHDMATable,x : STA !CGRAMHazePrevLayerThickness,y
  LDA $00 : STA !CGRAMHazeHDMATable,x

  ; set previous layer pointer
  TXA : STA !CGRAMHazePrevLayerPointerOffset,y

  ; hdma table pointer
  ADC.w #!CGRAMHazeHDMATable : STA $18D8,y ; carry is cleared here
  ; update register
  PHA : LDA $18C0,y : AND #$00FF : TAX : PLA ; channel index
  STA $4302,x

  PLP : RTL

.executeFunction
  JMP ($0000)
}

; determine y scroll functions
CGRAMHazeDetermineYScroll_NoScroll:
{
  TDC : RTS
}
CGRAMHazeDetermineYScroll_Layer1:
{
  LDA $B3 : SEC : SBC $091F ; BG1 Y scroll (so it's affected by room shaking)
  RTS
}
CGRAMHazeDetermineYScroll_Layer2:
{
  LDA $B7 : SEC : SBC $0923 ; BG2 Y scroll
  RTS
}
CGRAMHazeDetermineYScroll_Water:
{
  LDA #$0100 : SEC : SBC $195E : CLC : ADC $0915
  RTS
}
CGRAMHazeDetermineYScroll_LavaAcid:
{
  LDA #$0100 : SEC : SBC $1962 : CLC : ADC $0915
  RTS
}
;CGRAMHazeDetermineYScroll_Test:
;{
;  ; control with dpad
;  LDA $8B : BIT #$0800 : BEQ .notUp
;  LDA !CGRAMHazeVar0,y : DEC : STA !CGRAMHazeVar0,y
;  RTS
;
;.notUp
;  BIT #$0400 : BEQ .notDown
;  LDA !CGRAMHazeVar0,y : INC : STA !CGRAMHazeVar0,y
;  RTS
;
;.notDown
;  LDA !CGRAMHazeVar0,y
;  RTS
;}
%END_FREESPACE(85)
