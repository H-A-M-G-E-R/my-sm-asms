; Mother Brain DMA Freeup, by H A M
; DMAs most of Mother Brain's graphics to save sprite tile VRAM,
; She doesn't use extra enemy tiles anymore.
; Uses freespace in bank $AA, and any bank to store new GFX.
; Requires my Enemy Draw Hook ASM, cout's freespace.asm (https://metroidconstruction.com/resource.php?id=842);
; and my Ridley DMA Freeup for the DoDMADef function.

; Instructions (SMART):
; Replace Export/Enemies/EC3F.gfx in your project folder with this one.
; Do the same for EC7F.gfx.
; In Mother Brain's room, remove enemy $EC7F from the enemy set (Enemy Graphics).

lorom

!EnemyDrawHook = $7E700A ; must be the same as the value in enemy_draw_hook.asm

;;; Hijacks ;;;

org $A986AD : JSR MotherBrainBodyInitSetPreDrawHook ; hijack mother brain body init
org $A993B7 : JMP MotherBrainDMAMouth ; hijack mother brain brain drawing

!MotherBrainMouthDMAIndex = $7E8014 ; unused mother brain ram
!MotherBrainUpperLegDMAIndex = $7E8016
!MotherBrainLowerLegDMAIndex = $7E8018
!MotherBrainPhase3BrainGFXTransferred = $7E801A

;;; Spritemaps ;;;

