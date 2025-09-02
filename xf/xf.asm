; Patches for Meta's X-Fusion hack (https://metroidconstruction.com/hack.php?id=837) that makes it feel a bit more like Fusion.
; Patch it on xf_v1.2_gba-eng-fre-jap-ger.
lorom

org $90FF6D ; little bit of freespace :)
DoRShot:
{
    ; branch if [charge counter] < 60
    LDA $0CD0
    CMP.W #60
    BMI .dontDoIt
        STZ $0CD0 ; Beam charge counter = 0
        JSR $BCBE ; Clear charge beam animation state
        PHP
        JMP $B986 ; Go to fire charged beam
    .dontDoIt
    STZ $0CD0 ; Beam charge counter = 0
    JSR $BCBE ; Clear charge beam animation state
    JSL $91DEBA ; Load Samus suit palette
    RTS
}

org $9BCBFB ; 9b freespace
SamusChargingNormalBeamPals:
{
    dw $4E73,$0000,$57EE,$6AE7,$51CC,$38EC,$7FFF,$17FF,$1138,$115D,$08F1,$3FE7,$12F8,$5755,$362D,$252B
    dw $4E73,$0000,$5BF4,$632E,$4A52,$3171,$7FFF,$2FFF,$21DB,$21FD,$1574,$43EE,$271A,$5777,$3E92,$258F
    dw $4E73,$0000,$5FFA,$5796,$46B7,$2A16,$7FFF,$43FF,$327D,$369D,$1E17,$4BF6,$375D,$539A,$42D6,$2214
    dw $4E73,$0000,$5BF4,$632E,$4A52,$3171,$7FFF,$2FFF,$21DB,$21FD,$1574,$43EE,$271A,$5777,$3E92,$258F
    dw $4E73,$0000,$1FFD,$2731,$59D0,$20AE,$7FFF,$173F,$1138,$115D,$08F1,$3FE7,$3919,$5755,$362D,$252B
    dw $4E73,$0000,$3FFF,$3F75,$4E53,$2552,$7FFF,$2F9F,$21DB,$21FD,$1574,$43EE,$3A3B,$5777,$3E92,$258F
    dw $4E73,$0000,$5FDD,$57B9,$46B7,$1E15,$7FFF,$43FF,$327D,$369D,$1E17,$4BF6,$375D,$539A,$42D6,$2214
    dw $4E73,$0000,$3FFF,$3F75,$4E53,$2552,$7FFF,$2F9F,$21DB,$21FD,$1574,$43EE,$3A3B,$5777,$3E92,$258F
    dw $4E73,$0000,$5F1D,$49D4,$410D,$2CAA,$7FFF,$1FF0,$1138,$115D,$08F1,$3FE7,$5B07,$5B55,$3E6E,$08A6
    dw $4E73,$0000,$5F5E,$4E78,$41D1,$356F,$7FFF,$3BD5,$21DB,$21FD,$1574,$43EE,$5B4F,$5778,$42B2,$156D
    dw $4E73,$0000,$5F9E,$531B,$4696,$3E13,$7FFF,$57B9,$327D,$369D,$1E17,$4BF6,$5796,$539A,$42D6,$2214
    dw $4E73,$0000,$5F5E,$4E77,$41F2,$356F,$7FFF,$3BD5,$21DB,$21FD,$1574,$43EE,$5B4F,$5778,$42B2,$156D
    dw $4E73,$0000,$033F,$01DE,$00F3,$2468,$7FFF,$0271,$1138,$115D,$08F1,$3FE7,$014A,$5754,$362C,$250A
    dw $4E73,$0000,$037F,$021E,$0133,$24CA,$7FFF,$02D3,$21DA,$21FD,$1174,$43EE,$018C,$5377,$3A71,$218F
    dw $4E73,$0000,$03DF,$025E,$0173,$252D,$7FFF,$0336,$327D,$369D,$1E17,$4BF6,$01CF,$539A,$42D6,$2214
    dw $4E73,$0000,$037F,$021E,$0133,$24CA,$7FFF,$02D3,$21DA,$21FD,$1174,$43EE,$018C,$5377,$3A71,$218F
}
SamusChargingChargeBeamPals:
{
    dw $4E73,$0000,$5F94,$626F,$492D,$306B,$7FFF,$27DF,$10F9,$111E,$0C92,$3FE7,$1678,$5735,$360D,$2089
    dw $4E73,$0000,$6379,$5A77,$3D33,$244F,$7FFF,$4B9F,$215C,$259F,$18D7,$43CF,$2A3B,$5318,$3E12,$188D
    dw $4E73,$0000,$673F,$525E,$3539,$1452,$7FFF,$6F5F,$31BF,$3A1F,$291B,$47B6,$3DFD,$4EFA,$4237,$1490
    dw $4E73,$0000,$6379,$5A77,$3D33,$244F,$7FFF,$4B9F,$215C,$259F,$18D7,$43CF,$2A3B,$5318,$3E12,$188D
    dw $4E73,$0000,$379E,$1EF3,$5951,$1C2D,$7FFF,$131D,$10F9,$111E,$0C92,$3FE7,$3CB9,$5735,$3E4E,$1509
    dw $4E73,$0000,$5F7F,$2EB8,$4D56,$1C51,$7FFF,$235C,$215C,$259F,$18D7,$43CF,$3D5B,$5318,$4233,$14CD
    dw $4E73,$0000,$6F5F,$3E7D,$455B,$1874,$7FFF,$379B,$31BF,$3A1F,$291B,$47B6,$3DFD,$4EFA,$4237,$1490
    dw $4E73,$0000,$5F7F,$2EB8,$4D56,$1C51,$7FFF,$235C,$215C,$259F,$18D7,$43CF,$3D5B,$5318,$4233,$14CD
    dw $4E73,$0000,$62DC,$4534,$3C8D,$202A,$7FFF,$13D1,$10F9,$111E,$0C92,$3FE7,$4E6A,$5715,$3E4F,$0425
    dw $4E73,$0000,$671D,$4199,$3CD3,$1C4F,$7FFF,$23B6,$215C,$259F,$18D7,$43CF,$4A30,$52F9,$4235,$0C6A
    dw $4E73,$0000,$6F5F,$3DFD,$3D38,$1874,$7FFF,$379B,$31BF,$3A1F,$291B,$47B6,$4215,$4EFA,$4237,$1490
    dw $4E73,$0000,$671D,$4199,$3CD3,$1C4F,$7FFF,$23B6,$215C,$259F,$18D7,$43CF,$4A30,$52F9,$4235,$0C6A
    dw $4E73,$0000,$12FF,$0DDE,$0CF7,$282A,$7FFF,$1232,$10F9,$111D,$0C92,$3FC7,$0D4D,$5B32,$31E8,$20A8
    dw $4E73,$0000,$271F,$19FE,$1D1B,$2C4E,$7FFF,$2276,$215C,$259E,$18D6,$43AE,$1992,$5B32,$31E8,$1CAB
    dw $4E73,$0000,$3B3F,$2A3F,$2D5F,$3072,$7FFF,$32BA,$31BF,$3A1F,$291B,$47B6,$29D7,$5B32,$31E8,$18AE
    dw $4E73,$0000,$271F,$19FE,$1D1B,$2C4E,$7FFF,$2276,$215C,$259E,$18D6,$43AE,$1992,$5B32,$31E8,$1CAB
}
SamusChargingWideBeamPals:
{
    dw $4E73,$0000,$63D0,$726F,$594D,$3C4C,$7FFF,$2BBF,$18D9,$191E,$1892,$4BE7,$2A79,$6736,$45D0,$2C8A
    dw $4E73,$0000,$6FB8,$7277,$5D33,$3C51,$7FFF,$537F,$353B,$357F,$30B5,$5BEE,$563C,$6B39,$59B8,$348F
    dw $4E73,$0000,$7B7F,$6E5F,$5D39,$3855,$7FFF,$7B3F,$517D,$51FF,$4CF9,$6BF5,$6D9F,$733C,$6D9F,$3C94
    dw $4E73,$0000,$6FB8,$7277,$5D33,$3C51,$7FFF,$537F,$353B,$357F,$30B5,$5BEE,$563C,$6B39,$59B8,$348F
    dw $4E73,$0000,$3BBD,$3EB5,$6132,$280E,$7FFF,$3ABF,$18D9,$191E,$1892,$4BE7,$4C9A,$62D6,$4A0F,$250A
    dw $4E73,$0000,$5B9E,$5679,$6136,$3031,$7FFF,$769F,$353B,$357F,$30B5,$5BEE,$5D1D,$6B19,$55F5,$30CF
    dw $4E73,$0000,$775E,$6E3C,$5D39,$3855,$7FFF,$7B3F,$517D,$51FF,$4CF9,$6BF5,$6D9F,$733C,$61BA,$3C94
    dw $4E73,$0000,$5B9E,$5679,$6136,$3031,$7FFF,$769F,$353B,$357F,$30B5,$5BEE,$5D1D,$6B19,$55F5,$30CF
    dw $4E73,$0000,$6AFC,$5154,$48AD,$302B,$7FFF,$23F0,$18D9,$191E,$1892,$4BE7,$6287,$6335,$4A2F,$1426
    dw $4E73,$0000,$733D,$65D9,$50F2,$3870,$7FFF,$43D5,$353B,$357F,$30B5,$5BEE,$6E4F,$6B39,$55F5,$286D
    dw $4E73,$0000,$7B7E,$6E3C,$5D57,$44B5,$7FFF,$63B9,$517D,$51FF,$4CF9,$6BF5,$7637,$733C,$61BA,$3C94
    dw $4E73,$0000,$733D,$65D9,$50F2,$3870,$7FFF,$43D5,$353B,$357F,$30B5,$5BEE,$6E4F,$6B39,$55F5,$286D
    dw $4E73,$0000,$22DF,$19BE,$18D6,$284A,$7FFF,$2234,$18D8,$191D,$1891,$4BE7,$194D,$6335,$45CF,$2C8A
    dw $4E73,$0000,$42BF,$31DE,$34D9,$2C8E,$7FFF,$4659,$351A,$357E,$30B5,$5BEE,$3192,$6B38,$59B7,$348F
    dw $4E73,$0000,$62BF,$49FF,$50DC,$34D2,$7FFF,$6A7E,$517D,$51FF,$4CF9,$6BF5,$4DF8,$733C,$6D9F,$3C94
    dw $4E73,$0000,$42BF,$31DE,$34D9,$2C8E,$7FFF,$4659,$351A,$357E,$30B5,$5BEE,$3192,$6B38,$59B7,$348F
}
SamusChargingPlasmaBeamPals:
{
    dw $4E73,$0000,$4FF0,$5EE7,$51C7,$34C6,$7FFF,$17FF,$0D53,$119A,$050D,$4BE5,$0B14,$5773,$3A8B,$1D05
    dw $4E73,$0000,$4BF7,$4B4F,$4A27,$2925,$7FFF,$2FFF,$19F1,$2616,$0DCC,$5BEA,$1773,$5394,$36CC,$1564
    dw $4E73,$0000,$47FE,$37B6,$46A8,$1DA4,$7FFF,$47FE,$26AE,$36D4,$166A,$63F0,$1FB2,$4FD6,$330D,$0DE4
    dw $4E73,$0000,$4BF7,$4B4F,$4A27,$2925,$7FFF,$2FFF,$19F1,$2616,$0DCC,$5BEA,$1773,$5394,$36CC,$1564
    dw $4E73,$0000,$23FD,$2372,$55AB,$1C88,$7FFF,$173A,$0D53,$119A,$050D,$4BE5,$45EF,$5773,$3A8B,$1565
    dw $4E73,$0000,$47FE,$37B6,$4A09,$1D06,$7FFF,$2F95,$19F1,$2616,$0DCC,$57EA,$5A4F,$5394,$36CC,$11A5
    dw $4E73,$0000,$6BFD,$4BFA,$3E68,$1DA4,$7FFF,$43D0,$26AE,$36D4,$166A,$63F0,$66CC,$4FD6,$330D,$0DE4
    dw $4E73,$0000,$47FE,$37B6,$4A09,$1D06,$7FFF,$2F95,$1A31,$2656,$0DCC,$57EA,$5A4F,$5394,$36CC,$11A5
    dw $4E73,$0000,$62FC,$4991,$2CC6,$2485,$7FFF,$1BEE,$0D53,$119A,$050D,$4BE5,$5B03,$5773,$3A8B,$04A1
    dw $4E73,$0000,$673C,$5251,$31A6,$2505,$7FFF,$37F1,$1A31,$2656,$0DCC,$57EA,$5F47,$5394,$36CC,$0943
    dw $4E73,$0000,$6B9D,$5712,$3A86,$29A5,$7FFF,$53F3,$26EE,$3B33,$168A,$63F0,$5FAB,$4FD6,$330D,$0DE4
    dw $4E73,$0000,$673C,$5251,$31A6,$2505,$7FFF,$37F1,$1A31,$2656,$0DCC,$57EA,$5F47,$5394,$36CC,$0943
    dw $4E73,$0000,$033C,$023A,$0170,$2085,$7FFF,$066F,$0D33,$115A,$050C,$47E5,$0167,$5753,$3249,$1D05
    dw $4E73,$0000,$037A,$02B6,$020D,$1D04,$7FFF,$0AD0,$19F0,$2217,$0DAB,$53EA,$01C6,$5394,$32AB,$1564
    dw $4E73,$0000,$03D8,$0353,$02AB,$1DA4,$7FFF,$0F51,$26AE,$36D4,$166A,$63F0,$0645,$4FD6,$330D,$0DE4
    dw $4E73,$0000,$037A,$02B6,$020D,$1D04,$7FFF,$0AD0,$19F0,$2217,$0DAB,$53EA,$01C6,$5394,$32AB,$1564
}
SamusChargingWaveBeamPals:
{
    dw $4E73,$0000,$6B92,$7689,$690A,$4C88,$7FFF,$3FDE,$1CD5,$20FB,$1CAD,$5F8D,$3E33,$6F36,$562D,$4109
    dw $4E73,$0000,$7796,$7A6E,$710C,$5089,$7FFF,$5FBD,$3D13,$3D39,$3D0D,$6F74,$5DF2,$7738,$6A50,$514A
    dw $4E73,$0000,$7F3A,$7A73,$78ED,$54A9,$7FFF,$7B9C,$5D72,$5D77,$5D4D,$7F3A,$7DB0,$7F3A,$7A73,$5D8C
    dw $4E73,$0000,$7796,$7A6E,$710C,$5089,$7FFF,$5FBD,$3D13,$3D39,$3D0D,$6F74,$5DF2,$7738,$6A50,$514A
    dw $4E73,$0000,$1FDC,$26EF,$692C,$2C2A,$7FFF,$171B,$1CD5,$20FB,$1CAD,$47C5,$4C75,$6334,$4E4C,$3127
    dw $4E73,$0000,$3F9B,$42D0,$6D0D,$3849,$7FFF,$2B38,$3D13,$3D39,$3D0D,$57AA,$5CD4,$6F36,$5E6E,$4909
    dw $4E73,$0000,$5F5B,$5E92,$750D,$4869,$7FFF,$3F75,$5D72,$5D77,$5D4D,$638F,$6D52,$7738,$6E71,$610B
    dw $4E73,$0000,$3F9B,$42D0,$6D0D,$3849,$7FFF,$2B38,$3D13,$3D39,$3D0D,$57AA,$5CD4,$6F36,$5E6E,$4909
    dw $4E73,$0000,$66BB,$5151,$4C89,$3026,$7FFF,$1BCE,$1CD5,$20FB,$1CAD,$4BC6,$62A3,$6334,$4E4C,$1823
    dw $4E73,$0000,$6EFB,$61B2,$5CAA,$3C47,$7FFF,$37B0,$3D13,$3D39,$3D0D,$5F8D,$6EA6,$6F36,$5E6E,$3447
    dw $4E73,$0000,$771B,$6E12,$6CCC,$4868,$7FFF,$5392,$5D72,$5D77,$5D4D,$6F74,$76AA,$7738,$6E71,$508B
    dw $4E73,$0000,$6EFB,$61B2,$5CAA,$3C47,$7FFF,$37B0,$3D13,$3D39,$3D0D,$5F8D,$6EA6,$6F36,$5E6E,$3447
    dw $4E73,$0000,$26DD,$25BB,$1CD1,$3427,$7FFF,$2A72,$1CD4,$1CFB,$1CAD,$4FA8,$292A,$6734,$4A0B,$38E8
    dw $4E73,$0000,$4ADC,$49D8,$38EF,$4468,$7FFF,$52D6,$3D13,$3D39,$3CED,$6771,$516D,$7337,$622F,$492A
    dw $4E73,$0000,$6EDB,$6DF5,$550D,$54A9,$7FFF,$7F3A,$5D72,$5D77,$5D4D,$7F3A,$7DB0,$7F3A,$7A73,$5D8C
    dw $4E73,$0000,$4ADC,$49D8,$38EF,$4468,$7FFF,$52D6,$3D13,$3D39,$3CED,$6771,$516D,$7337,$622F,$492A
}
SamusChargingIceBeamPals:
{
    dw $4E73,$0000,$5BEA,$76A1,$5D46,$4486,$7FFF,$1BFD,$14F5,$14FC,$14CD,$47E2,$16B2,$6352,$4228,$34E5
    dw $4E73,$0000,$67EB,$7AC3,$6565,$4CA5,$7FFF,$33FA,$2D54,$2D5A,$2D2C,$53E5,$2E8F,$6B71,$4E48,$4124
    dw $4E73,$0000,$6FEC,$7EC4,$6D64,$50E3,$7FFF,$4BF8,$41B2,$41B9,$418C,$63E8,$468C,$6F90,$5E88,$4983
    dw $4E73,$0000,$67EB,$7AC3,$6565,$4CA5,$7FFF,$33FA,$2D54,$2D5A,$2D2C,$53E5,$2E8F,$6B71,$4E48,$4124
    dw $4E73,$0000,$17FB,$234D,$698B,$2C48,$7FFF,$131C,$14F5,$14FC,$14CD,$47E1,$4895,$6352,$4AAA,$2986
    dw $4E73,$0000,$2FFA,$376D,$6DCA,$3CA7,$7FFF,$2359,$2D54,$2D5A,$2D2C,$53E3,$5513,$6B92,$56EA,$3DC5
    dw $4E73,$0000,$47F9,$4FAC,$7609,$4D05,$7FFF,$3776,$41B2,$41B9,$418C,$63E5,$6191,$6FB2,$634A,$5205
    dw $4E73,$0000,$2FFA,$376D,$6DCA,$3CA7,$7FFF,$2359,$2D54,$2D5A,$2D2C,$53E3,$5513,$6B92,$56EA,$3DC5
    dw $4E73,$0000,$66DB,$5150,$48A8,$3045,$7FFF,$17EC,$14F5,$14FC,$14CD,$47E3,$62E1,$6373,$4A8B,$1441
    dw $4E73,$0000,$6B3A,$5DD0,$54E8,$3885,$7FFF,$2BED,$2D54,$2D5A,$2D2C,$57E6,$6B22,$6B93,$56EB,$28A3
    dw $4E73,$0000,$737A,$6A4F,$6149,$44C5,$7FFF,$43ED,$41B2,$41B9,$418C,$63EA,$7363,$73B4,$632C,$3CE4
    dw $4E73,$0000,$6B3A,$5DD0,$54E8,$3885,$7FFF,$2BED,$2D54,$2D5A,$2D2C,$57E6,$6B22,$6B93,$56EB,$28A3
    dw $4E73,$0000,$3B5E,$3A3D,$3953,$3864,$7FFF,$2EAE,$2114,$213B,$20ED,$4FE4,$2DA8,$6351,$4628,$3904
    dw $4E73,$0000,$579D,$567D,$5593,$44A3,$7FFF,$46ED,$3153,$317A,$312C,$57E6,$4608,$6770,$5248,$4143
    dw $4E73,$0000,$77DD,$76DD,$75D4,$50E3,$7FFF,$5F4D,$41B2,$41B9,$418C,$63E8,$5E68,$6F90,$5E88,$4983
    dw $4E73,$0000,$579D,$567D,$5593,$44A3,$7FFF,$46ED,$3153,$317A,$312C,$57E6,$4608,$6770,$5248,$4143
}
SamusAbsorbXPals:
{
    dw $4E73,$4E73,$4BEB,$6EA0,$4D69,$388A,$7FFF,$03FF,$00B7,$00DE,$0090,$33E0,$02D6,$4F13,$2E2B,$24E8
    dw $4E73,$4E73,$3FED,$66C0,$41AB,$30CC,$7FFF,$03FF,$00F8,$011E,$00B2,$2FE0,$02F8,$4713,$266D,$1D4A
    dw $4E73,$4E73,$37EF,$62E0,$39CD,$28EE,$7FFF,$03FF,$011A,$013E,$00F3,$27E0,$0319,$3AF4,$22B0,$198D
    dw $4E73,$4E73,$2BF1,$5B00,$2E0F,$2130,$7FFF,$03FF,$015B,$017E,$0115,$1FE0,$033A,$2ED4,$1EF3,$15EF
    dw $4E73,$4E73,$23F3,$5720,$2231,$1952,$7FFF,$03FF,$017C,$019F,$0157,$17E0,$035C,$22B5,$1B36,$0E51
    dw $4E73,$4E73,$1BF5,$4F40,$1A73,$1194,$7FFF,$03FF,$01BD,$01DF,$0179,$0FE0,$037D,$1695,$1379,$0A94
    dw $4E73,$4E73,$0FF7,$4B60,$0EB5,$09B6,$7FFF,$03FF,$01FE,$021F,$01BB,$0BE0,$03BE,$0A76,$0F9C,$06F6
    dw $4E73,$4E73,$07F9,$4380,$06D7,$01F8,$7FFF,$03FF,$021F,$023F,$01DC,$03E0,$03DF,$0256,$0BDE,$0338
    dw $4E73,$4E73,$0FFB,$43A3,$0735,$0635,$7FFF,$0FFF,$027D,$069E,$023A,$13E4,$03FE,$0294,$0BFD,$0356
    dw $4E73,$4E73,$17FB,$43A7,$0B53,$0A91,$7FFE,$1FFF,$06BA,$0EDC,$0297,$23E9,$07FD,$06D2,$0FFA,$0373
    dw $4E73,$4E73,$1FFB,$43CB,$0F71,$0ECD,$7FFD,$2BFE,$0718,$171B,$02F4,$37ED,$0BF9,$0B30,$13F8,$0771
    dw $4E73,$4E73,$27FB,$3FCF,$0FAF,$1329,$7FFC,$3BFB,$0B55,$1B79,$0351,$47F2,$0BF7,$0B6E,$13F6,$078E
    dw $4E73,$4E73,$33FB,$3FF2,$13CD,$1765,$7FFB,$47FB,$0BB3,$23B8,$038F,$5BF7,$0FF5,$0FAC,$17F4,$07AC
    dw $4E73,$4E73,$3BFB,$3FF6,$17EB,$1BA2,$7FFA,$57F9,$0FF1,$2BF6,$03EC,$6BFB,$13F3,$13EA,$1BF2,$0BA9
    dw $4E73,$4E73,$3BFB,$43F5,$17EB,$1B82,$7FFA,$53FA,$0BD1,$27D7,$03CC,$6BFA,$13F3,$13EA,$1BF2,$0BA9
    dw $4E73,$4E73,$3BFA,$43F5,$1BCB,$1F62,$7FFB,$53FA,$0BB2,$27B7,$03AC,$6BF9,$0FF4,$17EB,$1BD1,$0B89
    dw $4E73,$4E73,$3BFA,$47D4,$1FAA,$1F42,$7FFB,$4FFB,$0B92,$2798,$038C,$67F8,$0FD4,$17EB,$1BD1,$0B68
    dw $4E73,$4E73,$3FF9,$47D3,$1F8A,$2322,$7FFB,$4BFB,$0B72,$2378,$036C,$67F7,$0FD4,$1BEB,$1BB1,$0B48
    dw $4E73,$4E73,$3FF8,$4BB2,$236A,$2303,$7FFB,$47FB,$0B52,$2358,$034C,$63F6,$0FB4,$1FCC,$1F90,$0F28
    dw $4E73,$4E73,$43F6,$538F,$2B09,$2683,$7FFC,$3BFD,$06D3,$1AF9,$02CC,$5FF2,$0B94,$27CD,$1F4F,$12C7
    dw $4E73,$4E73,$47F3,$5B4C,$32A9,$2E24,$7FFD,$2FFE,$0674,$167A,$024D,$57EE,$0775,$33AE,$230D,$1647
    dw $4E73,$4E73,$4BF0,$6328,$3E48,$31A5,$7FFE,$23FF,$01F4,$11FB,$01CD,$4FEA,$0735,$3F8F,$26CC,$19C7
    dw $4E73,$4E73,$4FEE,$66E5,$45E7,$3526,$7FFF,$17FF,$0175,$099C,$014D,$47E6,$0315,$4770,$2A6A,$2146
    dw $4E73,$4E73,$53EB,$6EA2,$4D87,$3CA7,$7FFF,$0BFF,$00F6,$051D,$00CE,$3FE2,$02D5,$5351,$2E29,$24E6
}

