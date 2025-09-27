; My and PJ's SPC engine from https://github.com/H-A-M-G-E-R/SM-SPC/tree/xf

org $808059 ; NSPC bankcross fix
UploadToAPU: ; expects Y == APU data pointer
PHP
PHB : PHK : PLB ; DB = $80 (do not remove)
REP #$30 : STZ $00 ; $00 = 0
LDA #$BBAA : - : CMP $2140 : BNE - ; Wait until [APU IO 0..1] = AAh BBh
SEP #$20 : LDA #$CC ; Kick = CCh
BRA ProcessDataBlock ; Go to ProcessDataBlock

UploadDataBlock:
JSR GetDataAndIncY : XBA ; Data = [[Y++]]
; Index = 0 (set by the TDC)
BRA UploadData ; Go to UploadData

NextData:
XBA : JSR GetDataAndIncY : XBA ; Data = [[Y++]]
- : CMP $2140 : BNE - ; Wait until APU IO 0 echoes
INC ; Index += 1

UploadData:
REP #$20 : STA $2140 : SEP #$20 ; APU IO 0..1 = [index] [data]
DEX ; Decrement X (block size)
BNE NextData ; If [X] != 0: go to NextData
- : CMP $2140 : BNE - ; Wait until APU IO 0 echoes
- : ADC #$03 ; Kick = [index] + 4
BEQ - ; Ensure kick != 0

ProcessDataBlock:
PHA
JSR GetDataAndIncY : XBA : JSR GetDataAndIncY : XBA : TAX ; X = [[Y]] (block size), Y += 2
JSR GetDataAndIncY : STA $2142 : JSR GetDataAndIncY : STA $2143 ; APU IO 2..3 = [[Y]] (destination address), Y += 2
CPX #$0001 : TDC : ROL : STA $2141 ; If block size = 0: APU IO 1 = 0 (EOF), else APU IO 1 = 1 (arbitrary non-zero value)
ADC #$7F ; Set overflow if block size != 0, else clear overflow
PLA : STA $2140 ; APU IO 0 = kick
- : CMP $2140 : BNE - ; Wait until APU IO 0 echoes
BVS UploadDataBlock ; If block size != 0: go to UploadDataBlock
PLB : PLP : RTS

GetDataAndIncY:
LDA [$00],y
IncY:
INY ; Y += 1
BEQ + ; If [Y] != 0: return
RTS
+ : INC $02 ; Increment [$02]
LDY #$8000 ; Y = $8000
RTS

assert pc() <= $808111