; extended spritemaps
; use upper byte of extended spritemap size as indices to DMA
; low nibble is upper leg, high nibble is lower leg
org $A99FA0
{
MotherBrainExtSpritemap_0_A99FA0:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,29,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_1_A99FEA:
dw $210A, 28,47,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 38,19,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 33,19,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-3,MotherBrainSpritemap_12_A9A7F1,MotherBrainHitbox_2_A9A4C8, 0,2,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -11,58,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 6,31,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 1,33,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8, -25,-3,MotherBrainSpritemap_20_A9A8A6,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_2_A9A03C:
dw $110A, 40,48,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 38,19,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 35,19,MotherBrainSpritemap_16_A9A862,MotherBrainHitbox_2_A9A4C8, 0,-3,MotherBrainSpritemap_12_A9A7F1,MotherBrainHitbox_2_A9A4C8, 0,2,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -13,58,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 5,31,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, -1,33,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8, -26,-3,MotherBrainSpritemap_20_A9A8A6,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_3_A9A08E:
dw $110A, 40,51,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 38,21,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 35,22,MotherBrainSpritemap_16_A9A862,MotherBrainHitbox_2_A9A4C8, -1,-2,MotherBrainSpritemap_12_A9A7F1,MotherBrainHitbox_2_A9A4C8, 0,1,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -13,57,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 5,30,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, -1,32,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8, -26,-4,MotherBrainSpritemap_20_A9A8A6,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_4_A9A0E0:
dw $1009, 36,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 33,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 31,30,MotherBrainSpritemap_16_A9A862,MotherBrainHitbox_2_A9A4C8, 1,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -16,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 3,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, -4,30,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_5_A9A12A:
dw $2009, 21,60,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 29,31,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 27,32,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, -2,-2,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,2,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -16,52,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 0,26,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, -5,28,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_6_A9A174:
dw $0009, 15,64,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,35,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 26,37,MotherBrainSpritemap_18_A9A87A,MotherBrainHitbox_2_A9A4C8, -2,-1,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,6,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,47,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 4,22,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, -1,24,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_7_A9A1BE:
dw $2009, 17,60,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,32,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 24,32,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, -1,-2,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,2,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -8,47,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,21,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 3,23,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_8_A9A208:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 31,30,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, -1,-3,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,31,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_9_A9A252:
dw $0107, 18,20,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 34,-9,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 31,-6,MotherBrainSpritemap_18_A9A87A,MotherBrainHitbox_2_A9A4C8, -5,3,MotherBrainSpritemap_14_A9A83B,MotherBrainHitbox_2_A9A4C8, 0,-38,$A98A,MotherBrainHitbox_6_A9A4E8, 4,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,18,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA

MotherBrainExtSpritemap_10_A9A28C:
dw $0209, 18,30,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 36,2,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 31,4,MotherBrainSpritemap_18_A9A87A,MotherBrainHitbox_2_A9A4C8, -5,-2,MotherBrainSpritemap_13_A9A811,MotherBrainHitbox_2_A9A4C8, 0,-28,$A98A,MotherBrainHitbox_6_A9A4E8, -2,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,28,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,0,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,1,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_11_A9A2D6:
dw $2109, 18,46,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 31,17,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 26,18,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, -5,-4,MotherBrainSpritemap_12_A9A7F1,MotherBrainHitbox_2_A9A4C8, 0,-12,$A98A,MotherBrainHitbox_6_A9A4E8, -2,0,$AAEA,MotherBrainHitbox_8_A9A504, -10,44,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,16,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,17,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_12_A9A320:
dw $0001, 0,0,MotherBrainSpritemap_0_A9A586,MotherBrainHitbox_0_A9A4AC

MotherBrainExtSpritemap_13_A9A32A:
dw $0001, 0,0,MotherBrainSpritemap_1_A9A5BF,MotherBrainHitbox_0_A9A4AC

MotherBrainExtSpritemap_14_A9A334:
dw $0001, 0,0,MotherBrainSpritemap_2_A9A5F8,MotherBrainHitbox_0_A9A4AC

MotherBrainExtSpritemap_15_A9A33E:
dw $0001, 0,0,MotherBrainSpritemap_3_A9A62C,MotherBrainHitbox_0_A9A4AC

MotherBrainExtSpritemap_16_A9A348:
dw $0001, 0,0,MotherBrainSpritemap_4_A9A660,MotherBrainHitbox_0_A9A4AC

MotherBrainExtSpritemap_17_A9A352:
dw $0001, 0,0,MotherBrainSpritemap_6_A9A69B,MotherBrainHitbox_1_A9A4BA

MotherBrainExtSpritemap_18_A9A35C:
dw $0001, 0,0,MotherBrainSpritemap_7_A9A6D9,MotherBrainHitbox_1_A9A4BA

MotherBrainExtSpritemap_19_A9A366:
dw $0001, 0,0,MotherBrainSpritemap_8_A9A717,MotherBrainHitbox_1_A9A4BA

MotherBrainExtSpritemap_20_A9A370:
dw $0001, 0,0,MotherBrainSpritemap_9_A9A750,MotherBrainHitbox_1_A9A4BA

MotherBrainExtSpritemap_21_A9A37A:
dw $0001, 0,0,MotherBrainSpritemap_10_A9A789,MotherBrainHitbox_1_A9A4BA

MotherBrainExtSpritemap_22_A9A384:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AB70,MotherBrainHitbox_9_A9A51E, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,29,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_23_A9A3CE:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$ABF6,MotherBrainHitbox_10_A9A538, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,29,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_24_A9A418:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$AC76,MotherBrainHitbox_11_A9A552, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,29,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8

MotherBrainExtSpritemap_25_A9A462:
dw $2009, 18,58,MotherBrainSpritemap_19_A9A890,MotherBrainHitbox_3_A9A4CA, 30,29,MotherBrainSpritemap_15_A9A85B,MotherBrainHitbox_2_A9A4C8, 25,30,MotherBrainSpritemap_17_A9A86E,MotherBrainHitbox_2_A9A4C8, 0,-4,MotherBrainSpritemap_11_A9A7C2,MotherBrainHitbox_2_A9A4C8, 0,0,$A98A,MotherBrainHitbox_6_A9A4E8, 0,0,$ACE4,MotherBrainHitbox_12_A9A56C, -10,56,MotherBrainSpritemap_28_A9A974,MotherBrainHitbox_5_A9A4DA, 7,28,MotherBrainSpritemap_24_A9A93F,MotherBrainHitbox_4_A9A4D8, 2,29,MotherBrainSpritemap_27_A9A95E,MotherBrainHitbox_4_A9A4D8
}

