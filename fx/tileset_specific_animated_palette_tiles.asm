; Tileset-specific Animated Palette and Tiles, by H A M
; Makes palette FX objects and animated tiles objects spawned by FX
; tileset-specific instead of area-specific.
; Also frees up RAM $AF..B0 and $196A..196B because uhh why they are used as temp variables
; Uses freespace in any bank.

org $89AC54 ; modify "Load FX header" routine
LoadTilesetSpecificAreaPaletteAndTiles:
{
    LDX $1966 : LDA $000D,x : AND #$00FF : BEQ .noPaletteFX
        STA $12 ; current FX bitset, changed from $196A
        LDX $07BB : LDA $8F0003,x : AND #$00FF ; tileset index
        ASL : ASL : ASL : ASL : TAX
        LDA #$0008 : STA $14 ; loop counter
        .loopPaletteFX
            LSR $12 : BCC +
                LDA.l TilesetSpecificPaletteFXPointers,x : TAY
                JSL $8DC4E9 ; Spawn palette FX object
            +
            INX : INX : DEC $14 : BNE .loopPaletteFX
    .noPaletteFX
    ; same as above
    LDX $1966 : LDA $000E,x : AND #$00FF : BEQ .noAnimatedTiles
        STA $12
        LDX $07BB : LDA $8F0003,x : AND #$00FF 
        ASL : ASL : ASL : ASL : TAX
        LDA #$0008 : STA $14
        .loopAnimatedTiles
            LSR $12 : BCC +
                LDA.l TilesetSpecificAnimatedTilesPointers,x : TAY
                JSL $878027 ; Spawn animated tiles object
            +
            INX : INX : DEC $14 : BNE .loopAnimatedTiles
    .noAnimatedTiles
    PLB : PLP : RTL
}
assert pc() <= $89ACC3

; can be in any bank
%BEGIN_FREESPACE(83) ; freespace marker from cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842)
TilesetSpecificPaletteFXPointers:
{
    dw $F765, $FFE5, $FFE9, $F745, $F745, $F745, $FFED, $F745 ; 0: Upper Crateria
    dw $F765, $FFE5, $FFE9, $F745, $F745, $F745, $FFED, $F745 ; 1: Red Crateria
    dw $F745, $F745, $F745, $FFD9, $FFDD, $FFE1, $F745, $F745 ; 2: Lower Crateria / old Tourian - awake
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 3: Lower Crateria / old Touria - asleep
    dw $F76D, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 4: Wrecked Ship - power on
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 5: Wrecked Ship - power off
    dw $F775, $F745, $F745, $F779, $F745, $F745, $F745, $F745 ; 6: Green/blue Brinstar
    dw $F745, $F77D, $F781, $F745, $F745, $F745, $F745, $F745 ; 7: Red Brinstar / Kraid's lair
    dw $F745, $F77D, $F781, $F745, $F745, $F745, $F745, $F781 ; 8: Pre Tourian entrance corridor
    dw $F761, $F785, $F789, $F78D, $F791, $F745, $F745, $F745 ; 9: Heated Norfair
    dw $F761, $F785, $F789, $F78D, $F791, $F745, $F745, $F745 ; Ah: Unheated Norfair
    dw $F795, $F799, $F79D, $F745, $F745, $F745, $F745, $F745 ; Bh: Sandless Maridia
    dw $F795, $F799, $F79D, $F745, $F745, $F745, $F745, $F745 ; Ch: Sandy Maridia
    dw $F761, $F7A1, $F7A5, $FFC9, $FFCD, $FFD1, $FFD5, $F745 ; Dh: Tourian
    dw $F761, $F7A1, $F7A5, $FFC9, $FFCD, $FFD1, $FFD5, $F745 ; Eh: Mother Brain's room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; Fh: Blue Ceres
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 10h: White Ceres
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 11h: Blue Ceres elevator
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 12h: White Ceres elevator
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 13h: Blue Ceres Ridley's room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 14h: White Ceres Ridley's room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 15h: Map room / Tourian entrance
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 16h: Wrecked Ship map room - power off
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 17h: Blue refill room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 18h: Yellow refill room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 19h: Save room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 1Ah: Kraid's room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 1Bh: Crocomire's room
    dw $F745, $F745, $F745, $F745, $F745, $F745, $F745, $F745 ; 1Ch: Draygon's room
}
TilesetSpecificAnimatedTilesPointers:
{
    dw $8257, $8251, $825D, $8263, $824B, $824B, $824B, $824B ; 0: Upper Crateria
    dw $8257, $8251, $825D, $8263, $824B, $824B, $824B, $824B ; 1: Red Crateria
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 2: Lower Crateria / old Tourian - awake
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 3: Lower Crateria / old Touria - asleep
    dw $8257, $8251, $8275, $827B, $826F, $824B, $824B, $824B ; 4: Wrecked Ship - power on
    dw $8257, $8251, $8275, $827B, $826F, $824B, $824B, $824B ; 5: Wrecked Ship - power off
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 6: Green/blue Brinstar
    dw $8257, $8251, $8281, $824B, $824B, $824B, $824B, $824B ; 7: Red Brinstar / Kraid's lair
    dw $8257, $8251, $8281, $824B, $824B, $824B, $824B, $824B ; 8: Pre Tourian entrance corridor
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 9: Heated Norfair
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; Ah: Unheated Norfair
    dw $8257, $8251, $8287, $828D, $824B, $824B, $824B, $824B ; Bh: Sandless Maridia
    dw $8257, $8251, $8287, $828D, $824B, $824B, $824B, $824B ; Ch: Sandy Maridia
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; Dh: Tourian
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; Eh: Mother Brain's room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; Fh: Blue Ceres
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 10h: White Ceres
    dw $824B, $824B, $824B, $824B, $824B, $824B, $824B, $824B ; 11h: Blue Ceres elevator
    dw $824B, $824B, $824B, $824B, $824B, $824B, $824B, $824B ; 12h: White Ceres elevator
    dw $824B, $824B, $824B, $824B, $824B, $824B, $824B, $824B ; 13h: Blue Ceres Ridley's room
    dw $824B, $824B, $824B, $824B, $824B, $824B, $824B, $824B ; 14h: White Ceres Ridley's room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 15h: Map room / Tourian entrance
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 16h: Wrecked Ship map room - power off
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 17h: Blue refill room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 18h: Yellow refill room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 19h: Save room
    dw $824B, $824B, $824B, $824B, $824B, $824B, $824B, $824B ; 1Ah: Kraid's room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 1Bh: Crocomire's room
    dw $8257, $8251, $824B, $824B, $824B, $824B, $824B, $824B ; 1Ch: Draygon's room
}
%END_FREESPACE(83)
