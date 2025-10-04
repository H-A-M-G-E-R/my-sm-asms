asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; Lower Sector 3 acid rise

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$FF,$E0,$B8,$09,$EC
  db $19,$FF,$E8,$B8,$03,$EE
  db $1A,$FF,$E0,$B8,$01,$60
  db $1B,$FF,$E0,$B8,$03,$80
  db $1C,$FF,$E0,$B8,$00,$40
  db $1D,$FF,$E0,$B8,$00,$40
  db $1E,$FF,$E0,$B8,$00,$40
  db $1F,$FF,$E0,$B8,$00,$40
  db $20,$FF,$E0,$B8,$00,$40
  db $21,$7F,$E0,$00,$04,$F4
  db $22,$FF,$E0,$B8,$04,$F4
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18,Sample18
  dw Sample19,Sample19+342
  dw Sample1A,Sample1A
  dw Sample1B,Sample1B+18
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample1C_1D_1E_1F_20,Sample1C_1D_1E_1F_20+36
  dw Sample21_22,Sample21_22
  dw Sample21_22,Sample21_22
endspcblock

pushpc
org $AF00-$9F80+!p_sampleDataEnd+$400
  Sample18: skip filesize("Sample_89767433c447228a2f21fe0b1a2442f0.brr")
  Sample19: skip filesize("Sample_25c097763664d2404536cb7b102bf640.brr")
  Sample1A: skip filesize("Sample_3da45843d5164e6fc5c3df7c986e81a7.brr")
  Sample1B: skip filesize("Sample_a2c12bb7be2f47aee50de0c1f31959fb.brr")
  Sample1C_1D_1E_1F_20: skip filesize("Sample_677e567a4a0df275278c7795a4c46039.brr")
  Sample21_22: skip filesize("Sample_0e021b8c900b6db8440abf3c3b172967.brr")
  Trackers:
pullpc

spcblock Trackers nspc
  dw Tracker5, Tracker6

Tracker5:
  dw Pattern5840
-
  dw Pattern5850
  dw $00FF,-
  dw $0000

Tracker6:
  dw Pattern5840
-
  dw Pattern5860
  dw $00FF,-
  dw $0000

Pattern5840: dw Track5870, 0, 0, 0, 0, 0, 0, 0
Pattern5850: dw Track5887, Track58CA, Track58EB, Track592A, Track596B, 0, 0, 0
Pattern5860: dw Track59D0, Track58CA, Track58EB, 0, 0, 0, 0, 0

Track5870:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,49
  !musicVolume,192
  !echo,%00001111,47,47
  !echoParameters,2,48,5
  !end

Track5887:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,2,48,5
  !instr,$18
  !volume,176
  !pan,10
  !transpose,251
  !loop : dw Sub58A4 : db 4
  !loop : dw Sub58B7 : db 8
  !end

Sub58A4:
  !dynamicMusicVolume,192,144
  db 36
  !c4
  !c4
  db 24
  !cs4
  !as3
  !dynamicMusicVolume,192,176
  db 36
  !c4
  !c4
  db 24
  !cs4
  !as3
  !end

Sub58B7:
  !dynamicMusicVolume,192,144
  db 36
  !ds4
  !ds4
  db 24
  !e4
  !cs4
  !dynamicMusicVolume,192,176
  db 36
  !ds4
  !ds4
  db 24
  !e4
  !cs4
  !end

Track58CA:
  db 127,$7F
  !instr,$19
  !volume,192
  !pan,10
  !transpose,2
  !loop : dw Sub58DD : db 8
  !loop : dw Sub58E4 : db 8
  !end

Sub58DD:
  db 36
  !c4
  !c4
  db 24
  !cs4
  !as3
  !end

Sub58E4:
  db 36
  !ds4
  !ds4
  db 24
  !e4
  !cs4
  !end

Track58EB:
  db 127,$7F
  !instr,$19
  !volume,192
  !transpose,2
  !loop : dw Sub58FC : db 8
  !loop : dw Sub5913 : db 8
  !end

Sub58FC:
  !pan,10
  db 24
  !c5
  db 12
  !rest
  db 24
  !c5
  db 12
  !rest
  !pan,12
  db 22
  !cs5
  db 2
  !rest
  !pan,8
  db 22
  !as4
  db 2
  !rest
  !end

Sub5913:
  !pan,10
  db 24
  !ds5
  db 12
  !rest
  db 24
  !ds5
  db 12
  !rest
  !pan,12
  db 22
  !e5
  db 2
  !rest
  !pan,8
  db 22
  !cs5
  db 2
  !rest
  !end

Track592A:
  db 24,$7F
  !volume,176
  !transpose,1
  !instr,$1A
  !loop : dw Sub593F : db 2
  !loop : dw Sub594F : db 4
  !loop : dw Sub595D : db 255
  !end

Sub593F:
  !pan,6
  !dynamicPan,160,14
  db 96
  !c5
  !tie
  !pan,14
  !dynamicPan,160,6
  !c5
  !tie
  !end

Sub594F:
  !pan,6
  !dynamicPan,160,14
  db 96
  !c5
  !pan,14
  !dynamicPan,160,6
  !c5
  !end

Sub595D:
  !pan,6
  !dynamicPan,160,14
  db 48
  !c5
  !pan,14
  !dynamicPan,160,6
  !c5
  !end

Track596B:
  db 24,$7F
  !loop : dw Sub5982 : db 8
  !loop : dw Sub598C : db 1
  !loop : dw Sub5982 : db 8
  !loop : dw Sub59AE : db 1
  !loop : dw Sub5982 : db 255
  !end

Sub5982:
  !instr,$1B
  !volume,128
  !transpose,0
  db 12
  !rest
  !fs4
  !end

Sub598C:
  !instr,$1B
  !volume,192
  db 9
  !e3
  db 3
  !rest
  db 8
  !e3
  !e3
  db 9
  !e3
  db 3
  !rest
  db 8
  !e3
  !e3
  !transpose,253
  db 4
  !f4
  !e4
  !f4
  !g4
  !f4
  !g4
  !a4
  !g4
  !a4
  !b4
  !a4
  !b4
  !end

Sub59AE:
  !instr,$1B
  !volume,192
  db 9
  !e3
  db 3
  !rest
  db 8
  !e3
  !e3
  db 9
  !e3
  db 3
  !rest
  db 8
  !e3
  !e3
  !transpose,253
  db 4
  !f4
  !e4
  !ds4
  !e4
  !g4
  !c4
  !e4
  !g4
  !g4
  !fs4
  !f4
  !a4
  !end

Track59D0:
  db 127,$7F
  !transpose,0
  !echo,%00001111,47,47
  !echoParameters,2,48,5
  !instr,$18
  !volume,176
  !pan,10
  !transpose,251
  !loop : dw Sub59ED : db 4
  !loop : dw Sub5A00 : db 8
  !end

Sub59ED:
  !dynamicMusicVolume,192,144
  db 36
  !c3
  !c3
  db 24
  !cs3
  !as2
  !dynamicMusicVolume,192,176
  db 36
  !c3
  !c3
  db 24
  !cs3
  !as2
  !end

Sub5A00:
  !dynamicMusicVolume,192,144
  db 36
  !ds3
  !ds3
  db 24
  !e3
  !cs3
  !dynamicMusicVolume,192,176
  db 36
  !ds3
  !ds3
  db 24
  !e3
  !cs3
  !end

if defined("print_freespace")
  print "Song 8A: Space left: $",hex($10000-(2*$800)-pc())
endif
assert pc() <= $10000-(2*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
