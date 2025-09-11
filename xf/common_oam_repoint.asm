
; power bomb spritemaps
org $93C8FA
dw 1
db $FC,$01,$FC,$44,$3A

dw 1
db $FC,$01,$FC,$45,$3A

dw 1
db $FC,$01,$FC,$7B,$3A

; gfx
org $9A9E00 : incbin "common_oam.gfx":0..$A0*$20
org $9AC400 : incbin "common_oam.gfx":$A0*$20..$C0*$20
