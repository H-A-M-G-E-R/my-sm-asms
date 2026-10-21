; Metroid Repel Velocity Fix, by H A M
; Fixes metroid always reading projectile slot 0 when getting repelled by a projectile.
; My fix actually works compared to Tundain's solution which doesn't work.
; Uses no freespace.

lorom

org $A3EFB2
; Enemy X velocity = ([enemy X position] - [projectile X position]) / 8
STZ $0FA8,x : STZ $0FAA,x
LDA $0F7A,x : SEC : SBC $0B64,y : BPL +
DEC $0FAA,x
+
ASL : ASL : ASL : ASL : ASL : STA $0FA9,x
; Enemy Y velocity = ([enemy Y position] - [projectile Y position]) / 8
STZ $0FAC,x : STZ $0FAE,x
LDA $0F7E,x : SEC : SBC $0B78,y : BPL +
DEC $0FAE,x
+
ASL : ASL : ASL : ASL : ASL : STA $0FAD,x
BRA + : org $A3EFEC : +