org $E0A004 ; all the musics and swappable samples go here
{
SongPointers:
  dl Song00
  dl Song03
  dl Song06
  dl Song09
  dl Song0C
  dl Song0F
  dl Song12
  dl Song15
  dl Song18
  dl Song1B
  dl Song1E
  dl Song21
  dl Song24
  dl Song27
  dl Song2A
  dl Song2D
  dl Song30
  dl Song33
  dl Song36
  dl Song39
  dl Song3C
  dl Song3F
  dl Song42
  dl Song45
  dl Song48
  dl Song4B
  dl Song4E
  dl Song51
  dl Song54
  dl Song57
  dl Song5A
  dl Song5D
  dl Song60
  dl Song63
  dl Song66
  dl Song69
  dl Song6C
  dl Song6F
  dl Song72
  dl Song75
  dl Song78
  dl Song7B
  dl Song7E
  dl Song81
  dl Song84
  dl Song87
  dl Song8A
  dl Song8D
  dl Song90
  dl Song3C
  dl Song96
  dl Song99
  dl Song9C
  dl Song9F
  dl SongA2
  dl SongA5
  dl SongA8

SwappableSamplePointers:
  dl SwappableSample00
  dl SwappableSample01
  dl SwappableSample02
  dl SwappableSample03
  dl SwappableSample04
  dl SwappableSample05
  dl SwappableSample06
  dl SwappableSample07
  dl SwappableSample08
  dl SwappableSample09
  dl SwappableSample0A
  dl SwappableSample0B
  dl SwappableSample0C
  dl SwappableSample0D
  dl SwappableSample0E
  dl SwappableSample0F
  dl SwappableSample10
  dl SwappableSample11
  dl SwappableSample12
  dl SwappableSample13
  dl SwappableSample14
  dl SwappableSample15
  dl SwappableSample16
  dl SwappableSample17
  dl SwappableSample18
  dl SwappableSample19
  dl SwappableSample1A
  dl SwappableSample1B
  dl SwappableSample1C
  dl SwappableSample1D
  dl SwappableSample1E
  dl SwappableSample1F
  dl SwappableSample20
  dl 0
  dl SwappableSample22
  dl SwappableSample23
  dl SwappableSample24
  dl SwappableSample25
  dl SwappableSample26
  dl SwappableSample27
  dl SwappableSample28
  dl SwappableSample29

check bankcross off

Song00: incbin "music/00.nspc"
Song03: incbin "music/03.nspc"
Song06: incbin "music/06.nspc"
Song09: incbin "music/09.nspc"
Song0C: incbin "music/0C.nspc"
Song0F: incbin "music/0F.nspc"
Song12: incbin "music/12.nspc"
Song15: incbin "music/15.nspc"
Song18: incbin "music/18.nspc"
Song1B: incbin "music/1B.nspc"
Song1E: incbin "music/1E.nspc"
Song21: incbin "music/21.nspc"
Song24: incbin "music/24.nspc"
Song27: incbin "music/27.nspc"
Song2A: incbin "music/2A.nspc"
Song2D: incbin "music/2D.nspc"
Song30: incbin "music/30.nspc"
Song33: incbin "music/33.nspc"
Song36: incbin "music/36.nspc"
Song39: incbin "music/39.nspc"
Song3C: incbin "music/3C.nspc"
Song3F: incbin "music/3F.nspc"
Song42: incbin "music/42.nspc"
Song45: incbin "music/45.nspc"
Song48: incbin "music/48.nspc"
Song4B: incbin "music/4B.nspc"
Song4E: incbin "music/4E.nspc"
Song51: incbin "music/51.nspc"
Song54: incbin "music/54.nspc"
Song57: incbin "music/57.nspc"
Song5A: incbin "music/5A.nspc"
Song5D: incbin "music/5D.nspc"
Song60: incbin "music/60.nspc"
Song63: incbin "music/63.nspc"
Song66: incbin "music/66.nspc"
Song69: incbin "music/69.nspc"
Song6C: incbin "music/6C.nspc"
Song6F: incbin "music/6F.nspc"
Song72: incbin "music/72.nspc"
Song75: incbin "music/75.nspc"
Song78: incbin "music/78.nspc"
Song7B: incbin "music/7B.nspc"
Song7E: incbin "music/7E.nspc"
Song81: incbin "music/81.nspc"
Song84: incbin "music/84.nspc"
Song87: incbin "music/87.nspc"
Song8A: incbin "music/8A.nspc"
Song8D: incbin "music/8D.nspc"
Song90: incbin "music/90.nspc"
Song96: incbin "music/96.nspc"
Song99: incbin "music/99.nspc"
Song9C: incbin "music/9C.nspc"
Song9F: incbin "music/9F.nspc"
SongA2: incbin "music/A2.nspc"
SongA5: incbin "music/A5.nspc"

SwappableSample00: incbin "swappable_samples/00.nspc"
SwappableSample01: incbin "swappable_samples/01.nspc"
SwappableSample02: incbin "swappable_samples/02.nspc"
SwappableSample03: incbin "swappable_samples/03.nspc"
SwappableSample04: incbin "swappable_samples/04.nspc"
SwappableSample05: incbin "swappable_samples/05.nspc"
SwappableSample06: incbin "swappable_samples/06.nspc"
SwappableSample07: incbin "swappable_samples/07.nspc"
SwappableSample08: incbin "swappable_samples/08.nspc"
SwappableSample09: incbin "swappable_samples/09.nspc"
SwappableSample0A: incbin "swappable_samples/0A.nspc"
SwappableSample0B: incbin "swappable_samples/0B.nspc"
SwappableSample0C: incbin "swappable_samples/0C.nspc"
SwappableSample0D: incbin "swappable_samples/0D.nspc"
SwappableSample0E: incbin "swappable_samples/0E.nspc"
SwappableSample0F: incbin "swappable_samples/0F.nspc"
SwappableSample10: incbin "swappable_samples/10.nspc"
SwappableSample11: incbin "swappable_samples/11.nspc"
SwappableSample12: incbin "swappable_samples/12.nspc"
SwappableSample13: incbin "swappable_samples/13.nspc"
SwappableSample14: incbin "swappable_samples/14.nspc"
SwappableSample15: incbin "swappable_samples/15.nspc"
SwappableSample16: incbin "swappable_samples/16.nspc"
SwappableSample17: incbin "swappable_samples/17.nspc"
SwappableSample18: incbin "swappable_samples/18.nspc"
SwappableSample19: incbin "swappable_samples/19.nspc"
SwappableSample1A: incbin "swappable_samples/1A.nspc"
SwappableSample1B: incbin "swappable_samples/1B.nspc"
SwappableSample1C: incbin "swappable_samples/1C.nspc"
SwappableSample1D: incbin "swappable_samples/1D.nspc"
SwappableSample1E: incbin "swappable_samples/1E.nspc"
SwappableSample1F: incbin "swappable_samples/1F.nspc"
SwappableSample20: incbin "swappable_samples/20.nspc"
SwappableSample22: incbin "swappable_samples/22.nspc"
SwappableSample23: incbin "swappable_samples/23.nspc"
SwappableSample24: incbin "swappable_samples/24.nspc"
SwappableSample25: incbin "swappable_samples/25.nspc"
SwappableSample26: incbin "swappable_samples/26.nspc"
SwappableSample27: incbin "swappable_samples/27.nspc"
SwappableSample28: incbin "swappable_samples/28.nspc"
SwappableSample29: incbin "swappable_samples/29.nspc"

check bankcross full
%padSafe($FFFFFF) : db $FF
}

