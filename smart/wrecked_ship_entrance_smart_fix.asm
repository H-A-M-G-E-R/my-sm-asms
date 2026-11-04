; Wrecked Ship Entrance Fix for SMART, By H A M
; Fixes a crash caused by SMART 2.0.9570.38488 not writing the door ASM correctly.
; Temporary fix until SMART fixes that bug.

; Instructions:
; In WEST OCEAN.xml, replace the doorcode in the door <toroom area="03" index="01" />
; to <Code OP="4C" ARG="B971" />.
; In WRECKED SHIP MAIN SHAFT.xml, replace the doorcode in the door <toroom area="03" index="01" />
; to <Code OP="4C" ARG="E1D8" />.

; Door ASM - start Wrecked Ship treadmill - west entrance
; Door destination: Wrecked Ship entrance treadmill
; Room $93FE, door 1. Wrecked Ship entrance
org $8FB971
{
    LDY #$8275 : JSL $878027 ; Spawn Wrecked Ship treadmill - rightwards animated tiles object
    JSL $8483D7 : db $04, $09 : dw $B64B ; Spawn Wrecked Ship entrance treadmill from west PLM
    RTS
}

; Door ASM - start Wrecked Ship treadmill - east entrance
; Door destination: Wrecked Ship entrance treadmill
; Room $CAF6, door 0. Wrecked Ship mainstreet
org $8FE1D8
{
    LDY #$827B : JSL $878027 ; Spawn Wrecked Ship treadmill - leftwards animated tiles object
    JSL $8483D7 : db $04, $09 : dw $B64F ; Spawn Wrecked Ship entrance treadmill from east PLM
    RTS
}