; hitboxes
{
MotherBrainHitbox_0_A9A4AC:
dw $0001, -20,-21,16,23,$B5C6,$B507

MotherBrainHitbox_1_A9A4BA:
dw $0001, -20,-21,19,23,$B5C6,$B507

MotherBrainHitbox_2_A9A4C8:
dw $0000

MotherBrainHitbox_3_A9A4CA:
dw $0001, -23,-1,23,7,$B5C5,$B503

MotherBrainHitbox_4_A9A4D8:
dw $0000

MotherBrainHitbox_5_A9A4DA:
dw $0001, -23,-2,23,7,$B5C5,$B503

MotherBrainHitbox_6_A9A4E8:
dw $0002, -32,-24,20,52,$B5C5,$B503, -24,-42,13,-25,$B5C5,$B503

MotherBrainHitbox_7_A9A502:
dw $0000

MotherBrainHitbox_8_A9A504:
dw $0002, 4,-59,28,-24,$B5C5,$B503, 28,-41,57,-30,$B5C5,$B503

MotherBrainHitbox_9_A9A51E:
dw $0002, 4,-59,28,-24,$B5C5,$B503, 28,-41,54,-30,$B5C5,$B503

MotherBrainHitbox_10_A9A538:
dw $0002, 4,-59,28,-24,$B5C5,$B503, 29,-43,45,-24,$B5C5,$B503

MotherBrainHitbox_11_A9A552:
dw $0002, 4,-59,28,-24,$B5C5,$B503, 29,-48,68,-40,$B5C5,$B503

MotherBrainHitbox_12_A9A56C:
dw $0002, 4,-59,28,-24,$B5C5,$B503, 28,-41,58,-31,$B5C5,$B503
}

; spritemaps (discard unused)
{
; use upper byte of extended spritemap size as stuff
; low nibble is index to mouth DMA, bit $8000 is flag to transfer phase 3 brain GFX
MotherBrainSpritemap_0_A9A586:
dw $010B : db $0C,$00,$01,$2C,$21, $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_1_A9A5BF:
dw $010B : db $0C,$00,$01,$40,$21, $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_2_A9A5F8:
dw $010A : db $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_3_A9A62C:
dw $020A : db $FF,$81,$0E,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_4_A9A660:
dw $030A : db $FC,$81,$10,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_5_A9A694:
dw $0001 : db $F8,$81,$F8,$20,$21

MotherBrainSpritemap_6_A9A69B:
dw $000B : db $0C,$00,$01,$2C,$21, $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

; copy phase 2 brain spritemaps to phase 3 brain spritemaps
org $A9A6D9
MotherBrainSpritemap_7_A9A6D9:
dw $810B : db $0C,$00,$01,$40,$21, $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

org $A9A717
MotherBrainSpritemap_8_A9A717:
dw $810A : db $02,$80,$09,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

org $A9A750
MotherBrainSpritemap_9_A9A750:
dw $810A : db $FF,$81,$0E,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

org $A9A789
MotherBrainSpritemap_10_A9A789:
dw $820A : db $FC,$81,$10,$00,$21, $E8,$81,$04,$08,$21, $F8,$81,$04,$02,$21, $F8,$81,$F4,$0C,$21, $08,$80,$00,$04,$21, $08,$80,$F0,$1E,$21, $08,$80,$E8,$0E,$21, $F8,$81,$E4,$0A,$21, $F0,$01,$EC,$2D,$21, $E8,$81,$F4,$06,$21

MotherBrainSpritemap_11_A9A7C2:
dw $8309 : db $1C,$00,$1C,$47,$33, $14,$80,$0C,$26,$33, $0C,$80,$14,$35,$33, $0C,$00,$0C,$25,$33, $14,$00,$04,$44,$F3, $04,$00,$14,$44,$33, $FC,$01,$FC,$22,$33, $FC,$81,$04,$32,$33, $04,$80,$FC,$23,$33

; upper leg DMA index 1
MotherBrainSpritemap_12_A9A7F1:
dw $0006 : db $1D,$80,$03,$2A,$33, $1D,$80,$0B,$3A,$33, $0D,$80,$0B,$3E,$33, $0D,$80,$FB,$3C,$33, $FD,$81,$03,$38,$33, $FD,$81,$FB,$28,$33

; upper leg DMA index 2
MotherBrainSpritemap_13_A9A811:
dw $0006 : db $20,$80,$00,$3E,$B3, $20,$80,$F0,$3E,$33, $10,$80,$00,$3C,$B3, $00,$80,$00,$3A,$B3, $10,$80,$F0,$3C,$33, $00,$80,$F0,$3A,$33

; upper leg DMA index 1
MotherBrainSpritemap_14_A9A83B:
dw $0006 : db $1D,$80,$ED,$2A,$B3, $1D,$80,$E5,$3A,$B3, $0D,$80,$E5,$3E,$B3, $0D,$80,$F5,$3C,$B3, $FD,$81,$ED,$38,$B3, $FD,$81,$F5,$28,$B3

MotherBrainSpritemap_15_A9A85B:
dw $0001 : db $F8,$81,$F8,$5A,$33

; lower leg DMA index 1
MotherBrainSpritemap_16_A9A862:
dw $0002 : db $F8,$81,$10,$53,$33, $F8,$81,$00,$51,$33

; lower leg DMA index 2
MotherBrainSpritemap_17_A9A86E:
dw $0002 : db $F3,$81,$10,$53,$33, $F7,$81,$00,$51,$33

MotherBrainSpritemap_18_A9A87A:
dw $0004 : db $FB,$01,$0E,$41,$33, $EB,$81,$0E,$55,$33, $FB,$81,$FE,$58,$33, $F3,$81,$FE,$57,$33

MotherBrainSpritemap_19_A9A890:
dw $0004 : db $10,$00,$00,$60,$33, $08,$00,$00,$50,$33, $F8,$81,$F8,$5E,$33, $E8,$81,$F8,$5C,$33

MotherBrainSpritemap_20_A9A8A6:
dw $0009 : db $1C,$00,$1C,$47,$27, $14,$80,$0C,$26,$27, $0C,$80,$14,$35,$27, $0C,$00,$0C,$25,$27, $14,$00,$04,$44,$E7, $04,$00,$14,$44,$27, $FC,$01,$FC,$22,$27, $FC,$81,$04,$32,$27, $04,$80,$FC,$23,$27

MotherBrainSpritemap_24_A9A93F:
dw $0001 : db $F8,$81,$F8,$5A,$27

MotherBrainSpritemap_27_A9A95E:
dw $0004 : db $FB,$01,$0E,$41,$27, $EB,$81,$0E,$55,$27, $FB,$81,$FE,$58,$27, $F3,$81,$FE,$57,$27

MotherBrainSpritemap_28_A9A974:
dw $0004 : db $10,$00,$00,$60,$27, $08,$00,$00,$50,$27, $F8,$81,$F8,$5E,$27, $E8,$81,$F8,$5C,$27
}

