; Disable Lavaquake Sound In Init ASM, by H A M
; Disables the lavaquake sound in the room's init ASM,
; instead of checking for hardcoded room pointers.
; This fixes it not working in SMART.

lorom

; in Initialise special effects for new room
org $8882CA : BRA + : org $8882F3 : + ; skip hardcoded room checks

org $8FFD00 ; freespace to put setup ASM

; Ridley (RIDLEY BOSS ROOM) - all states
; Lower Norfair breakable pillars hall (PILLAR ROOM)
; Mother Brain (MOTHER BRAIN BOSS ROOM) - all states
DisableLavaquakeSoundInitASM: ; FD00
LDA #$FFFF : STA $0609 : RTS

; Old Tourian escape shaft (OLD TOURIAN SHAFT) - event "Zebes timebomb set" is set
DisableLavaquakeSoundInitASM_OldTourianEscapeShaft: ; FD07
JSR $91A9 ; Room setup ASM - make old Tourian escape shaft fake wall explode
BRA DisableLavaquakeSoundInitASM

; Bomb Torizo (SILVER TORIZO BOSS ROOM) - event "Zebes timebomb set" is set
DisableLavaquakeSoundInitASM_TrappedCritters: ; FD0C
JSR $91B2 ; Room setup ASM - spawn critters escape block
BRA DisableLavaquakeSoundInitASM

; Escape room 4 (TOURIAN VERTICAL ESCAPE)
DisableLavaquakeSoundInitASM_TourianVerticalEscape: ; FD11
JSR $C953 ; Room setup ASM - set up rising acid and set medium horizontal room shaking
BRA DisableLavaquakeSoundInitASM
