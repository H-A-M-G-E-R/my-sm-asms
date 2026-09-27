asar 1.91
lorom

; Instant Unpause + Don't Reload BG3 Tiles, by H A M

; Makes unpausing almost instant by taking advantage of an expanded SRAM to decompress tiles to it, and when unpausing, reloads the tiles from it!
; Frees up $7E:DF5C..EF5B in the process.

; BG3 tiles now aren't reloaded when pausing and unpausing, so you can DMA it freely without worrying about it getting reset.
; Makes BG3 animated tiles such as lava, acid and spores work while fighting Kraid.
; This works by:
; Not changing BG3 tiles base address
; Putting the halves of Kraid's tilemap to seperate VRAM locations and using an HDMA that changes BG2 tilemap base address.

; Uses no freespace.

; Bug: When using SMART to apply this ASM to ROM, you'll need to manually apply the ASM using your assembler,
; or do a manual hex edit: $7FD8 - $03 -> $06.

; Vanilla bug: For some reason the vanilla music loader overwrites some of the tile graphics in SRAM ($712141..2143), because of open bus.
; Fix below: (don't use if using my "upload to apu space optimization".)
org $8080E5 : PLP : RTS : org $8080F2 : PLP : RTS

; An example Barf Kraid room XML for SMART is provided with the new library backgrounds.

;;; Instant Unpause ;;;

org $80FFD8 : db $06 ; expand SRAM to 10000h bytes ($70:0000..7FFF and $71:0000..7FFF)
org $808693 : PLP : RTS ; skip SRAM check but don't skip region check

org $828D08 : BRA $01 ; skip backing up BG2 tilemap
org $828ED1 : dw $1000 ; skip clearing BG2 tilemap
org $829377 : BRA $01 ; skip restoring BG2 tilemap
org $828D47 : BRA $02 ; skip clearing fx tilemap
org $80A15F : BRA $06 ; skip loading fx tilemap, library background, BG1 and custom BG2
org $828DCA : LDA $5B ; fix bug caused by not clearing fx tilemap in the pause menu
org $828E5D : STA $5B
org $82A0C6 : STA $5B
org $82936A : BRA $01 ; skip clearing samus/beam tiles when unpausing, frees up $82:A2BE..A2E2

org $82E488 : BRA + : org $82E492 : + ; don't reload bg3 tiles during some door transition
org $828EB8 : PLP : RTL ; don't reload bg3 tiles when pausing

; decompress tiles to a different place ($71:0000) in door transitions
org $82E421 : dl $715000
org $82E432 : dl $710000
org $82E449 : dl $710000
org $82E453 : dl $712000
org $82E45D : dl $714000
org $82E477 : dl $715000
org $82E481 : dl $716000

org $80A15B : JSL ReloadTiles
org $82E780 : JMP LoadTilesWhenStartingGame
org $828D51 ; freed up space here
ReloadTiles:
{
  ; transfer $71:0000..7FFF to vram $0000..3FFF
  LDA #$0080 : STA $2115
  STZ $2116
  JSL $8091A9 : db $00,$01,$18 : dl $710000 : dw $8000
  TDC : INC : STA $420B
  RTL
}

LoadTilesWhenStartingGame:
{
  LDA $82E414 : STA $48 : LDA $82E419 : STA $47 : JSL $80B0FF : dl $715000 ; decompress CRE (gets repointed by SMART)
  LDA $07C4 : STA $48 : LDA $07C3 : STA $47 : JSL $80B0FF : dl $710000 ; decompress SCE
  JSL ReloadTiles
  JMP $E7BF ; load target palettes and return
}

; Y is library background pointer
LoadLibraryBackgroundLong:
{
  LDA $0795 : BNE .door

.startingGame
  LDX $0000,y : INY : INY
  JSR ($E9D5,x) : BCC .startingGame
  RTL

.door
  LDX $0000,y : INY : INY
  JSR ($E5C7,x) : BCC .door
  RTL
}

assert pc() <= $828DBD

;;; Kraid ;;;

; Kraid's VRAM layout is now:
; $0000..3FFF: BG1/2 tiles
; {
;     $2000..27FF: BG2 tilemap first half
        
;     $3E00..3FFF: BG1/2 tiles that need reloading after pause screen
;     {
;         $3F00..3FFF: Room background
;     }
; }
; $4000..47FF: BG3 tiles
; $4800..4FFF: BG2 tilemap second half
; $5000..57FF: BG1 tilemap
; $5800..5FFF: BG3 tilemap
; $6000..7FFF: Sprite tiles

!KraidBG3SCChangeHDMAPointer = $7E9002 ; unused by kraid, $7E9000 = Kraid death sequence quake sound timer

org $A7AA79 ; hijack kraid init to spawn hdma object
JSR SpawnKraidBG3SCChangeHDMAObject

; update top half
org $A7C889
LDA #$2000 : STA $D5,x
TXA : CLC : ADC #$0007 : STA $0330
RTL

; update bottom half
org $A7C8CB
LDA #$4800 : STA $D5,x
TXA : CLC : ADC #$0007 : STA $0330
RTL

; kraid's mouth
org $A7AF71
LDA #$2000 : STA $D0,x
INX : INX : STX $0330
PLX : LDA #$0001 : RTS

; handle kraid sinking
org $A7C5CE
LDA $C5E9,y : ORA #$2000 : JSR DetermineKraidSinkingVRAMAddress : NOP

org $A7C770 ; The code in $A7:C777..C814 aren't needed anymore because they were used to load BG3 tiles
LDA #$C815 : STA $0FA8 ; Kraid function = fade in BG palette 6
JMP $C815 ; Go to Kraid function - fade in BG palette 6

SpawnKraidBG3SCChangeHDMAObject:
{
  STA $0FAC
  JSL $888435
    db %00000000 ; direct, 8-bit
    db $08 ; $2108 BG2SC
    dw KraidBG3SCChangeHDMAObject_ilist
  RTS
}

KraidBG3SCChangeHDMAObject:
.ilist
{
  dw $8655 : db !KraidBG3SCChangeHDMAPointer>>16 ; HDMA table bank = $7E
  dw $8570 : dl .pre ; Pre-instruction
  dw 1,!KraidBG3SCChangeHDMAPointer
  dw $8682 ; Sleep
}
.pre
{
  LDA $0FA8 : CMP #$C715 : BEQ .kraidDead ; if Kraid function = fade in regular background
  LDX #$00
  ; set position
  LDA $B7 : INC ; bg2 y scroll + 1
  BIT #$0100 : PHP : SEP #$20 : EOR #$FF : INC : PLP : BNE .bottomFirst
  LDY #$23
  AND #$00FF : BEQ .topOrBottomOnly
  JSR WriteToKraidBG3SCChangeHDMA
  LDY #$43 : BRA .common

.topOrBottomOnly
  INC : BRA .common

.bottomFirst
  LDY #$43
  AND #$00FF : BEQ .topOrBottomOnly
  JSR WriteToKraidBG3SCChangeHDMA
  LDY #$23

.common
  JSR WriteToKraidBG3SCChangeHDMA
  ; terminate
  SEP #$20
  LDA #$00 : STA !KraidBG3SCChangeHDMAPointer,x
  REP #$20
  RTL

.kraidDead
  LDX $18B2 : STZ $18B4,x ; delete HDMA object
  TDC : STA !KraidBG3SCChangeHDMAPointer ; blank the hdma this frame
  RTL
}

; A: scanline count
; Y: byte to write
WriteToKraidBG3SCChangeHDMA:
{
  SEP #$20
-
  CMP #$80 : BCC +
  SEC : SBC #$7F
  XBA
  LDA #$7F : STA !KraidBG3SCChangeHDMAPointer,x
  INX : TYA : STA !KraidBG3SCChangeHDMAPointer,x
  INX
  XBA
  BRA -
+
  STA !KraidBG3SCChangeHDMAPointer,x
  INX : TYA : STA !KraidBG3SCChangeHDMAPointer,x
  INX
  REP #$20
  RTS
}

DetermineKraidSinkingVRAMAddress:
{
  CMP #$2800 : BCC +
  ADC #$1FFF ; carry is set here
+
  RTS
}

assert pc() <= $A7C815

org $A7C1FB
KraidPauseHook: ; that's the new pause hook
{
  ; transfer vram $2000..27FF to $71:4000..$71:4FFF
  LDA #$2000 : STA $2116 : LDA $2139
  JSL $8091A9 : db $00,$81,$39 : dl $714000 : dw $1000
  TDC : INC : STA $420B

  ; transfer vram $3E00..3FFF to $71:7C00..$71:7FFF
  LDA #$3E00 : STA $2116 : LDA $2139
  JSL $8091A9 : db $00,$81,$39 : dl $717C00 : dw $0400
  TDC : INC : STA $420B
  RTL
}

KraidUnpauseHook: ; that's the new unpause hook
{
  JSL $80836F ; set force blank and wait for nmi

  ; don't need to transfer kraid's top half here because the instant unpause already transferred it
  ; transfer $7E:6000..$7E:63FF to vram $3E00..3FFF
  LDA #$3E00 : STA $2116
  JSL $8091A9 : db $00,$01,$18 : dl $717C00 : dw $0400
  LDX #$0001 : STX $420B

  JML $808382 ; clear force blank and wait for nmi
}

; dammit cannot set a custom vram destination of a library background in smart
; hope this will be fixed soon...
LoadKraidLibraryBackgroundCommands:
{
  LDY.w #.commands
  JSL LoadLibraryBackgroundLong
  LDA $0F8C
  RTS

; Don't need to decompress top half to $7E4000 because
; the Set up Kraid graphics with the tile priority cleared already does it
.commands:
  dw $0002 : dl $7E4000 : dw $2000 : dl $1000 ; Transfer 1000h from $7E:4000 to VRAM $2000 (top half)\
  dw $0000
}

assert pc() <= $A7C360

org $A7A96D : LDA #KraidPauseHook
org $A7A967 : LDA #KraidUnpauseHook
org $A7C4D4 : LDA #KraidUnpauseHook

org $A7AA23 : JSR LoadKraidLibraryBackgroundCommands ; in kraid init, after Set up Kraid graphics with the tile priority cleared

;;; TEST ;;;
; Kraid function - restrict Samus X position to first screen
;org $A7C868 : JMP $B92D ; restore
;org $A7C868 : JMP Testcode

;org $A7A3C8 ; Unused. Extended spritemaps - Kraid arm
;Testcode:
;{
;  LDA $8B : BIT #$0800 : BEQ .notUp
;  DEC $0F7E
;  RTL

;.notUp
;  BIT #$0400 : BEQ .notDown
;  INC $0F7E
;.notDown
;  RTL
;}