;;; Code ;;;

MotherBrainBodyInitSetPreDrawHook:
{
  LDA.w #MotherBrainBodyPreDrawHook : STA.l !EnemyDrawHook
  TDC : RTS ; restore from hijack
}

MotherBrainBodyPreDrawHook:
{
  LDX $0F8E ; spritemap pointer
  LDA $0001,x : PHA ; high byte of size

  ; DMA upper leg
  AND #$000F : BEQ .noUpperLegDMA
  CMP.l !MotherBrainUpperLegDMAIndex : BEQ .noUpperLegDMA
    STA.l !MotherBrainUpperLegDMAIndex
    ASL : TAX : LDY.w MotherBrainUpperLegDMADefPointers-2,x
    JSL DoDMADef
  .noUpperLegDMA

  ; DMA lower leg
  PLA : AND #$00F0 : BEQ .noLowerLegDMA
  CMP.l !MotherBrainLowerLegDMAIndex : BEQ .noLowerLegDMA
    STA.l !MotherBrainLowerLegDMAIndex
    LSR : LSR : LSR : TAX : LDY.w MotherBrainLowerLegDMADefPointers-2,x
    JSL DoDMADef
  .noLowerLegDMA

  SEC : RTL ; draw normally
}

MotherBrainUpperLegDMADefPointers:
{
  dw MotherBrainUpperLegDMADef1
  dw MotherBrainUpperLegDMADef2
}

MotherBrainLowerLegDMADefPointers:
{
  dw MotherBrainLowerLegDMADef1
  dw MotherBrainLowerLegDMADef2
}