SamusChargingBeamPalPtrTbl:
    dw SamusChargingNormalBeamPals
    dw SamusChargingWaveBeamPals
    dw SamusChargingPlasmaBeamPals
    dw SamusChargingWaveBeamPals
    dw SamusChargingWideBeamPals
    dw SamusChargingWaveBeamPals
    dw SamusChargingPlasmaBeamPals
    dw SamusChargingWaveBeamPals
    dw SamusChargingNormalBeamPals
    dw SamusChargingNormalBeamPals
    dw SamusChargingNormalBeamPals
    dw SamusChargingNormalBeamPals

; charge while spinjumping
HandleChargingBeam:
{
    LDA $0CD0 : STA $0DC2 ; previous charge counter = [charge counter]
    LDA $0A78 : BNE .ret ; return if time is frozen
    LDA $0A1F : AND #$00FF : CMP #$001B : BNE + ; reset charge and return if movement type = shinespark / crystal flash / drained by metroid / damaged by MB's attacks
        STZ $0CD0 : BRA .ret
    +
    LDA $0D32 : CMP #$C4F0 : BNE .ret ; return if grappling
    LDX $09D2 : LDA.l AllowedChargeBeamHUDSelections-1,x : BPL .ret ; return if charging beam isn't allowed

    LDA $0A76 : BNE .hyperOrNoCharge ; branch if hyper beam
    LDA $09A6 : BIT #$1000 : BNE .charge ; branch if charge equipped

    .hyperOrNoCharge
    ;STZ $0CD0 ; reset charge counter if hyper beam or no charge
    BRA .ret

    .charge
    LDA $8B : AND $09B2 : BEQ .ret ; return if not pressing shoot
    LDA $0CD0 : CMP #$0078 : BPL .ret ; return if [charge counter] >= 120
    INC : STA $0CD0 ; increment charge counter

    .ret
    LDA $0A1F : AND #$00FF : RTL

AllowedChargeBeamHUDSelections:
    db $FF,$00,$00,$FF,$00,$FF
}

