asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*$18+!p_instrumentTable nspc
  db $18,$8F,$10,$00,$02,$7A
  db $19,$FF,$E0,$B8,$02,$7A
  db $1A,$FF,$E0,$B8,$00,$9E
  db $1B,$FF,$F1,$B8,$01,$3D
  db $1C,$FF,$F1,$B8,$01,$3D
  db $1D,$CF,$91,$B8,$01,$3D
  db $1E,$FE,$ED,$B8,$01,$3D
  db $1F,$FF,$F0,$B8,$01,$3C
  db $20,$F8,$EF,$B8,$01,$3D
  db $21,$FF,$E0,$B8,$05,$83
  db $22,$FF,$E0,$B8,$04,$F4
  db $23,$FF,$E0,$B8,$02,$00
endspcblock

spcblock 4*$18+!p_sampleTable nspc
  dw Sample18_19,Sample18_19
  dw Sample18_19,Sample18_19
  dw Sample1A,Sample1A+4545
  dw Sample1B,Sample1B+216
  dw Sample1C,Sample1C+1197
  dw Sample1D,Sample1D+864
  dw Sample1E_20,Sample1E_20+630
  dw Sample1F,Sample1F+639
  dw Sample1E_20,Sample1E_20+630
  dw Sample21,Sample21
  dw Sample22,Sample22+9
  dw Sample23,Sample23
endspcblock

pushpc
org $A180-$9F80+!p_sampleDataEnd+$400
  Sample18_19: skip filesize("Sample_8c1f02134ac346c8f14eb82059b8ef02.brr")
  Sample1A: skip filesize("Sample_f4b98a6e87a1b968270ab79d84403d4d.brr")
  Sample1B: skip filesize("Sample_1d2bbf84c25c871bc6e3176bc24870a4.brr")
  Sample1C: skip filesize("Sample_4648f271e3145cbeb3be74154c98bbc9.brr")
  Sample1D: skip filesize("Sample_43bc4f28d5162b86489cbd3dca2e7af7.brr")
  Sample1E_20: skip filesize("Sample_d789d8b4545d918b6564cc827ee4a348.brr")
  Sample1F: skip filesize("Sample_14513002db7f6139db33682eaa96e6ea.brr")
  Sample21: skip filesize("Sample_fe57609e4a845c8073dd4012e9b2f49e.brr")
  Sample22: skip filesize("Sample_73a339645833dc5c4a7c268916578efa.brr")
  Sample23: skip filesize("Sample_d76a1e2bcbc403bc9360d154294dce53.brr")
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
Pattern5844: dw Track586B, Track58AF, Track59CC, Track5A23, Track5A7A, Track5AF3, 0, 0

Track5854:
  !musicTranspose,0
  !tempo,32
  !musicVolume,192
  !endTremolo
  !endVibrato
  !tempo,48
  !musicVolume,192
  !echo,%00001111,63,63
  !echoParameters,3,16,0
  !end

Track586B:
  db 127,$7F
  !transpose,0
  !pan,10
  !echo,%00001111,63,63
  !echoParameters,3,16,0
  !loop : dw Sub587E : db 255
  !end

Sub587E:
  !instr,$19
  !volume,208
  db 12
  !c5
  db 108
  !rest
  db 12
  !c5
  !rest
  !instr,$18
  !volume,144
  !pan,10
  db 48
  !c5
  !volume,64
  !c5
  !instr,$19
  !volume,208
  !rest
  db 12
  !c5
  db 84
  !rest
  db 12
  !c5
  !rest
  !c5
  !rest
  !instr,$18
  !volume,144
  !pan,10
  db 48
  !c5
  !volume,64
  !c5
  !rest
  !end

Track58AF:
  db 127,$7F
  !transpose,0
  !instr,$1A
  !volume,208
  !pan,6
  !dynamicPan,192,10
  db 96
  !d5
  !tie
  !tie
  !rest
  !tie
  !tie
  !instr,$1B
  !volume,72
  !pan,14
  !dynamicPan,240,6
  db 36
  !rest
  db 12
  !a6
  !as6
  db 24
  !a7
  !rest
  db 12
  !a6
  !c7
  db 24
  !g7
  !rest
  db 12
  !a6
  !d7
  db 24
  !f7
  !rest
  !a6
  !e7
  !rest
  db 12
  !a6
  !as6
  db 24
  !d7
  !rest
  db 12
  !a6
  !c7
  db 24
  !e7
  !rest
  db 12
  !a6
  !d7
  db 24
  !f7
  !rest
  db 12
  !a6
  !e7
  !g7
  !instr,$1A
  !volume,208
  !pan,14
  !dynamicPan,192,10
  db 96
  !d5
  !tie
  !tie
  !rest
  !tie
  !tie
  !instr,$1B
  !volume,72
  !pan,6
  !dynamicPan,240,14
  db 36
  !rest
  db 12
  !a6
  !as6
  db 24
  !a7
  !rest
  db 12
  !a6
  !c7
  db 24
  !g7
  !rest
  db 12
  !a6
  !d7
  db 24
  !f7
  !rest
  !a6
  !e7
  !rest
  db 12
  !a6
  !as6
  db 24
  !d7
  !rest
  db 12
  !a6
  !c7
  db 24
  !e7
  !rest
  db 12
  !a6
  !d7
  db 24
  !f7
  !rest
  db 12
  !a6
  !e7
  !g7
  !instr,$1A
  !volume,208
  !pan,6
  !dynamicPan,192,10
  db 96
  !ds5
  !tie
  !tie
  !rest
  !tie
  !tie
  !instr,$1B
  !volume,72
  !pan,14
  !dynamicPan,240,6
  db 36
  !rest
  db 12
  !as6
  !b6
  db 24
  !as7
  !rest
  db 12
  !as6
  !cs7
  db 24
  !gs7
  !rest
  db 12
  !as6
  !ds7
  db 24
  !fs7
  !rest
  !as6
  !f7
  !rest
  db 12
  !as6
  !b6
  db 24
  !ds7
  !rest
  db 12
  !as6
  !cs7
  db 24
  !f7
  !rest
  db 12
  !as6
  !ds7
  db 24
  !fs7
  !rest
  db 12
  !as6
  !f7
  !gs7
  !instr,$1A
  !volume,208
  !pan,14
  !dynamicPan,192,10
  db 96
  !ds5
  !tie
  !tie
  !rest
  !tie
  !tie
  !instr,$1B
  !volume,72
  !pan,6
  !dynamicPan,240,14
  db 36
  !rest
  db 12
  !as6
  !b6
  db 24
  !as7
  !rest
  db 12
  !as6
  !cs7
  db 24
  !gs7
  !rest
  db 12
  !as6
  !ds7
  db 24
  !fs7
  !rest
  !as6
  !f7
  !rest
  db 12
  !as6
  !b6
  db 24
  !ds7
  !rest
  db 12
  !as6
  !cs7
  db 24
  !f7
  !rest
  db 12
  !as6
  !ds7
  db 24
  !fs7
  !rest
  db 12
  !as6
  !f7
  !gs7
  !end

