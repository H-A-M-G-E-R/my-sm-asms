asar 1.91
norom : org 0
incsrc "../spc_defines.asm"

; elevator

spcblock !p_sounds3Low+$0B-1 nspc
  db SoundElevator
endspcblock

spcblock !p_sounds3High+$0B-1 nspc
  db SoundElevator>>8
endspcblock

spcblock 6*$3F+!p_instrumentTable nspc
  db $3F,$F5,$E0,$00,$02,$83
endspcblock

spcblock 4*$3F+!p_sampleTable nspc
  dw SampleElevator,SampleElevator+16*9/16
endspcblock

spcblock $A800-$9F80+!p_sampleDataEnd+$400-filesize("elevator_10491.144192_16.brr")-25 nspc
SoundElevator:
  db $01 : dw .voice0 ; 3
.voice0
  db $F5,$100/64 : !b7 ; 6
  db $3F ; 7
  !c4,200,64 ; 10
  db $FE,$00 ; 12
    db $F5,$200/128 : !c2 ; 15
    db $F0,200,128 ; 18
    db $F5,$200/128 : !b7 ; 21
    db $F0,200,128 ; 24
  db $FB ; 25

  SampleElevator: incbin "elevator_10491.144192_16.brr"
endspcblock

dw $0000
