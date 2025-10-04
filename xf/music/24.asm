asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Sector 6 (NOC)

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FD,$E3,$B8,$02,$7A
  db $19,$FF,$E0,$B8,$04,$F4
  db $1A,$FF,$E0,$B8,$0A,$67
  db $1B,$FF,$E7,$B8,$02,$7A
  db $1C,$FD,$48,$B8,$01,$3D
  db $1D,$FF,$F1,$B8,$04,$F6
  db $1E,$FF,$E0,$B8,$04,$F4
  db $1F,$FF,$E0,$B8,$04,$F4
  db $20,$FF,$E0,$B8,$04,$F4
  db $21,$FF,$E0,$B8,$04,$F4
  db $22,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_1C,Sample18_1C+18
  dw Sample19,Sample19+432
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B
  dw Sample18_1C,Sample18_1C+18
  dw Sample1D,Sample1D+1062
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
  dw Sample1E_1F_20_21_22,Sample1E_1F_20_21_22
endspcblock

pushpc
org $A800-$9F80+!p_sampleDataEnd+$400
  Sample18_1C: skip filesize("Sample_3429be383b9039b6b0406cc1633cfca3.brr")
  Sample19: skip filesize("Sample_ad67229b04d0d78fc5b618649e1045ce.brr")
  Sample1A: skip filesize("Sample_9a82d2d7c4923f5e8db69a308f25f46c.brr")
  Sample1B: skip filesize("Sample_da1530af58462df8494ebdc079f396b3.brr")
  Sample1D: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1E_1F_20_21_22: skip filesize("Sample_601a4b08468b4095e62779faacd92271.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5836
  dw Pattern5846
-
  dw Pattern5856
  dw $00FF,-
  dw $0000

Pattern5836: dw Track5866, 0, 0, 0, 0, 0, 0, 0
Pattern5846: dw Track587D, Track5A04, Track5B19, Track5BC2, 0, 0, 0, 0
Pattern5856: dw Track58CF, Track5A4D, Track5B57, Track5C28, 0, 0, 0, 0

Track5866:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,31
  !musicVolume,176
  !echo,%00001111,47,47
  !echoParameters,4,16,0
  !end

Track587D:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,48
  db 96
  !rest
  !tie
  !tie
  !dynamicVolume,96,112
  !e5
  !dynamicVolume,96,80
  db 24
  !ds5
  !fs5
  !f5
  db 48
  !rest
  !dynamicVolume,96,48
  db 96
  !e5
  !dynamicVolume,96,112
  db 72
  !tie
  !dynamicVolume,192,64
  db 96
  !ds5
  !tie
  !volume,112
  db 24
  !rest
  db 72
  !c4
  !dynamicVolume,192,64
  db 96
  !gs3
  !tie
  !dynamicVolume,192,80
  !c6
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,112
  !volume,48
  !dynamicVolume,96,112
  !b5
  db 72
  !tie
  !volume,48
  !dynamicVolume,96,80
  db 120
  !b4
  !end

Track58CF:
  db 127,$7F
  !transpose,0
  !pan,10
  !echo,%00001111,47,47
  !echoParameters,4,16,0
  !instr,$18
  !volume,80
  db 96
  !b4
  !volume,48
  !dynamicVolume,192,96
  !c5
  !tie
  !dynamicVolume,255,16
  !tie
  !tie
  !tie
  !volume,48
  !volume,48
  !dynamicVolume,96,112
  !d5
  !tie
  !dynamicVolume,192,64
  !e5
  !dynamicVolume,96,112
  !tie
  !dynamicVolume,96,64
  !tie
  db 48
  !tie
  !rest
  !dynamicVolume,96,96
  db 96
  !ds6
  db 72
  !tie
  db 24
  !d6
  db 96
  !cs6
  !dynamicVolume,48,16
  db 48
  !tie
  !volume,48
  !rest
  !volume,48
  !dynamicVolume,96,96
  db 96
  !as4
  db 48
  !tie
  db 24
  !rest
  !b4
  !volume,112
  !as4
  !dynamicVolume,96,48
  db 120
  !a4
  db 24
  !rest
  !volume,96
  !dynamicVolume,192,64
  db 96
  !gs4
  !tie
  !tie
  db 48
  !tie
  !rest
  !volume,96
  !dynamicVolume,192,64
  db 96
  !g4
  !tie
  !tie
  db 24
  !tie
  db 72
  !rest
  !volume,96
  !dynamicVolume,192,64
  db 96
  !fs4
  !tie
  !tie
  !rest
  !volume,96
  !dynamicVolume,192,64
  !f4
  !tie
  !tie
  !rest
  !volume,112
  !dynamicVolume,192,80
  !d4
  !tie
  !tie
  db 48
  !tie
  !rest
  !volume,96
  db 24
  !ds4
  !rest
  !dynamicVolume,192,64
  db 96
  !d4
  !tie
  !tie
  db 24
  !tie
  !rest
  !volume,112
  !dynamicVolume,192,80
  db 96
  !cs4
  !tie
  !tie
  db 24
  !tie
  db 96
  !rest
  !tie
  !tie
  !volume,48
  !dynamicVolume,192,112
  !a3
  !tie
  !volume,112
  !dynamicVolume,192,48
  !tie
  !tie
  !rest
  !tie
  !volume,80
  !as4
  !tie
  db 48
  !tie
  !volume,112
  !dynamicVolume,144,48
  !a4
  db 72
  !gs4
  db 24
  !rest
  !volume,80
  db 96
  !as4
  !tie
  db 48
  !tie
  !volume,112
  !dynamicVolume,144,48
  !a4
  db 72
  !gs4
  db 24
  !rest
  !volume,80
  db 96
  !d5
  !tie
  db 48
  !tie
  !volume,112
  !dynamicVolume,144,48
  !cs5
  db 96
  !c5
  !volume,80
  !d5
  !tie
  !tie
  db 72
  !c5
  db 24
  !rest
  !volume,80
  db 96
  !as5
  !tie
  db 48
  !tie
  db 96
  !a5
  db 48
  !as4
  !volume,80
  db 96
  !as5
  !tie
  db 48
  !tie
  !volume,96
  db 96
  !a5
  db 48
  !as4
  db 96
  !as5
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,96
  !rest
  !volume,80
  !f4
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,80
  !loop : dw Sub5A00 : db 255
  !end

Sub5A00:
  db 96
  !rest
  !tie
  !end

Track5A04:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  db 96
  !rest
  !tie
  !tie
  !volume,16
  !dynamicVolume,80,80
  !b4
  !volume,80
  db 24
  !as4
  !cs5
  !c5
  db 48
  !rest
  !dynamicVolume,96,112
  db 96
  !b4
  db 48
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,80
  !dynamicVolume,192,48
  db 96
  !as4
  !tie
  !volume,112
  db 24
  !rest
  db 72
  !g3
  db 48
  !cs4
  !dynamicVolume,144,16
  db 96
  !tie
  db 48
  !tie
  !volume,112
  db 96
  !rest
  !tie
  !tie
  !tie
  !volume,80
  !as5
  !tie
  !end

Track5A4D:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,48
  db 48
  !as5
  db 96
  !rest
  db 48
  !tie
  !volume,80
  db 96
  !as4
  !tie
  !cs5
  !tie
  !tie
  !tie
  !tie
  !volume,96
  !rest
  !f5
  db 48
  !tie
  !rest
  !volume,112
  db 96
  !d4
  !tie
  !volume,80
  db 24
  !rest
  db 120
  !f5
  db 48
  !rest
  !volume,96
  db 96
  !c4
  db 48
  !tie
  !volume,112
  db 24
  !rest
  !cs4
  !c4
  !volume,80
  db 120
  !b3
  !volume,96
  db 24
  !rest
  db 96
  !as3
  !tie
  !tie
  db 48
  !tie
  !rest
  db 96
  !a3
  !tie
  !tie
  db 24
  !tie
  db 72
  !rest
  db 96
  !gs3
  !tie
  !tie
  !rest
  !g3
  !tie
  !tie
  !rest
  !fs3
  !tie
  !tie
  db 48
  !tie
  !rest
  db 24
  !g3
  !rest
  db 96
  !fs3
  !tie
  !tie
  db 24
  !tie
  !rest
  db 96
  !f3
  !tie
  !tie
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,96
  db 96
  !rest
  !instr,$1C
  !volume,255
  !as2
  !tie
  !tie
  !tie
  !tie
  !tie
  !rest
  !tie
  !instr,$18
  !volume,80
  !cs4
  !tie
  !tie
  db 72
  !tie
  db 24
  !rest
  db 96
  !cs4
  !tie
  !tie
  db 60
  !tie
  db 36
  !rest
  db 96
  !as4
  !tie
  !tie
  db 48
  !tie
  !e4
  db 96
  !rest
  !tie
  db 48
  !tie
  db 96
  !cs5
  !dynamicVolume,24,16
  db 24
  !tie
  !volume,80
  !rest
  db 96
  !d5
  !tie
  !tie
  !gs5
  !d5
  !tie
  !tie
  !gs5
  !rest
  !tie
  !tie
  !tie
  !volume,80
  !as3
  !tie
  !dynamicVolume,96,16
  !tie
  !volume,80
  !loop : dw Sub5B15 : db 255
  !end

Sub5B15:
  db 96
  !rest
  !tie
  !end

Track5B19:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$18
  !volume,48
  !dynamicVolume,96,112
  db 96
  !c3
  !tie
  !volume,112
  !dynamicVolume,192,64
  !tie
  !tie
  !volume,64
  !dynamicVolume,192,104
  !tie
  !tie
  !volume,104
  !dynamicVolume,192,112
  !tie
  !tie
  !volume,112
  !dynamicVolume,96,48
  !tie
  !rest
  !instr,$1D
  !volume,208
  db 24
  !c4
  !f3
  !fs3
  !c3
  db 96
  !rest
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !end

Track5B57:
  db 127,$7F
  !transpose,0
  !pan,10
  !instr,$1D
  !volume,208
  db 24
  !c3
  db 96
  !rest
  db 24
  !cs3
  db 72
  !rest
  db 24
  !fs3
  !rest
  !f3
  db 96
  !rest
  db 24
  !rest
  !c3
  db 48
  !rest
  db 24
  !cs3
  db 72
  !rest
  db 24
  !rest
  !fs3
  !rest
  !f3
  db 96
  !rest
  db 24
  !rest
  !c3
  db 48
  !rest
  db 24
  !cs3
  db 72
  !rest
  db 24
  !rest
  !fs3
  !rest
  !f3
  db 96
  !rest
  !loop : dw Sub5BAE : db 1
  db 48
  !cs3
  !rest
  !d3
  !rest
  !e3
  !rest
  !f3
  !rest
  !loop : dw Sub5BAE : db 7
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub5BB8 : db 8
  !end

Sub5BAE:
  db 48
  !cs3
  !rest
  !d3
  !rest
  !ds3
  !rest
  !e3
  !rest
  !end

Sub5BB8:
  db 48
  !as2
  !rest
  !b2
  !rest
  !e3
  !rest
  !ds3
  !rest
  !end

Track5BC2:
  db 127,$7F
  !transpose,0
  !pan,10
  db 96
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1B
  !volume,160
  db 12
  !e4
  !volume,128
  !e4
  !volume,96
  db 24
  !e4
  !rest
  !volume,160
  db 12
  !e4
  !volume,128
  !e4
  !volume,96
  db 24
  !e4
  !rest
  db 48
  !rest
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !end

Sub5BFF:
  !instr,$19
  !volume,160
  db 12
  !c4
  !volume,144
  !c4
  !instr,$1A
  !volume,160
  !g3
  !g3
  !volume,192
  !g3
  !g3
  !volume,128
  !g3
  !volume,96
  db 24
  !g3
  db 12
  !rest
  !instr,$1B
  !volume,160
  !b2
  !volume,128
  !b2
  !volume,96
  db 24
  !b2
  !end

Track5C28:
  db 127,$7F
  !transpose,0
  !pan,10
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  !instr,$19
  !volume,160
  db 12
  !c4
  !volume,144
  !c4
  db 96
  !rest
  db 72
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !rest
  !tie
  !instr,$1B
  !volume,160
  db 12
  !e4
  !volume,128
  !e4
  !volume,96
  !e4
  !e4
  !e4
  !e4
  db 48
  !rest
  !volume,128
  db 12
  !e4
  !volume,96
  !e4
  !e4
  !e4
  db 24
  !rest
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  db 96
  !rest
  !tie
  !rest
  !tie
  !loop : dw Sub5BFF : db 1
  !loop : dw Sub5C92 : db 255
  !end

Sub5C92:
  db 96
  !rest
  !tie
  !end

assert pc() <= $10000-(4*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
