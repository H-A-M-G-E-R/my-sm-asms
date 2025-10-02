asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; SA-X ambience

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FC,$E0,$B8,$09,$EC
  db $19,$FE,$F2,$B8,$04,$F4
  db $1A,$FD,$E0,$B8,$04,$F4
  db $1B,$FD,$E0,$B8,$04,$F4
  db $1C,$FD,$E0,$B8,$04,$F4
  db $1D,$FD,$E8,$B8,$04,$F4
  db $1E,$FF,$E0,$B8,$00,$40
  db $1F,$FF,$E0,$B8,$00,$40
  db $20,$FF,$E0,$B8,$00,$40
  db $21,$FF,$E0,$B8,$04,$F4
  db $22,$7F,$E0,$00,$04,$F4
  db $23,$FF,$E0,$B8,$04,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18+1062
  dw Sample19,Sample19
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B
  dw Sample1C,Sample1C+657
  dw Sample1D,Sample1D+1368
  dw Sample1E_1F_20,Sample1E_1F_20+36
  dw Sample1E_1F_20,Sample1E_1F_20+36
  dw Sample1E_1F_20,Sample1E_1F_20+36
  dw Sample21_22,Sample21_22
  dw Sample21_22,Sample21_22
  dw Sample23,Sample23+9
endspcblock

pushpc
org $A780-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample19: skip filesize("Sample_850852da5c349c3afa42df4f4e7b4c95.brr")
  Sample1A: skip filesize("Sample_f57926b4e3fe7bb2e54deb5edc499437.brr")
  Sample1B: skip filesize("Sample_b0408218d46b86bf204427f3abb52c5a.brr")
  Sample1C: skip filesize("Sample_8ffbbac2da03c55c193cbf36b1e520db.brr")
  Sample1D: skip filesize("Sample_641b15dcd55d0f5bb5d923c84c24935e.brr")
  Sample1E_1F_20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21_22: skip filesize("Sample_601a4b08468b4095e62779faacd92271.brr")
  Sample23: skip filesize("Sample_8b80f8c8dfc034a9b10dbf6c96fe1714.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5840
  dw Pattern5850
-
  dw Pattern5860
  dw $00FF,-
  dw $0000

Tracker6:
-
  dw Pattern5870
  dw $00FF,-
  dw $0000

Pattern5840: dw Track5880, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track588D, Track593E, Track58BE, Track5911, 0, 0, 0, 0
Pattern5860: dw 0, Track595A, Track5902, Track592D, 0, 0, 0, 0
Pattern5870: dw Track5974, Track5998, Track59CD, Track5A03, 0, 0, 0, 0

Track5880:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,192
  !end

Track588D:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  db 66
  !tie
  !dynamicPan,96,11
  !instr,$1A
  !volume,192
  db 96
  !c3
  db 84
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  db 48
  !rest
  !dynamicPan,96,10
  !instr,$1C
  !volume,160
  db 96
  !c3
  !tie
  !dynamicVolume,255,16
  !tie
  !tie
  !tie
  !volume,160
  !end

Track58BE:
  db 127,$7F
  !transpose,0
  !pan,10
  db 90
  !rest
  !dynamicPan,96,9
  !instr,$1D
  !volume,192
  db 72
  !c3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,192
  db 96
  !rest
  db 60
  !tie
  !dynamicPan,96,10
  !instr,$1B
  !volume,176
  db 72
  !c3
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,176
  db 78
  !rest
  !instr,$19
  !volume,192
  !loop : dw Sub58F5 : db 3
  !end

Sub58F5:
  db 12
  !c4
  db 18
  !rest
  db 12
  !c4
  db 30
  !rest
  db 12
  !c4
  db 108
  !rest
  !end

Track5902:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$19
  !volume,192
  !loop : dw Sub58F5 : db 4
  !end

Track5911:
  db 127,$7F
  !transpose,0
  !pan,10
  db 90
  !rest
  db 96
  !rest
  !rest
  db 60
  !tie
  db 96
  !rest
  db 78
  !rest
  db 3
  !rest
  !instr,$19
  !volume,160
  !loop : dw Sub58F5 : db 3
  !end

Track592D:
  db 127,$7F
  !transpose,0
  !pan,10
  db 3
  !rest
  !instr,$19
  !volume,160
  !loop : dw Sub58F5 : db 4
  !end

Track593E:
  db 127,$7F
  !transpose,0
  !pan,10
  db 90
  !rest
  !instr,$18
  !volume,240
  db 96
  !e2
  db 90
  !tie
  db 96
  !e2
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !end

Track595A:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,240
  !dynamicVolume,192,208
  db 96
  !e2
  !tie
  !tie
  !tie
  !dynamicVolume,192,240
  !tie
  !tie
  !tie
  !tie
  !end

Track5974:
  db 127,$7F
  !transpose,252
  !pan,10
  !subtranspose,64
  !instr,$18
  !vibrato,12,8,16
  db 24
  !rest
  !volume,48
  !loop : dw Sub598B : db 255
  !end

Sub598B:
  !dynamicVolume,96,176
  db 96
  !c3
  !dynamicVolume,32,64
  db 32
  !tie
  db 16
  !rest
  !end

Track5998:
  db 127,$7F
  !transpose,0
  !instr,$1C
  !loop : dw Sub59A5 : db 2
  db 48
  !rest
  !end

Sub59A5:
  !volume,48
  !dynamicVolume,192,208
  !pan,13
  !dynamicPan,192,10
  db 96
  !e2
  !tie
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,48
  !volume,48
  !dynamicVolume,192,208
  !pan,6
  !dynamicPan,192,8
  !e2
  !tie
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,48
  !end

Track59CD:
  db 127,$7F
  !transpose,244
  !instr,$23
  !volume,64
  !pan,11
  db 96
  !rest
  db 48,$2F
  !as6
  !f6
  !a6
  !cs6
  db 72
  !rest
  !rest
  db 48
  !c6
  !fs6
  !b6
  !rest
  !rest
  db 48,$1F
  !f6
  db 24
  !rest
  db 48
  !d6
  db 24
  !rest
  db 72
  !rest
  db 96
  !rest
  !rest
  !rest
  !rest
  db 24
  !rest
  !loop : dw Sub59FF : db 255
  !end

Sub59FF:
  db 96
  !rest
  !tie
  !end

Track5A03:
  db 127,$7F
  !transpose,244
  !instr,$23
  !volume,64
  !pan,8
  db 96
  !rest
  db 48,$2F
  !d5
  !a4
  !cs5
  !f4
  db 72
  !rest
  !rest
  db 48
  !e4
  !as4
  !ds5
  !rest
  !rest
  !a5
  db 24
  !rest
  db 48
  !fs5
  db 24
  !rest
  db 66
  !rest
  db 96
  !rest
  !rest
  !rest
  !rest
  db 30
  !rest
  !loop : dw Sub5A33 : db 255
  !end

Sub5A33:
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(0*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