Track59CC:
  db 127,$7F
  !instr,$1C
  !pan,10
  db 24
  !rest
  !transpose,0
  !loop : dw Sub59E1 : db 8
  !transpose,1
  !loop : dw Sub59E1 : db 8
  !end

Sub59E1:
  !volume,175
  !pan,9
  db 12
  !d6
  !rest
  !pan,11
  !e6
  !rest
  !volume,95
  !pan,10
  !e6
  !rest
  !volume,175
  !pan,9
  !e6
  !rest
  !pan,11
  !f6
  !rest
  !volume,95
  !pan,10
  !f6
  !rest
  !volume,175
  !pan,9
  !f6
  !rest
  !pan,11
  !g6
  !rest
  !volume,95
  !pan,10
  !g6
  !rest
  !volume,175
  !pan,9
  !g6
  !rest
  !pan,11
  !a6
  !rest
  !volume,95
  !pan,10
  !a6
  !rest
  !end

Track5A23:
  db 127,$7F
  !instr,$1D
  !pan,10
  db 24
  !rest
  !transpose,0
  !loop : dw Sub5A38 : db 8
  !transpose,1
  !loop : dw Sub5A38 : db 8
  !end

Sub5A38:
  !volume,79
  !pan,11
  db 12
  !f6
  !rest
  !pan,9
  !g6
  !rest
  !volume,47
  !pan,10
  !g6
  !rest
  !volume,79
  !pan,11
  !g6
  !rest
  !pan,9
  !a6
  !rest
  !volume,47
  !pan,10
  !a6
  !rest
  !volume,79
  !pan,11
  !a6
  !rest
  !pan,9
  !as6
  !rest
  !volume,47
  !pan,10
  !as6
  !rest
  !volume,79
  !pan,11
  !as6
  !rest
  !pan,9
  !c7
  !rest
  !volume,47
  !pan,10
  !c7
  !rest
  !end

Track5A7A:
  db 127,$7F
  !pan,10
  !instr,$1F
  !volume,240
  db 96
  !d6
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1E
  !volume,192
  db 72
  !a5
  db 96
  !e5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1F
  !volume,240
  db 96
  !d6
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1E
  !volume,192
  db 72
  !d5
  db 96
  !f4
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1F
  !volume,240
  db 96
  !ds6
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1E
  !volume,192
  db 72
  !as5
  db 96
  !f5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1F
  !volume,240
  db 96
  !ds6
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$1E
  !volume,192
  db 72
  !cs5
  db 96
  !ds5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  !tie
  db 24
  !tie
  !end

Track5AF3:
  db 127,$7F
  !pan,10
  !instr,$1F
  !volume,144
  db 96
  !d7
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$20
  !volume,160
  db 48
  !rest
  db 72
  !a5
  db 96
  !e5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  db 72
  !tie
  !instr,$1F
  !volume,144
  db 96
  !d7
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$20
  !volume,160
  db 48
  !rest
  db 72
  !d5
  db 96
  !f4
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  db 72
  !tie
  !instr,$1F
  !volume,144
  db 96
  !ds7
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$20
  !volume,160
  db 48
  !rest
  db 72
  !as5
  db 96
  !f5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  db 72
  !tie
  !instr,$1F
  !volume,144
  db 96
  !ds7
  !tie
  !rest
  !tie
  !tie
  db 24
  !tie
  !instr,$20
  !volume,160
  db 48
  !rest
  db 72
  !cs5
  db 96
  !ds5
  !tie
  db 72
  !tie
  db 96
  !rest
  !tie
  db 72
  !tie
  !end

assert pc() <= $10000-(3*$800)
endspcblock

spcblock !p_extra nspc
  dw Trackers-8 : db 0
endspcblock

dw $0000
