; Compressed FX Tilemaps
; By H A M
; Original description
; Makes the game load compressed FX tilemaps instead of uncompressed ones, freeing lots of space in bank $8A!
; Repoints the FX tilemap pointers to freespace and expands it to avoid crashing in Ceres rooms.
; I compressed the vanilla tilemaps using AmoebaCompress (https://edit-sm.art/download/AmoebaCompress.1.0.0.0.zip).
; Also included in the .7z file are uncompressed vanilla tilemaps which you can edit and compress them.

; Notes for X-Fusion:
; FX tilemap pointers are in $83FC00-FC2D
; FX tilemaps are in bank $83
; I now use fe3_comp from https://github.com/sfc-comp/sfc-comp because I now use Linux.

org $8A8912 ; when starting game, or unpausing if not using one of my "Instant Unpause" patches
LDA #$8300 : STA $48
LDA $1964 : BEQ + ; skip if pointer is 0
STA $47 : JSL $80B0FF : dl $7E4000 ; decompress to $7E:4000
; now transfer it
LDA #$5BE0 : STA $2116
JSL $8091A9 : db $00,$01,$18 : dl $7E4000 : dw $0840
SEP #$20
LDA #$80 : STA $2115
LDA #$01 : STA $420B
BRA +
org $8A8947 : +

org $8A8FED ; in door transitions
LDA #$8300 : STA $48
LDA $1964 : BEQ + ; skip if pointer is 0
STA $47 : JSL $80B0FF : dl $7E4000 ; decompress to $7E:4000
; now transfer it
JSR $8BE3 : dl $7E4000 : dw $5BE0, $0840
BRA +
org $8A9012 : +

org $83BA00 ; the compressed tilemaps themselves
Lava: incbin "fx_tilemaps/lava.bin.comp"
Acid: incbin "fx_tilemaps/acid.bin.comp"
Water: incbin "fx_tilemaps/water.bin.comp"
Spores: incbin "fx_tilemaps/spores.bin.comp"
Rain: incbin "fx_tilemaps/rain.bin.comp"
Fog: incbin "fx_tilemaps/fog.bin.comp"
CeresElevator: incbin "fx_tilemaps/ceres_elevator.bin.comp"
Fireflea: incbin "fx_tilemaps/fireflea.bin.comp"

incsrc "bank83_stuff.asm"

%padSafe($83FC00)

;0000 ; 0: None
;BA00 ; 2: Lava
;C240 ; 4: Acid
;CA80 ; 6: Water
;D2C0 ; 8: Spores
;DB00 ; Ah: Rain
;E340 ; Ch: Fog
;0000
;0000
;0000
;0000
;0000
;0000
;0000
;0000
;0000
;0000 ; 20h: Scrolling sky
;0000 ; 22h: Unused
;F3C0 ; 24h: Fireflea
;CA80 ; 26h: Tourian entrance statue
;D2C0 ; 28h: Ceres Ridley
;EB80 ; 2Ah: Ceres elevator
;0000 ; 2Ch: Ceres haze

FXTilemapPointers:
dw $0000, ; 0: None
   Lava, ; 2: Lava
   Acid, ; 4: Acid
   Water, ; 6: Water
   Spores, ; 8: Spores
   Rain, ; Ah: Rain
   Fog, ; Ch: Fog
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, 
   $0000, ; 20h: Scrolling sky
   $0000, ; 22h: Unused
   Fireflea, ; 24h: Fireflea
   Water, ; 26h: Tourian entrance statue
   Spores, ; 28h: Ceres Ridley
   CeresElevator, ; 2Ah: Ceres elevator
   $0000  ; 2Ch: Ceres haze