org $98C180
SongA8: incbin "music/A8.nspc"
assert pc() <= $98E7DC

org $808F72 : LDA.l SongPointers,x : STA $00 : LDA.l SongPointers+1,x : STA $01
org $808FA3 : LDA.l SwappableSamplePointers,x : STA $00 : LDA.l SwappableSamplePointers+1,x : STA $01
org $80845D : dl Song00

;;; My sounds

; enemy hurt sounds
org $A0DA80+$E : dw $0026 ; hornoad
org $A0DAC0+$E : dw $0026 ; hornoad
org $A0D940+$E : dw $002E ; halzyn
org $A0F380+$E : dw $0035 ; moto
org $A0F3C0+$E : dw $0035 ; moto
org $A0DB40+$E : dw $0040 ; yameba
org $A0DB80+$E : dw $0040 ; yameba
org $A0DBC0+$E : dw $0040 ; yameba
org $A0DC00+$E : dw $0040 ; yameba
org $A0DC40+$E : dw $0040 ; yameba
org $A0DC80+$E : dw $0040 ; yameba
org $A0D5C0+$E : dw $004A ; sciser
org $A0D600+$E : dw $004A ; sciser
org $A0D680+$E : dw $004E ; gold sciser
org $A0DB00+$E : dw $0051 ; geemer
org $A0F0C0+$E : dw $0059 ; kihunter
org $A0F080+$E : dw $0060 ; reo
org $A0E9C0+$E : dw $0063 ; sidehopper
org $A0F2C0+$E : dw $0063 ; sidehopper
org $A0EA00+$E : dw $0068 ; dessgeega
org $A0ED80+$E : dw $006A ; geruda
org $A0ECC0+$E : dw $006F ; yard
org $A0EAC0+$E : dw $0070 ; geruboss
org $A0F600+$E : dw $0070 ; geruboss
org $A0F5C0+$E : dw $0016 ; waver

org $A4F8D8 : dw $0033 ; halzyn lunge

; lava damage
org $9081E3 : BIT #$000F
org $9081F0 : LDA #$0012

; acid damage
org $908225 : BIT #$000F
org $908232 : LDA #$0012