org $90C541
    JSR DoRShot
    CLC : RTS

org $91D7D5 ; pointers to old charge palettes
DoSamusChargingBeamPal:
{
    LDA $09A6 : AND #$000F : ASL : TAX ; equipped beams
    LDA.L SamusChargingBeamPalPtrTbl,x : STA $24
    LDA $0B62 : AND #$000C : ASL : ASL : ASL : ADC $24 : STA $24 ; charge palette index
    LDA $0A74 : XBA : LSR : LSR : ADC $24 : TAX ; suit palette index
    RTS
}

DoSamusAbsorbXPal:
{
    LDA.W #48+1 : SEC : SBC $0B18 : LSR : XBA : LSR : LSR : LSR
    CLC : ADC.W #SamusAbsorbXPals : TAX
    RTS
}

SetSamusAbsorbXPalTimer:
{
    LDA.W #48+1 : STA $0B18
    LDA $14 : AND #$000F : RTL
}

SetSamusAbsorbBlueXPalTimer:
{
    LDA.W #48+1 : STA $0B18
    JML $91DF12
}
assert pc() <= $91D829

org $91D75A
    JSR DoSamusChargingBeamPal
    JSR $DD5B ; Samus palette = 20h bytes from $9B:[X]
    INC $0B62
    CLC : RTS

