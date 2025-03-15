; Instant Unpause (SRAM Expansion), by H A M
; Makes unpausing almost instant by taking advantage of an expanded SRAM to decompress tiles to it, and when unpausing, reloads the tiles from it!
; Uses no freespace.
; Bug: When using SMART to apply this ASM to ROM, you'll need to do a manual hex edit: $7FD8 - $03 -> $06.
lorom

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
; transfer $71:0000..7FFF to vram $0000..3FFF
LDA #$0080 : STA $2115
STZ $2116
JSL $8091A9 : db $00,$01,$18 : dl $710000 : dw $8000
TDC : INC : STA $420B
RTL
LoadTilesWhenStartingGame:
LDA $82E414 : STA $48 : LDA $82E419 : STA $47 : JSL $80B0FF : dl $715000 ; decompress CRE (gets repointed by SMART)
LDA $07C4 : STA $48 : LDA $07C3 : STA $47 : JSL $80B0FF : dl $710000 ; decompress SCE
JSL ReloadTiles
JMP $E7BF ; load target palettes and return

; kraid unpause fix (needed because we skipped loading library background when unpausing)
org $A7C1FB ; that's the new pause hook
KraidPauseHook:
; transfer vram $3E00..47FF to $7E:5000..$7E:63FF
LDA #$3E00 : STA $2116 : LDA $2139
JSL $8091A9 : db $00,$81,$39 : dl $7E5000 : dw $1400
TDC : INC : STA $420B
RTL
KraidUnpauseHook: ; that's the new unpause hook
; transfer $7E:5000..$7E:63FF to vram $3E00..47FF
JSL $80836F ; set force blank and wait for nmi
LDA #$0080 : STA $2115
LDA #$3E00 : STA $2116
JSL $8091A9 : db $00,$01,$18 : dl $7E5000 : dw $1400
LDX #$0001 : STX $420B
; transfer bg3 tiles because loading library background is skipped
LDA #$2000 : STA $2116
LSR : STA $4305
LDA #$9AB2 : STA $4303
STX $420B
JML $808382 ; clear force blank and wait for nmi

org $A7A96D : LDA #KraidPauseHook
org $A7A967 : LDA #KraidUnpauseHook
org $A7C4D4 : LDA #KraidUnpauseHook

org $A7C770 ; The code in $A7:C777..C814 is very stupid and redundant in vanilla, now we gonna free up $A7:C779..C814
LDA #$C815 : STA $0FA8 ; Kraid function = fade in BG palette 6
JMP $C815 ; Go to Kraid function - fade in BG palette 6
