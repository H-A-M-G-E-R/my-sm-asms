
;;; Power bomb DMA
org $9382FD ; overwrite an unused instruction
Inst_DoPowerBombDma:
{
  PHX : LDA $0000,y : AND #$00FF : TAX
  PHB : PEA $8300 : PLB : PLB
  LDA.W PowerBombDmaPtrs,x : JSL DoDmaDef ; see "charge_flare/charge_flare.asm"
  PLB : PLX : INY : RTS
}

PowerBombSlowAnim:
dw Inst_DoPowerBombDma : db 0
dw 8,PowerBombOam : db 4,4 : dw 0
dw Inst_DoPowerBombDma : db 2
dw 8,PowerBombOam : db 4,4 : dw 0
dw Inst_DoPowerBombDma : db 4
dw 8,PowerBombOam : db 4,4 : dw 0
dw $8239,PowerBombSlowAnim ; go to

%padSafe($93834D)

org $93C8BE
PowerBombAnimTbl:
dw 200, PowerBombSlowAnim

PowerBombFastAnim:
dw Inst_DoPowerBombDma : db 0
dw 3,PowerBombOam : db 4,4 : dw 0
dw Inst_DoPowerBombDma : db 2
dw 3,PowerBombOam : db 4,4 : dw 0
dw Inst_DoPowerBombDma : db 4
dw 3,PowerBombOam : db 4,4 : dw 0
dw $8239,PowerBombFastAnim

PowerBombOam:
dw 1
db $FC,$01,$FC,$7B,$3A

%padSafe($93C90F)

org $9383F7 : dw PowerBombAnimTbl
org $90C171 : ADC.W #PowerBombFastAnim-PowerBombSlowAnim

; gfx
org $9A9E00 : incbin "common_oam.gfx":0..$A0*$20
org $9AC400 : incbin "common_oam.gfx":$A0*$20..$C0*$20
