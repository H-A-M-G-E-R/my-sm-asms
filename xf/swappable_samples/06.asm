asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

spcblock 6*4+!p_instrumentTable nspc
  db $04,$FF,$E0,$B8,$05,$08
endspcblock

spcblock 6*!sampleChargingBeam1+!p_instrumentTable nspc
  db !sampleChargingBeam1,$FF,$E0,$00,$02,$82
endspcblock

spcblock 4*!sampleChargingBeam1+!p_sampleTable nspc
  dw SampleChargingBeam1,SampleChargingBeam1+16*9/16
endspcblock

spcblock !p_sample04 nspc
  Sample04: incbin "plasma_beam_10512_noloop_a1.5.brr"
  SampleChargingBeam1: incbin "charging_plasma_beam_10476.805824_16.brr"
endspcblock

spcblock !p_chargingBeamSound nspc
Sound08:
  db $02 : dw .voice0, .voice1
.voice0
  db $F5,(($A4+46/64*12)-($A4-47/64*12))/52*256 : !b7
  %make_sound_subnote_with_instr(!sampleChargingBeamCommon, "!c5", -47/64*12, 80, 52)
  db $F5,0 : !b7
.resumeVoice0
  %make_sound_subnote_with_instr(!sampleChargingBeamCommon, "!c5", 46/64*12, 80, 255)

.voice1
  db $F5,(($A4+32/64*12)-($A4-47/64*12))/52*256 : !b7
  %make_sound_subnote_with_instr(!sampleChargingBeam1, "!c5", -47/64*12, 27*3, 52)
  db $F5,0 : !b7
.resumeVoice1
  %make_sound_subnote_with_instr(!sampleChargingBeam1, "!c5", 32/64*12, 22*3, 255)

Sound41:
  db $02 : dw Sound08_resumeVoice0, Sound08_resumeVoice1
endspcblock

dw $0000