org $91D794 ; Samus absorb X pal (replaces charged shot glow)
    JSR DoSamusAbsorbXPal
    JSR $DD5B
    DEC $0B18 : BEQ +
    CLC : RTS
+
    SEC : RTS

org $90BA36 : JSL $91DEBA : PLP : RTS ; remove charged shot glow

org $8D837B ; absorb X routine
    JSL SetSamusAbsorbXPalTimer : NOP

org $A8BE4B ; absorb blue X routine
    JSL SetSamusAbsorbBlueXPalTimer

org $9BA380
SamusHurtPal:
{
    dw $7C84,$675F,$467F,$465F,$5B1F,$4EFF,$46FF,$531F,$5B5F,$6FDF,$7F98,$7FDA,$7FF6,$7FFF,$7FFF,$47F1
}

org $91D8D4 : BRA $00

org $91D8D9
    BIT #$0002
    BNE +
        LDX #$A380 : JSR $DD5B ; hurt flash palette
        BRA ++
    +
        JSL $91DEBA
        BRA ++

org $91D8FC : ++

; don't flicker Samus
org $9085EC : BRA + : org $908606 : +
org $90C66B : BRA + : org $90C67A : +

; hijack right before executing HUD selection handler
org $90DCF0 : JSL HandleChargingBeam : BMI $00

