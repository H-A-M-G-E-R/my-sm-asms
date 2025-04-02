; Faster Boot + SPC Engine Echo Improvements
; By H A M
; Makes booting faster by uploading the SPC engine while the Nintendo logo is displayed.
; The echo on a channel when a sound is finished gets re-activated, and the echo never applies to a sound.
; Uses no freespace.
!SPCFreespace = $04BE ; put it in somewhere that mITroid's key off patches never touch
lorom

org $8B9282
STZ $2133
REP #$20 : LDA #$8040 : STA $75
LDA #$9500 : BRA +
org $8B9296 : +

org $8B92EB
JSR $936B ; Add 'Nintendo' logo spritemap to OAM
JSL $80896E ; Finalise OAM
-
JSR $9100 ; Advance fast screen fade in
BCS + ; If not max brightness:
JSL $808338 : BRA - ; Wait for NMI and loop
+
JSL $808338 ; Wait for NMI
LDA $80845D : STA $00 : LDA $80845E : STA $01 : JSL $808024 ; Upload SPC engine to APU (gets repointed by SMART)
TDC : - : DEC : BNE - ; wait for SPC to be available for upload
JSL $80800A : dl Patch ; upload patch
-
JSR $90B8 ; Advance fast screen fade out
BCS + ; If not reached zero brightness:
JSL $808338 : BRA - ; Wait for NMI and loop
+
JSL $808338 ; Wait for NMI
PLB : PLP : RTL

Patch:
arch spc700
spcblock $1A4B nspc ; echo enable command
	mov $4F,a ; store to unused ram (fake echo)
endspcblock
spcblock $1651 nspc
	call ResumeEchoOnNewNote
endspcblock
spcblock !SPCFreespace nspc
ResumeEchoOnNewNote:
	mov a,$4F ; If [$4F] & [current music voice bitset] != 0:
	and a,$47
	beq .disable
	tset $004A,a ; Echo enable flags |= [current music voice bitset] (enable echo)
	bra +
.disable
	mov a,$47 ; Else: Echo enable flags &= ~[current music voice bitset] (disable echo)
	tclr $004A,a
+
	mov a,$0381+x ; restore from hijack
	ret
endspcblock execute $1500

arch 65816
org $808459 ; skip vanilla SPC engine upload after Nintendo logo
BRA +
org $808482
+
