; Makes game options menus uncompressed, and can easily be editable.
; Uses 2800h bytes of freespace, can't cross banks.
; See https://patrickjohnston.org/bank/82#fEB9F for option highlight offsets, and https://patrickjohnston.org/bank/82#fF296 for cursor offsets.

lorom

org $B88000 ; freespace to put tilemaps in
OptionsScreen:
incbin "$978DF4 - tilemap - game options menu - options screen.bin"

ControllerSettingsEnglish:
incbin "$978FCD - tilemap - game options menu - controller settings - English.bin"

ControllerSettingsJapanese:
incbin "$9791C4 - tilemap - game options menu - controller settings - Japanese.bin"

SpecialSettingsEnglish:
incbin "$97938D - tilemap - game options menu - special settings - English.bin"

SpecialSettingsJapanese:
incbin "$97953A - tilemap - game options menu - special settings - Japanese.bin"

org $82EC66 : BRA + : org $82ECBB : + ; skip decompressing all the stuff

; load uncompressed tilemaps instead
org $82ECBE : LDA.l OptionsScreen,x
org $82EF55 : LDA.l ControllerSettingsEnglish,x
org $82EF66 : LDA.l ControllerSettingsJapanese,x
org $82EF89 : LDA.l SpecialSettingsEnglish,x
org $82EF9A : LDA.l SpecialSettingsJapanese,x
org $82EFC5 : LDA.l OptionsScreen,x