org $90B846
DEC : BEQ +
CMP #$0077 : BPL ++
PLP : RTS

org $90B854 : +
org $90B876 : ++

org $90C2D1 ; beam speeds
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0700,$0700*3/4
    dw $0700,$0700*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0700,$0700*3/4
    dw $0700,$0700*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4
    dw $0600,$0600*3/4

org $90AF12 ; don't accelerate non-wave beams
LDA $0C04,x : AND #$000F : ASL : TAX
JSR ($AF36,x)
JMP $B16A

org $90B103 ; don't accelerate wave beams
LDA $0C04,x : AND #$000F : ASL : TAX
JSR ($B127,x)
JMP $B16A

org $90C254 ; uncharged beam cooldowns
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07

org $90C264 ; charged beam cooldowns
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07
    db $07

org $938268 : BRA + : org $9382A6 : + ; no beam flicker

org $91FA7A : CLC : RTS ; goodbye walljump dust
org $90EE64 : RTS ; and speed boost dust

;;; touch AI rewrite
org $A0A4A1
    LDA $0A6E : BNE ContactDamage
    TXY ; Y = [enemy index]
    LDA $0F78,x : TAX : LDA $A00006,x : JSL $A08996 : JSL $91DF51 ; deal suit-adjusted damage to samus
    LDA.w #60 : STA $18A8 ; iframes = 60
    LDA.w #5 : STA $18AA ; knockback timer = 5
    TDC : TAX ; knockback direction = left
    LDA $0AF6 : CMP $0F7A,y : BMI +
        INX ; knockback direction = right
    +
    STX $0A54
    RTS