MotherBrainUpperLegDMADef1:
{
  dw 6*$20 : dl 0*$20+MotherBrainUpperLegGFX : dw $73A0
  dw 6*$20 : dl 6*$20+MotherBrainUpperLegGFX : dw $74A0
  dw 0
}

MotherBrainUpperLegDMADef2:
{
  dw 6*$20 : dl 12*$20+MotherBrainUpperLegGFX : dw $73A0
  dw 6*$20 : dl 18*$20+MotherBrainUpperLegGFX : dw $74A0
  dw 0
}

MotherBrainLowerLegDMADef1:
{
  dw 4*$20 : dl 0*$20+MotherBrainLowerLegGFX : dw $7510
  dw 4*$20 : dl 4*$20+MotherBrainLowerLegGFX : dw $7610
  dw 0
}

MotherBrainLowerLegDMADef2:
{
  dw 4*$20 : dl 8*$20+MotherBrainLowerLegGFX : dw $7510
  dw 4*$20 : dl 12*$20+MotherBrainLowerLegGFX : dw $7610
  dw 0
}

assert pc() <= $A9A98A

%BEGIN_FREESPACE(A9)
MotherBrainDMAMouth:
{
  LDA $0001,y : AND #$007F ; high byte of size

  ; DMA mouth
  BEQ .noMouthDMA
  CMP.l !MotherBrainMouthDMAIndex : BEQ .noMouthDMA
    STA.l !MotherBrainMouthDMAIndex
    ASL : TAX
    PHY
    LDY.w MotherBrainMouthDMADefPointers-2,x
    JSL DoDMADef
    PLY
  .noMouthDMA

  ; DMA third phase brain
  LDA $0000,y : BPL .noPhase3BrainDMA_NoLDA
    LDA.l !MotherBrainPhase3BrainGFXTransferred : BNE .noPhase3BrainDMA
    INC : STA.l !MotherBrainPhase3BrainGFXTransferred ; set to 1
    PHY
    LDY.w #MotherBrainPhase3BrainDMADef
    JSL DoDMADef
    PLY
  .noPhase3BrainDMA
    LDA $0000,y
  .noPhase3BrainDMA_NoLDA

  AND #$00FF : JMP $93F1 ; restore from hijack, only get low byte of size
}

MotherBrainMouthDMADefPointers:
{
  dw MotherBrainMouthDMADef1
  dw MotherBrainMouthDMADef2
  dw MotherBrainMouthDMADef3
}

MotherBrainMouthDMADef1:
{
  dw 2*$20 : dl 0*$20+MotherBrainMouthGFX : dw $7000
  dw 2*$20 : dl 2*$20+MotherBrainMouthGFX : dw $7100
  dw 0
}

MotherBrainMouthDMADef2:
{
  dw 2*$20 : dl 4*$20+MotherBrainMouthGFX : dw $7000
  dw 2*$20 : dl 6*$20+MotherBrainMouthGFX : dw $7100
  dw 0
}

MotherBrainMouthDMADef3:
{
  dw 2*$20 : dl 8*$20+MotherBrainMouthGFX : dw $7000
  dw 2*$20 : dl 10*$20+MotherBrainMouthGFX : dw $7100
  dw 0
}

MotherBrainPhase3BrainDMADef:
{
  dw 10*$20 : dl 0*$20+MotherBrainPhase3BrainGFX : dw $7060
  dw 10*$20 : dl 10*$20+MotherBrainPhase3BrainGFX : dw $7160
  dw 3*$20 : dl 27*$20+MotherBrainPhase3BrainGFX : dw $72D0
  dw 0
}
%END_FREESPACE(A9)

;;; Enemy projectile spritemaps ;;;

