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

incsrc "spc_data.asm"

org $98C180 : %padSafe($98E7DC) ; it's free now

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

org $A0EB80+$E : dw $2A72 ; zeela
org $A0E840+$E : dw $2B73 ; ripper II
org $A0EB00+$E : dw $2C72 ; choot
org $A0F7C0+$E : dw $2D72 ; genesis
org $A0D8C0+$E : dw $2E7D ; owtch
org $A0EA80+$E : dw $2F7E ; puyo
org $A0EB40+$E : dw $3072 ; sova
org $A0EE00+$E : dw $3173 ; powamp

org $A0E340+$E : dw $0074 ; Zazabi

org $A4F8D8 : dw $0033 ; halzyn lunge

; lava damage
org $9081E3 : BIT #$000F
org $9081F0 : LDA #$0012

; acid damage
org $908225 : BIT #$000F
org $908232 : LDA #$0012
