; Enemy Tile Loading Rewrite
; By H A M
; Rewrites the enemy tile loading routine to do:
; Frees up $82:DFD1..E038, $A0:8C48..8D39, and $A0:8E34..B5
; Frees up RAM $0DA0, $0E5A..75, and $0E7A..0E7F
; Makes bitflag 8000h in enemy tile data size useless (it was used in vanilla to load tiles to reserved space)
; Ups the maximum number of enemy types to 14 from 4 without using extra RAM!
; 1.03: freed a bit more space, forgot to remove an old routine
; 1.02: fixed crocomire
; 1.01: skipped debug code that assumed a maximum of 12 enemy types
lorom

!EnemySetEntry = $10 ; was $12 but $809507 is using it
!EnemyTilesOffset = $14
!EnemyPalette = $16 ; 3 bytes long
!EnemyTilesOffsetDataIndex = $19
!EnemyTilesSize = $1B
!PrevEnemyTilesPtr = $1D; 3 bytes long
!PrevEnemyTilesOffset = $20
!EnemyTilesOffsetData = $7EEF5C

!EnemySetEnemyID = $B40000
!EnemySetEnemyProperties = $B40002

org $A08D64
ProcessEnemySet:
{
LDA #$7000 : STA !EnemyTilesOffset
STZ !EnemyTilesOffsetDataIndex
LDA #$1801 : STA $4300 ; DMAP0 and BBAD0
LDA #$0080 : STA $2115 ; VMAIN
LDX $07D1 : STX !EnemySetEntry ; set it to [enemy set pointer]
.LoopEntries
LDA !EnemySetEnemyID,x : INC : BNE + ; check for terminator (FFFFh)
RTS

+ : DEC : TAX ; X = (enemy ID)
; Palette
LDA $000B,x : STA !EnemyPalette+1 : LDA $0002,x : STA !EnemyPalette
LDX !EnemySetEntry : LDA !EnemySetEnemyProperties-1,x : AND #$0700 : LSR #3 : TAX ; X = (enemy palette index) * 20h
TDC : TAY : - : LDA [!EnemyPalette],y : STA $7EC300,x : INY #2 : INX #2 : CPY #$0020 : BNE - ; Target enemy palette = 20h bytes from [[enemy palette]]

LDX !EnemySetEntry : LDA !EnemySetEnemyID,x : TAY ; Y = (enemy ID)
; check if the tiles are the same as the previous one
LDA $0036,y : CMP !PrevEnemyTilesPtr : BNE .different
LDA $0037,y : CMP !PrevEnemyTilesPtr+1 : BNE .different
; tiles are the same
LDX !EnemyTilesOffsetDataIndex : LDA !PrevEnemyTilesOffset : LSR #4 : SBC #$06FF : STA !EnemyTilesOffsetData,x
JMP .nextEntry

.different
; Swappable sample
LDA $000F,y : AND #$00FF : BEQ + ; upper byte of enemy cry
JSL $809507 ; load swappable sample (uses $12)

; Tiles
+ : LDA $0000,y : ASL : LSR : STA !EnemyTilesSize
LDA !EnemySetEnemyProperties,x : BPL .Automatic
LSR #4 : ORA #$6000
PHA : TDC ; so it won't break omega metroid
BRA +
.Automatic
LDA !EnemyTilesOffset
PHA : LSR #4 : SBC #$06FF ; ([A] >> 4) - 700h and restore it afterwards
+ : LDX !EnemyTilesOffsetDataIndex : STA !EnemyTilesOffsetData,x : PLA
LDX $0795 : BNE .DoorTransition
; Loading enemy tiles when starting game
STA $2116 ; target address
LDA !EnemyTilesSize : STA $4305 ; size
LDA $0036,y : STA $4302 : STA !PrevEnemyTilesPtr : LDA $0037,y : STA $4303 : STA !PrevEnemyTilesPtr+1 ; source address
TDC : INC : STA $420B ; do DMA (there's no HDMA)
BRA +
.DoorTransition
; Loading enemy tiles in door transition
STA $05BE ; target address
LDA !EnemyTilesSize : STA $05C3 ; size
LDA $0036,y : STA $05C0 : STA !PrevEnemyTilesPtr : LDA $0037,y : STA $05C1 : STA !PrevEnemyTilesPtr+1 ; source address
LDA #$8000 : TSB $05BC ; Flag door transition VRAM update
- : LDA $05BC : BMI - ; Wait for door transition VRAM update
+ : LDA !EnemyTilesOffset : STA !PrevEnemyTilesOffset
LDA !EnemyTilesSize : LSR : ADC !EnemyTilesOffset : STA !EnemyTilesOffset

.nextEntry
INC !EnemyTilesOffsetDataIndex : INC !EnemyTilesOffsetDataIndex
LDX !EnemySetEntry : INX #4 : STX !EnemySetEntry
JMP .LoopEntries

%padSafe($A08EB5)
}

; remove old routine to transfer enemy tiles when starting game
org $8A8147 : JSL $A08A9E : BRA 13 ; same as NOP 15 times but faster
org $8A81AE : JSL $A08A9E : BRA 13

; remove old routine to load enemy tile data
org $A08A5C : BRA 2

; remove old routine to transfer enemy tiles in door transition
org $8A8FAA : BRA 1

!TargetEnemyID = $12
!EnemyIndex = $14

!EnemyPopulationEnemyID = $A10000


org $A08BF3
LoadEnemyGFXIndicesInPopulation:
{
PHX : LDA !EnemyPopulationEnemyID,x : STA !TargetEnemyID
STY !EnemyIndex
JSR LoadEnemyGFXIndices
TYX : STA $7E7006,x : LDA $0F96,x : STA $7E7008,x ; GFX indices for respawn
PLX : RTS
}

LoadEnemyGFXIndices:
{
LDX $07D1 : TDC : TAY
.LoopEntries
LDA !EnemySetEnemyID,x : CMP !TargetEnemyID : BEQ .Found
INC : BEQ .NotFound
INX #4 : INY #2 : BRA .LoopEntries
.NotFound
LDY !EnemyIndex : LDA #$0A00 : STA $0F96,y : TDC : STA $0F98,y : RTS
.Found
LDA !EnemySetEnemyProperties-1,x : TYX : LDY !EnemyIndex : AND #$0700 : ASL : STA $0F96,y
LDA !EnemyTilesOffsetData,x : STA $0F98,y : RTS
}

%padSafe($A08D3A)

org $A092DB
LoadEnemyGFXIndicesWhenSpawningEnemy:
{
LDA $0E4A : STA !EnemyIndex
LDX $0E20 : LDA $0000,x : STA !TargetEnemyID
JSR LoadEnemyGFXIndices
LDX !TargetEnemyID : BRA +
org $A0932A : +
}


;;; Don't reload same tileset in door transition to speed it up
!PrevTilesetTiles = $0E5A ; 3 bytes long

org $8A8C1E
SavePrevTilesetTilesAndLoadStateHeader:
{
  LDA $07C3 : STA !PrevTilesetTiles : LDA $07C4 : STA !PrevTilesetTiles+1
  JMP $87B8
}

CheckShouldLoadTilesetInDoor:
{
  LDA $07C3 : CMP !PrevTilesetTiles : BNE .different
  LDA $07C4 : CMP !PrevTilesetTiles+1 : BNE .different
  JMP $8F4D

.different
  LDA $07C4 : JMP $8F21
}
%padSafe($8A8C83)

org $8A8E71 : JSR SavePrevTilesetTilesAndLoadStateHeader

org $8A8F0D
{
  ; have to load target palettes regardless
  LDA $07C7 : STA $48 : LDA $07C6 : STA $47
  JSL $80B0FF : dl $7EC200
  JMP CheckShouldLoadTilesetInDoor

  STA $48 : LDA $07C3 : STA $47
  JSL $80B0FF : dl $7E2000
}