org $8D93DB
{
MotherBrainParticleSpritemap_0_8D93DB:
dw $000B : db $FC,$01,$E5,$8D,$3B, $0E,$00,$EF,$9C,$3B, $EA,$01,$EF,$9C,$7B, $25,$00,$F8,$8C,$3B, $1A,$00,$D6,$8C,$3B, $DF,$01,$D6,$8C,$3B, $D3,$01,$F8,$8C,$3B, $ED,$01,$F8,$8B,$3B, $0C,$00,$F8,$8B,$3B, $04,$00,$ED,$8B,$3B, $F5,$01,$ED,$8B,$3B

MotherBrainParticleSpritemap_1_8D9414:
dw $0007 : db $FC,$01,$E1,$8E,$3B, $11,$00,$ED,$9D,$3B, $E7,$01,$ED,$9D,$7B, $F0,$01,$E8,$9C,$7B, $E8,$01,$F8,$7D,$7B, $10,$00,$F8,$7D,$3B, $08,$00,$E8,$9C,$3B

MotherBrainParticleSpritemap_2_8D9439:
dw $0007 : db $FC,$01,$DE,$8F,$3B, $18,$00,$E8,$9E,$3B, $E0,$01,$E8,$9E,$7B, $E5,$01,$F8,$7E,$7B, $14,$00,$F8,$7E,$3B, $0A,$00,$E6,$9D,$3B, $EE,$01,$E6,$9D,$7B

MotherBrainParticleSpritemap_3_8D945E:
dw $0007 : db $FC,$01,$DA,$9F,$3B, $1D,$00,$E6,$9F,$3B, $DC,$01,$E6,$9F,$7B, $DE,$01,$F8,$7F,$7B, $1B,$00,$F8,$7F,$3B, $10,$00,$E0,$9E,$3B, $E8,$01,$E0,$9E,$7B

MotherBrainParticleSpritemap_4_8D9483:
dw $000A : db $0A,$00,$F3,$8A,$3B, $FC,$01,$EC,$8A,$3B, $FC,$01,$D4,$8C,$3B, $20,$00,$E4,$8C,$3B, $F0,$01,$F3,$8A,$3B, $DA,$01,$E4,$8C,$3B, $D8,$01,$F8,$9F,$7B, $20,$00,$F8,$9F,$3B, $14,$00,$DC,$9F,$3B, $E4,$01,$DC,$9F,$7B

MotherBrainParticleSpritemap_5_8D94B7:
dw $000E : db $FC,$01,$EA,$8B,$3B, $22,$00,$E3,$8C,$3B, $0A,$00,$F3,$8B,$3B, $EF,$01,$F3,$8B,$3B, $D8,$01,$E3,$8C,$3B, $E1,$01,$D8,$8C,$3B, $EC,$01,$F8,$8A,$3B, $F4,$01,$EC,$8A,$3B, $05,$00,$EC,$8A,$3B, $0C,$00,$F8,$8A,$3B, $23,$00,$F8,$8C,$3B, $18,$00,$D8,$8C,$3B, $FC,$01,$D1,$8C,$3B, $D5,$01,$F8,$8C,$3B

MotherBrainParticleSpritemap_6_8D94FF:
dw $0001 : db $FC,$01,$FA,$90,$3B

MotherBrainParticleSpritemap_7_8D9506:
dw $0001 : db $FC,$01,$FB,$91,$3B

MotherBrainParticleSpritemap_8_8D950D:
dw $0001 : db $FC,$01,$FC,$92,$3B

MotherBrainParticleSpritemap_9_8D9514:
dw $0001 : db $FC,$01,$FC,$93,$3B

MotherBrainParticleSpritemap_10_8D951B:
dw $0001 : db $FC,$01,$FC,$94,$3B

MotherBrainParticleSpritemap_11_8D9522:
dw $0001 : db $FC,$01,$FC,$95,$3B

MotherBrainParticleSpritemap_12_8D9529:
dw $0001 : db $FC,$01,$FC,$96,$3B

MotherBrainParticleSpritemap_13_8D9530:
dw $0001 : db $FC,$01,$FC,$7A,$3B

MotherBrainParticleSpritemap_14_8D9537:
dw $0002 : db $FC,$01,$00,$7C,$3B, $FC,$01,$FC,$7B,$3B

MotherBrainParticleSpritemap_15_8D9543:
dw $0002 : db $FC,$01,$04,$7C,$3B, $FC,$01,$FC,$7B,$3B

MotherBrainParticleSpritemap_16_8D954F:
dw $0002 : db $EE,$01,$F2,$97,$3B, $F8,$81,$F8,$70,$3B

MotherBrainParticleSpritemap_17_8D955B:
dw $0004 : db $EC,$01,$EE,$97,$3B, $EE,$01,$F1,$98,$3B, $00,$80,$00,$70,$7B, $F8,$81,$F7,$72,$3B

MotherBrainParticleSpritemap_18_8D9571:
dw $0007 : db $E8,$01,$E8,$99,$3B, $EE,$01,$EA,$97,$3B, $EC,$01,$ED,$98,$3B, $EE,$01,$F0,$99,$3B, $08,$80,$08,$70,$FB, $00,$80,$01,$72,$3B, $F8,$81,$F6,$74,$3B

MotherBrainParticleSpritemap_19_8D9596:
dw $0008 : db $E8,$01,$E6,$97,$3B, $EE,$01,$E9,$98,$3B, $EC,$01,$EC,$99,$3B, $EE,$01,$EF,$9A,$3B, $10,$80,$0E,$70,$7B, $08,$80,$07,$72,$3B, $00,$80,$00,$74,$3B, $F8,$81,$F4,$76,$3B

MotherBrainParticleSpritemap_20_8D95C0:
dw $0007 : db $E8,$01,$E5,$98,$3B, $EE,$01,$E8,$99,$3B, $EC,$01,$EB,$9A,$3B, $13,$80,$0D,$72,$3B, $08,$80,$06,$74,$3B, $00,$80,$FE,$76,$3B, $F8,$81,$F1,$78,$3B

MotherBrainParticleSpritemap_21_8D95E5:
dw $0006 : db $E8,$01,$E4,$99,$3B, $EF,$01,$E7,$9A,$3B, $EC,$01,$EA,$9B,$3B, $12,$80,$0C,$74,$3B, $08,$80,$02,$76,$3B, $00,$80,$FB,$78,$3B

MotherBrainParticleSpritemap_22_8D9605:
dw $0004 : db $E8,$01,$E3,$9A,$3B, $F0,$01,$E6,$9B,$3B, $12,$80,$0A,$76,$3B, $08,$80,$FF,$78,$3B

MotherBrainParticleSpritemap_23_8D961B:
dw $0002 : db $E8,$01,$E3,$9B,$3B, $12,$80,$07,$78,$3B

MotherBrainParticleSpritemap_24_8D9627:
dw $0001 : db $FC,$01,$F8,$97,$3B

MotherBrainParticleSpritemap_25_8D962E:
dw $0002 : db $FA,$01,$F4,$97,$3B, $FC,$01,$F7,$98,$3B

MotherBrainParticleSpritemap_26_8D963A:
dw $0004 : db $F6,$01,$EE,$99,$3B, $FC,$01,$F0,$97,$3B, $FA,$01,$F3,$98,$3B, $FC,$01,$F6,$99,$3B

MotherBrainParticleSpritemap_27_8D9650:
dw $0004 : db $F6,$01,$EC,$97,$3B, $FC,$01,$EF,$98,$3B, $FA,$01,$F2,$99,$3B, $FC,$01,$F5,$9A,$3B

MotherBrainParticleSpritemap_28_8D9666:
dw $0003 : db $F6,$01,$EB,$98,$3B, $FC,$01,$EE,$99,$3B, $FA,$01,$F1,$9A,$3B

MotherBrainParticleSpritemap_29_8D9677:
dw $0003 : db $F6,$01,$EA,$99,$3B, $FD,$01,$ED,$9A,$3B, $FA,$01,$F0,$9B,$3B

MotherBrainParticleSpritemap_30_8D9688:
dw $0002 : db $F6,$01,$E9,$9A,$3B, $FE,$01,$EC,$9B,$3B

MotherBrainParticleSpritemap_31_8D9694:
dw $0001 : db $F6,$01,$E9,$9B,$3B
}

; graphics (any freespace, doesn't have to be in the same bank)
%BEGIN_FREESPACE(89)
MotherBrainMouthGFX: incbin "mouth_dma.gfx"
MotherBrainPhase3BrainGFX: incbin "phase_3_brain.gfx"
MotherBrainUpperLegGFX: incbin "upper_leg_dma.gfx"
MotherBrainLowerLegGFX: incbin "lower_leg_dma.gfx"
%END_FREESPACE(89)

org $B79000 : incbin "legs_new.gfx"
