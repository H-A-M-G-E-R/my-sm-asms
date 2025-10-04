asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Vs. Serris, Yakuza

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$F3,$3C,$02,$7A
  db $19,$DA,$E0,$B8,$02,$7A
  db $1A,$FF,$E9,$B8,$02,$7A
  db $1B,$FF,$EF,$B8,$02,$78
  db $1C,$FF,$F0,$B8,$02,$7A
  db $1D,$FF,$F0,$B8,$02,$7A
  db $1E,$FF,$F0,$B8,$02,$7A
  db $1F,$FA,$E6,$B8,$03,$78
  db $20,$FF,$F0,$B8,$08,$00
  db $21,$FE,$E1,$B8,$01,$3D
  db $22,$F4,$E1,$B8,$01,$3D
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19
  dw Sample1A,Sample1A+1062
  dw Sample1B,Sample1B+639
  dw Sample1C,Sample1C+1197
  dw Sample1D,Sample1D+918
  dw Sample1E,Sample1E+1314
  dw Sample1F,Sample1F+27
  dw Sample20,Sample20+36
  dw Sample21_22,Sample21_22+828
  dw Sample21_22,Sample21_22+828
endspcblock

pushpc
org $B080-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample19: skip filesize("Sample_e5230fbebb607c8b32fe2959e0902347.brr")
  Sample1A: skip filesize("Sample_002b224c6729825252e7f39a13633f64.brr")
  Sample1B: skip filesize("Sample_14513002db7f6139db33682eaa96e6ea.brr")
  Sample1C: skip filesize("Sample_4648f271e3145cbeb3be74154c98bbc9.brr")
  Sample1D: skip filesize("Sample_37b309a75099915cabe221b8f1189840.brr")
  Sample1E: skip filesize("Sample_c3b3f93e0b2d53bce48ae87cc36af9c7.brr")
  Sample1F: skip filesize("Sample_923155b9c5895807692728099ebe975a.brr")
  Sample20: skip filesize("Sample_aecff530da367e51e6090043494c92bb.brr")
  Sample21_22: skip filesize("Sample_ff587f76a1c839d23cc16a649c7acb24.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5

Tracker5:
  dw Pattern5834
-
  dw Pattern5844
  dw $00FF,-
  dw $0000

Pattern5834: dw Track5854, 0, 0, 0, 0, 0, 0, 0
Pattern5844: dw Track586B, Track5A75, Track5B28, Track5BAE, Track5DB4, Track5C42, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,57
  !musicVolume,221
  !echo,%01111100,47,47
  !echoParameters,2,16,5
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !echo,%01111100,47,47
  !echoParameters,2,16,5
  !volume,176
  !loop : dw Sub5886 : db 8
  !loop : dw Sub592B : db 3
  !loop : dw Sub59D0 : db 3
  !end

Sub5886:
  !instr,$1C
  !pan,10
  db 9
  !cs4
  db 3
  !rest
  !pan,14
  db 9
  !gs5
  db 3
  !rest
  !pan,10
  db 9
  !cs5
  db 3
  !rest
  !pan,6
  db 9
  !fs5
  db 3
  !rest
  !pan,10
  db 9
  !cs6
  db 3
  !rest
  !pan,14
  db 9
  !gs5
  db 3
  !rest
  !pan,10
  db 9
  !cs5
  db 3
  !rest
  !pan,6
  db 9
  !e6
  db 3
  !rest
  !instr,$1D
  db 9
  !fs5
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  !instr,$1E
  db 9
  !e5
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  !instr,$1D
  db 9
  !e6
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  !instr,$1C
  db 9
  !fs6
  db 3
  !rest
  db 9
  !e7
  db 3
  !rest
  db 9
  !fs5
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  db 9
  !cs6
  db 3
  !rest
  db 9
  !e5
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  db 9
  !e6
  db 3
  !rest
  db 9
  !fs5
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  !pan,14
  !instr,$1D
  db 9
  !fs6
  db 3
  !rest
  db 9
  !cs6
  db 3
  !rest
  !instr,$1E
  db 9
  !e5
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  !instr,$1D
  db 9
  !e6
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  !instr,$1C
  db 9
  !b5
  db 3
  !rest
  db 9
  !b6
  db 3
  !rest
  !end

Sub592B:
  !instr,$1C
  !pan,10
  db 9
  !f4
  db 3
  !rest
  !pan,14
  db 9
  !c6
  db 3
  !rest
  !pan,10
  db 9
  !f5
  db 3
  !rest
  !pan,6
  db 9
  !as5
  db 3
  !rest
  !pan,10
  db 9
  !f6
  db 3
  !rest
  !pan,14
  db 9
  !c6
  db 3
  !rest
  !pan,10
  db 9
  !f5
  db 3
  !rest
  !pan,6
  db 9
  !gs6
  db 3
  !rest
  !instr,$1D
  db 9
  !as5
  db 3
  !rest
  db 9
  !c7
  db 3
  !rest
  !instr,$1D
  db 9
  !gs5
  db 3
  !rest
  db 9
  !ds6
  db 3
  !rest
  !instr,$1D
  db 9
  !gs6
  db 3
  !rest
  db 9
  !c6
  db 3
  !rest
  !instr,$1C
  db 9
  !as6
  db 3
  !rest
  db 9
  !gs7
  db 3
  !rest
  db 9
  !as5
  db 3
  !rest
  db 9
  !c6
  db 3
  !rest
  db 9
  !f6
  db 3
  !rest
  db 9
  !gs5
  db 3
  !rest
  db 9
  !c6
  db 3
  !rest
  db 9
  !gs6
  db 3
  !rest
  db 9
  !as5
  db 3
  !rest
  db 9
  !ds6
  db 3
  !rest
  !pan,14
  !instr,$1D
  db 9
  !as6
  db 3
  !rest
  db 9
  !f6
  db 3
  !rest
  !instr,$1E
  db 9
  !gs5
  db 3
  !rest
  db 9
  !c6
  db 3
  !rest
  !instr,$1D
  db 9
  !gs6
  db 3
  !rest
  db 9
  !c6
  db 3
  !rest
  !instr,$1C
  db 9
  !ds6
  db 3
  !rest
  db 9
  !ds7
  db 3
  !rest
  !end

Sub59D0:
  !instr,$1C
  !pan,10
  db 9
  !e4
  db 3
  !rest
  !pan,14
  db 9
  !b5
  db 3
  !rest
  !pan,10
  db 9
  !e5
  db 3
  !rest
  !pan,6
  db 9
  !a5
  db 3
  !rest
  !pan,10
  db 9
  !e6
  db 3
  !rest
  !pan,14
  db 9
  !b5
  db 3
  !rest
  !pan,10
  db 9
  !e5
  db 3
  !rest
  !pan,6
  db 9
  !g6
  db 3
  !rest
  !instr,$1D
  db 9
  !a5
  db 3
  !rest
  db 9
  !b6
  db 3
  !rest
  !instr,$1E
  db 9
  !g5
  db 3
  !rest
  db 9
  !d6
  db 3
  !rest
  !instr,$1D
  db 9
  !g6
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  !instr,$1C
  db 9
  !a6
  db 3
  !rest
  db 9
  !g7
  db 3
  !rest
  db 9
  !a5
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  db 9
  !e6
  db 3
  !rest
  db 9
  !g5
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  db 9
  !g6
  db 3
  !rest
  db 9
  !a5
  db 3
  !rest
  db 9
  !d6
  db 3
  !rest
  !pan,14
  !instr,$1D
  db 9
  !a6
  db 3
  !rest
  db 9
  !e6
  db 3
  !rest
  !instr,$1E
  db 9
  !g5
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  !instr,$1D
  db 9
  !g6
  db 3
  !rest
  db 9
  !b5
  db 3
  !rest
  !instr,$1C
  db 9
  !d6
  db 3
  !rest
  db 9
  !d7
  db 3
  !rest
  !end

Track5A75:
  db 127,$7F
  !transpose,0
  !volume,128
  !pan,10
  db 24
  !rest
  !loop : dw Sub5A8C : db 8
  !loop : dw Sub5AC0 : db 3
  !loop : dw Sub5AF4 : db 3
  !end

Sub5A8C:
  !instr,$1C
  db 12
  !cs4
  !gs5
  !cs5
  !fs5
  !cs6
  !gs5
  !cs5
  !e6
  !instr,$1D
  !fs5
  !gs6
  !instr,$1E
  !e5
  !b5
  !instr,$1D
  !e6
  !gs5
  !instr,$1C
  !fs6
  !e7
  !fs5
  !gs5
  !cs6
  !e5
  !gs5
  !e6
  !fs5
  !b5
  !instr,$1D
  !fs6
  !cs6
  !instr,$1E
  !e5
  !gs5
  !instr,$1D
  !e6
  !gs5
  !instr,$1C
  !b5
  !b6
  !end

Sub5AC0:
  !instr,$1C
  db 12
  !f4
  !c6
  !f5
  !as5
  !f6
  !c6
  !f5
  !gs6
  !instr,$1D
  !as5
  !c7
  !instr,$1D
  !gs5
  !ds6
  !instr,$1D
  !gs6
  !c6
  !instr,$1C
  !as6
  !gs7
  !as5
  !c6
  !f6
  !gs5
  !c6
  !gs6
  !as5
  !ds6
  !instr,$1D
  !as6
  !f6
  !instr,$1E
  !gs5
  !c6
  !instr,$1D
  !gs6
  !c6
  !instr,$1C
  !ds6
  !ds7
  !end

Sub5AF4:
  !instr,$1C
  db 12
  !e4
  !b5
  !e5
  !a5
  !e6
  !b5
  !e5
  !g6
  !instr,$1D
  !a5
  !b6
  !instr,$1E
  !g5
  !d6
  !instr,$1D
  !g6
  !b5
  !instr,$1C
  !a6
  !g7
  !a5
  !b5
  !e6
  !g5
  !b5
  !g6
  !a5
  !d6
  !instr,$1D
  !a6
  !e6
  !instr,$1E
  !g5
  !b5
  !instr,$1D
  !g6
  !b5
  !instr,$1C
  !d6
  !d7
  !end

Track5B28:
  db 127,$7F
  !transpose,0
  !endVibrato
  !instr,$1A
  !volume,255
  !pan,10
  db 96
  !cs5
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$1F
  !volume,120
  !pan,9
  !vibrato,0,18,47
  !gs6
  !tie
  !tie
  !tie
  !b6
  !tie
  !tie
  !tie
  !endVibrato
  !instr,$1A
  !volume,255
  !pan,10
  !cs5
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$1F
  !volume,120
  !pan,9
  !vibrato,0,18,47
  !gs6
  !tie
  !tie
  !tie
  !b6
  !tie
  !tie
  !tie
  !volume,64
  !dynamicVolume,48,96
  !pan,10
  !f7
  !tie
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,64
  !rest
  !endVibrato
  !instr,$21
  !volume,176
  !pan,10
  !vibrato,0,16,16
  db 48
  !f5
  !gs5
  db 96
  !g5
  db 48
  !tie
  !ds5
  db 96
  !f5
  !c5
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !e5
  !g5
  db 96
  !fs5
  db 48
  !tie
  !d5
  db 96
  !e5
  !tie
  !b5
  !tie
  !end

Track5BAE:
  db 127,$7F
  !transpose,0
  !instr,$1B
  !volume,255
  !pan,0
  !dynamicPan,48,20
  db 48
  !d5
  !dynamicPan,48,0
  !tie
  !dynamicPan,48,20
  !tie
  !dynamicPan,48,0
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$1F
  !volume,120
  !pan,11
  !vibrato,0,18,47
  !rest
  !tie
  !a6
  !tie
  !tie
  !tie
  !e7
  !tie
  !tie
  !tie
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,120
  !rest
  !tie
  !rest
  !tie
  !endVibrato
  !rest
  !tie
  !a6
  !tie
  !tie
  !tie
  !e7
  !tie
  !dynamicVolume,192,16
  !tie
  !tie
  !volume,120
  !rest
  !tie
  !rest
  !instr,$22
  !volume,144
  db 48
  !rest
  !pan,12
  !f5
  !pan,8
  !gs5
  !pan,12
  db 96
  !g5
  db 48
  !tie
  !pan,8
  !ds5
  !pan,12
  db 96
  !f5
  !dynamicPan,192,6
  !c5
  !tie
  db 48
  !tie
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  db 48
  !tie
  !pan,12
  !e5
  !pan,8
  !g5
  !pan,12
  db 96
  !fs5
  db 48
  !tie
  !pan,8
  !d5
  !dynamicPan,192,14
  db 96
  !e5
  !tie
  !rest
  !tie
  !end

Track5C42:
  db 127,$7F
  !transpose,0
  db 96
  !rest
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !tie
  !instr,$20
  !volume,128
  !pan,10
  !loop : dw Sub5CCA : db 1
  !loop : dw Sub5CF1 : db 1
  !loop : dw Sub5CCA : db 1
  !loop : dw Sub5CF1 : db 1
  !instr,$1B
  !volume,255
  !pan,0
  !dynamicPan,48,20
  db 48
  !d5
  !dynamicPan,48,0
  !tie
  !dynamicPan,48,20
  !tie
  !dynamicPan,48,0
  !tie
  db 96
  !rest
  !tie
  !rest
  !tie
  !rest
  !tie
  !instr,$20
  !volume,128
  !pan,10
  !loop : dw Sub5CCA : db 1
  !loop : dw Sub5CF1 : db 1
  !loop : dw Sub5CCA : db 1
  !loop : dw Sub5CF1 : db 1
  !loop : dw Sub5D18 : db 1
  !loop : dw Sub5D3F : db 1
  !loop : dw Sub5D18 : db 1
  !loop : dw Sub5D3F : db 1
  !loop : dw Sub5D18 : db 1
  !loop : dw Sub5D3F : db 1
  !loop : dw Sub5D66 : db 1
  !loop : dw Sub5D8D : db 1
  !loop : dw Sub5D66 : db 1
  !loop : dw Sub5D8D : db 1
  !loop : dw Sub5D66 : db 1
  !loop : dw Sub5D8D : db 1
  !end

Sub5CCA:
  !pan,12
  !dynamicPan,192,8
  db 6
  !cs4
  !rest
  !gs5
  !rest
  !cs5
  !rest
  !fs5
  !rest
  !cs6
  !rest
  !gs5
  !rest
  !cs5
  !rest
  !e6
  !rest
  !fs5
  !rest
  !gs6
  !rest
  !e5
  !rest
  !b5
  !rest
  !e6
  !rest
  !gs5
  !rest
  !fs6
  !rest
  !e7
  !rest
  !end

Sub5CF1:
  !pan,8
  !dynamicPan,192,12
  db 6
  !fs5
  !rest
  !gs5
  !rest
  !cs6
  !rest
  !e5
  !rest
  !gs5
  !rest
  !e6
  !rest
  !fs5
  !rest
  !b5
  !rest
  !fs6
  !rest
  !cs6
  !rest
  !e5
  !rest
  !gs5
  !rest
  !e6
  !rest
  !gs5
  !rest
  !b5
  !rest
  !b6
  !rest
  !end

Sub5D18:
  !pan,12
  !dynamicPan,192,8
  db 6
  !f4
  !rest
  !c6
  !rest
  !f5
  !rest
  !as5
  !rest
  !f6
  !rest
  !c6
  !rest
  !f5
  !rest
  !gs6
  !rest
  !as5
  !rest
  !c7
  !rest
  !gs5
  !rest
  !ds6
  !rest
  !gs6
  !rest
  !c6
  !rest
  !as6
  !rest
  !gs7
  !rest
  !end

Sub5D3F:
  !pan,8
  !dynamicPan,192,12
  db 6
  !as5
  !rest
  !c6
  !rest
  !f6
  !rest
  !gs5
  !rest
  !c6
  !rest
  !gs6
  !rest
  !as5
  !rest
  !ds6
  !rest
  !as6
  !rest
  !f6
  !rest
  !gs5
  !rest
  !c6
  !rest
  !gs6
  !rest
  !c6
  !rest
  !ds6
  !rest
  !ds7
  !rest
  !end

Sub5D66:
  !pan,12
  !dynamicPan,192,8
  db 6
  !e4
  !rest
  !b5
  !rest
  !e5
  !rest
  !a5
  !rest
  !e6
  !rest
  !b5
  !rest
  !e5
  !rest
  !g6
  !rest
  !a5
  !rest
  !b6
  !rest
  !g5
  !rest
  !d6
  !rest
  !g6
  !rest
  !b5
  !rest
  !a6
  !rest
  !g7
  !rest
  !end

Sub5D8D:
  !pan,8
  !dynamicPan,192,12
  db 6
  !a5
  !rest
  !b5
  !rest
  !e6
  !rest
  !g5
  !rest
  !b5
  !rest
  !g6
  !rest
  !a5
  !rest
  !d6
  !rest
  !a6
  !rest
  !e6
  !rest
  !g5
  !rest
  !b5
  !rest
  !g6
  !rest
  !b5
  !rest
  !d6
  !rest
  !d7
  !rest
  !end

Track5DB4:
  db 127,$7F
  !transpose,0
  !volume,255
  !loop : dw Sub5DBF : db 255
  !end

Sub5DBF:
  !pan,8
  !instr,$18
  db 24
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  db 12
  !b4
  !pan,12
  !instr,$18
  !b4
  !pan,8
  !b4
  !pan,12
  !rest
  db 24
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,8
  !instr,$18
  !b4
  !instr,$19
  !b4
  !pan,12
  !instr,$18
  !b4
  !b4
  !end

assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