ContactDamage:
    PHX ; push [enemy index] to stack
    ASL : TAX
    LDA.l ContactDamageTable-2,x : STA $26 ; $26 = contact damage
    TXA : LSR : CMP #$0004 : BNE + ; end charge when hitting an enemy with pseudo screw
        LDA $09A2 : BIT #$0080 : BEQ ++
            LDA #400 : STA $26
        ++
        LDA #$0004 : JSL $90F084 ; End charge beam
        LDA #$0005
    +
    CLC : ADC #$000F : STA $14 ; vulnerability index = Fh + [contact damage index] if not pseudo-screwing, 14h if pseudo screwing
    PLX ; pull [enemy index] from stack
    LDA $0F78,x : TAX : LDA $A0003C,x
    CLC : ADC $14 : TAX : LDA $B40000,x : AND #$007F
    STA $28 ; $28 = contact vulnerability
    JSL $A0B6FF ; $2A = contact damage * contact vulnerability
    LSR $2A : BEQ NoDamage ; half calculated damage
    LDY $0E54 ; Y = [enemy index]
    LDX $0F78,y : LDA $A0000D,x : AND #$00FF : BNE +
        LDA #$0004 ; default is 4
    +
    STA $0F9C,y ; set flash timer
    LDA $0F8A,y : ORA #$0002 : STA $0F8A,y ; set hurt ai
    LDA $0F8C,y : SEC : SBC $2A : BCS + ; deal damage to enemy
        TDC
    +
    STA $0F8C,y
    LDA $0F9E,y : BNE + ; queue enemy cry if not frozen
    LDX $0F78,y : LDA $A0000E,x : BEQ +
        JSL $8090B7
    +
    NoDamage:
    RTS

ContactDamageTable:
    dw 500,300,2000,200 ; speed boosting, shinesparking, screw attacking, pseudo screwing respectively

; prevents iframes from dropping to 0 when there are enemies present and samus is speedboosting/shinesparking/(pseudo) screwing
org $A09A90 : BRA + : org $A09A9A : + ; for extended spritemap
org $A0A096 : BRA + : org $A0A0B8 : + ; for non-extended spritemap

; lower iframes from 96 to 60
org $A09864 : LDA.w #60
org $A09923 : LDA.w #60
