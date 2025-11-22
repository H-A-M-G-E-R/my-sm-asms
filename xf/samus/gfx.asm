macro spritemapEntry(Size, XOffset, YOffset, YFlip, XFlip, Priority, Palette, Tile)
; Spritemap entry format is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = sprite X offset
;     y = sprite Y offset
;     Y = Y flip
;     X = X flip
;     p = priority (relative to background)
;     P = palette (often unused)
;     t = tile number
    dw <Size><<15|(<XOffset>&$1FF)
    db <YOffset>
    dw <YFlip><<15|<XFlip><<14|<Priority><<12|<Palette><<9|<Tile>
endmacro

org $928000 ; Set Samus tiles definitions for current animation
SetSamusTileDefs:
{
  PHP : PHB : PHK : PLB : REP #$30
  LDA $0A1C : ASL : TAX
  LDA $0A96 : ASL : ASL : ADC.w SamusTileAnims,x : TAX ; X = [SamusTileAnims + [pose] * 2] + [anim frame] * 4
  LDA $0000,x : BPL .skipUpper
    STA $071F ; top tiles definition
    INC $071D ; flag transfer top half to vram
  .skipUpper
  LDA $0002,x : BPL .skipLower
    STA $0721 ; bottom tiles definition
    INC $071E ; flag transfer bottom half to vram
  .skipLower
  PLB : PLP : RTL
}

org $92808D+2*$198
OA_T_0D:
OA_T_0E:
OA_T_20:
OA_T_21:
OA_T_22:
OA_T_23:
OA_T_24:
OA_T_33:
OA_T_34:
OA_T_39:
OA_T_3A:
OA_T_42:
OA_T_45:
OA_T_46:
OA_T_47:
OA_T_48:
OA_T_AC:
OA_T_AD:
OA_T_AE:
OA_T_AF:
OA_T_B0:
OA_T_B1:
OA_T_C5:
OA_T_C6:
OA_T_DF:

OA_B_0D:
OA_B_0E:
OA_B_20:
OA_B_21:
OA_B_22:
OA_B_23:
OA_B_24:
OA_B_33:
OA_B_34:
OA_B_39:
OA_B_3A:
OA_B_42:
OA_B_45:
OA_B_46:
OA_B_47:
OA_B_48:
OA_B_5B:
OA_B_5C:
OA_B_63:
OA_B_64:
OA_B_65:
OA_B_66:
OA_B_AC:
OA_B_AD:
OA_B_AE:
OA_B_AF:
OA_B_B0:
OA_B_B1:
OA_B_C5:
OA_B_C6:
OA_B_DF:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty

OA_T_00:
OA_T_9B:
  dw SamusOam_9676
  dw SamusOam_9676
  dw SamusOam_9676
  dw $8000
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_96C2
  dw SamusOam_Empty
  dw SamusOam_96EC
  dw SamusOam_Empty
  dw SamusOam_9711
  dw SamusOam_Empty
  dw SamusOam_9740
  dw SamusOam_Empty
  dw SamusOam_9783
  dw SamusOam_Empty
  dw SamusOam_97A8
  dw SamusOam_Empty
  dw SamusOam_97D7
  dw SamusOam_Empty
  dw SamusOam_980B
  dw SamusOam_Empty
  dw SamusOam_97A8
  dw SamusOam_Empty
  dw SamusOam_97D7
  dw SamusOam_Empty
  dw SamusOam_980B
  dw SamusOam_Empty

OA_B_00:
OA_B_9B:
  dw SamusOam_968C
  dw SamusOam_968C
  dw SamusOam_968C
  dw $8000
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_Empty
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698
  dw SamusOam_9698

OA_T_01:
OA_T_35:
OA_T_3B:
OA_T_89:
OA_T_A8:
OA_T_D5:
OA_T_D9:
  dw SamusOam_9830
  dw SamusOam_9830
  dw SamusOam_9830
  dw SamusOam_Empty

  dw SamusOam_Top_Right_Shooting_Frame0
  dw SamusOam_9830

OA_B_01:
OA_B_35:
OA_B_3B:
OA_B_89:
OA_B_A8:
OA_B_D5:
OA_B_D9:
  dw SamusOam_9846
  dw SamusOam_9846
  dw SamusOam_9846
  dw SamusOam_Empty

  dw SamusOam_9846
  dw SamusOam_9846

OA_T_02:
OA_T_36:
OA_T_3C:
OA_T_8A:
OA_T_A9:
OA_T_D6:
OA_T_DA:
  dw SamusOam_9857
  dw SamusOam_9857
  dw SamusOam_9857
  dw SamusOam_Empty

  dw SamusOam_Top_Left_Shooting_Frame0
  dw SamusOam_9857

OA_B_02:
OA_B_36:
OA_B_3C:
OA_B_8A:
OA_B_A9:
OA_B_D6:
OA_B_DA:
  dw SamusOam_986D
  dw SamusOam_986D
  dw SamusOam_986D
  dw SamusOam_Empty

  dw SamusOam_986D
  dw SamusOam_986D

OA_T_03:
OA_T_F7:
  dw SamusOam_987E
  dw SamusOam_987E
  dw SamusOam_987E

OA_B_03:
OA_B_F7:
  dw SamusOam_988A
  dw SamusOam_988A
  dw SamusOam_988A

OA_T_04:
OA_T_F8:
  dw SamusOam_989B
  dw SamusOam_989B
  dw SamusOam_989B

OA_B_04:
OA_B_F8:
  dw SamusOam_98A7
  dw SamusOam_98A7
  dw SamusOam_98A7

OA_T_05:
OA_T_CF:
OA_T_F9:
  dw SamusOam_98B8
  dw SamusOam_98B8
  dw SamusOam_98B8
  dw SamusOam_Empty

  dw SamusOam_Top_Right_DiagonalUp_Shooting_Frame0
  dw SamusOam_98B8

OA_B_05:
OA_B_CF:
OA_B_F9:
  dw SamusOam_988A
  dw SamusOam_988A
  dw SamusOam_988A
  dw SamusOam_Empty

  dw SamusOam_988A
  dw SamusOam_988A

OA_T_06:
OA_T_6A:
OA_T_6E:
OA_T_D0:
OA_T_FA:
  dw SamusOam_98C4
  dw SamusOam_98C4
  dw SamusOam_98C4
  dw SamusOam_Empty

  dw SamusOam_Top_Left_DiagonalUp_Shooting_Frame0
  dw SamusOam_98C4

OA_B_06:
OA_B_D0:
OA_B_FA:
  dw SamusOam_98A7
  dw SamusOam_98A7
  dw SamusOam_98A7
  dw SamusOam_Empty

  dw SamusOam_98A7
  dw SamusOam_98A7

OA_T_07:
OA_T_AA:
OA_T_D1:
OA_T_FB:
  dw SamusOam_98D0
  dw SamusOam_98D0
  dw SamusOam_98D0
  dw SamusOam_Empty

  dw SamusOam_Top_Right_DiagonalDown_Shooting_Frame0
  dw SamusOam_98D0

OA_B_07:
OA_B_AA:
OA_B_D1:
OA_B_FB:
  dw SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0
  dw SamusOam_Bottom_Right_DiagonalDown_Standing_Frame1
  dw SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0
  dw SamusOam_Empty

  dw SamusOam_9846
  dw SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0

OA_T_08:
OA_T_6C:
OA_T_70:
OA_T_AB:
OA_T_D2:
OA_T_FC:
  dw SamusOam_98DC
  dw SamusOam_98DC
  dw SamusOam_98DC
  dw SamusOam_Empty

  dw SamusOam_Top_Left_DiagonalDown_Shooting_Frame0
  dw SamusOam_98DC

OA_B_08:
OA_B_AB:
OA_B_D2:
OA_B_FC:
  dw SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0
  dw SamusOam_Bottom_Left_DiagonalDown_Standing_Frame1
  dw SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0
  dw SamusOam_Empty

  dw SamusOam_986D
  dw SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0

OA_T_09:
  dw SamusOam_98E8
  dw SamusOam_98FE
  dw SamusOam_990F
  dw SamusOam_992A
  dw SamusOam_9940
  dw SamusOam_9951
  dw SamusOam_9962
  dw SamusOam_996E
  dw SamusOam_997F
  dw SamusOam_9990

OA_B_09:
OA_B_0B:
OA_B_0F:
OA_B_11:
  dw SamusOam_999C
  dw SamusOam_99A8
  dw SamusOam_99B9
  dw SamusOam_99D4
  dw SamusOam_99EA
  dw SamusOam_99F6
  dw SamusOam_9A07
  dw SamusOam_9A18
  dw SamusOam_9A33
  dw SamusOam_9A49

OA_T_0A:
  dw SamusOam_9A64
  dw SamusOam_9A70
  dw SamusOam_9A7C
  dw SamusOam_9A8D
  dw SamusOam_9AA3
  dw SamusOam_9AB4
  dw SamusOam_9AC0
  dw SamusOam_9AC7
  dw SamusOam_9AD3
  dw SamusOam_9ADF

OA_B_0A:
OA_B_0C:
OA_B_10:
OA_B_12:
  dw SamusOam_9AE6
  dw SamusOam_9AF2
  dw SamusOam_9B03
  dw SamusOam_9B1E
  dw SamusOam_9B34
  dw SamusOam_9B40
  dw SamusOam_9B51
  dw SamusOam_9B62
  dw SamusOam_9B7D
  dw SamusOam_9B93

OA_T_0B:
  dw SamusOam_9BAE
  dw SamusOam_9BBF
  dw SamusOam_9BD0
  dw SamusOam_9BD0
  dw SamusOam_9BBF
  dw SamusOam_9BAE
  dw SamusOam_9BBF
  dw SamusOam_9BD0
  dw SamusOam_9BD0
  dw SamusOam_9BBF

OA_T_0C:
  dw SamusOam_9BE1
  dw SamusOam_9BF7
  dw SamusOam_9C0D
  dw SamusOam_9C0D
  dw SamusOam_9BF7
  dw SamusOam_9BE1
  dw SamusOam_9BF7
  dw SamusOam_9C0D
  dw SamusOam_9C0D
  dw SamusOam_9BF7

OA_T_0F:
  dw SamusOam_9C23
  dw SamusOam_9C2F
  dw SamusOam_9C3B
  dw SamusOam_9C3B
  dw SamusOam_9C2F
  dw SamusOam_9C23
  dw SamusOam_9C2F
  dw SamusOam_9C3B
  dw SamusOam_9C3B
  dw SamusOam_9C2F

OA_T_10:
  dw SamusOam_9C47
  dw SamusOam_9C53
  dw SamusOam_9C5F
  dw SamusOam_9C5F
  dw SamusOam_9C53
  dw SamusOam_9C47
  dw SamusOam_9C53
  dw SamusOam_9C5F
  dw SamusOam_9C5F
  dw SamusOam_9C53

OA_T_11:
  dw SamusOam_9C6B
  dw SamusOam_9C77
  dw SamusOam_9C83
  dw SamusOam_9C83
  dw SamusOam_9C77
  dw SamusOam_9C6B
  dw SamusOam_9C77
  dw SamusOam_9C83
  dw SamusOam_9C83
  dw SamusOam_9C77

OA_T_12:
  dw SamusOam_9C8F
  dw SamusOam_9C9B
  dw SamusOam_9CA7
  dw SamusOam_9CA7
  dw SamusOam_9C9B
  dw SamusOam_9C8F
  dw SamusOam_9C9B
  dw SamusOam_9CA7
  dw SamusOam_9CA7
  dw SamusOam_9C9B

OA_T_13:
OA_T_51:
OA_T_67:
OA_T_EC:
OA_T_EE:
  dw SamusOam_Top_Right_Forward_MidAir_Frame0
  dw SamusOam_Top_Right_Forward_MidAir_Frame1
  dw SamusOam_Top_Right_Forward_MidAir_Frame2
  dw SamusOam_Top_Right_Forward_MidAir_Frame3
  dw SamusOam_Top_Right_Forward_MidAir_Frame0
  dw SamusOam_Top_Right_Forward_MidAir_Frame1

OA_T_14:
OA_T_52:
OA_T_68:
OA_T_BA:
OA_T_BC:
  dw SamusOam_Top_Left_Forward_MidAir_Frame0
  dw SamusOam_Top_Left_Forward_MidAir_Frame1
  dw SamusOam_Top_Left_Forward_MidAir_Frame2
  dw SamusOam_Top_Left_Forward_MidAir_Frame3
  dw SamusOam_Top_Left_Forward_MidAir_Frame0
  dw SamusOam_Top_Left_Forward_MidAir_Frame1

OA_B_13:
OA_B_15:
OA_B_2B:
OA_B_51:
OA_B_67:
OA_B_69:
OA_B_6B:
OA_B_6D:
OA_B_6F:
OA_B_EC:
OA_B_ED:
OA_B_EE:
  dw SamusOam_Bottom_Right_MidAir_Frame0
  dw SamusOam_Bottom_Right_MidAir_Frame1
  dw SamusOam_Bottom_Right_MidAir_Frame2
  dw SamusOam_Bottom_Right_MidAir_Frame3
  dw SamusOam_Bottom_Right_MidAir_Frame4
  dw SamusOam_Bottom_Right_MidAir_Frame5

OA_T_69:
OA_T_6D:
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame0
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame1
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame2
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame3
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame4
  dw SamusOam_Top_Right_DiagonalUp_MidAir_Frame5

OA_T_6B:
OA_T_6F:
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame0
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame0
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame2
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame3
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame4
  dw SamusOam_Top_Right_DiagonalDown_MidAir_Frame5

OA_B_14:
OA_B_16:
OA_B_2C:
OA_B_52:
OA_B_68:
OA_B_6A:
OA_B_6C:
OA_B_6E:
OA_B_70:
OA_B_BA:
OA_B_BB:
OA_B_BC:
  dw SamusOam_Bottom_Left_MidAir_Frame0
  dw SamusOam_Bottom_Left_MidAir_Frame1
  dw SamusOam_Bottom_Left_MidAir_Frame2
  dw SamusOam_Bottom_Left_MidAir_Frame3
  dw SamusOam_Bottom_Left_MidAir_Frame4
  dw SamusOam_Bottom_Left_MidAir_Frame5

OA_T_15:
OA_T_2B:
OA_T_ED:
  dw SamusOam_Top_Right_Up_MidAir_Frame0
  dw SamusOam_Top_Right_Up_MidAir_Frame1
  dw SamusOam_Top_Right_Up_MidAir_Frame2
  dw SamusOam_Top_Right_Up_MidAir_Frame3
  dw SamusOam_Top_Right_Up_MidAir_Frame4
  dw SamusOam_Top_Right_Up_MidAir_Frame5

OA_T_16:
OA_T_2C:
OA_T_BB:
  dw SamusOam_98C4
  dw SamusOam_989B

OA_T_17:
OA_T_2D:
OA_T_EF:
  dw SamusOam_Top_Right_Down_MidAir_Frame0
  dw SamusOam_Top_Right_Down_MidAir_Frame0
  dw SamusOam_Top_Right_Down_MidAir_Frame0
  dw SamusOam_Top_Right_Down_MidAir_Frame0
  dw SamusOam_Top_Right_Down_MidAir_Frame0
  dw SamusOam_Top_Right_Down_MidAir_Frame0

OA_B_17:
OA_B_2D:
OA_B_EF:
  dw SamusOam_Bottom_Right_Down_MidAir_Frame0
  dw SamusOam_Bottom_Right_Down_MidAir_Frame1
  dw SamusOam_Bottom_Right_Down_MidAir_Frame1
  dw SamusOam_Bottom_Right_Down_MidAir_Frame1
  dw SamusOam_Bottom_Right_Down_MidAir_Frame1
  dw SamusOam_Bottom_Right_Down_MidAir_Frame1

OA_T_18:
OA_T_2E:
OA_T_BD:
  dw SamusOam_98DC
  dw SamusOam_9CBF

OA_B_18:
OA_B_2E:
OA_B_BD:
  dw SamusOam_A0D9
  dw SamusOam_A0E5

OA_T_19:
  dw SamusOam_9CCB
  dw SamusOam_9CE3
  dw SamusOam_9CF9
  dw SamusOam_9CE3
  dw SamusOam_9D05
  dw SamusOam_9D11
  dw SamusOam_9D27
  dw SamusOam_9D11
  dw SamusOam_9D33
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CCB

OA_B_19:
OA_B_1B:
  dw SamusOam_9CD7
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CD7

OA_T_1A:
  dw SamusOam_9D3F
  dw SamusOam_9D57
  dw SamusOam_9D6D
  dw SamusOam_9D57
  dw SamusOam_9D79
  dw SamusOam_9D85
  dw SamusOam_9D9B
  dw SamusOam_9D85
  dw SamusOam_9DA7
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D3F

OA_B_1A:
OA_B_1C:
  dw SamusOam_9D4B
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D4B

OA_T_1B:
  dw SamusOam_9CCB
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CCB

OA_T_1C:
  dw SamusOam_9D3F
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D3F

OA_T_1D:
OA_T_1E:
OA_T_31:
OA_T_3F:
OA_T_79:
OA_T_7B:
OA_T_7D:
OA_T_7F:
  dw SamusOam_9DB3
  dw SamusOam_9DBA
  dw SamusOam_9DB3
  dw SamusOam_9DC1
  dw SamusOam_9DB3
  dw SamusOam_9DBA
  dw SamusOam_9DB3
  dw SamusOam_9DC1

OA_B_1D:
OA_B_1E:
OA_B_1F:
OA_B_31:
OA_B_32:
OA_B_37:
OA_B_38:
OA_B_3D:
OA_B_3E:
OA_B_3F:
OA_B_40:
OA_B_41:
OA_B_79:
OA_B_7A:
OA_B_7B:
OA_B_7C:
OA_B_7D:
OA_B_7E:
OA_B_7F:
OA_B_80:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty

OA_T_25:
OA_T_2F:
OA_T_BF:
  dw SamusOam_9DC8
  dw SamusOam_9DD9

OA_B_25:
OA_B_BF:
  dw SamusOam_9846
  dw SamusOam_986D

OA_T_26:
OA_T_30:
OA_T_C0:
  dw SamusOam_9DD9
  dw SamusOam_9DC8

OA_B_26:
OA_B_C0:
  dw SamusOam_986D
  dw SamusOam_9846

OA_T_27:
OA_T_B4:
  dw SamusOam_9DF4

OA_B_27:
OA_B_B4:
  dw SamusOam_9E0A

OA_T_28:
OA_T_B5:
  dw SamusOam_9E16

OA_B_28:
OA_B_B5:
  dw SamusOam_9E2C

OA_T_29:
  dw SamusOam_9E38
  dw SamusOam_9E44
  dw SamusOam_9E50
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9E44
  dw SamusOam_9962

OA_B_29:
  dw SamusOam_A02D
  dw SamusOam_A01C
  dw SamusOam_A039
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A01C
  dw SamusOam_A02D

OA_T_2A:
  dw SamusOam_9E5C
  dw SamusOam_9E68
  dw SamusOam_9E74
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9E68
  dw SamusOam_9AD3

OA_B_2A:
  dw SamusOam_A0CD
  dw SamusOam_A0BC
  dw SamusOam_A0D9
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A0BC
  dw SamusOam_A0CD

OA_T_37:
  dw SamusOam_9E80
  dw SamusOam_9DB3

OA_T_38:
  dw SamusOam_9E9B
  dw SamusOam_9DB3

OA_T_3D:
  dw SamusOam_9DB3
  dw SamusOam_9E80

OA_T_3E:
  dw SamusOam_9DB3
  dw SamusOam_9E9B

OA_T_1F:
OA_T_32:
OA_T_40:
OA_T_41:
OA_T_7A:
OA_T_7C:
OA_T_7E:
OA_T_80:
  dw SamusOam_9DC1
  dw SamusOam_9DB3
  dw SamusOam_9DBA
  dw SamusOam_9DB3
  dw SamusOam_9DC1
  dw SamusOam_9DB3
  dw SamusOam_9DBA
  dw SamusOam_9DB3

OA_T_43:
  dw SamusOam_9DC8
  dw SamusOam_9DD9

OA_B_43:
  dw SamusOam_9EB6
  dw SamusOam_9EBD

OA_T_44:
  dw SamusOam_9DD9
  dw SamusOam_9DC8

OA_B_44:
  dw SamusOam_9EBD
  dw SamusOam_9EB6

OA_T_49:
  dw SamusOam_9EC4
  dw SamusOam_9EDA
  dw SamusOam_9EF0
  dw SamusOam_9EDA
  dw SamusOam_9EC4
  dw SamusOam_9EC4

OA_B_49:
OA_B_75:
OA_B_77:
  dw SamusOam_9F06
  dw SamusOam_9F12
  dw SamusOam_9F1E
  dw SamusOam_9F2A
  dw SamusOam_9F36
  dw SamusOam_9F42

OA_T_4A:
  dw SamusOam_9F4E
  dw SamusOam_9F64
  dw SamusOam_9F7A
  dw SamusOam_9F64
  dw SamusOam_9F4E
  dw SamusOam_9F4E

OA_B_4A:
OA_B_76:
OA_B_78:
  dw SamusOam_9F90
  dw SamusOam_9F9C
  dw SamusOam_9FA8
  dw SamusOam_9FB4
  dw SamusOam_9FC0
  dw SamusOam_9FCC

OA_T_4D:
OA_T_F0:
  dw SamusOam_992A
  dw SamusOam_990F
  dw SamusOam_992A
  dw SamusOam_9940
  dw SamusOam_9951
  dw SamusOam_9962

OA_B_4D:
OA_B_F0:
  dw SamusOam_999C
  dw SamusOam_9FEE
  dw SamusOam_A004
  dw SamusOam_A004
  dw SamusOam_A01C
  dw SamusOam_A02D

OA_T_4E:
OA_T_BE:
  dw SamusOam_A062
  dw SamusOam_9A7C
  dw SamusOam_9A8D
  dw SamusOam_9AA3
  dw SamusOam_9AB4
  dw SamusOam_9AD3

OA_B_4E:
OA_B_BE:
  dw SamusOam_9AE6
  dw SamusOam_A08E
  dw SamusOam_A0A4
  dw SamusOam_A0A4
  dw SamusOam_A0BC
  dw SamusOam_A0CD

OA_T_4F:
  dw SamusOam_AAC0
  dw SamusOam_9D3F
  dw SamusOam_9D85
  dw SamusOam_9D9B
  dw SamusOam_9D85
  dw SamusOam_9D79
  dw SamusOam_9D57
  dw SamusOam_9D6D
  dw SamusOam_9D57
  dw SamusOam_9E74

OA_B_4F:
  dw SamusOam_AAFA
  dw SamusOam_9D4B
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A0D9

OA_T_50:
  dw SamusOam_AA47
  dw SamusOam_9CCB
  dw SamusOam_9D11
  dw SamusOam_9D27
  dw SamusOam_9D11
  dw SamusOam_9D05
  dw SamusOam_9CE3
  dw SamusOam_9CF9
  dw SamusOam_9CE3
  dw SamusOam_9E50

OA_B_50:
  dw SamusOam_AA81
  dw SamusOam_9CD7
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A039
  dw SamusOam_A039
  dw SamusOam_A02D
  dw SamusOam_A0D9
  dw SamusOam_A0CD

OA_T_53:
  dw SamusOam_9CCB
  dw SamusOam_9CCB

OA_B_53:
  dw SamusOam_9CD7
  dw SamusOam_9CD7

OA_T_54:
  dw SamusOam_9D3F
  dw SamusOam_9D3F

OA_B_54:
  dw SamusOam_9D4B
  dw SamusOam_9D4B

OA_T_71:
OA_T_F3:
  dw SamusOam_A102

OA_B_71:
OA_B_F3:
  dw SamusOam_9E0A

OA_T_72:
OA_T_F4:
  dw SamusOam_A10E

OA_B_72:
OA_B_F4:
  dw SamusOam_9E2C

OA_T_73:
OA_T_B6:
OA_T_F5:
  dw SamusOam_A11A

OA_B_73:
OA_B_B6:
OA_B_F5:
  dw SamusOam_9E0A

OA_T_74:
OA_T_B7:
OA_T_F6:
  dw SamusOam_A126

OA_B_74:
OA_B_B7:
OA_B_F6:
  dw SamusOam_9E2C

OA_T_75:
  dw SamusOam_A132
  dw SamusOam_A13E
  dw SamusOam_A14A
  dw SamusOam_A13E
  dw SamusOam_A132
  dw SamusOam_A132

OA_T_76:
  dw SamusOam_A156
  dw SamusOam_A162
  dw SamusOam_A16E
  dw SamusOam_A162
  dw SamusOam_A156
  dw SamusOam_A156

OA_T_77:
  dw SamusOam_A17A
  dw SamusOam_A186
  dw SamusOam_A192
  dw SamusOam_A186
  dw SamusOam_A17A
  dw SamusOam_A17A

OA_T_78:
  dw SamusOam_A19E
  dw SamusOam_A1AA
  dw SamusOam_A1B6
  dw SamusOam_A1AA
  dw SamusOam_A19E
  dw SamusOam_A19E

OA_T_81:
  dw SamusOam_9CCB
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CCB

OA_B_81:
  dw SamusOam_9CD7
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CD7

OA_T_82:
  dw SamusOam_9D3F
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D3F

OA_B_82:
  dw SamusOam_9D4B
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D4B

OA_T_83:
  dw SamusOam_A286
  dw SamusOam_A2A1
  dw SamusOam_Empty
  dw SamusOam_9CE3
  dw SamusOam_9CF9
  dw SamusOam_9CE3
  dw SamusOam_9D05
  dw SamusOam_9D11
  dw SamusOam_9D27
  dw SamusOam_9D11
  dw SamusOam_9D33
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9CE3
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11
  dw SamusOam_9D11

OA_B_83:
OA_B_84:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204
  dw SamusOam_A1C2
  dw SamusOam_A1C2
  dw SamusOam_A1D8
  dw SamusOam_A1D8
  dw SamusOam_A1EE
  dw SamusOam_A1EE
  dw SamusOam_A204
  dw SamusOam_A204

OA_T_84:
  dw SamusOam_A2C1
  dw SamusOam_A2DC
  dw SamusOam_Empty
  dw SamusOam_9D57
  dw SamusOam_9D6D
  dw SamusOam_9D57
  dw SamusOam_9D79
  dw SamusOam_9D85
  dw SamusOam_9D9B
  dw SamusOam_9D85
  dw SamusOam_9DA7
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D57
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_9D85
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266
  dw SamusOam_A224
  dw SamusOam_A224
  dw SamusOam_A23A
  dw SamusOam_A23A
  dw SamusOam_A250
  dw SamusOam_A250
  dw SamusOam_A266
  dw SamusOam_A266

OA_T_85:
OA_T_F1:
  dw SamusOam_987E
  dw SamusOam_987E

OA_B_85:
OA_B_F1:
  dw SamusOam_9E0A
  dw SamusOam_9E0A

OA_T_86:
OA_T_F2:
  dw SamusOam_989B
  dw SamusOam_989B

OA_B_86:
OA_B_F2:
  dw SamusOam_9E2C
  dw SamusOam_9E2C

OA_T_87:
  dw SamusOam_9DC8
  dw SamusOam_9DD9

OA_B_2F:
OA_B_87:
OA_B_8F:
OA_B_91:
OA_B_93:
OA_B_95:
OA_B_9E:
OA_B_A0:
  dw SamusOam_A051
  dw SamusOam_A0F1

OA_T_88:
  dw SamusOam_9DD9
  dw SamusOam_9DC8

OA_B_30:
OA_B_88:
OA_B_90:
OA_B_92:
OA_B_94:
OA_B_96:
OA_B_9F:
OA_B_A1:
  dw SamusOam_A0F1
  dw SamusOam_A051

OA_T_8B:
OA_T_8F:
OA_T_93:
OA_T_C1:
  dw SamusOam_A2FC
  dw SamusOam_A308

OA_B_8B:
OA_B_C1:
  dw SamusOam_9846
  dw SamusOam_986D

OA_T_8C:
OA_T_90:
OA_T_94:
OA_T_C2:
  dw SamusOam_A308
  dw SamusOam_A2FC

OA_B_8C:
OA_B_C2:
  dw SamusOam_986D
  dw SamusOam_9846

OA_T_8D:
OA_T_91:
OA_T_95:
OA_T_C3:
  dw SamusOam_A314
  dw SamusOam_A325

OA_B_8D:
OA_B_C3:
  dw SamusOam_9846
  dw SamusOam_986D

OA_T_8E:
OA_T_92:
OA_T_96:
OA_T_C4:
  dw SamusOam_A325
  dw SamusOam_A314

OA_B_8E:
OA_B_C4:
  dw SamusOam_986D
  dw SamusOam_9846

OA_T_97:
  dw SamusOam_A2FC
  dw SamusOam_A308

OA_B_97:
  dw SamusOam_9EB6
  dw SamusOam_9EBD

OA_T_98:
  dw SamusOam_A308
  dw SamusOam_A2FC

OA_B_98:
  dw SamusOam_9EBD
  dw SamusOam_9EB6

OA_T_99:
  dw SamusOam_A314
  dw SamusOam_A325

OA_B_99:
  dw SamusOam_9EB6
  dw SamusOam_9EBD

OA_T_9A:
  dw SamusOam_A325
  dw SamusOam_A314

OA_B_9A:
  dw SamusOam_9EBD
  dw SamusOam_9EB6

OA_T_9C:
OA_T_9E:
OA_T_A0:
  dw SamusOam_A336
  dw SamusOam_A342

OA_B_9C:
  dw SamusOam_9846
  dw SamusOam_986D

OA_T_9D:
OA_T_9F:
OA_T_A1:
  dw SamusOam_A342
  dw SamusOam_A336

OA_B_9D:
  dw SamusOam_986D
  dw SamusOam_9846

OA_T_A2:
  dw SamusOam_A336
  dw SamusOam_A342

OA_B_A2:
  dw SamusOam_9EB6
  dw SamusOam_9EBD

OA_T_A3:
  dw SamusOam_A342
  dw SamusOam_A336

OA_B_A3:
  dw SamusOam_9EBD
  dw SamusOam_9EB6

OA_T_B2:
  dw SamusOam_A34E
  dw SamusOam_A35A
  dw SamusOam_A366
  dw SamusOam_A372
  dw SamusOam_A37E
  dw SamusOam_A38A
  dw SamusOam_A396
  dw SamusOam_A3A2
  dw SamusOam_A3AE
  dw SamusOam_A3BA
  dw SamusOam_A3C6
  dw SamusOam_A3D2
  dw SamusOam_A3DE
  dw SamusOam_A3EA
  dw SamusOam_A3F6
  dw SamusOam_A402
  dw SamusOam_A40E
  dw SamusOam_A41A
  dw SamusOam_A426
  dw SamusOam_A432
  dw SamusOam_A43E
  dw SamusOam_A44A
  dw SamusOam_A456
  dw SamusOam_A462
  dw SamusOam_A46E
  dw SamusOam_A47A
  dw SamusOam_A486
  dw SamusOam_A492
  dw SamusOam_A49E
  dw SamusOam_A4AA
  dw SamusOam_A4B6
  dw SamusOam_A4C2
  dw SamusOam_A34E
  dw SamusOam_A35A
  dw SamusOam_A366
  dw SamusOam_A372
  dw SamusOam_A37E
  dw SamusOam_A38A
  dw SamusOam_A396
  dw SamusOam_A3A2
  dw SamusOam_A3AE
  dw SamusOam_A3BA
  dw SamusOam_A3C6
  dw SamusOam_A3D2
  dw SamusOam_A3DE
  dw SamusOam_A3EA
  dw SamusOam_A3F6
  dw SamusOam_A402
  dw SamusOam_A40E
  dw SamusOam_A41A
  dw SamusOam_A426
  dw SamusOam_A432
  dw SamusOam_A43E
  dw SamusOam_A44A
  dw SamusOam_A456
  dw SamusOam_A462
  dw SamusOam_A46E
  dw SamusOam_A47A
  dw SamusOam_A486
  dw SamusOam_A492
  dw SamusOam_A49E
  dw SamusOam_A4AA
  dw SamusOam_A4B6
  dw SamusOam_A4C2
  dw SamusOam_A40E
  dw SamusOam_A40E

OA_B_B2:
  dw SamusOam_A4DA
  dw SamusOam_A4E6
  dw SamusOam_A4F2
  dw SamusOam_A4FE
  dw SamusOam_A50A
  dw SamusOam_A516
  dw SamusOam_A522
  dw SamusOam_A52E
  dw SamusOam_A53A
  dw SamusOam_A546
  dw SamusOam_A552
  dw SamusOam_A55E
  dw SamusOam_A56A
  dw SamusOam_A576
  dw SamusOam_A582
  dw SamusOam_A58E
  dw SamusOam_A59A
  dw SamusOam_A5A6
  dw SamusOam_A5B2
  dw SamusOam_A5BE
  dw SamusOam_A5CA
  dw SamusOam_A5D6
  dw SamusOam_A5E2
  dw SamusOam_A5EE
  dw SamusOam_A5FA
  dw SamusOam_A606
  dw SamusOam_A612
  dw SamusOam_A61E
  dw SamusOam_A62A
  dw SamusOam_A636
  dw SamusOam_A642
  dw SamusOam_A64E
  dw SamusOam_A4DA
  dw SamusOam_A4E6
  dw SamusOam_A4F2
  dw SamusOam_A4FE
  dw SamusOam_A50A
  dw SamusOam_A516
  dw SamusOam_A522
  dw SamusOam_A52E
  dw SamusOam_A53A
  dw SamusOam_A546
  dw SamusOam_A552
  dw SamusOam_A55E
  dw SamusOam_A56A
  dw SamusOam_A576
  dw SamusOam_A582
  dw SamusOam_A58E
  dw SamusOam_A59A
  dw SamusOam_A5A6
  dw SamusOam_A5B2
  dw SamusOam_A5BE
  dw SamusOam_A5CA
  dw SamusOam_A5D6
  dw SamusOam_A5E2
  dw SamusOam_A5EE
  dw SamusOam_A5FA
  dw SamusOam_A606
  dw SamusOam_A612
  dw SamusOam_A61E
  dw SamusOam_A62A
  dw SamusOam_A636
  dw SamusOam_A642
  dw SamusOam_A64E
  dw SamusOam_A59A
  dw SamusOam_A4CE

OA_T_B3:
  dw SamusOam_A65A
  dw SamusOam_A869
  dw SamusOam_A858
  dw SamusOam_A847
  dw SamusOam_A836
  dw SamusOam_A825
  dw SamusOam_A814
  dw SamusOam_A803
  dw SamusOam_A7F2
  dw SamusOam_A7E1
  dw SamusOam_A7D0
  dw SamusOam_A7BF
  dw SamusOam_A7AE
  dw SamusOam_A79D
  dw SamusOam_A78C
  dw SamusOam_A77B
  dw SamusOam_A76A
  dw SamusOam_A759
  dw SamusOam_A748
  dw SamusOam_A737
  dw SamusOam_A726
  dw SamusOam_A715
  dw SamusOam_A704
  dw SamusOam_A6F3
  dw SamusOam_A6E2
  dw SamusOam_A6D1
  dw SamusOam_A6C0
  dw SamusOam_A6AF
  dw SamusOam_A69E
  dw SamusOam_A68D
  dw SamusOam_A67C
  dw SamusOam_A66B
  dw SamusOam_A65A
  dw SamusOam_A869
  dw SamusOam_A858
  dw SamusOam_A847
  dw SamusOam_A836
  dw SamusOam_A825
  dw SamusOam_A814
  dw SamusOam_A803
  dw SamusOam_A7F2
  dw SamusOam_A7E1
  dw SamusOam_A7D0
  dw SamusOam_A7BF
  dw SamusOam_A7AE
  dw SamusOam_A79D
  dw SamusOam_A78C
  dw SamusOam_A77B
  dw SamusOam_A76A
  dw SamusOam_A759
  dw SamusOam_A748
  dw SamusOam_A737
  dw SamusOam_A726
  dw SamusOam_A715
  dw SamusOam_A704
  dw SamusOam_A6F3
  dw SamusOam_A6E2
  dw SamusOam_A6D1
  dw SamusOam_A6C0
  dw SamusOam_A6AF
  dw SamusOam_A69E
  dw SamusOam_A68D
  dw SamusOam_A67C
  dw SamusOam_A66B
  dw SamusOam_A76A
  dw SamusOam_A76A

OA_B_B3:
  dw SamusOam_A886
  dw SamusOam_A9FA
  dw SamusOam_A9EE
  dw SamusOam_A9E2
  dw SamusOam_A9D6
  dw SamusOam_A9CA
  dw SamusOam_A9BE
  dw SamusOam_A9B2
  dw SamusOam_A9A6
  dw SamusOam_A99A
  dw SamusOam_A98E
  dw SamusOam_A982
  dw SamusOam_A976
  dw SamusOam_A96A
  dw SamusOam_A95E
  dw SamusOam_A952
  dw SamusOam_A946
  dw SamusOam_A93A
  dw SamusOam_A92E
  dw SamusOam_A922
  dw SamusOam_A916
  dw SamusOam_A90A
  dw SamusOam_A8FE
  dw SamusOam_A8F2
  dw SamusOam_A8E6
  dw SamusOam_A8DA
  dw SamusOam_A8CE
  dw SamusOam_A8C2
  dw SamusOam_A8B6
  dw SamusOam_A8AA
  dw SamusOam_A89E
  dw SamusOam_A892
  dw SamusOam_A886
  dw SamusOam_A9FA
  dw SamusOam_A9EE
  dw SamusOam_A9E2
  dw SamusOam_A9D6
  dw SamusOam_A9CA
  dw SamusOam_A9BE
  dw SamusOam_A9B2
  dw SamusOam_A9A6
  dw SamusOam_A99A
  dw SamusOam_A98E
  dw SamusOam_A982
  dw SamusOam_A976
  dw SamusOam_A96A
  dw SamusOam_A95E
  dw SamusOam_A952
  dw SamusOam_A946
  dw SamusOam_A93A
  dw SamusOam_A92E
  dw SamusOam_A922
  dw SamusOam_A916
  dw SamusOam_A90A
  dw SamusOam_A8FE
  dw SamusOam_A8F2
  dw SamusOam_A8E6
  dw SamusOam_A8DA
  dw SamusOam_A8CE
  dw SamusOam_A8C2
  dw SamusOam_A8B6
  dw SamusOam_A8AA
  dw SamusOam_A89E
  dw SamusOam_A892
  dw SamusOam_A946
  dw SamusOam_A87A

OA_T_B8:
  dw SamusOam_AA06

OA_B_B8:
  dw SamusOam_AA12

OA_T_B9:
  dw SamusOam_AA1E

OA_B_B9:
  dw SamusOam_AA2A

OA_T_C7:
  dw SamusOam_AA36
  dw SamusOam_AA47
  dw SamusOam_AA53
  dw SamusOam_AA5F

OA_B_C7:
  dw SamusOam_AA6B
  dw SamusOam_AA81
  dw SamusOam_AA97
  dw SamusOam_AAA8

OA_T_C8:
  dw SamusOam_AAB4
  dw SamusOam_AAC0
  dw SamusOam_AACC
  dw SamusOam_AAD8

OA_B_C8:
  dw SamusOam_AAE4
  dw SamusOam_AAFA
  dw SamusOam_AB10
  dw SamusOam_AB21

OA_T_C9:
OA_T_CD:
  dw SamusOam_AB2D
  dw SamusOam_AB43

OA_B_C9:
OA_B_CD:
  dw SamusOam_AB54
  dw SamusOam_AB60

OA_T_CA:
OA_T_CE:
  dw SamusOam_AB71
  dw SamusOam_AB87

OA_B_CA:
OA_B_CE:
  dw SamusOam_AB98
  dw SamusOam_ABA4

OA_T_CB:
  dw SamusOam_ABB5
  dw SamusOam_ABCB

OA_B_CB:
OA_B_CC:
  dw SamusOam_ABE1
  dw SamusOam_ABE3

OA_T_CC:
  dw SamusOam_ABE5
  dw SamusOam_ABFB

OA_T_D3:
  dw SamusOam_9DB3
  dw SamusOam_9E80
  dw SamusOam_AC11
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_AC11
  dw SamusOam_AC36
  dw SamusOam_AC5B
  dw SamusOam_AC36
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9E80
  dw SamusOam_9E80
  dw SamusOam_9CCB

OA_B_D3:
  dw SamusOam_AC80
  dw SamusOam_AC96
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_AC96
  dw SamusOam_AC80
  dw SamusOam_9CD7

OA_T_D4:
  dw SamusOam_9DB3
  dw SamusOam_9E9B
  dw SamusOam_AD3A
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_AD3A
  dw SamusOam_AD5F
  dw SamusOam_AD84
  dw SamusOam_AD5F
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_9E9B
  dw SamusOam_9E9B
  dw SamusOam_9D3F

OA_B_D4:
  dw SamusOam_AC80
  dw SamusOam_AC96
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_ACE8
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_AC96
  dw SamusOam_AC80
  dw SamusOam_9D4B

OA_T_D7:
  dw SamusOam_9DB3
  dw SamusOam_9E80
  dw SamusOam_9E80
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_ADA9

OA_B_D7:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_ADB5

OA_T_D8:
  dw SamusOam_9DC1
  dw SamusOam_9E9B
  dw SamusOam_9E9B
  dw SamusOam_ADC1
  dw SamusOam_ADC1
  dw SamusOam_ADC1

OA_B_D8:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ADCD
  dw SamusOam_ADCD
  dw SamusOam_ADCD

OA_T_DB:
OA_T_DC:
OA_T_DD:
OA_T_DE:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty

OA_B_DB:
  dw SamusOam_ADD9
  dw SamusOam_ADFE
  dw SamusOam_AE4F
  dw SamusOam_AE7E
  dw SamusOam_AEAD
  dw SamusOam_AEDC
  dw SamusOam_AF0B
  dw SamusOam_AF3A
  dw SamusOam_AF69

OA_B_DC:
  dw SamusOam_AE14
  dw SamusOam_AE39
  dw SamusOam_AE4F
  dw SamusOam_AE7E
  dw SamusOam_AEAD
  dw SamusOam_AEDC
  dw SamusOam_AF0B
  dw SamusOam_AF3A
  dw SamusOam_AF69

OA_B_DD:
  dw SamusOam_AE4F
  dw SamusOam_ADFE

OA_B_DE:
  dw SamusOam_AE4F
  dw SamusOam_AE39

OA_T_55:
OA_T_E0:
  dw SamusOam_AF98
  dw SamusOam_AF98

OA_B_55:
OA_B_E0:
  dw SamusOam_AFF6
  dw SamusOam_AFF6

OA_T_56:
OA_T_E1:
  dw SamusOam_AFA4
  dw SamusOam_AFA4

OA_B_56:
OA_B_E1:
  dw SamusOam_B018
  dw SamusOam_B018

OA_T_57:
OA_T_E2:
  dw SamusOam_AFB0
  dw SamusOam_AFB0

OA_B_57:
OA_B_E2:
  dw SamusOam_AFF6
  dw SamusOam_AFF6

OA_T_58:
OA_T_E3:
  dw SamusOam_AFBC
  dw SamusOam_AFBC

OA_B_58:
OA_B_E3:
  dw SamusOam_B018
  dw SamusOam_B018

OA_T_59:
OA_T_E4:
  dw SamusOam_AFC8
  dw SamusOam_AFC8

OA_B_59:
OA_B_E4:
  dw SamusOam_AFF6
  dw SamusOam_AFF6

OA_T_5A:
OA_T_E5:
  dw SamusOam_AFD4
  dw SamusOam_AFD4

OA_B_5A:
OA_B_E5:
  dw SamusOam_B018
  dw SamusOam_B018

OA_T_4B:
OA_T_A4:
OA_T_A6:
OA_T_E6:
  dw SamusOam_AFE0
  dw SamusOam_AFE0

OA_B_4B:
OA_B_A4:
OA_B_A6:
OA_B_E6:
  dw SamusOam_AFF6
  dw SamusOam_AFF6

OA_T_4C:
OA_T_A5:
OA_T_A7:
OA_T_E7:
  dw SamusOam_B002
  dw SamusOam_B002

OA_B_4C:
OA_B_A5:
OA_B_A7:
OA_B_E7:
  dw SamusOam_B018
  dw SamusOam_B018

OA_T_E8:
  dw SamusOam_9DC1
  dw SamusOam_9E80
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_ADA9
  dw SamusOam_B024
  dw SamusOam_B035
  dw SamusOam_B046
  dw SamusOam_B035
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B08A

OA_B_E8:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_ADB5
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B096

OA_T_E9:
  dw SamusOam_9DC1
  dw SamusOam_9E9B
  dw SamusOam_ADC1
  dw SamusOam_ADC1
  dw SamusOam_ADC1
  dw SamusOam_ADC1
  dw SamusOam_ADC1
  dw SamusOam_B0D2
  dw SamusOam_B0A2
  dw SamusOam_B0AE
  dw SamusOam_B0BA
  dw SamusOam_B0AE
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0A2
  dw SamusOam_B0D2
  dw SamusOam_B0F9
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0A2
  dw SamusOam_B0D2
  dw SamusOam_B0F9
  dw SamusOam_B0D2
  dw SamusOam_B0A2
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0AE
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0AE

OA_B_E9:
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_ADCD
  dw SamusOam_ADCD
  dw SamusOam_ADCD
  dw SamusOam_ADCD
  dw SamusOam_ADCD
  dw SamusOam_B0ED
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0C6
  dw SamusOam_B0ED
  dw SamusOam_B10A
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0C6
  dw SamusOam_B0ED
  dw SamusOam_B10A
  dw SamusOam_B0ED
  dw SamusOam_B0C6
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0C6
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_B0C6

OA_T_EA:
  dw SamusOam_B116
  dw SamusOam_B136
  dw SamusOam_B156
  dw SamusOam_B136
  dw SamusOam_Empty
  dw SamusOam_B08A

OA_B_EA:
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_B057
  dw SamusOam_Empty
  dw SamusOam_B096

OA_T_EB:
  dw SamusOam_B176
  dw SamusOam_B191
  dw SamusOam_B1AC
  dw SamusOam_B191
  dw SamusOam_Empty
  dw SamusOam_B0F9

OA_B_EB:
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_B0C6
  dw SamusOam_Empty
  dw SamusOam_B10A

OA_T_5B:
  dw SamusOam_Right_Skidding_Frame0
  dw SamusOam_Empty

  dw SamusOam_Right_Skidding_Frame0

OA_T_5C:
  dw SamusOam_Left_Skidding_Frame0
  dw SamusOam_Empty

  dw SamusOam_Left_Skidding_Frame0

OA_T_5D:
  dw SamusOam_Right_UsingAnElevator_Frame0
  dw SamusOam_9676
  dw SamusOam_UsingAnElevator_Frame2
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_UsingAnElevator_Frame2

OA_B_5D:
OA_B_5E:
  dw SamusOam_Empty
  dw SamusOam_968C
  dw SamusOam_Empty
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_Empty

OA_T_5E:
  dw SamusOam_Left_UsingAnElevator_Frame0
  dw SamusOam_9676
  dw SamusOam_UsingAnElevator_Frame2
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_UsingAnElevator_Frame2

OA_T_5F:
  dw SamusOam_Top_Right_HangingOnLedge_Frame0
  dw SamusOam_Top_Right_HangingOnLedge_Frame1
  dw SamusOam_Top_Right_HangingOnLedge_Frame2

  dw SamusOam_Top_Right_HangingOnLedge_Frame1
  dw SamusOam_Top_Right_HangingOnLedge_Frame1
  dw SamusOam_Top_Right_HangingOnLedge_Frame5
  dw SamusOam_Top_Right_HangingOnLedge_Frame1
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_Right_ReadyToJump_HangingOnLedge_Frame0

OA_B_5F:
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame0
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame1
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame2

  dw SamusOam_Bottom_Right_HangingOnLedge_Frame3
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame1
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame5
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame1
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_Empty

OA_T_60:
  dw SamusOam_Top_Left_HangingOnLedge_Frame0
  dw SamusOam_Top_Left_HangingOnLedge_Frame1
  dw SamusOam_Top_Left_HangingOnLedge_Frame2

  dw SamusOam_Top_Left_HangingOnLedge_Frame2
  dw SamusOam_Top_Left_HangingOnLedge_Frame1
  dw SamusOam_Top_Left_HangingOnLedge_Frame5
  dw SamusOam_Top_Left_HangingOnLedge_Frame1
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_Left_ReadyToJump_HangingOnLedge_Frame0

OA_B_60:
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame0
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame1
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame2

  dw SamusOam_Bottom_Left_HangingOnLedge_Frame3
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame1
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame5
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame1
  dw SamusOam_Empty
  dw SamusOam_Empty

  dw SamusOam_Empty

OA_T_61:
  dw SamusOam_Top_Right_HangingOnLedge_Frame0
  dw SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame1
  dw SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame2

OA_B_61:
  dw SamusOam_Bottom_Right_HangingOnLedge_Frame0
  dw SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame1
  dw SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame2

OA_T_62:
  dw SamusOam_Top_Left_HangingOnLedge_Frame0
  dw SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame1
  dw SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame2

OA_B_62:
  dw SamusOam_Bottom_Left_HangingOnLedge_Frame0
  dw SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame1
  dw SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame2

OA_T_63:
  dw SamusOam_Right_PullingYourselfForwardFromHanging_Frame0
  dw SamusOam_Right_PullingYourselfForwardFromHanging_Frame1
  dw SamusOam_Right_PullingYourselfForwardFromHanging_Frame2
  dw SamusOam_Right_PullingYourselfForwardFromHanging_Frame3

OA_T_64:
  dw SamusOam_Left_PullingYourselfForwardFromHanging_Frame0
  dw SamusOam_Left_PullingYourselfForwardFromHanging_Frame1
  dw SamusOam_Left_PullingYourselfForwardFromHanging_Frame2
  dw SamusOam_Left_PullingYourselfForwardFromHanging_Frame3

OA_T_65:
  dw SamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0

OA_T_66:
  dw SamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0

%padSafe($929263)

org $929263
  dw (OA_T_00-$808D)/2, (OA_T_01-$808D)/2, (OA_T_02-$808D)/2, (OA_T_03-$808D)/2, (OA_T_04-$808D)/2, (OA_T_05-$808D)/2, (OA_T_06-$808D)/2, (OA_T_07-$808D)/2, (OA_T_08-$808D)/2, (OA_T_09-$808D)/2, (OA_T_0A-$808D)/2, (OA_T_0B-$808D)/2, (OA_T_0C-$808D)/2, (OA_T_0D-$808D)/2, (OA_T_0E-$808D)/2, (OA_T_0F-$808D)/2
  dw (OA_T_10-$808D)/2, (OA_T_11-$808D)/2, (OA_T_12-$808D)/2, (OA_T_13-$808D)/2, (OA_T_14-$808D)/2, (OA_T_15-$808D)/2, (OA_T_16-$808D)/2, (OA_T_17-$808D)/2, (OA_T_18-$808D)/2, (OA_T_19-$808D)/2, (OA_T_1A-$808D)/2, (OA_T_1B-$808D)/2, (OA_T_1C-$808D)/2, (OA_T_1D-$808D)/2, (OA_T_1E-$808D)/2, (OA_T_1F-$808D)/2
  dw (OA_T_20-$808D)/2, (OA_T_21-$808D)/2, (OA_T_22-$808D)/2, (OA_T_23-$808D)/2, (OA_T_24-$808D)/2, (OA_T_25-$808D)/2, (OA_T_26-$808D)/2, (OA_T_27-$808D)/2, (OA_T_28-$808D)/2, (OA_T_29-$808D)/2, (OA_T_2A-$808D)/2, (OA_T_2B-$808D)/2, (OA_T_2C-$808D)/2, (OA_T_2D-$808D)/2, (OA_T_2E-$808D)/2, (OA_T_2F-$808D)/2
  dw (OA_T_30-$808D)/2, (OA_T_31-$808D)/2, (OA_T_32-$808D)/2, (OA_T_33-$808D)/2, (OA_T_34-$808D)/2, (OA_T_35-$808D)/2, (OA_T_36-$808D)/2, (OA_T_37-$808D)/2, (OA_T_38-$808D)/2, (OA_T_39-$808D)/2, (OA_T_3A-$808D)/2, (OA_T_3B-$808D)/2, (OA_T_3C-$808D)/2, (OA_T_3D-$808D)/2, (OA_T_3E-$808D)/2, (OA_T_3F-$808D)/2
  dw (OA_T_40-$808D)/2, (OA_T_41-$808D)/2, (OA_T_42-$808D)/2, (OA_T_43-$808D)/2, (OA_T_44-$808D)/2, (OA_T_45-$808D)/2, (OA_T_46-$808D)/2, (OA_T_47-$808D)/2, (OA_T_48-$808D)/2, (OA_T_49-$808D)/2, (OA_T_4A-$808D)/2, (OA_T_4B-$808D)/2, (OA_T_4C-$808D)/2, (OA_T_4D-$808D)/2, (OA_T_4E-$808D)/2, (OA_T_4F-$808D)/2
  dw (OA_T_50-$808D)/2, (OA_T_51-$808D)/2, (OA_T_52-$808D)/2, (OA_T_53-$808D)/2, (OA_T_54-$808D)/2, (OA_T_55-$808D)/2, (OA_T_56-$808D)/2, (OA_T_57-$808D)/2, (OA_T_58-$808D)/2, (OA_T_59-$808D)/2, (OA_T_5A-$808D)/2, (OA_T_5B-$808D)/2, (OA_T_5C-$808D)/2, (OA_T_5D-$808D)/2, (OA_T_5E-$808D)/2, (OA_T_5F-$808D)/2
  dw (OA_T_60-$808D)/2, (OA_T_61-$808D)/2, (OA_T_62-$808D)/2, (OA_T_63-$808D)/2, (OA_T_64-$808D)/2, (OA_T_65-$808D)/2, (OA_T_66-$808D)/2, (OA_T_67-$808D)/2, (OA_T_68-$808D)/2, (OA_T_69-$808D)/2, (OA_T_6A-$808D)/2, (OA_T_6B-$808D)/2, (OA_T_6C-$808D)/2, (OA_T_6D-$808D)/2, (OA_T_6E-$808D)/2, (OA_T_6F-$808D)/2
  dw (OA_T_70-$808D)/2, (OA_T_71-$808D)/2, (OA_T_72-$808D)/2, (OA_T_73-$808D)/2, (OA_T_74-$808D)/2, (OA_T_75-$808D)/2, (OA_T_76-$808D)/2, (OA_T_77-$808D)/2, (OA_T_78-$808D)/2, (OA_T_79-$808D)/2, (OA_T_7A-$808D)/2, (OA_T_7B-$808D)/2, (OA_T_7C-$808D)/2, (OA_T_7D-$808D)/2, (OA_T_7E-$808D)/2, (OA_T_7F-$808D)/2
  dw (OA_T_80-$808D)/2, (OA_T_81-$808D)/2, (OA_T_82-$808D)/2, (OA_T_83-$808D)/2, (OA_T_84-$808D)/2, (OA_T_85-$808D)/2, (OA_T_86-$808D)/2, (OA_T_87-$808D)/2, (OA_T_88-$808D)/2, (OA_T_89-$808D)/2, (OA_T_8A-$808D)/2, (OA_T_8B-$808D)/2, (OA_T_8C-$808D)/2, (OA_T_8D-$808D)/2, (OA_T_8E-$808D)/2, (OA_T_8F-$808D)/2
  dw (OA_T_90-$808D)/2, (OA_T_91-$808D)/2, (OA_T_92-$808D)/2, (OA_T_93-$808D)/2, (OA_T_94-$808D)/2, (OA_T_95-$808D)/2, (OA_T_96-$808D)/2, (OA_T_97-$808D)/2, (OA_T_98-$808D)/2, (OA_T_99-$808D)/2, (OA_T_9A-$808D)/2, (OA_T_9B-$808D)/2, (OA_T_9C-$808D)/2, (OA_T_9D-$808D)/2, (OA_T_9E-$808D)/2, (OA_T_9F-$808D)/2
  dw (OA_T_A0-$808D)/2, (OA_T_A1-$808D)/2, (OA_T_A2-$808D)/2, (OA_T_A3-$808D)/2, (OA_T_A4-$808D)/2, (OA_T_A5-$808D)/2, (OA_T_A6-$808D)/2, (OA_T_A7-$808D)/2, (OA_T_A8-$808D)/2, (OA_T_A9-$808D)/2, (OA_T_AA-$808D)/2, (OA_T_AB-$808D)/2, (OA_T_AC-$808D)/2, (OA_T_AD-$808D)/2, (OA_T_AE-$808D)/2, (OA_T_AF-$808D)/2
  dw (OA_T_B0-$808D)/2, (OA_T_B1-$808D)/2, (OA_T_B2-$808D)/2, (OA_T_B3-$808D)/2, (OA_T_B4-$808D)/2, (OA_T_B5-$808D)/2, (OA_T_B6-$808D)/2, (OA_T_B7-$808D)/2, (OA_T_B8-$808D)/2, (OA_T_B9-$808D)/2, (OA_T_BA-$808D)/2, (OA_T_BB-$808D)/2, (OA_T_BC-$808D)/2, (OA_T_BD-$808D)/2, (OA_T_BE-$808D)/2, (OA_T_BF-$808D)/2
  dw (OA_T_C0-$808D)/2, (OA_T_C1-$808D)/2, (OA_T_C2-$808D)/2, (OA_T_C3-$808D)/2, (OA_T_C4-$808D)/2, (OA_T_C5-$808D)/2, (OA_T_C6-$808D)/2, (OA_T_C7-$808D)/2, (OA_T_C8-$808D)/2, (OA_T_C9-$808D)/2, (OA_T_CA-$808D)/2, (OA_T_CB-$808D)/2, (OA_T_CC-$808D)/2, (OA_T_CD-$808D)/2, (OA_T_CE-$808D)/2, (OA_T_CF-$808D)/2
  dw (OA_T_D0-$808D)/2, (OA_T_D1-$808D)/2, (OA_T_D2-$808D)/2, (OA_T_D3-$808D)/2, (OA_T_D4-$808D)/2, (OA_T_D5-$808D)/2, (OA_T_D6-$808D)/2, (OA_T_D7-$808D)/2, (OA_T_D8-$808D)/2, (OA_T_D9-$808D)/2, (OA_T_DA-$808D)/2, (OA_T_DB-$808D)/2, (OA_T_DC-$808D)/2, (OA_T_DD-$808D)/2, (OA_T_DE-$808D)/2, (OA_T_DF-$808D)/2
  dw (OA_T_E0-$808D)/2, (OA_T_E1-$808D)/2, (OA_T_E2-$808D)/2, (OA_T_E3-$808D)/2, (OA_T_E4-$808D)/2, (OA_T_E5-$808D)/2, (OA_T_E6-$808D)/2, (OA_T_E7-$808D)/2, (OA_T_E8-$808D)/2, (OA_T_E9-$808D)/2, (OA_T_EA-$808D)/2, (OA_T_EB-$808D)/2, (OA_T_EC-$808D)/2, (OA_T_ED-$808D)/2, (OA_T_EE-$808D)/2, (OA_T_EF-$808D)/2
  dw (OA_T_F0-$808D)/2, (OA_T_F1-$808D)/2, (OA_T_F2-$808D)/2, (OA_T_F3-$808D)/2, (OA_T_F4-$808D)/2, (OA_T_F5-$808D)/2, (OA_T_F6-$808D)/2, (OA_T_F7-$808D)/2, (OA_T_F8-$808D)/2, (OA_T_F9-$808D)/2, (OA_T_FA-$808D)/2, (OA_T_FB-$808D)/2, (OA_T_FC-$808D)/2

org $92945D
  dw (OA_B_00-$808D)/2, (OA_B_01-$808D)/2, (OA_B_02-$808D)/2, (OA_B_03-$808D)/2, (OA_B_04-$808D)/2, (OA_B_05-$808D)/2, (OA_B_06-$808D)/2, (OA_B_07-$808D)/2, (OA_B_08-$808D)/2, (OA_B_09-$808D)/2, (OA_B_0A-$808D)/2, (OA_B_0B-$808D)/2, (OA_B_0C-$808D)/2, (OA_B_0D-$808D)/2, (OA_B_0E-$808D)/2, (OA_B_0F-$808D)/2
  dw (OA_B_10-$808D)/2, (OA_B_11-$808D)/2, (OA_B_12-$808D)/2, (OA_B_13-$808D)/2, (OA_B_14-$808D)/2, (OA_B_15-$808D)/2, (OA_B_16-$808D)/2, (OA_B_17-$808D)/2, (OA_B_18-$808D)/2, (OA_B_19-$808D)/2, (OA_B_1A-$808D)/2, (OA_B_1B-$808D)/2, (OA_B_1C-$808D)/2, (OA_B_1D-$808D)/2, (OA_B_1E-$808D)/2, (OA_B_1F-$808D)/2
  dw (OA_B_20-$808D)/2, (OA_B_21-$808D)/2, (OA_B_22-$808D)/2, (OA_B_23-$808D)/2, (OA_B_24-$808D)/2, (OA_B_25-$808D)/2, (OA_B_26-$808D)/2, (OA_B_27-$808D)/2, (OA_B_28-$808D)/2, (OA_B_29-$808D)/2, (OA_B_2A-$808D)/2, (OA_B_2B-$808D)/2, (OA_B_2C-$808D)/2, (OA_B_2D-$808D)/2, (OA_B_2E-$808D)/2, (OA_B_2F-$808D)/2
  dw (OA_B_30-$808D)/2, (OA_B_31-$808D)/2, (OA_B_32-$808D)/2, (OA_B_33-$808D)/2, (OA_B_34-$808D)/2, (OA_B_35-$808D)/2, (OA_B_36-$808D)/2, (OA_B_37-$808D)/2, (OA_B_38-$808D)/2, (OA_B_39-$808D)/2, (OA_B_3A-$808D)/2, (OA_B_3B-$808D)/2, (OA_B_3C-$808D)/2, (OA_B_3D-$808D)/2, (OA_B_3E-$808D)/2, (OA_B_3F-$808D)/2
  dw (OA_B_40-$808D)/2, (OA_B_41-$808D)/2, (OA_B_42-$808D)/2, (OA_B_43-$808D)/2, (OA_B_44-$808D)/2, (OA_B_45-$808D)/2, (OA_B_46-$808D)/2, (OA_B_47-$808D)/2, (OA_B_48-$808D)/2, (OA_B_49-$808D)/2, (OA_B_4A-$808D)/2, (OA_B_4B-$808D)/2, (OA_B_4C-$808D)/2, (OA_B_4D-$808D)/2, (OA_B_4E-$808D)/2, (OA_B_4F-$808D)/2
  dw (OA_B_50-$808D)/2, (OA_B_51-$808D)/2, (OA_B_52-$808D)/2, (OA_B_53-$808D)/2, (OA_B_54-$808D)/2, (OA_B_55-$808D)/2, (OA_B_56-$808D)/2, (OA_B_57-$808D)/2, (OA_B_58-$808D)/2, (OA_B_59-$808D)/2, (OA_B_5A-$808D)/2, (OA_B_5B-$808D)/2, (OA_B_5C-$808D)/2, (OA_B_5D-$808D)/2, (OA_B_5E-$808D)/2, (OA_B_5F-$808D)/2
  dw (OA_B_60-$808D)/2, (OA_B_61-$808D)/2, (OA_B_62-$808D)/2, (OA_B_63-$808D)/2, (OA_B_64-$808D)/2, (OA_B_65-$808D)/2, (OA_B_66-$808D)/2, (OA_B_67-$808D)/2, (OA_B_68-$808D)/2, (OA_B_69-$808D)/2, (OA_B_6A-$808D)/2, (OA_B_6B-$808D)/2, (OA_B_6C-$808D)/2, (OA_B_6D-$808D)/2, (OA_B_6E-$808D)/2, (OA_B_6F-$808D)/2
  dw (OA_B_70-$808D)/2, (OA_B_71-$808D)/2, (OA_B_72-$808D)/2, (OA_B_73-$808D)/2, (OA_B_74-$808D)/2, (OA_B_75-$808D)/2, (OA_B_76-$808D)/2, (OA_B_77-$808D)/2, (OA_B_78-$808D)/2, (OA_B_79-$808D)/2, (OA_B_7A-$808D)/2, (OA_B_7B-$808D)/2, (OA_B_7C-$808D)/2, (OA_B_7D-$808D)/2, (OA_B_7E-$808D)/2, (OA_B_7F-$808D)/2
  dw (OA_B_80-$808D)/2, (OA_B_81-$808D)/2, (OA_B_82-$808D)/2, (OA_B_83-$808D)/2, (OA_B_84-$808D)/2, (OA_B_85-$808D)/2, (OA_B_86-$808D)/2, (OA_B_87-$808D)/2, (OA_B_88-$808D)/2, (OA_B_89-$808D)/2, (OA_B_8A-$808D)/2, (OA_B_8B-$808D)/2, (OA_B_8C-$808D)/2, (OA_B_8D-$808D)/2, (OA_B_8E-$808D)/2, (OA_B_8F-$808D)/2
  dw (OA_B_90-$808D)/2, (OA_B_91-$808D)/2, (OA_B_92-$808D)/2, (OA_B_93-$808D)/2, (OA_B_94-$808D)/2, (OA_B_95-$808D)/2, (OA_B_96-$808D)/2, (OA_B_97-$808D)/2, (OA_B_98-$808D)/2, (OA_B_99-$808D)/2, (OA_B_9A-$808D)/2, (OA_B_9B-$808D)/2, (OA_B_9C-$808D)/2, (OA_B_9D-$808D)/2, (OA_B_9E-$808D)/2, (OA_B_9F-$808D)/2
  dw (OA_B_A0-$808D)/2, (OA_B_A1-$808D)/2, (OA_B_A2-$808D)/2, (OA_B_A3-$808D)/2, (OA_B_A4-$808D)/2, (OA_B_A5-$808D)/2, (OA_B_A6-$808D)/2, (OA_B_A7-$808D)/2, (OA_B_A8-$808D)/2, (OA_B_A9-$808D)/2, (OA_B_AA-$808D)/2, (OA_B_AB-$808D)/2, (OA_B_AC-$808D)/2, (OA_B_AD-$808D)/2, (OA_B_AE-$808D)/2, (OA_B_AF-$808D)/2
  dw (OA_B_B0-$808D)/2, (OA_B_B1-$808D)/2, (OA_B_B2-$808D)/2, (OA_B_B3-$808D)/2, (OA_B_B4-$808D)/2, (OA_B_B5-$808D)/2, (OA_B_B6-$808D)/2, (OA_B_B7-$808D)/2, (OA_B_B8-$808D)/2, (OA_B_B9-$808D)/2, (OA_B_BA-$808D)/2, (OA_B_BB-$808D)/2, (OA_B_BC-$808D)/2, (OA_B_BD-$808D)/2, (OA_B_BE-$808D)/2, (OA_B_BF-$808D)/2
  dw (OA_B_C0-$808D)/2, (OA_B_C1-$808D)/2, (OA_B_C2-$808D)/2, (OA_B_C3-$808D)/2, (OA_B_C4-$808D)/2, (OA_B_C5-$808D)/2, (OA_B_C6-$808D)/2, (OA_B_C7-$808D)/2, (OA_B_C8-$808D)/2, (OA_B_C9-$808D)/2, (OA_B_CA-$808D)/2, (OA_B_CB-$808D)/2, (OA_B_CC-$808D)/2, (OA_B_CD-$808D)/2, (OA_B_CE-$808D)/2, (OA_B_CF-$808D)/2
  dw (OA_B_D0-$808D)/2, (OA_B_D1-$808D)/2, (OA_B_D2-$808D)/2, (OA_B_D3-$808D)/2, (OA_B_D4-$808D)/2, (OA_B_D5-$808D)/2, (OA_B_D6-$808D)/2, (OA_B_D7-$808D)/2, (OA_B_D8-$808D)/2, (OA_B_D9-$808D)/2, (OA_B_DA-$808D)/2, (OA_B_DB-$808D)/2, (OA_B_DC-$808D)/2, (OA_B_DD-$808D)/2, (OA_B_DE-$808D)/2, (OA_B_DF-$808D)/2
  dw (OA_B_E0-$808D)/2, (OA_B_E1-$808D)/2, (OA_B_E2-$808D)/2, (OA_B_E3-$808D)/2, (OA_B_E4-$808D)/2, (OA_B_E5-$808D)/2, (OA_B_E6-$808D)/2, (OA_B_E7-$808D)/2, (OA_B_E8-$808D)/2, (OA_B_E9-$808D)/2, (OA_B_EA-$808D)/2, (OA_B_EB-$808D)/2, (OA_B_EC-$808D)/2, (OA_B_ED-$808D)/2, (OA_B_EE-$808D)/2, (OA_B_EF-$808D)/2
  dw (OA_B_F0-$808D)/2, (OA_B_F1-$808D)/2, (OA_B_F2-$808D)/2, (OA_B_F3-$808D)/2, (OA_B_F4-$808D)/2, (OA_B_F5-$808D)/2, (OA_B_F6-$808D)/2, (OA_B_F7-$808D)/2, (OA_B_F8-$808D)/2, (OA_B_F9-$808D)/2, (OA_B_FA-$808D)/2, (OA_B_FB-$808D)/2, (OA_B_FC-$808D)/2

org $929657
SamusOam_Empty:
dw 0

SamusOam_9659:
dw 3
db $E8,$C3,$F0,$40,$28
db $F8,$C3,$F0,$42,$28
db $08,$C0,$F0,$44,$28

;SamusOam_966A:
;dw 2
;db $F8,$C3,$00,$BE,$28
;db $F8,$C3,$10,$7E,$28

SamusOam_9676:
dw 4
db $FC,$C3,$F0,$00,$28
db $F4,$C3,$F0,$02,$28
db $FC,$C3,$00,$04,$28
db $F4,$C3,$00,$06,$28

SamusOam_968C:
dw 2
db $F9,$01,$10,$08,$28
db $01,$00,$10,$09,$28

SamusOam_9698:
dw 8
db $F4,$C3,$F0,$08,$28
db $04,$00,$F0,$0A,$28
db $04,$00,$F8,$1A,$28
db $F4,$C3,$00,$0B,$28
db $04,$00,$00,$0D,$28
db $04,$00,$08,$1D,$28
db $F9,$01,$10,$0E,$28
db $01,$00,$10,$0F,$28

SamusOam_96C2:
dw 8
db $04,$00,$10,$01,$38
db $FC,$01,$10,$02,$38
db $FC,$01,$08,$03,$38
db $FC,$01,$00,$04,$38
db $04,$00,$F8,$05,$38
db $FC,$01,$F8,$06,$38
db $F4,$01,$F8,$07,$38
db $F4,$01,$F0,$10,$38

SamusOam_96EC:
dw 7
db $04,$00,$08,$00,$38
db $FC,$01,$08,$01,$38
db $F4,$01,$08,$02,$38
db $04,$00,$00,$03,$38
db $FC,$01,$00,$04,$38
db $F4,$01,$00,$05,$38
db $F4,$01,$F8,$06,$38

SamusOam_9711:
dw 9
db $FC,$01,$10,$02,$38
db $F4,$01,$10,$03,$38
db $04,$00,$08,$04,$38
db $FC,$01,$08,$05,$38
db $04,$00,$00,$06,$38
db $FC,$01,$00,$07,$38
db $FC,$01,$F8,$10,$38
db $04,$00,$F0,$11,$38
db $FC,$01,$F0,$12,$38

SamusOam_9740:
dw 13
db $FC,$01,$10,$02,$38
db $F4,$01,$10,$03,$38
db $04,$00,$08,$04,$38
db $FC,$01,$08,$05,$38
db $F4,$01,$08,$06,$38
db $04,$00,$00,$07,$38
db $FC,$01,$00,$10,$38
db $F4,$01,$00,$11,$38
db $04,$00,$F8,$12,$38
db $FC,$01,$F8,$13,$38
db $F4,$01,$F8,$14,$38
db $04,$00,$F0,$15,$38
db $FC,$01,$F0,$16,$38

SamusOam_9783:
dw 7
db $FC,$01,$10,$01,$38
db $FC,$01,$08,$02,$38
db $04,$00,$00,$03,$38
db $F4,$01,$00,$04,$38
db $04,$00,$F8,$05,$38
db $F4,$01,$F8,$06,$38
db $04,$00,$F0,$07,$38

SamusOam_97A8:
dw 9
db $04,$00,$10,$01,$38
db $FC,$01,$10,$02,$38
db $04,$00,$08,$03,$38
db $FC,$01,$08,$04,$38
db $04,$00,$F8,$05,$38
db $FC,$01,$F8,$06,$38
db $F4,$01,$F8,$07,$38
db $04,$00,$F0,$10,$38
db $FC,$01,$F0,$11,$38

SamusOam_97D7:
dw 10
db $04,$00,$10,$01,$38
db $FC,$01,$10,$02,$38
db $F4,$01,$10,$03,$38
db $04,$00,$08,$04,$38
db $FC,$01,$08,$05,$38
db $F4,$01,$08,$06,$38
db $F4,$01,$F8,$07,$38
db $04,$00,$F0,$10,$38
db $FC,$01,$F0,$11,$38
db $F4,$01,$F0,$12,$38

SamusOam_980B:
dw 7
db $04,$00,$11,$00,$38
db $F4,$01,$11,$01,$38
db $F4,$01,$09,$02,$38
db $04,$00,$01,$03,$38
db $04,$00,$F1,$04,$38
db $FC,$01,$F1,$05,$38
db $F4,$01,$F1,$06,$38

SamusOam_9830:
dw 4
db $FC,$C3,$F5,$00,$28
db $00,$00,$ED,$02,$68
db $0C,$00,$FD,$12,$28
db $04,$C0,$F9,$06,$28

SamusOam_9846:
dw 3
db $FE,$C3,$06,$08,$68
db $EE,$C3,$06,$0A,$68
db $F6,$C3,$F6,$0C,$68

SamusOam_9857:
dw 4
db $F5,$C3,$F5,$04,$28
db $F9,$01,$ED,$02,$28
db $ED,$01,$FD,$13,$28
db $ED,$C1,$F9,$06,$68

SamusOam_986D:
dw 3
db $F3,$C3,$06,$08,$28
db $03,$C2,$06,$0A,$28
db $FB,$C3,$F6,$0C,$28

SamusOam_987E:
dw 2
db $F9,$C3,$F0,$00,$28
db $FD,$C3,$E0,$02,$28

SamusOam_988A:
dw 3
db $FE,$C3,$06,$08,$68
db $EE,$C3,$06,$0A,$68
db $FA,$C3,$F6,$0C,$68

SamusOam_989B:
dw 2
db $F8,$C3,$F0,$04,$28
db $F4,$C3,$E0,$06,$28

SamusOam_98A7:
dw 3
db $F3,$C3,$06,$08,$28
db $03,$C0,$06,$0A,$28
db $F7,$C3,$F6,$0C,$28

SamusOam_98B8:
dw 2
db $FB,$C3,$F0,$00,$28
db $0B,$C0,$F0,$02,$28

SamusOam_98C4:
dw 2
db $F6,$C3,$F0,$06,$28
db $E6,$C3,$F0,$04,$28

SamusOam_98D0:
dw 2
db $FA,$C3,$F2,$00,$28
db $02,$C0,$FA,$02,$28

SamusOam_98DC:
dw 2
db $F7,$C3,$F2,$06,$28
db $EF,$C3,$FA,$04,$28

SamusOam_98E8:
dw 4
db $FC,$C3,$F4,$00,$28
db $0C,$00,$FC,$12,$28
db $FC,$01,$04,$02,$28
db $04,$00,$04,$03,$28

SamusOam_98FE:
dw 3
db $FC,$C3,$F4,$00,$28
db $FC,$01,$04,$02,$28
db $04,$00,$04,$03,$28

SamusOam_990F:
dw 5
db $F8,$C3,$F2,$00,$28
db $08,$00,$F2,$02,$28
db $08,$00,$FA,$12,$28
db $F8,$01,$02,$03,$28
db $00,$00,$02,$04,$28

SamusOam_992A:
dw 4
db $F9,$C3,$F2,$00,$28
db $09,$00,$FA,$12,$28
db $F9,$01,$02,$02,$28
db $01,$00,$02,$03,$28

SamusOam_9940:
dw 3
db $FB,$C3,$F3,$00,$28
db $FB,$01,$03,$02,$28
db $03,$00,$03,$03,$28

SamusOam_9951:
dw 3
db $FB,$C3,$F4,$00,$28
db $FB,$01,$04,$02,$28
db $03,$00,$04,$03,$28

SamusOam_9962:
dw 2
db $FB,$C3,$F4,$00,$28
db $0B,$00,$FC,$12,$28

SamusOam_996E:
dw 3
db $F9,$C3,$F2,$00,$28
db $09,$00,$F2,$02,$28
db $09,$00,$FA,$12,$28

SamusOam_997F:
dw 3
db $FB,$C3,$F2,$00,$28
db $0B,$00,$F2,$02,$28
db $0B,$00,$FA,$12,$28

SamusOam_9990:
dw 2
db $FC,$C3,$F4,$00,$28
db $0C,$00,$FC,$12,$28

SamusOam_999C:
dw 2
db $F7,$C3,$FF,$08,$68
db $FA,$01,$0F,$0A,$68

SamusOam_99A8:
dw 3
db $F7,$C3,$FF,$08,$68
db $FF,$01,$0F,$0A,$68
db $F7,$01,$0F,$0B,$68

SamusOam_99B9:
dw 5
db $F9,$C3,$06,$08,$68
db $F1,$01,$06,$0A,$68
db $F1,$01,$0E,$1A,$68
db $01,$00,$FE,$0B,$68
db $F9,$01,$FE,$0C,$68

SamusOam_99D4:
dw 4
db $00,$C0,$05,$08,$68
db $F0,$C3,$05,$0A,$68
db $00,$00,$FD,$0C,$68
db $F8,$01,$FD,$0D,$68

SamusOam_99EA:
dw 2
db $FB,$C3,$07,$0A,$68
db $F3,$C3,$FF,$08,$68

SamusOam_99F6:
dw 3
db $F7,$C3,$FF,$08,$68
db $FF,$01,$0F,$0A,$68
db $F7,$01,$0F,$0B,$68

SamusOam_9A07:
dw 3
db $F7,$C3,$FF,$08,$68
db $FF,$01,$0F,$0A,$68
db $F7,$01,$0F,$0B,$68

SamusOam_9A18:
dw 5
db $F8,$C3,$06,$08,$68
db $F0,$01,$06,$0A,$68
db $F0,$01,$0E,$1A,$68
db $00,$00,$FE,$0B,$68
db $F8,$01,$FE,$0C,$68

SamusOam_9A33:
dw 4
db $00,$C0,$05,$08,$68
db $F0,$C3,$05,$0A,$68
db $00,$00,$FD,$0C,$68
db $F8,$01,$FD,$0D,$68

SamusOam_9A49:
dw 5
db $FA,$C3,$FF,$08,$68
db $F2,$01,$FF,$0A,$68
db $F2,$01,$07,$1A,$68
db $02,$00,$0F,$0B,$68
db $FA,$01,$0F,$0C,$68

SamusOam_9A64:
dw 2
db $F6,$C3,$F5,$00,$28
db $F6,$01,$ED,$02,$28

SamusOam_9A70:
dw 2
db $F4,$C3,$F6,$00,$28
db $F8,$01,$EE,$02,$28

SamusOam_9A7C:
dw 3
db $F1,$C3,$F3,$00,$28
db $01,$00,$F3,$02,$28
db $01,$00,$FB,$12,$28

SamusOam_9A8D:
dw 4
db $EF,$C3,$F4,$00,$28
db $F7,$01,$EC,$03,$28
db $FF,$01,$F4,$02,$28
db $FF,$01,$FC,$12,$28

SamusOam_9AA3:
dw 3
db $F5,$C3,$F6,$00,$28
db $F4,$01,$EE,$02,$28
db $FC,$01,$EE,$03,$28

SamusOam_9AB4:
dw 2
db $F6,$C3,$F5,$00,$28
db $F6,$01,$ED,$02,$28

SamusOam_9AC0:
dw 1
db $F5,$C3,$F2,$00,$28

SamusOam_9AC7:
dw 2
db $F7,$C3,$F1,$01,$28
db $EF,$01,$F9,$10,$28

SamusOam_9AD3:
dw 2
db $F5,$C3,$F2,$01,$28
db $ED,$01,$FA,$10,$28

SamusOam_9ADF:
dw 1
db $F4,$C3,$F3,$00,$28

SamusOam_9AE6:
dw 2
db $F9,$C3,$FF,$08,$28
db $FE,$01,$0F,$0A,$28

SamusOam_9AF2:
dw 3
db $F9,$C3,$FF,$08,$28
db $F9,$01,$0F,$0A,$28
db $01,$00,$0F,$0B,$28

SamusOam_9B03:
dw 5
db $F8,$C3,$06,$08,$28
db $08,$00,$06,$0A,$28
db $08,$00,$0E,$1A,$28
db $F8,$01,$FE,$0B,$28
db $00,$00,$FE,$0C,$28

SamusOam_9B1E:
dw 4
db $F0,$C1,$05,$08,$28
db $00,$C2,$05,$0A,$28
db $F8,$01,$FD,$0C,$28
db $00,$00,$FD,$0D,$28

SamusOam_9B34:
dw 2
db $F5,$C3,$07,$0A,$28
db $FD,$C3,$FF,$08,$28

SamusOam_9B40:
dw 3
db $F9,$C3,$FF,$08,$28
db $F9,$01,$0F,$0A,$28
db $01,$00,$0F,$0B,$28

SamusOam_9B51:
dw 3
db $F9,$C3,$FF,$08,$28
db $F9,$01,$0F,$0A,$28
db $01,$00,$0F,$0B,$28

SamusOam_9B62:
dw 5
db $F8,$C3,$06,$08,$28
db $08,$00,$06,$0A,$28
db $08,$00,$0E,$1A,$28
db $F8,$01,$FE,$0B,$28
db $00,$00,$FE,$0C,$28

SamusOam_9B7D:
dw 4
db $F0,$C1,$05,$08,$28
db $00,$C2,$05,$0A,$28
db $F8,$01,$FD,$0C,$28
db $00,$00,$FD,$0D,$28

SamusOam_9B93:
dw 5
db $F6,$C3,$FF,$08,$28
db $06,$00,$FF,$0A,$28
db $06,$00,$07,$1A,$28
db $F6,$01,$0F,$0B,$28
db $FE,$01,$0F,$0C,$28

SamusOam_9BAE:
dw 3
db $FB,$C3,$F4,$00,$28
db $08,$00,$FE,$12,$28
db $03,$C0,$F9,$06,$28

SamusOam_9BBF:
dw 3
db $FC,$C3,$F3,$00,$28
db $0A,$00,$FD,$12,$28
db $05,$C0,$F8,$06,$28

SamusOam_9BD0:
dw 3
db $FC,$C3,$F2,$00,$28
db $0B,$00,$FC,$12,$28
db $06,$C0,$F7,$06,$28

SamusOam_9BE1:
dw 4
db $F5,$C3,$F5,$04,$28
db $ED,$01,$FD,$13,$28
db $F6,$01,$ED,$02,$28
db $ED,$C1,$F9,$06,$68

SamusOam_9BF7:
dw 4
db $F4,$C3,$F4,$04,$28
db $EC,$01,$FC,$13,$28
db $F5,$01,$EC,$02,$28
db $EB,$C1,$F8,$06,$68

SamusOam_9C0D:
dw 4
db $F4,$C3,$F3,$04,$28
db $EC,$01,$FB,$13,$28
db $F5,$01,$EB,$02,$28
db $EA,$C1,$F7,$06,$68

SamusOam_9C23:
dw 2
db $FB,$C3,$F4,$00,$28
db $0B,$C0,$F4,$02,$28

SamusOam_9C2F:
dw 2
db $FB,$C3,$F2,$00,$28
db $0B,$C0,$F2,$02,$28

SamusOam_9C3B:
dw 2
db $FC,$C3,$F0,$00,$28
db $0C,$C0,$F0,$02,$28

SamusOam_9C47:
dw 2
db $F5,$C3,$F4,$06,$28
db $E5,$C1,$F4,$04,$28

SamusOam_9C53:
dw 2
db $F5,$C3,$F2,$06,$28
db $E5,$C1,$F2,$04,$28

SamusOam_9C5F:
dw 2
db $F4,$C3,$F0,$06,$28
db $E4,$C1,$F0,$04,$28

SamusOam_9C6B:
dw 2
db $F8,$C3,$F1,$00,$28
db $FF,$C3,$F9,$02,$28

SamusOam_9C77:
dw 2
db $F9,$C3,$F0,$00,$28
db $00,$C0,$F8,$02,$28

SamusOam_9C83:
dw 2
db $FA,$C3,$F0,$00,$28
db $01,$C0,$F8,$02,$28

SamusOam_9C8F:
dw 2
db $F8,$C3,$F1,$06,$28
db $F0,$C3,$F9,$04,$28

SamusOam_9C9B:
dw 2
db $F7,$C3,$F0,$06,$28
db $EF,$C1,$F9,$04,$28

SamusOam_9CA7:
dw 2
db $F6,$C3,$F0,$06,$28
db $EE,$C1,$F8,$04,$28

SamusOam_9CB3:
dw 2
db $FC,$C3,$F5,$00,$28
db $FC,$C3,$05,$02,$28

SamusOam_9CBF:
dw 2
db $F4,$C3,$F5,$04,$28
db $F4,$C3,$05,$06,$28

SamusOam_9CCB:
dw 2
db $F8,$C3,$F4,$02,$28
db $08,$00,$FC,$14,$28

SamusOam_9CD7:
dw 2
db $F6,$C3,$F9,$08,$68
db $F6,$C3,$09,$0A,$68

SamusOam_9CE3:
dw 4
db $F0,$C3,$F0,$02,$68
db $00,$C0,$F0,$00,$68
db $F0,$C3,$00,$06,$68
db $00,$C0,$00,$04,$68

SamusOam_9CF9:
dw 2
db $EF,$C3,$F8,$02,$68
db $FF,$C3,$F8,$00,$68

SamusOam_9D05:
dw 2
db $F8,$C3,$F0,$00,$68
db $F8,$C3,$00,$02,$68

SamusOam_9D11:
dw 4
db $F0,$C3,$F0,$04,$A8
db $00,$C0,$F0,$06,$A8
db $F0,$C3,$00,$00,$A8
db $00,$C0,$00,$02,$A8

SamusOam_9D27:
dw 2
db $F1,$C3,$F8,$00,$A8
db $01,$C0,$F8,$02,$A8

SamusOam_9D33:
dw 2
db $F8,$C3,$F0,$02,$A8
db $F8,$C3,$00,$00,$A8

SamusOam_9D3F:
dw 2
db $F8,$C3,$F4,$00,$28
db $F5,$01,$00,$04,$28

SamusOam_9D4B:
dw 2
db $FA,$C3,$FA,$08,$28
db $FA,$C3,$0A,$0A,$28

SamusOam_9D57:
dw 4
db $F0,$C3,$F0,$00,$28
db $00,$C0,$F0,$02,$28
db $F0,$C3,$00,$04,$28
db $00,$C0,$00,$06,$28

SamusOam_9D6D:
dw 2
db $EF,$C3,$F8,$00,$28
db $FF,$C3,$F8,$02,$28

SamusOam_9D79:
dw 2
db $F8,$C3,$F0,$00,$28
db $F8,$C3,$00,$02,$28

SamusOam_9D85:
dw 4
db $F0,$C3,$F0,$06,$E8
db $00,$C0,$F0,$04,$E8
db $F0,$C3,$00,$02,$E8
db $00,$C0,$00,$00,$E8

SamusOam_9D9B:
dw 2
db $F1,$C3,$F8,$02,$E8
db $01,$C0,$F8,$00,$E8

SamusOam_9DA7:
dw 2
db $F8,$C3,$F0,$02,$E8
db $F8,$C3,$00,$00,$E8

SamusOam_9DB3:
dw 1
db $F8,$C3,$F8,$00,$28

SamusOam_9DBA:
dw 1
db $F8,$C3,$F7,$00,$28

SamusOam_9DC1:
dw 1
db $F8,$C3,$F9,$00,$28

SamusOam_9DC8:
dw 3
db $F8,$C3,$F5,$00,$28
db $FD,$01,$ED,$12,$28
db $08,$00,$F6,$02,$28

SamusOam_9DD9:
dw 5
db $F9,$C3,$F6,$04,$28
db $F9,$01,$EE,$06,$28
db $01,$00,$EE,$07,$28
db $F1,$01,$FE,$13,$28
db $F1,$01,$F6,$03,$28

SamusOam_9DF4:
dw 4
db $FA,$C3,$F5,$00,$28
db $FE,$01,$ED,$02,$68
db $0A,$00,$FD,$12,$28
db $02,$C0,$F9,$06,$28

SamusOam_9E0A:
dw 2
db $06,$C0,$FD,$08,$68
db $F6,$C3,$FD,$0A,$68

SamusOam_9E16:
dw 4
db $F7,$C3,$F5,$04,$28
db $FB,$01,$ED,$02,$28
db $EF,$01,$FD,$13,$28
db $EF,$C1,$F9,$06,$68

SamusOam_9E2C:
dw 2
db $EA,$C3,$FD,$08,$28
db $FA,$C3,$FD,$0A,$28

SamusOam_9E38:
dw 2
db $FA,$C3,$EB,$00,$28
db $FA,$C3,$FB,$02,$28

SamusOam_9E44:
dw 2
db $FB,$C3,$F2,$00,$28
db $0B,$00,$F5,$02,$28

SamusOam_9E50:
dw 2
db $FA,$C3,$F2,$00,$28
db $05,$00,$EF,$02,$28

SamusOam_9E5C:
dw 2
db $F6,$C3,$EB,$00,$68
db $F6,$C3,$FB,$04,$28

SamusOam_9E68:
dw 2
db $F5,$C3,$F2,$03,$28
db $ED,$01,$F5,$02,$68

SamusOam_9E74:
dw 2
db $F6,$C3,$F2,$03,$28
db $F3,$01,$EF,$12,$28

SamusOam_9E80:
dw 5
db $FA,$C3,$FA,$00,$68
db $F2,$01,$FA,$02,$68
db $F2,$01,$02,$12,$68
db $03,$00,$F2,$03,$68
db $FB,$01,$F2,$04,$68

SamusOam_9E9B:
dw 5
db $F6,$C3,$FA,$00,$28
db $06,$00,$FA,$02,$28
db $06,$00,$02,$12,$28
db $F5,$01,$F2,$03,$28
db $FD,$01,$F2,$04,$28

SamusOam_9EB6:
dw 1
db $F7,$C3,$FD,$08,$68

SamusOam_9EBD:
dw 1
db $FB,$C3,$FD,$08,$28

SamusOam_9EC4:
dw 4
db $F5,$C3,$F5,$04,$28
db $F9,$01,$ED,$02,$28
db $ED,$01,$FD,$13,$28
db $ED,$C1,$F9,$06,$68

SamusOam_9EDA:
dw 4
db $F6,$C3,$F5,$04,$28
db $FA,$01,$ED,$02,$28
db $EE,$01,$FD,$13,$28
db $EE,$C1,$F9,$06,$68

SamusOam_9EF0:
dw 4
db $F7,$C3,$F5,$04,$28
db $FB,$01,$ED,$02,$28
db $EF,$01,$FD,$13,$28
db $EF,$C1,$F9,$06,$68

SamusOam_9F06:
dw 2
db $F9,$C3,$06,$08,$28
db $F9,$C3,$F6,$0A,$28

SamusOam_9F12:
dw 2
db $F9,$C3,$06,$08,$28
db $F9,$C3,$F6,$0A,$28

SamusOam_9F1E:
dw 2
db $FC,$C3,$06,$08,$28
db $FC,$C3,$F6,$0A,$28

SamusOam_9F2A:
dw 2
db $F9,$C3,$06,$08,$28
db $F9,$C3,$F6,$0A,$28

SamusOam_9F36:
dw 2
db $F8,$C3,$06,$08,$28
db $F8,$C3,$F6,$0A,$28

SamusOam_9F42:
dw 2
db $F9,$C3,$06,$08,$28
db $F9,$C3,$F6,$0A,$28

SamusOam_9F4E:
dw 4
db $FC,$C3,$F5,$00,$28
db $00,$00,$ED,$02,$68
db $0C,$00,$FD,$12,$28
db $04,$C0,$F9,$06,$28

SamusOam_9F64:
dw 4
db $FB,$C3,$F5,$00,$28
db $FF,$01,$ED,$02,$68
db $0B,$00,$FD,$12,$28
db $03,$C0,$F9,$06,$28

SamusOam_9F7A:
dw 4
db $FA,$C3,$F5,$00,$28
db $FE,$01,$ED,$02,$68
db $0A,$00,$FD,$12,$28
db $02,$C0,$F9,$06,$28

SamusOam_9F90:
dw 2
db $F7,$C3,$06,$08,$68
db $F7,$C3,$F6,$0A,$68

SamusOam_9F9C:
dw 2
db $F7,$C3,$06,$08,$68
db $F7,$C3,$F6,$0A,$68

SamusOam_9FA8:
dw 2
db $F4,$C3,$06,$08,$68
db $F4,$C3,$F6,$0A,$68

SamusOam_9FB4:
dw 2
db $F7,$C3,$06,$08,$68
db $F7,$C3,$F6,$0A,$68

SamusOam_9FC0:
dw 2
db $F8,$C3,$06,$08,$68
db $F8,$C3,$F6,$0A,$68

SamusOam_9FCC:
dw 2
db $F7,$C3,$06,$08,$68
db $F7,$C3,$F6,$0A,$68

SamusOam_9FD8:
dw 4
db $F8,$C3,$FF,$08,$68
db $F8,$01,$0F,$0B,$68
db $00,$00,$0F,$0A,$68
db $F8,$01,$17,$0C,$68

SamusOam_9FEE:
dw 4
db $FC,$C3,$FE,$08,$68
db $FC,$01,$0E,$0B,$68
db $04,$00,$0E,$0A,$68
db $FC,$01,$16,$0C,$68

SamusOam_A004:
dw 2
db $FA,$C3,$FF,$08,$68
db $FA,$01,$0F,$0A,$68

SamusOam_A010:
dw 2
db $FA,$C3,$00,$08,$68
db $FA,$01,$10,$0A,$68

SamusOam_A01C:
dw 3
db $F8,$C3,$FE,$08,$68
db $F8,$01,$0E,$0B,$68
db $F8,$01,$0E,$0A,$68

SamusOam_A02D:
dw 2
db $F7,$C3,$FD,$08,$68
db $F7,$C3,$0D,$0A,$68

SamusOam_A039:
dw 2
db $F8,$C3,$FD,$08,$68
db $F8,$C3,$0D,$0A,$68

SamusOam_A045:
dw 2
db $F3,$C3,$F4,$08,$68
db $F3,$C3,$04,$0A,$68

SamusOam_A051:
dw 3
db $F8,$C3,$FD,$08,$68
db $F8,$01,$0D,$0B,$68
db $00,$00,$0D,$0A,$68

SamusOam_A062:
dw 4
db $F2,$C3,$F4,$00,$28
db $FA,$01,$EC,$03,$28
db $02,$00,$F4,$02,$28
db $02,$00,$FC,$12,$28

SamusOam_A078:
dw 4
db $F8,$C3,$FF,$08,$28
db $00,$00,$0F,$0B,$28
db $F8,$01,$0F,$0A,$28
db $00,$00,$17,$0C,$28

SamusOam_A08E:
dw 4
db $F4,$C3,$FE,$08,$28
db $FC,$01,$0E,$0B,$28
db $F4,$01,$0E,$0A,$28
db $FC,$01,$16,$0C,$28

SamusOam_A0A4:
dw 2
db $F6,$C3,$FF,$08,$28
db $FE,$01,$0F,$0A,$28

SamusOam_A0B0:
dw 2
db $F6,$C3,$00,$08,$28
db $FE,$01,$10,$0A,$28

SamusOam_A0BC:
dw 3
db $F8,$C3,$FE,$08,$28
db $00,$00,$0E,$0B,$28
db $F8,$00,$0E,$0A,$28

SamusOam_A0CD:
dw 2
db $F9,$C3,$FD,$08,$28
db $F9,$C3,$0D,$0A,$28

SamusOam_A0D9:
dw 2
db $F8,$C3,$FD,$08,$28
db $F8,$C3,$0D,$0A,$28

SamusOam_A0E5:
dw 2
db $FD,$C3,$F4,$08,$28
db $FD,$C3,$04,$0A,$28

SamusOam_A0F1:
dw 3
db $F9,$C3,$FD,$08,$28
db $01,$00,$0D,$0B,$28
db $F9,$01,$0D,$0A,$28

SamusOam_A102:
dw 2
db $F9,$C3,$F0,$00,$28
db $09,$C0,$F0,$02,$28

SamusOam_A10E:
dw 2
db $F8,$C3,$F0,$06,$28
db $E8,$C3,$F0,$04,$28

SamusOam_A11A:
dw 2
db $F8,$C3,$F2,$00,$28
db $00,$C0,$FA,$02,$28

SamusOam_A126:
dw 2
db $F9,$C3,$F2,$06,$28
db $F1,$C3,$FA,$04,$28

SamusOam_A132:
dw 2
db $F6,$C3,$F0,$06,$28
db $E6,$C3,$F0,$04,$28

SamusOam_A13E:
dw 2
db $F7,$C3,$F0,$06,$28
db $E7,$C3,$F0,$04,$28

SamusOam_A14A:
dw 2
db $F8,$C3,$F0,$06,$28
db $E8,$C3,$F0,$04,$28

SamusOam_A156:
dw 2
db $FB,$C3,$F0,$00,$28
db $0B,$C0,$F0,$02,$28

SamusOam_A162:
dw 2
db $FA,$C3,$F0,$00,$28
db $0A,$C0,$F0,$02,$28

SamusOam_A16E:
dw 2
db $F9,$C3,$F0,$00,$28
db $09,$C0,$F0,$02,$28

SamusOam_A17A:
dw 2
db $F7,$C3,$F2,$06,$28
db $EF,$C3,$FA,$04,$28

SamusOam_A186:
dw 2
db $F8,$C3,$F2,$06,$28
db $F0,$C3,$FA,$04,$28

SamusOam_A192:
dw 2
db $F9,$C3,$F2,$06,$28
db $F1,$C3,$FA,$04,$28

SamusOam_A19E:
dw 2
db $FA,$C3,$F2,$00,$28
db $02,$C0,$FA,$02,$28

SamusOam_A1AA:
dw 2
db $F9,$C3,$F2,$00,$28
db $01,$C0,$FA,$02,$28

SamusOam_A1B6:
dw 2
db $F8,$C3,$F2,$00,$28
db $00,$C0,$FA,$02,$28

SamusOam_A1C2:
dw 4
db $F0,$C3,$F0,$0A,$68
db $00,$C0,$F0,$08,$68
db $F0,$C3,$00,$0E,$68
db $00,$C0,$00,$0C,$68

SamusOam_A1D8:
dw 4
db $EE,$C3,$F0,$0A,$68
db $FE,$C3,$F0,$08,$68
db $EE,$C3,$00,$0E,$68
db $FE,$C3,$00,$0C,$68

SamusOam_A1EE:
dw 4
db $EF,$C3,$EF,$0A,$68
db $FF,$C3,$EF,$08,$68
db $EF,$C3,$FF,$0E,$68
db $FF,$C3,$FF,$0C,$68

SamusOam_A204:
dw 6
db $EF,$C3,$EE,$0A,$68
db $FF,$C3,$EE,$08,$68
db $EF,$C3,$FE,$0E,$68
db $FF,$01,$06,$1D,$68
db $FF,$01,$0E,$1C,$68
db $07,$00,$0E,$0C,$68

SamusOam_A224:
dw 4
db $F0,$C3,$F0,$08,$28
db $00,$C0,$F0,$0A,$28
db $F0,$C3,$00,$0C,$28
db $00,$C0,$00,$0E,$28

SamusOam_A23A:
dw 4
db $F2,$C3,$F0,$08,$28
db $02,$C0,$F0,$0A,$28
db $F2,$C3,$00,$0C,$28
db $02,$C0,$00,$0E,$28

SamusOam_A250:
dw 4
db $F1,$C3,$EF,$08,$28
db $01,$C0,$EF,$0A,$28
db $F1,$C3,$FF,$0C,$28
db $01,$C0,$FF,$0E,$28

SamusOam_A266:
dw 6
db $F1,$C3,$EE,$08,$28
db $01,$C0,$EE,$0A,$28
db $01,$C0,$FE,$0E,$28
db $F9,$01,$06,$1D,$28
db $F9,$01,$0E,$1C,$28
db $F1,$01,$0E,$0C,$28

SamusOam_A286:
dw 5
db $F0,$C3,$00,$00,$28
db $00,$C0,$00,$02,$28
db $F6,$C3,$F0,$04,$28
db $06,$00,$F0,$06,$28
db $06,$00,$F8,$16,$28

SamusOam_A2A1:
dw 6
db $F0,$C3,$00,$00,$28
db $00,$00,$00,$02,$28
db $00,$00,$08,$12,$28
db $F6,$01,$F8,$03,$28
db $FF,$01,$F8,$04,$28
db $06,$00,$F8,$05,$28

SamusOam_A2C1:
dw 5
db $F0,$C3,$00,$00,$28
db $00,$C0,$00,$02,$28
db $F2,$C3,$F0,$04,$28
db $02,$00,$F0,$06,$28
db $02,$00,$F8,$16,$28

SamusOam_A2DC:
dw 6
db $F8,$C3,$00,$00,$28
db $08,$00,$00,$02,$28
db $08,$00,$08,$12,$28
db $F2,$01,$F8,$03,$28
db $FA,$01,$F8,$04,$28
db $02,$00,$F8,$05,$28

SamusOam_A2FC:
dw 2
db $F9,$C3,$F0,$00,$28
db $FB,$C3,$E0,$02,$28

SamusOam_A308:
dw 2
db $F8,$C3,$F0,$04,$28
db $F6,$C3,$E0,$06,$28

SamusOam_A314:
dw 3
db $F9,$C3,$F3,$00,$28
db $F5,$01,$03,$02,$28
db $FD,$01,$03,$03,$28

SamusOam_A325:
dw 3
db $F7,$C3,$F3,$04,$28
db $F4,$01,$03,$12,$28
db $FC,$01,$03,$13,$28

SamusOam_A336:
dw 2
db $FA,$C3,$F0,$04,$28
db $0A,$00,$F0,$06,$28

SamusOam_A342:
dw 2
db $F9,$C3,$F0,$02,$28
db $E9,$C1,$F0,$00,$28

SamusOam_A34E:
dw 2
db $F8,$C3,$00,$02,$28
db $F8,$C3,$10,$00,$28

SamusOam_A35A:
dw 2
db $F4,$C3,$FF,$02,$28
db $F4,$C3,$0F,$00,$28

SamusOam_A366:
dw 2
db $F3,$C3,$FE,$02,$28
db $EB,$C3,$0E,$00,$28

SamusOam_A372:
dw 2
db $F2,$C3,$FF,$02,$28
db $EA,$C3,$07,$00,$28

SamusOam_A37E:
dw 2
db $F2,$C3,$FE,$02,$28
db $E9,$C3,$05,$00,$28

SamusOam_A38A:
dw 2
db $F1,$C3,$FE,$02,$28
db $E1,$C3,$04,$00,$28

SamusOam_A396:
dw 2
db $F0,$C3,$FB,$02,$28
db $E0,$C3,$01,$00,$28

SamusOam_A3A2:
dw 2
db $F0,$C3,$FA,$02,$28
db $E0,$C3,$FA,$00,$28

SamusOam_A3AE:
dw 2
db $F0,$C3,$F8,$02,$28
db $E0,$C3,$F8,$00,$28

SamusOam_A3BA:
dw 2
db $F0,$C3,$F6,$02,$28
db $E0,$C3,$F6,$00,$28

SamusOam_A3C6:
dw 2
db $F1,$C3,$F6,$02,$28
db $E1,$C3,$EF,$00,$28

SamusOam_A3D2:
dw 2
db $F0,$C3,$F7,$02,$28
db $E7,$C3,$EF,$00,$28

SamusOam_A3DE:
dw 2
db $F1,$C3,$F3,$02,$28
db $EA,$C3,$EA,$00,$28

SamusOam_A3EA:
dw 2
db $F2,$C3,$F2,$02,$28
db $EC,$C3,$E2,$00,$28

SamusOam_A3F6:
dw 2
db $F5,$C3,$F2,$02,$28
db $F1,$C3,$E2,$00,$28

SamusOam_A402:
dw 2
db $F5,$C3,$F1,$02,$28
db $F5,$C3,$E1,$00,$28

SamusOam_A40E:
dw 2
db $F8,$C3,$E0,$00,$E8
db $F8,$C3,$F0,$02,$E8

SamusOam_A41A:
dw 2
db $FC,$C3,$F1,$02,$E8
db $FC,$C3,$E1,$00,$E8

SamusOam_A426:
dw 2
db $FD,$C3,$F2,$02,$E8
db $05,$C2,$E2,$00,$E8

SamusOam_A432:
dw 2
db $FE,$C3,$F1,$02,$E8
db $06,$C2,$E9,$00,$E8

SamusOam_A43E:
dw 2
db $FE,$C3,$F2,$02,$E8
db $07,$C2,$EB,$00,$E8

SamusOam_A44A:
dw 2
db $FF,$C3,$F2,$02,$E8
db $0F,$C2,$EC,$00,$E8

SamusOam_A456:
dw 2
db $00,$C2,$F5,$02,$E8
db $10,$C2,$EF,$00,$E8

SamusOam_A462:
dw 2
db $00,$C2,$F6,$02,$E8
db $10,$C2,$F6,$00,$E8

SamusOam_A46E:
dw 2
db $00,$C2,$F8,$02,$E8
db $10,$C2,$F8,$00,$E8

SamusOam_A47A:
dw 2
db $00,$C2,$FA,$02,$E8
db $10,$C2,$FA,$00,$E8

SamusOam_A486:
dw 2
db $FF,$C3,$FA,$02,$E8
db $0F,$C2,$01,$00,$E8

SamusOam_A492:
dw 2
db $00,$C2,$F9,$02,$E8
db $09,$C2,$01,$00,$E8

SamusOam_A49E:
dw 2
db $FF,$C3,$FD,$02,$E8
db $06,$C2,$06,$00,$E8

SamusOam_A4AA:
dw 2
db $FE,$C3,$FE,$02,$E8
db $04,$C2,$0E,$00,$E8

SamusOam_A4B6:
dw 2
db $FB,$C3,$FE,$02,$E8
db $FF,$C3,$0E,$00,$E8

SamusOam_A4C2:
dw 2
db $FB,$C3,$FF,$02,$E8
db $FB,$C3,$0F,$00,$E8

SamusOam_A4CE:
dw 2
db $F9,$C3,$FF,$08,$68
db $F9,$C3,$0F,$0A,$68

SamusOam_A4DA:
dw 2
db $F8,$C3,$E0,$0A,$28
db $F8,$C3,$F0,$08,$28

SamusOam_A4E6:
dw 2
db $F7,$C3,$E2,$0A,$28
db $F7,$C3,$F2,$08,$28

SamusOam_A4F2:
dw 2
db $F8,$C3,$E2,$0A,$28
db $F8,$C3,$F2,$08,$28

SamusOam_A4FE:
dw 2
db $FE,$C3,$E5,$0A,$28
db $FA,$C3,$F5,$08,$28

SamusOam_A50A:
dw 2
db $00,$C0,$EA,$0A,$28
db $FC,$C3,$F6,$08,$28

SamusOam_A516:
dw 2
db $0C,$C0,$ED,$0A,$28
db $FC,$C3,$F4,$08,$28

SamusOam_A522:
dw 2
db $0C,$C0,$F7,$0A,$28
db $FC,$C3,$F7,$08,$28

SamusOam_A52E:
dw 2
db $0D,$C0,$F7,$0A,$28
db $FD,$C3,$F7,$08,$28

SamusOam_A53A:
dw 2
db $0F,$C0,$F8,$0A,$28
db $FF,$C3,$F8,$08,$28

SamusOam_A546:
dw 2
db $0E,$C0,$F9,$0A,$28
db $FE,$C3,$F9,$08,$28

SamusOam_A552:
dw 2
db $0E,$C0,$FC,$0A,$28
db $FE,$C3,$FC,$08,$28

SamusOam_A55E:
dw 2
db $08,$C0,$01,$0A,$28
db $F8,$C3,$FF,$08,$28

SamusOam_A56A:
dw 2
db $01,$C0,$09,$0A,$28
db $FB,$C3,$F9,$08,$28

SamusOam_A576:
dw 2
db $FE,$C3,$0B,$0A,$28
db $FB,$C3,$FB,$08,$28

SamusOam_A582:
dw 2
db $FE,$C3,$0C,$0A,$28
db $FB,$C3,$FC,$08,$28

SamusOam_A58E:
dw 2
db $F9,$C3,$FE,$08,$28
db $F9,$C3,$0E,$0A,$28

SamusOam_A59A:
dw 2
db $F8,$C3,$00,$08,$E8
db $F8,$C3,$10,$0A,$E8

SamusOam_A5A6:
dw 2
db $F9,$C3,$0E,$0A,$E8
db $F9,$C3,$FE,$08,$E8

SamusOam_A5B2:
dw 2
db $F8,$C3,$0E,$0A,$E8
db $F8,$C3,$FE,$08,$E8

SamusOam_A5BE:
dw 2
db $F2,$C3,$0B,$0A,$E8
db $F6,$C3,$FB,$08,$E8

SamusOam_A5CA:
dw 2
db $F0,$C1,$06,$0A,$E8
db $F4,$C3,$FA,$08,$E8

SamusOam_A5D6:
dw 2
db $E4,$C1,$03,$0A,$E8
db $F4,$C3,$FC,$08,$E8

SamusOam_A5E2:
dw 2
db $E4,$C1,$FA,$0A,$E8
db $F4,$C3,$FA,$08,$E8

SamusOam_A5EE:
dw 2
db $E3,$C1,$F9,$0A,$E8
db $F3,$C3,$F9,$08,$E8

SamusOam_A5FA:
dw 2
db $E1,$C1,$F8,$0A,$E8
db $F1,$C3,$F8,$08,$E8

SamusOam_A606:
dw 2
db $E2,$C1,$F7,$0A,$E8
db $F2,$C3,$F7,$08,$E8

SamusOam_A612:
dw 2
db $E2,$C1,$F4,$0A,$E8
db $F2,$C3,$F4,$08,$E8

SamusOam_A61E:
dw 2
db $E8,$C1,$EF,$0A,$E8
db $F8,$C3,$F1,$08,$E8

SamusOam_A62A:
dw 2
db $EF,$C1,$E7,$0A,$E8
db $F5,$C3,$F7,$08,$E8

SamusOam_A636:
dw 2
db $F2,$C3,$E5,$0A,$E8
db $F5,$C3,$F5,$08,$E8

SamusOam_A642:
dw 2
db $F2,$C3,$E4,$0A,$E8
db $F5,$C3,$F4,$08,$E8

SamusOam_A64E:
dw 2
db $F7,$C3,$F2,$08,$E8
db $F7,$C3,$E2,$0A,$E8

SamusOam_A65A:
dw 3
db $FA,$C3,$FB,$04,$E8
db $F8,$C3,$00,$02,$68
db $F8,$C3,$10,$00,$68

SamusOam_A66B:
dw 3
db $F9,$C3,$FB,$04,$E8
db $FC,$C3,$FF,$02,$68
db $FC,$C3,$0F,$00,$68

SamusOam_A67C:
dw 3
db $FC,$C3,$FD,$04,$E8
db $FD,$C3,$FE,$02,$68
db $05,$C2,$0E,$00,$68

SamusOam_A68D:
dw 3
db $FC,$C3,$FC,$04,$E8
db $FE,$C3,$FF,$02,$68
db $06,$C2,$07,$00,$68

SamusOam_A69E:
dw 3
db $FB,$C3,$FE,$04,$E8
db $FE,$C3,$FE,$02,$68
db $07,$C2,$05,$00,$68

SamusOam_A6AF:
dw 3
db $FC,$C3,$FF,$04,$E8
db $FF,$C3,$FE,$02,$68
db $0F,$C2,$04,$00,$68

SamusOam_A6C0:
dw 3
db $FD,$C3,$FF,$04,$E8
db $00,$C2,$FB,$02,$68
db $10,$C2,$01,$00,$68

SamusOam_A6D1:
dw 3
db $FD,$C3,$F7,$04,$E8
db $00,$C2,$FA,$02,$68
db $10,$C2,$FA,$00,$68

SamusOam_A6E2:
dw 3
db $FD,$C3,$F6,$04,$E8
db $00,$C2,$F8,$02,$68
db $10,$C2,$F8,$00,$68

SamusOam_A6F3:
dw 3
db $FC,$C3,$F6,$04,$E8
db $00,$C2,$F6,$02,$68
db $10,$C2,$F6,$00,$68

SamusOam_A704:
dw 3
db $FD,$C3,$F8,$04,$E8
db $FF,$C3,$F6,$02,$68
db $0F,$C2,$EF,$00,$68

SamusOam_A715:
dw 3
db $FC,$C3,$F8,$04,$E8
db $00,$C2,$F7,$02,$68
db $09,$C2,$EF,$00,$68

SamusOam_A726:
dw 3
db $FB,$C3,$F6,$04,$E8
db $FF,$C3,$F3,$02,$68
db $06,$C2,$EA,$00,$68

SamusOam_A737:
dw 3
db $FA,$C3,$F3,$04,$E8
db $FE,$C3,$F2,$02,$68
db $04,$C2,$E2,$00,$68

SamusOam_A748:
dw 3
db $F8,$C3,$F4,$04,$E8
db $FB,$C3,$F2,$02,$68
db $FF,$C3,$E2,$00,$68

SamusOam_A759:
dw 3
db $F9,$C3,$F5,$04,$E8
db $FB,$C3,$F1,$02,$68
db $FB,$C3,$E1,$00,$68

SamusOam_A76A:
dw 3
db $F6,$C3,$F5,$04,$28
db $F8,$C3,$E0,$00,$A8
db $F8,$C3,$F0,$02,$A8

SamusOam_A77B:
dw 3
db $F7,$C3,$F5,$04,$28
db $F4,$C3,$F1,$02,$A8
db $F4,$C3,$E1,$00,$A8

SamusOam_A78C:
dw 3
db $F4,$C3,$F5,$04,$28
db $F3,$C3,$F2,$02,$A8
db $EB,$C3,$E2,$00,$A8

SamusOam_A79D:
dw 3
db $F4,$C3,$F4,$04,$28
db $F2,$C3,$F1,$02,$A8
db $EA,$C3,$E9,$00,$A8

SamusOam_A7AE:
dw 3
db $F5,$C3,$F2,$04,$28
db $F2,$C3,$F2,$02,$A8
db $E9,$C3,$EB,$00,$A8

SamusOam_A7BF:
dw 3
db $F4,$C3,$F1,$04,$28
db $F1,$C3,$F2,$02,$A8
db $E1,$C3,$EC,$00,$A8

SamusOam_A7D0:
dw 3
db $F3,$C3,$F1,$04,$28
db $F0,$C3,$F5,$02,$A8
db $E0,$C3,$EF,$00,$A8

SamusOam_A7E1:
dw 3
db $F3,$C3,$F9,$04,$28
db $F0,$C3,$F6,$02,$A8
db $E0,$C3,$F6,$00,$A8

SamusOam_A7F2:
dw 3
db $F3,$C3,$FA,$04,$28
db $F0,$C3,$F8,$02,$A8
db $E0,$C3,$F8,$00,$A8

SamusOam_A803:
dw 3
db $F4,$C3,$FA,$04,$28
db $F0,$C3,$FA,$02,$A8
db $E0,$C3,$FA,$00,$A8

SamusOam_A814:
dw 3
db $F3,$C3,$F8,$04,$28
db $F1,$C3,$FA,$02,$A8
db $E1,$C3,$01,$00,$A8

SamusOam_A825:
dw 3
db $F4,$C3,$F8,$04,$28
db $F0,$C3,$F9,$02,$A8
db $E7,$C3,$01,$00,$A8

SamusOam_A836:
dw 3
db $F5,$C3,$FA,$04,$28
db $F1,$C3,$FD,$02,$A8
db $EA,$C3,$06,$00,$A8

SamusOam_A847:
dw 3
db $F6,$C3,$FD,$04,$28
db $F2,$C3,$FE,$02,$A8
db $EC,$C3,$0E,$00,$A8

SamusOam_A858:
dw 3
db $F8,$C3,$FC,$04,$28
db $F5,$C3,$FE,$02,$A8
db $F1,$C3,$0E,$00,$A8

SamusOam_A869:
dw 3
db $F7,$C3,$FB,$04,$28
db $F5,$C3,$FF,$02,$A8
db $F5,$C3,$0F,$00,$A8

SamusOam_A87A:
dw 2
db $F7,$C3,$FF,$08,$28
db $F7,$C3,$0F,$0A,$28

SamusOam_A886:
dw 2
db $F8,$C3,$E0,$0A,$68
db $F8,$C3,$F0,$08,$68

SamusOam_A892:
dw 2
db $F9,$C3,$E2,$0A,$68
db $F9,$C3,$F2,$08,$68

SamusOam_A89E:
dw 2
db $F8,$C3,$E2,$0A,$68
db $F8,$C3,$F2,$08,$68

SamusOam_A8AA:
dw 2
db $F2,$C3,$E5,$0A,$68
db $F6,$C3,$F5,$08,$68

SamusOam_A8B6:
dw 2
db $F0,$C1,$EA,$0A,$68
db $F4,$C3,$F6,$08,$68

SamusOam_A8C2:
dw 2
db $E4,$C1,$ED,$0A,$68
db $F4,$C3,$F4,$08,$68

SamusOam_A8CE:
dw 2
db $E4,$C1,$F7,$0A,$68
db $F4,$C3,$F7,$08,$68

SamusOam_A8DA:
dw 2
db $E3,$C1,$F7,$0A,$68
db $F3,$C3,$F7,$08,$68

SamusOam_A8E6:
dw 2
db $E1,$C1,$F8,$0A,$68
db $F1,$C3,$F8,$08,$68

SamusOam_A8F2:
dw 2
db $E2,$C1,$F9,$0A,$68
db $F2,$C3,$F9,$08,$68

SamusOam_A8FE:
dw 2
db $E2,$C1,$FC,$0A,$68
db $F2,$C3,$FC,$08,$68

SamusOam_A90A:
dw 2
db $E8,$C1,$01,$0A,$68
db $F8,$C3,$FF,$08,$68

SamusOam_A916:
dw 2
db $EF,$C1,$09,$0A,$68
db $F5,$C3,$F9,$08,$68

SamusOam_A922:
dw 2
db $F2,$C3,$0B,$0A,$68
db $F5,$C3,$FB,$08,$68

SamusOam_A92E:
dw 2
db $F2,$C3,$0C,$0A,$68
db $F5,$C3,$FC,$08,$68

SamusOam_A93A:
dw 2
db $F7,$C3,$FE,$08,$68
db $F7,$C3,$0E,$0A,$68

SamusOam_A946:
dw 2
db $F8,$C3,$00,$08,$A8
db $F8,$C3,$10,$0A,$A8

SamusOam_A952:
dw 2
db $F7,$C3,$0E,$0A,$A8
db $F7,$C3,$FE,$08,$A8

SamusOam_A95E:
dw 2
db $F8,$C3,$0E,$0A,$A8
db $F8,$C3,$FE,$08,$A8

SamusOam_A96A:
dw 2
db $FE,$C3,$0B,$0A,$A8
db $FA,$C3,$FB,$08,$A8

SamusOam_A976:
dw 2
db $00,$C0,$06,$0A,$A8
db $FC,$C3,$FA,$08,$A8

SamusOam_A982:
dw 2
db $0C,$C0,$03,$0A,$A8
db $FC,$C3,$FC,$08,$A8

SamusOam_A98E:
dw 2
db $0C,$C0,$FA,$0A,$A8
db $FC,$C3,$FA,$08,$A8

SamusOam_A99A:
dw 2
db $0D,$C0,$F9,$0A,$A8
db $FD,$C3,$F9,$08,$A8

SamusOam_A9A6:
dw 2
db $0F,$C0,$F8,$0A,$A8
db $FF,$C3,$F8,$08,$A8

SamusOam_A9B2:
dw 2
db $0E,$C0,$F7,$0A,$A8
db $FE,$C3,$F7,$08,$A8

SamusOam_A9BE:
dw 2
db $0E,$C0,$F4,$0A,$A8
db $FE,$C3,$F4,$08,$A8

SamusOam_A9CA:
dw 2
db $08,$C0,$EF,$0A,$A8
db $F8,$C3,$F1,$08,$A8

SamusOam_A9D6:
dw 2
db $01,$C0,$E7,$0A,$A8
db $FB,$C3,$F7,$08,$A8

SamusOam_A9E2:
dw 2
db $FE,$C3,$E5,$0A,$A8
db $FB,$C3,$F5,$08,$A8

SamusOam_A9EE:
dw 2
db $FE,$C3,$E4,$0A,$A8
db $FB,$C3,$F4,$08,$A8

SamusOam_A9FA:
dw 2
db $F9,$C3,$F2,$08,$A8
db $F9,$C3,$E2,$0A,$A8

SamusOam_AA06:
dw 2
db $FB,$C3,$F1,$00,$28
db $0B,$C0,$F1,$02,$28

SamusOam_AA12:
dw 2
db $02,$C0,$01,$08,$28
db $06,$00,$11,$0A,$28

SamusOam_AA1E:
dw 2
db $EE,$C3,$F1,$00,$28
db $FE,$C3,$F1,$02,$28

SamusOam_AA2A:
dw 2
db $EE,$C3,$01,$08,$28
db $F4,$01,$11,$0A,$28

SamusOam_AA36:
dw 3
db $FD,$01,$FE,$02,$28
db $05,$00,$FE,$03,$28
db $F8,$C3,$F5,$00,$28

SamusOam_AA47:
dw 2
db $FD,$C3,$FB,$02,$68
db $F8,$C3,$F5,$00,$68

SamusOam_AA53:
dw 2
db $FC,$C3,$FD,$02,$68
db $F8,$C3,$F7,$00,$68

SamusOam_AA5F:
dw 2
db $FC,$C3,$01,$02,$68
db $F8,$C3,$F9,$00,$68

SamusOam_AA6B:
dw 4
db $F9,$C3,$09,$08,$68
db $F9,$01,$01,$0B,$68
db $01,$00,$01,$0A,$68
db $F1,$01,$11,$0C,$68

SamusOam_AA81:
dw 4
db $F8,$C3,$01,$08,$68
db $F8,$01,$11,$0B,$68
db $00,$00,$11,$0A,$68
db $F8,$01,$19,$0C,$68

SamusOam_AA97:
dw 3
db $F8,$C3,$03,$08,$68
db $F8,$01,$13,$0B,$68
db $00,$00,$13,$0A,$68

SamusOam_AAA8:
dw 2
db $F8,$C3,$05,$08,$68
db $F8,$01,$15,$0A,$68

SamusOam_AAB4:
dw 2
db $F0,$01,$FD,$13,$28
db $F8,$C3,$F5,$04,$28

SamusOam_AAC0:
dw 2
db $F8,$C3,$F5,$00,$28
db $F3,$C1,$F9,$02,$28

SamusOam_AACC:
dw 2
db $F8,$C3,$F7,$00,$28
db $F4,$C1,$FB,$02,$28

SamusOam_AAD8:
dw 2
db $F8,$C3,$F9,$00,$28
db $F4,$C1,$FF,$02,$28

SamusOam_AAE4:
dw 4
db $F7,$C3,$09,$08,$28
db $FF,$01,$01,$0B,$28
db $F7,$01,$01,$0A,$28
db $07,$00,$11,$0C,$28

SamusOam_AAFA:
dw 4
db $F8,$C3,$01,$08,$28
db $00,$00,$11,$0B,$28
db $F8,$01,$11,$0A,$28
db $00,$00,$19,$0C,$28

SamusOam_AB10:
dw 3
db $F8,$C3,$03,$08,$28
db $00,$00,$13,$0B,$28
db $F8,$01,$13,$0A,$28

SamusOam_AB21:
dw 2
db $F8,$C3,$05,$08,$28
db $00,$00,$15,$0A,$28

SamusOam_AB2D:
dw 4
db $FA,$C3,$FC,$00,$28
db $FC,$C3,$F0,$03,$28
db $F4,$01,$F0,$02,$28
db $F4,$01,$F8,$12,$28

SamusOam_AB43:
dw 3
db $FA,$C3,$FC,$00,$28
db $FC,$C3,$F0,$03,$28
db $F4,$01,$F0,$02,$28

SamusOam_AB54:
dw 2
db $FC,$C3,$00,$08,$68
db $EC,$C1,$00,$0A,$68

SamusOam_AB60:
dw 3
db $FC,$C3,$00,$08,$68
db $EC,$C1,$00,$0A,$68
db $E4,$01,$02,$0C,$68

SamusOam_AB71:
dw 4
db $F6,$C3,$FC,$00,$28
db $F4,$C3,$F0,$02,$28
db $04,$00,$F0,$04,$28
db $04,$00,$F8,$14,$28

SamusOam_AB87:
dw 3
db $F6,$C3,$FC,$00,$28
db $F4,$C3,$F0,$02,$28
db $04,$00,$F0,$04,$28

SamusOam_AB98:
dw 2
db $F4,$C3,$00,$08,$28
db $04,$C0,$00,$0A,$28

SamusOam_ABA4:
dw 3
db $F4,$C3,$00,$08,$28
db $04,$C0,$00,$0A,$28
db $14,$00,$02,$0C,$28

SamusOam_ABB5:
dw 4
db $F6,$C3,$F5,$00,$28
db $F8,$C3,$F0,$02,$68
db $F9,$C3,$FC,$08,$68
db $F9,$C3,$0C,$0A,$68

SamusOam_ABCB:
dw 4
db $F5,$C3,$F4,$00,$28
db $F8,$C3,$F0,$02,$68
db $F9,$C3,$FE,$08,$68
db $F9,$C3,$0E,$0A,$68

SamusOam_ABE1:
dw 0

SamusOam_ABE3:
dw 0

SamusOam_ABE5:
dw 4
db $FB,$C3,$F5,$04,$28
db $F8,$C3,$F0,$02,$28
db $F7,$C3,$FC,$08,$28
db $F7,$C3,$0C,$0A,$28

SamusOam_ABFB:
dw 4
db $FB,$C3,$F4,$04,$28
db $F8,$C3,$F0,$02,$28
db $F7,$C3,$FE,$08,$28
db $F7,$C3,$0E,$0A,$28

SamusOam_AC11:
dw 7
db $F8,$C3,$EC,$00,$6C
db $F8,$01,$0C,$02,$6C
db $00,$00,$0C,$03,$6C
db $F8,$01,$04,$04,$6C
db $00,$00,$04,$05,$6C
db $F8,$01,$FC,$06,$6C
db $00,$00,$FC,$07,$6C

SamusOam_AC36:
dw 7
db $F8,$C3,$EB,$00,$6C
db $F8,$01,$0B,$02,$6C
db $00,$00,$0B,$03,$6C
db $F8,$01,$03,$04,$6C
db $00,$00,$03,$05,$6C
db $F8,$01,$FB,$06,$6C
db $00,$00,$FB,$07,$6C

SamusOam_AC5B:
dw 7
db $F8,$C3,$EA,$00,$6C
db $F8,$01,$0A,$02,$6C
db $00,$00,$0A,$03,$6C
db $F8,$01,$02,$04,$6C
db $00,$00,$02,$05,$6C
db $F8,$01,$FA,$06,$6C
db $00,$00,$FA,$07,$6C

SamusOam_AC80:
dw 4
db $00,$C2,$00,$08,$FC
db $F0,$C3,$00,$08,$BC
db $00,$C2,$F0,$08,$7C
db $F0,$C3,$F0,$08,$3C

SamusOam_AC96:
dw 16
db $00,$C2,$00,$08,$FC
db $10,$C2,$00,$0A,$FC
db $00,$C2,$10,$0C,$FC
db $10,$C2,$10,$0E,$FC
db $F0,$C3,$00,$08,$BC
db $E0,$C3,$00,$0A,$BC
db $F0,$C3,$10,$0C,$BC
db $E0,$C3,$10,$0E,$BC
db $00,$C2,$F0,$08,$7C
db $10,$C2,$F0,$0A,$7C
db $00,$C2,$E0,$0C,$7C
db $10,$C2,$E0,$0E,$7C
db $E0,$C3,$E0,$0E,$3C
db $E0,$C3,$F0,$0A,$3C
db $F0,$C3,$E0,$0C,$3C
db $F0,$C3,$F0,$08,$3C

SamusOam_ACE8:
dw 16
db $00,$C2,$00,$08,$FC
db $10,$C2,$00,$0A,$FC
db $00,$C2,$10,$0C,$FC
db $10,$C2,$10,$0E,$FC
db $F0,$C3,$00,$08,$BC
db $E0,$C3,$00,$0A,$BC
db $F0,$C3,$10,$0C,$BC
db $E0,$C3,$10,$0E,$BC
db $00,$C2,$F0,$08,$7C
db $10,$C2,$F0,$0A,$7C
db $00,$C2,$E0,$0C,$7C
db $10,$C2,$E0,$0E,$7C
db $F0,$C3,$F0,$08,$3C
db $E0,$C3,$F0,$0A,$3C
db $F0,$C3,$E0,$0C,$3C
db $E0,$C3,$E0,$0E,$3C

SamusOam_AD3A:
dw 7
db $F8,$C3,$EC,$00,$2C
db $00,$00,$0C,$02,$2C
db $F8,$01,$0C,$03,$2C
db $00,$00,$04,$04,$2C
db $F8,$01,$04,$05,$2C
db $00,$00,$FC,$06,$2C
db $F8,$01,$FC,$07,$2C

SamusOam_AD5F:
dw 7
db $F8,$C3,$EB,$00,$2C
db $00,$00,$0B,$02,$2C
db $F8,$01,$0B,$03,$2C
db $00,$00,$03,$04,$2C
db $F8,$01,$03,$05,$2C
db $00,$00,$FB,$06,$2C
db $F8,$01,$FB,$07,$2C

SamusOam_AD84:
dw 7
db $F8,$C3,$EA,$00,$2C
db $00,$00,$0A,$02,$2C
db $F8,$01,$0A,$03,$2C
db $00,$00,$02,$04,$2C
db $F8,$01,$02,$05,$2C
db $00,$00,$FA,$06,$2C
db $F8,$01,$FA,$07,$2C

SamusOam_ADA9:
dw 2
db $F8,$C3,$F4,$02,$28
db $08,$00,$FC,$14,$28

SamusOam_ADB5:
dw 2
db $F6,$C3,$F9,$08,$68
db $F6,$C3,$09,$0A,$68

SamusOam_ADC1:
dw 2
db $F6,$C3,$F2,$00,$28
db $F3,$01,$FE,$04,$28

SamusOam_ADCD:
dw 2
db $F8,$C3,$F8,$08,$28
db $F8,$C3,$08,$0A,$28

SamusOam_ADD9:
dw 7
db $F5,$C3,$F5,$04,$28
db $F9,$01,$ED,$02,$28
db $ED,$01,$FD,$13,$28
db $ED,$C1,$F9,$06,$68
db $F3,$C3,$06,$08,$28
db $03,$C2,$06,$0A,$28
db $FB,$C3,$F6,$0C,$28

SamusOam_ADFE:
dw 4
db $F8,$C3,$F8,$00,$28
db $F8,$C3,$08,$04,$28
db $F8,$03,$F0,$06,$28
db $00,$00,$F0,$07,$28

SamusOam_AE14:
dw 7
db $FC,$C3,$F5,$00,$28
db $00,$00,$ED,$02,$68
db $0C,$00,$FD,$12,$28
db $04,$C0,$F9,$06,$28
db $FE,$C3,$06,$08,$68
db $EE,$C3,$06,$0A,$68
db $F6,$C3,$F6,$0C,$68

SamusOam_AE39:
dw 4
db $F8,$C3,$F8,$02,$28
db $F8,$C3,$08,$04,$68
db $F8,$03,$F0,$07,$68
db $00,$00,$F0,$06,$68

SamusOam_AE4F:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$02,$28
db $F4,$01,$00,$12,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AE7E:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$03,$28
db $F4,$01,$00,$13,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AEAD:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$04,$28
db $F4,$01,$00,$14,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AEDC:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$05,$28
db $F4,$01,$00,$15,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AF0B:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$06,$28
db $F4,$01,$00,$16,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AF3A:
dw 9
db $F4,$01,$F0,$0B,$28
db $FC,$01,$F0,$0C,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$07,$28
db $F4,$01,$00,$17,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AF69:
dw 9
db $F4,$01,$F0,$0E,$28
db $FC,$01,$F0,$0F,$28
db $04,$00,$F0,$0D,$28
db $FC,$81,$F8,$00,$28
db $F4,$01,$F8,$02,$28
db $F4,$01,$00,$12,$28
db $FC,$81,$08,$09,$28
db $F4,$01,$08,$08,$28
db $F4,$01,$10,$18,$28

SamusOam_AF98:
dw 2
db $F9,$C3,$F3,$00,$28
db $FD,$C3,$E3,$02,$28

SamusOam_AFA4:
dw 2
db $F8,$C3,$F3,$04,$28
db $F4,$C3,$E3,$06,$28

SamusOam_AFB0:
dw 2
db $FB,$C3,$F3,$00,$28
db $0B,$C0,$F3,$02,$28

SamusOam_AFBC:
dw 2
db $F6,$C3,$F3,$06,$28
db $E6,$C3,$F3,$04,$28

SamusOam_AFC8:
dw 2
db $FA,$C3,$F5,$00,$28
db $02,$C0,$FD,$02,$28

SamusOam_AFD4:
dw 2
db $F7,$C3,$F2,$06,$28
db $EF,$C3,$FA,$04,$28

SamusOam_AFE0:
dw 4
db $FC,$C3,$F8,$00,$28
db $00,$00,$F0,$02,$68
db $0C,$00,$00,$12,$28
db $04,$C0,$FC,$06,$28

SamusOam_AFF6:
dw 2
db $F9,$C3,$04,$08,$68
db $FB,$C3,$F4,$0A,$68

SamusOam_B002:
dw 4
db $F5,$C3,$F8,$04,$28
db $F9,$01,$F0,$02,$28
db $ED,$01,$00,$13,$28
db $ED,$C1,$FC,$06,$68

SamusOam_B018:
dw 2
db $F8,$C3,$04,$08,$28
db $F6,$C3,$F4,$0A,$28

SamusOam_B024:
dw 3
db $F9,$C3,$F9,$00,$28
db $F6,$C3,$F5,$02,$68
db $FA,$C3,$F4,$04,$68

SamusOam_B035:
dw 3
db $F9,$C3,$FC,$00,$28
db $F6,$C3,$F8,$02,$68
db $FA,$C3,$F5,$04,$68

SamusOam_B046:
dw 3
db $F8,$C3,$FB,$00,$28
db $F8,$C3,$F9,$02,$68
db $FA,$C3,$F5,$04,$68

SamusOam_B057:
dw 2
db $FA,$C3,$FD,$08,$68
db $EA,$C1,$FD,$0A,$68

SamusOam_B063:
dw 5
db $FF,$01,$FD,$01,$28
db $FF,$01,$05,$11,$28
db $FA,$C3,$F9,$02,$28
db $01,$00,$FF,$00,$68
db $01,$00,$07,$10,$68

SamusOam_B07E:
dw 2
db $06,$C2,$03,$08,$68
db $F6,$C3,$03,$0A,$68

SamusOam_B08A:
dw 2
db $FE,$C3,$F9,$02,$68
db $F8,$C3,$F3,$00,$68

SamusOam_B096:
dw 2
db $F8,$C3,$03,$08,$68
db $FA,$C3,$F3,$0A,$68

SamusOam_B0A2:
dw 2
db $FA,$C3,$F5,$02,$28
db $F6,$C3,$F4,$04,$28

SamusOam_B0AE:
dw 2
db $FA,$C3,$F8,$02,$28
db $F6,$C3,$F5,$04,$28

SamusOam_B0BA:
dw 2
db $F8,$C3,$F9,$02,$28
db $F6,$C3,$F5,$04,$28

SamusOam_B0C6:
dw 2
db $F6,$C3,$FD,$08,$28
db $06,$C0,$FD,$0A,$28

SamusOam_B0D2:
dw 5
db $F9,$01,$FD,$01,$68
db $F9,$01,$05,$11,$68
db $F6,$C3,$F9,$02,$68
db $F7,$01,$FF,$00,$28
db $F7,$01,$07,$10,$28

SamusOam_B0ED:
dw 2
db $EA,$C3,$03,$08,$28
db $FA,$C3,$03,$0A,$28

SamusOam_B0F9:
dw 3
db $F8,$C3,$F3,$00,$28
db $F0,$01,$03,$04,$28
db $F8,$01,$03,$05,$28

SamusOam_B10A:
dw 2
db $F8,$C3,$03,$08,$28
db $F6,$C3,$F3,$0A,$28

SamusOam_B116:
dw 6
db $F9,$C3,$F9,$00,$28
db $F6,$C3,$F5,$02,$68
db $02,$00,$F4,$06,$68
db $02,$00,$FC,$16,$68
db $FA,$01,$F4,$05,$68
db $FA,$01,$FC,$15,$68

SamusOam_B136:
dw 6
db $F9,$C3,$FC,$00,$28
db $F6,$C3,$F8,$02,$68
db $02,$00,$F5,$06,$68
db $02,$00,$FD,$16,$68
db $FA,$01,$F6,$05,$68
db $FA,$01,$FE,$15,$68

SamusOam_B156:
dw 6
db $F8,$C3,$FB,$00,$28
db $F8,$C3,$F9,$02,$68
db $02,$00,$F5,$06,$68
db $02,$00,$FD,$16,$68
db $FA,$01,$F5,$05,$68
db $FA,$01,$FD,$15,$68

SamusOam_B176:
dw 5
db $FA,$C3,$F5,$02,$28
db $F6,$01,$F4,$06,$28
db $F6,$01,$FC,$16,$28
db $FE,$01,$F4,$05,$28
db $FE,$01,$FC,$15,$28

SamusOam_B191:
dw 5
db $FA,$C3,$F8,$02,$28
db $F6,$01,$F5,$06,$28
db $F6,$01,$FD,$16,$28
db $FE,$01,$F6,$05,$28
db $FE,$01,$FE,$15,$28

SamusOam_B1AC:
dw 5
db $F8,$C3,$F9,$02,$28
db $F6,$01,$F5,$06,$28
db $F6,$01,$FD,$16,$28
db $FE,$01,$F5,$05,$28
db $FE,$01,$FD,$15,$28


SamusOam_Right_Skidding_Frame0:
dw $0008
%spritemapEntry(1, $1FA, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8, $DE+$16, 0, 1, 2, 4, $02)
%spritemapEntry(1, $1F8, $E8+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $F8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F8, $F8+$16, 0, 1, 2, 4, $0C)
%spritemapEntry(0, $008, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $008, $F8+$16, 0, 1, 2, 4, $1A)
%spritemapEntry(1, $001, $DD+$16, 0, 0, 2, 4, $04)

SamusOam_Left_Skidding_Frame0:
dw $0008
%spritemapEntry(1, $1F7+1, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $DE+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F8+1, $E8+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8+1, $F8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $000+1, $F8+$16, 0, 0, 2, 4, $0C)
%spritemapEntry(0, $1F0+1, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F0+1, $F8+$16, 0, 0, 2, 4, $1A)
%spritemapEntry(1, $1F0+1, $DE+$16, 0, 0, 2, 4, $04)


SamusOam_Right_UsingAnElevator_Frame0:
dw $0006
%spritemapEntry(0, $1F7, $E3+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F7, $EB+$18, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F8, $F0+$18, 0, 1, 2, 4, $08)
%spritemapEntry(1, $1F8, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F8, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(0, $000, $E8+$18, 0, 0, 2, 4, $04)

SamusOam_Left_UsingAnElevator_Frame0:
dw $0004
%spritemapEntry(1, $1F8, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F8, $E8+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $000, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(1, $1F8, $F0+$18, 0, 0, 2, 4, $08)

SamusOam_UsingAnElevator_Frame2:
dw $0009
%spritemapEntry(1, $1F5, $F0+$18, 0, 0, 2, 4, $08)
%spritemapEntry(0, $005, $F0+$18, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $005, $F8+$18, 0, 0, 2, 4, $1A)
%spritemapEntry(1, $1F5, $D8+$18, 0, 0, 2, 4, $00)
%spritemapEntry(0, $005, $D8+$18, 0, 0, 2, 4, $02)
%spritemapEntry(0, $005, $E0+$18, 0, 0, 2, 4, $12)
%spritemapEntry(0, $1F5, $E8+$18, 0, 0, 2, 4, $03)
%spritemapEntry(0, $1FD, $E8+$18, 0, 0, 2, 4, $04)
%spritemapEntry(0, $005, $E8+$18, 0, 0, 2, 4, $05)


SamusOam_Top_Right_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $E3+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FB, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1FF, $D7+$16, 0, 1, 2, 4, $04)

SamusOam_Top_Left_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F4+1, $DF+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1F4+1, $D7+$16, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1FC+1, $D7+$16, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1EE+1, $E3+$16, 0, 0, 2, 4, $03)

SamusOam_Top_Right_DiagonalUp_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $D9+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FA, $DA+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $00A, $E2+$16, 0, 0, 2, 4, $14)

SamusOam_Top_Left_DiagonalUp_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F6+1, $DA+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1EE+1, $DA+$16, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1EE+1, $E2+$16, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1ED+1, $D9+$16, 0, 0, 2, 4, $03)

SamusOam_Top_Right_DiagonalDown_Shooting_Frame0:
dw 3
%spritemapEntry(1, $002, $E5+$16, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F9, $DC+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $001, $EC+$16, 0, 0, 2, 4, $04)

SamusOam_Top_Left_DiagonalDown_Shooting_Frame0:
dw 4
%spritemapEntry(1, $1F7+1, $DB+$16, 0, 0, 2, 4, $00)
%spritemapEntry(0, $1EF+1, $EB+$16, 0, 0, 2, 4, $04)
%spritemapEntry(0, $1F7+1, $EB+$16, 0, 0, 2, 4, $05)
%spritemapEntry(1, $1EE+1, $E4+$16, 0, 0, 2, 4, $02)

SamusOam_Bottom_Right_DiagonalDown_Standing_Frame0:
dw 5
%spritemapEntry(1, $1F6, $E8+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FE, $F8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F6, $F8+$16, 0, 1, 2, 4, $0C)
%spritemapEntry(0, $006, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $006, $F8+$16, 0, 1, 2, 4, $1A)

SamusOam_Bottom_Right_DiagonalDown_Standing_Frame1:
dw 5
%spritemapEntry(1, $1F6, $F0+$16, 0, 1, 2, 4, $08)
%spritemapEntry(0, $006, $F0+$16, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $006, $F8+$16, 0, 1, 2, 4, $1A)
%spritemapEntry(0, $1FE, $E8+$16, 0, 1, 2, 4, $0B)
%spritemapEntry(0, $1F6, $E8+$16, 0, 1, 2, 4, $0C)

SamusOam_Bottom_Left_DiagonalDown_Standing_Frame0:
dw 5
%spritemapEntry(1, $1FA+1, $E8+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FA+1, $F8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $002+1, $F8+$16, 0, 0, 2, 4, $0C)
%spritemapEntry(0, $1F2+1, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F2+1, $F8+$16, 0, 0, 2, 4, $1A)

SamusOam_Bottom_Left_DiagonalDown_Standing_Frame1:
dw 5
%spritemapEntry(1, $1FA+1, $F0+$16, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F2+1, $F0+$16, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F2+1, $F8+$16, 0, 0, 2, 4, $1A)
%spritemapEntry(0, $1FA+1, $E8+$16, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $002+1, $E8+$16, 0, 0, 2, 4, $0C)


SamusOam_Bottom_Right_MidAir_Frame0:
dw 4
%spritemapEntry(1, -8, -26+22, 0, 1, 2, 4, $08)
%spritemapEntry(0, -8+8, -10+22, 0, 1, 2, 4, $0A)
%spritemapEntry(0, -8, -10+22, 0, 1, 2, 4, $0B)
%spritemapEntry(0, -8, -2+22, 0, 1, 2, 4, $0C)

SamusOam_Bottom_Right_MidAir_Frame1:
dw 3
%spritemapEntry(1, -8, -24+22, 0, 1, 2, 4, $08)
%spritemapEntry(0, -8+8, -8+22, 0, 1, 2, 4, $0A)
%spritemapEntry(0, -8, -8+22, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_MidAir_Frame2:
dw 2
%spritemapEntry(1, -8, -20+22, 0, 1, 2, 4, $08)
%spritemapEntry(0, -8, -4+22, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_MidAir_Frame3:
dw 3
%spritemapEntry(1, -8, -23+22, 0, 1, 2, 4, $08)
%spritemapEntry(0, -8+8, -7+22, 0, 1, 2, 4, $0A)
%spritemapEntry(0, -8, -7+22, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_MidAir_Frame4:
dw 2
%spritemapEntry(1, -9, -25+22, 0, 1, 2, 4, $08)
%spritemapEntry(1, -9, -9+22, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_MidAir_Frame5:
dw 2
%spritemapEntry(1, -8, -25+22, 0, 1, 2, 4, $08)
%spritemapEntry(1, -8, -9+22, 0, 1, 2, 4, $0A)

SamusOam_Top_Right_Forward_MidAir_Frame0:
dw 2
%spritemapEntry(0, 1, -44+22, 0, 1, 2, 4, $02)
%spritemapEntry(1, -6, -36+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Forward_MidAir_Frame1:
dw 2
%spritemapEntry(0, 1, -43+22, 0, 1, 2, 4, $02)
%spritemapEntry(1, -6, -35+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Forward_MidAir_Frame2:
dw 2
%spritemapEntry(0, 1, -38+22, 0, 1, 2, 4, $02)
%spritemapEntry(1, -6, -30+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Forward_MidAir_Frame3:
dw 2
%spritemapEntry(0, 1, -41+22, 0, 1, 2, 4, $02)
%spritemapEntry(1, -6, -33+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame0:
dw 2
%spritemapEntry(1, -6, -39+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -6+8, -39+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame1:
dw 2
%spritemapEntry(1, -6, -37+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -6+8, -37+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame2:
dw 2
%spritemapEntry(1, -6, -31+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -6+8, -31+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame3:
dw 2
%spritemapEntry(1, -6, -35+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -6+8, -35+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame4:
dw 2
%spritemapEntry(1, -6, -38+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -6+8, -38+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalUp_MidAir_Frame5:
dw 2
%spritemapEntry(1, -7, -40+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -7+8, -40+22, 0, 0, 2, 4, $01)

SamusOam_Top_Right_DiagonalDown_MidAir_Frame0:
dw 2
%spritemapEntry(1, -7, -40+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, 1, -24+22, 0, 0, 2, 4, $02)

SamusOam_Top_Right_DiagonalDown_MidAir_Frame2:
dw 2
%spritemapEntry(1, -8, -35+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, 0, -19+22, 0, 0, 2, 4, $02)

SamusOam_Top_Right_DiagonalDown_MidAir_Frame3:
dw 2
%spritemapEntry(1, -7, -38+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, 1, -22+22, 0, 0, 2, 4, $02)

SamusOam_Top_Right_DiagonalDown_MidAir_Frame4:
dw 2
%spritemapEntry(1, -7, -41+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, 1, -25+22, 0, 0, 2, 4, $02)

SamusOam_Top_Right_DiagonalDown_MidAir_Frame5:
dw 2
%spritemapEntry(1, -7, -39+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, 1, -23+22, 0, 0, 2, 4, $02)

SamusOam_Top_Right_Up_MidAir_Frame0:
dw 1
%spritemapEntry(1, -7, -40+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Up_MidAir_Frame1:
dw 1
%spritemapEntry(1, -7, -37+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Up_MidAir_Frame2:
dw 1
%spritemapEntry(1, -7, -33+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Up_MidAir_Frame3:
dw 1
%spritemapEntry(1, -7, -36+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Up_MidAir_Frame4:
dw 1
%spritemapEntry(1, -7, -39+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Up_MidAir_Frame5:
dw 1
%spritemapEntry(1, -7, -38+22, 0, 0, 2, 4, $00)

SamusOam_Top_Right_Down_MidAir_Frame0:
dw 2
%spritemapEntry(1, -4, -30+22, 0, 0, 2, 4, $00)
%spritemapEntry(1, -4, -14+22, 0, 0, 2, 4, $02)

SamusOam_Bottom_Right_Down_MidAir_Frame0:
dw 2
%spritemapEntry(1, -14, -30+22, 0, 1, 2, 4, $08)
%spritemapEntry(1, -14, -14+22, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_Down_MidAir_Frame1:
dw 2
%spritemapEntry(1, -12, -30+22, 0, 1, 2, 4, $08)
%spritemapEntry(1, -12, -14+22, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Left_MidAir_Frame0:
dw 4
%spritemapEntry(1, -8+1, -26+22, 0, 0, 2, 4, $08)
%spritemapEntry(0, -8+1, -10+22, 0, 0, 2, 4, $0A)
%spritemapEntry(0, -8+8+1, -10+22, 0, 0, 2, 4, $0B)
%spritemapEntry(0, 0+1, -2+22, 0, 0, 2, 4, $0C)

SamusOam_Bottom_Left_MidAir_Frame1:
dw 3
%spritemapEntry(1, -8+1, -24+22, 0, 0, 2, 4, $08)
%spritemapEntry(0, -8+1, -8+22, 0, 0, 2, 4, $0A)
%spritemapEntry(0, -8+8+1, -8+22, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_MidAir_Frame2:
dw 2
%spritemapEntry(1, -8+1, -20+22, 0, 0, 2, 4, $08)
%spritemapEntry(0, 0+1, -4+22, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_MidAir_Frame3:
dw 3
%spritemapEntry(1, -8+1, -23+22, 0, 0, 2, 4, $08)
%spritemapEntry(0, -8+1, -7+22, 0, 0, 2, 4, $0A)
%spritemapEntry(0, -8+8+1, -7+22, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_MidAir_Frame4:
dw 2
%spritemapEntry(1, -7+1, -25+22, 0, 0, 2, 4, $08)
%spritemapEntry(1, -7+1, -9+22, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_MidAir_Frame5:
dw 2
%spritemapEntry(1, -8+1, -25+22, 0, 0, 2, 4, $08)
%spritemapEntry(1, -8+1, -9+22, 0, 0, 2, 4, $0A)

SamusOam_Top_Left_Forward_MidAir_Frame0:
dw 3
%spritemapEntry(1, -10+1, -36+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, -9+1, -44+22, 0, 0, 2, 4, $02)
%spritemapEntry(0, -18+1, -28+22, 0, 0, 2, 4, $03)

SamusOam_Top_Left_Forward_MidAir_Frame1:
dw 3
%spritemapEntry(1, -10+1, -35+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, -9+1, -43+22, 0, 0, 2, 4, $02)
%spritemapEntry(0, -18+1, -27+22, 0, 0, 2, 4, $03)

SamusOam_Top_Left_Forward_MidAir_Frame2:
dw 3
%spritemapEntry(1, -10+1, -30+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, -9+1, -38+22, 0, 0, 2, 4, $02)
%spritemapEntry(0, -18+1, -22+22, 0, 0, 2, 4, $03)

SamusOam_Top_Left_Forward_MidAir_Frame3:
dw 3
%spritemapEntry(1, -10+1, -33+22, 0, 0, 2, 4, $00)
%spritemapEntry(0, -9+1, -41+22, 0, 0, 2, 4, $02)
%spritemapEntry(0, -18+1, -25+22, 0, 0, 2, 4, $03)

SamusOam_Top_Right_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1FC, $D9+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $DF+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1FB, $D8+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame2:
dw $0002
%spritemapEntry(1, $1FA, $D9+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1FB, $D8+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E0+$17, 0, 1, 2, 4, $02)

SamusOam_Bottom_Right_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1F6, $ED+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $FD+$17, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F8, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $EF+$17, 0, 1, 2, 4, $0A)

SamusOam_Bottom_Right_HangingOnLedge_Frame2:
dw $0003
%spritemapEntry(1, $1F8, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $EF+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F8, $EF+$17, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_HangingOnLedge_Frame3:
dw $0003
%spritemapEntry(0, $002, $EF+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1FA, $EF+$17, 0, 1, 2, 4, $0B)
%spritemapEntry(1, $1FA, $F7+$17, 0, 1, 2, 4, $08)

SamusOam_Bottom_Right_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F7, $F7+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $EF+$17, 0, 1, 2, 4, $0A)


SamusOam_Top_Left_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1F6+1, $D9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9+1, $DF+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F6+1, $D9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame2:
dw $0002
%spritemapEntry(1, $1F6+1, $DA+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F6+1, $DA+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E0+$17, 0, 0, 2, 4, $02)

SamusOam_Bottom_Left_HangingOnLedge_Frame0:
dw $0002
%spritemapEntry(1, $1FA+1, $ED+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $FD+$17, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_HangingOnLedge_Frame1:
dw $0002
%spritemapEntry(1, $1F8+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8+1, $EF+$17, 0, 0, 2, 4, $0A)

SamusOam_Bottom_Left_HangingOnLedge_Frame2:
dw $0003
%spritemapEntry(1, $1F8+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F8+1, $EF+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $000+1, $EF+$17, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_HangingOnLedge_Frame3:
dw $0003
%spritemapEntry(0, $1F6+1, $EF+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FE+1, $EF+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(1, $1F6+1, $F7+$17, 0, 0, 2, 4, $08)

SamusOam_Bottom_Left_HangingOnLedge_Frame5:
dw $0002
%spritemapEntry(1, $1F9+1, $F7+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $EF+$17, 0, 0, 2, 4, $0A)


SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame1:
dw $0002
%spritemapEntry(1, $1FA, $E0+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $E1+$17, 0, 1, 2, 4, $02)

SamusOam_Top_Right_PullingYourselfUpFromHanging_Frame2:
dw $0002
%spritemapEntry(1, $1FA, $E2+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F8, $DF+$17, 0, 1, 2, 4, $02)

SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame1:
dw $0003
%spritemapEntry(1, $1F9, $EB+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $201, $FB+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F9, $FB+$17, 0, 1, 2, 4, $0B)

SamusOam_Bottom_Right_PullingYourselfUpFromHanging_Frame2:
dw $0003
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0B)


SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame1:
dw $0002
%spritemapEntry(1, $1F6+1, $E2+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $E1+$17, 0, 0, 2, 4, $02)

SamusOam_Top_Left_PullingYourselfUpFromHanging_Frame2:
dw $0002
%spritemapEntry(1, $1F6+1, $E0+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F8+1, $DF+$17, 0, 0, 2, 4, $02)

SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame1:
dw $0003
%spritemapEntry(1, $1F7+1, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F7+1, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FF+1, $FB+$17, 0, 0, 2, 4, $0B)

SamusOam_Bottom_Left_PullingYourselfUpFromHanging_Frame2:
dw $0003
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201+1, $F8+$17, 0, 0, 2, 4, $0B)


SamusOam_Right_PullingYourselfForwardFromHanging_Frame0:
dw $0006
%spritemapEntry(0, $1FF, $E4+$17, 0, 0, 2, 4, $04)
%spritemapEntry(0, $1FF, $EC+$17, 0, 0, 2, 4, $14)
%spritemapEntry(1, $1FA, $E1+$17, 0, 1, 2, 4, $00)
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FF, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0B)

SamusOam_Right_PullingYourselfForwardFromHanging_Frame1:
dw $0005
%spritemapEntry(1, $1F7, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $000, $E9+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $000, $F1+$17, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F9, $E4+$17, 0, 1, 2, 4, $00)
%spritemapEntry(0, $1F7, $F8+$17, 0, 1, 2, 4, $0A)

SamusOam_Right_PullingYourselfForwardFromHanging_Frame2:
dw $0005
%spritemapEntry(1, $001, $E9+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FB, $E3+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F5, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F5, $F8+$17, 0, 1, 2, 4, $0B)

SamusOam_Right_PullingYourselfForwardFromHanging_Frame3:
dw $0005
%spritemapEntry(1, $001, $E8+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9, $E0+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1F5, $E8+$17, 0, 1, 2, 4, $08)
%spritemapEntry(0, $1FD, $F8+$17, 0, 1, 2, 4, $0A)
%spritemapEntry(0, $1F5, $F8+$17, 0, 1, 2, 4, $0B)


SamusOam_Left_PullingYourselfForwardFromHanging_Frame0:
dw $0008
%spritemapEntry(0, $1F9+1, $E5+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F9+1, $ED+$17, 0, 0, 2, 4, $12)
%spritemapEntry(1, $1F6+1, $E1+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201+1, $F8+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $1F7+1, $E7+$17, 0, 1, 2, 4, $03)
%spritemapEntry(0, $1F7+1, $EF+$17, 0, 1, 2, 4, $13)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame1:
dw $0005
%spritemapEntry(1, $1F9+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(1, $1F7+1, $E4+$17, 0, 0, 2, 4, $00)
%spritemapEntry(0, $001+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1F8+1, $E9+$17, 0, 1, 2, 4, $02)
%spritemapEntry(0, $1F8+1, $F1+$17, 0, 1, 2, 4, $12)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame2:
dw $0006
%spritemapEntry(1, $1F5+1, $E4+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FB+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $203+1, $F8+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(0, $1ED+1, $F4+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $1F5+1, $F4+$17, 0, 0, 2, 4, $03)

SamusOam_Left_PullingYourselfForwardFromHanging_Frame3:
dw $0005
%spritemapEntry(1, $1F7+1, $E0+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1EF+1, $E8+$17, 0, 0, 2, 4, $02)
%spritemapEntry(1, $1FB+1, $E8+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1FB+1, $F8+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $203+1, $F8+$17, 0, 0, 2, 4, $0B)


SamusOam_Right_PullingYourselfIntoMorphBallTunnel_Frame0:
dw $0008
%spritemapEntry(0, $1FE, $EC+$17, 0, 0, 2, 4, $13)
%spritemapEntry(0, $1FE, $F4+$17, 0, 0, 2, 4, $14)
%spritemapEntry(0, $204, $E3+$17, 0, 1, 2, 4, $03)
%spritemapEntry(0, $1FC, $E3+$17, 0, 1, 2, 4, $04)
%spritemapEntry(1, $1FC, $EB+$17, 0, 1, 2, 4, $00)
%spritemapEntry(0, $1F4, $EA+$17, 0, 1, 2, 4, $02)
%spritemapEntry(0, $1F4, $F2+$17, 0, 1, 2, 4, $12)
%spritemapEntry(0, $1F4, $FA+$17, 0, 1, 2, 4, $06)

SamusOam_Left_PullingYourselfIntoMorphBallTunnel_Frame0:
dw $0007
%spritemapEntry(0, $1F9+1, $F2+$17, 0, 0, 2, 4, $05)
%spritemapEntry(0, $1F4+1, $E3+$17, 0, 0, 2, 4, $03)
%spritemapEntry(0, $1FC+1, $E3+$17, 0, 0, 2, 4, $04)
%spritemapEntry(1, $1F4+1, $EB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(0, $004+1, $EA+$17, 0, 0, 2, 4, $02)
%spritemapEntry(0, $004+1, $F2+$17, 0, 0, 2, 4, $12)
%spritemapEntry(0, $004+1, $FA+$17, 0, 0, 2, 4, $06)


SamusOam_Right_ReadyToJump_HangingOnLedge_Frame0:
dw $0005
%spritemapEntry(1, $1F2, $DB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FA, $DB+$17, 0, 0, 2, 4, $01)
%spritemapEntry(1, $1F9, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F9, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $201, $FB+$17, 0, 0, 2, 4, $0B)

SamusOam_Left_ReadyToJump_HangingOnLedge_Frame0:
dw $0005
%spritemapEntry(1, $1F6+1, $EB+$17, 0, 0, 2, 4, $08)
%spritemapEntry(0, $1F6+1, $FB+$17, 0, 0, 2, 4, $0A)
%spritemapEntry(0, $1FE+1, $FB+$17, 0, 0, 2, 4, $0B)
%spritemapEntry(1, $1F6+1, $DB+$17, 0, 0, 2, 4, $00)
%spritemapEntry(1, $1FE+1, $DB+$17, 0, 0, 2, 4, $01)


SamusTileDefs_Top_0:
TD_T_0_00: dl T_0_00 : dw $0100, $0100 ; $9C8000
TD_T_0_01: dl T_0_01 : dw $0100, $0100 ; $9C8200
TD_T_0_02: dl T_0_02 : dw $0100, $0100 ; $9C8400
TD_T_0_03: dl T_0_03 : dw $0100, $0020 ; $9C8600
TD_T_0_04: dl T_0_04 : dw $00E0, $0000 ; $9C8720
TD_T_0_05: dl T_0_05 : dw $0100, $0060 ; $9C8800
TD_T_0_06: dl T_0_06 : dw $0100, $00E0 ; $9C8960
TD_T_0_07: dl T_0_07 : dw $0100, $0000 ; $9C8B40
TD_T_0_08: dl T_0_08 : dw $0100, $0040 ; $9C8C40
TD_T_0_09: dl T_0_09 : dw $0100, $0060 ; $9C8D80
TD_T_0_0A: dl T_0_0A : dw $00E0, $0000 ; $9C8EE0
TD_T_0_0B: dl T_0_0B : dw $0100, $00C0 ; $9BF640
TD_T_0_0C: dl T_0_0C : dw $0100, $0100 ; $9BF800

SamusTileDefs_Top_1:
TD_T_1_00: dl T_1_00 : dw $0100, $0100 ; $9C91C0
TD_T_1_01: dl T_1_01 : dw $0100, $0100 ; $9C93C0
TD_T_1_02: dl T_1_02 : dw $0100, $0100 ; $9C95C0
TD_T_1_03: dl T_1_03 : dw $0100, $00C0 ; $9C97C0
TD_T_1_04: dl T_1_04 : dw $0100, $0100 ; $9C9980
TD_T_1_05: dl T_1_05 : dw $0100, $0100 ; $9C9B80
TD_T_1_06: dl T_1_06 : dw $0100, $0100 ; $9C9D80
TD_T_1_07: dl T_1_07 : dw $00E0, $00C0 ; $9C9F80
TD_T_1_08: dl T_1_08 : dw $0100, $0100 ; $9CA120
TD_T_1_09: dl T_1_09 : dw $0100, $0100 ; $9CA320
TD_T_1_0A: dl T_1_0A : dw $0100, $0100 ; $9CA520
TD_T_1_0B: dl T_1_0B : dw $00C0, $00C0 ; $9CA720
TD_T_1_0C: dl T_1_0C : dw $0100, $0100 ; $9CA8A0
TD_T_1_0D: dl T_1_0D : dw $0100, $0100 ; $9CAAA0
TD_T_1_0E: dl T_1_0E : dw $0100, $0100 ; $9CACA0
TD_T_1_0F: dl T_1_0F : dw $0100, $0100 ; $9CAEA0
TD_T_1_10: dl T_1_10 : dw $0100, $0100 ; $9CB0A0

SamusTileDefs_Top_2:
TD_T_2_00: dl T_2_00 : dw $0080, $0060 ; $9CC820
TD_T_2_01: dl T_2_01 : dw $0080, $0040 ; $9CC900
TD_T_2_02: dl T_2_02 : dw $00A0, $0060 ; $9CC9C0
TD_T_2_03: dl T_2_03 : dw $0080, $0060 ; $9CCAC0
TD_T_2_04: dl T_2_04 : dw $0080, $0040 ; $9CCBA0
TD_T_2_05: dl T_2_05 : dw $0080, $0040 ; $9CCC60
TD_T_2_06: dl T_2_06 : dw $0040, $0060 ; $9CCD20
TD_T_2_07: dl T_2_07 : dw $0060, $0060 ; $9CCDC0
TD_T_2_08: dl T_2_08 : dw $0060, $0060 ; $9CCE80
TD_T_2_09: dl T_2_09 : dw $0040, $0060 ; $9CCF40
TD_T_2_0A: dl T_2_0A : dw $0060, $0040 ; $9CCFE0
TD_T_2_0B: dl T_2_0B : dw $0060, $0060 ; $9CD080 wrong size
TD_T_2_0C: dl T_2_0C : dw $0060, $0060 ; $9CD120
TD_T_2_0D: dl T_2_0D : dw $0080, $0060 ; $9CD1E0
TD_T_2_0E: dl T_2_0E : dw $0080, $0040 ; $9CD2C0
TD_T_2_0F: dl T_2_0F : dw $0060, $0040 ; $9CD380
TD_T_2_10: dl T_2_10 : dw $0040, $0040 ; $9CD420
TD_T_2_11: dl T_2_11 : dw $0060, $0060 ; $9CD4A0
TD_T_2_12: dl T_2_12 : dw $0060, $0060 ; $9CD560
TD_T_2_13: dl T_2_13 : dw $0040, $0040 ; $9CD620
TD_T_2_14: dl T_2_14 : dw $0100, $0100 ; $9CD6A0
TD_T_2_15: dl T_2_15 : dw $0100, $0100 ; $9CD8A0
TD_T_2_16: dl T_2_16 : dw $0100, $0100 ; $9CDAA0
TD_T_2_17: dl T_2_17 : dw $0100, $0100 ; $9CDCA0
TD_T_2_18: dl T_2_18 : dw $0100, $0100 ; $9CDEA0
TD_T_2_19: dl T_2_19 : dw $0100, $0100 ; $9CE0A0
TD_T_2_1A: dl T_2_1A : dw $0100, $0100 ; $9CE2A0
TD_T_2_1B: dl T_2_1B : dw $0100, $0100 ; $9CE4A0
TD_T_2_1C: dl T_2_1C : dw $0100, $0100 ; $9CE6A0

SamusTileDefs_Top_3:
TD_T_3_00: dl T_3_00 : dw $00A0, $00A0 ; $9CF800
TD_T_3_01: dl T_3_01 : dw $0100, $0100 ; $9CF940
TD_T_3_02: dl T_3_02 : dw $0080, $0080 ; $9CFB40
TD_T_3_03: dl T_3_03 : dw $0100, $0100 ; $9CFC40
TD_T_3_04: dl T_3_04 : dw $0080, $0080 ; $9CFE40
TD_T_3_05: dl T_3_05 : dw $0100, $0100 ; $9D85C0
TD_T_3_06: dl T_3_06 : dw $0100, $0100 ; $9D87C0
TD_T_3_07: dl T_3_07 : dw $0100, $0100 ; $9D89C0
TD_T_3_08: dl T_3_08 : dw $0100, $0100 ; $9D8BC0
TD_T_3_09: dl T_3_09 : dw $00E0, $00E0 ; $9D8000
TD_T_3_0A: dl T_3_0A : dw $00C0, $0060 ; $9D81C0
TD_T_3_0B: dl T_3_0B : dw $00E0, $00E0 ; $9D82E0
TD_T_3_0C: dl T_3_0C : dw $00C0, $0060 ; $9D84A0
TD_T_3_0D: dl T_3_0D : dw $00C0, $00C0 ; $9D8DC0
TD_T_3_0E: dl T_3_0E : dw $0080, $0080 ; $9D8F40
TD_T_3_0F: dl T_3_0F : dw $0080, $0080 ; $9D9040
TD_T_3_10: dl T_3_10 : dw $0080, $0080 ; $9D9140
TD_T_3_11: dl T_3_11 : dw $00A0, $00A0 ; $9D9240
TD_T_3_12: dl T_3_12 : dw $00A0, $00A0 ; $9D9380
TD_T_3_13: dl T_3_13 : dw $00A0, $00A0 ; $9D94C0
TD_T_3_14: dl T_3_14 : dw $00A0, $0080 ; $9D9600
TD_T_3_15: dl T_3_15 : dw $00C0, $00C0 ; $9D9720
TD_T_3_16: dl T_3_16 : dw $00C0, $00C0 ; $9D98A0

SamusTileDefs_Top_4:
TD_T_4_00: dl T_4_00 : dw $00C0, $00C0 ; $9DA740
TD_T_4_01: dl T_4_01 : dw $00A0, $00A0 ; $9DA8C0
TD_T_4_02: dl T_4_02 : dw $00A0, $00A0 ; $9DAA00
TD_T_4_03: dl T_4_03 : dw $0080, $0080 ; $9BF300
TD_T_4_04: dl T_4_04 : dw $0080, $0080 ; $9BF400

SamusTileDefs_Top_5:
TD_T_5_00: dl T_5_00 : dw $00E0, $00E0 ; $9DB220
TD_T_5_01: dl T_5_01 : dw $00E0, $00E0 ; $9DB3E0
TD_T_5_02: dl T_5_02 : dw $00E0, $00E0 ; $9DB5A0
TD_T_5_03: dl T_5_03 : dw $0080, $0080 ; $9DB760
TD_T_5_04: dl T_5_04 : dw $00C0, $0080 ; $9DB860

SamusTileDefs_Top_6:
TD_T_6_00: dl T_6_00 : dw $0080, $0080 ; $9DC4E0
TD_T_6_01: dl T_6_01 : dw $0080, $0080 ; $9DC5E0
TD_T_6_02: dl T_6_02 : dw $0080, $0080 ; $9DC6E0
TD_T_6_03: dl T_6_03 : dw $0080, $0080 ; $9DC7E0
TD_T_6_04: dl T_6_04 : dw $0080, $0080 ; $9DC8E0
TD_T_6_05: dl T_6_05 : dw $0080, $0080 ; $9DC9E0
TD_T_6_06: dl T_6_06 : dw $0080, $0080 ; $9DCAE0
TD_T_6_07: dl T_6_07 : dw $0080, $0080 ; $9DCBE0
TD_T_6_08: dl T_6_08 : dw $0080, $0080 ; $9DCCE0
TD_T_6_09: dl T_6_09 : dw $0080, $0080 ; $9DCDE0
TD_T_6_0A: dl T_6_0A : dw $0080, $0080 ; $9DCEE0
TD_T_6_0B: dl T_6_0B : dw $0080, $0080 ; $9DCFE0
TD_T_6_0C: dl T_6_0C : dw $0080, $0080 ; $9DD0E0
TD_T_6_0D: dl T_6_0D : dw $0080, $0080 ; $9DD1E0
TD_T_6_0E: dl T_6_0E : dw $0080, $0080 ; $9DD2E0
TD_T_6_0F: dl T_6_0F : dw $0080, $0080 ; $9DD3E0
TD_T_6_10: dl T_6_10 : dw $00C0, $00C0 ; $9DD4E0
TD_T_6_11: dl T_6_11 : dw $00C0, $00C0 ; $9DD660
TD_T_6_12: dl T_6_12 : dw $00C0, $00C0 ; $9DD7E0
TD_T_6_13: dl T_6_13 : dw $00C0, $00C0 ; $9DD960
TD_T_6_14: dl T_6_14 : dw $00C0, $00C0 ; $9DDAE0
TD_T_6_15: dl T_6_15 : dw $00C0, $00C0 ; $9DDC60
TD_T_6_16: dl T_6_16 : dw $00C0, $00C0 ; $9DDDE0
TD_T_6_17: dl T_6_17 : dw $00C0, $00C0 ; $9DDF60
TD_T_6_18: dl T_6_18 : dw $00C0, $00C0 ; $9DE0E0
TD_T_6_19: dl T_6_19 : dw $00C0, $00C0 ; $9DE260
TD_T_6_1A: dl T_6_1A : dw $00C0, $00C0 ; $9DE3E0
TD_T_6_1B: dl T_6_1B : dw $00C0, $00C0 ; $9DE560
TD_T_6_1C: dl T_6_1C : dw $00C0, $00C0 ; $9DE6E0
TD_T_6_1D: dl T_6_1D : dw $00C0, $00C0 ; $9DE860
TD_T_6_1E: dl T_6_1E : dw $00C0, $00C0 ; $9DE9E0
TD_T_6_1F: dl T_6_1F : dw $00C0, $00C0 ; $9DEB60

SamusTileDefs_Top_7:
TD_T_7_00: dl T_7_00 : dw $0100, $0040 ; $9DBCA0
TD_T_7_01: dl T_7_01 : dw $0100, $0040 ; $9DBDE0
TD_T_7_02: dl T_7_02 : dw $0100, $0040 ; $9DBF20

SamusTileDefs_Top_B:
TD_T_B_00: dl T_B_00 : dw $00A0, $0060 ; $9CC1A0
TD_T_B_01: dl T_B_01 : dw $00A0, $0060 ; $9CC2A0
TD_T_B_02: dl T_B_02 : dw $0040, $0040 ; $9CC3A0
TD_T_B_03: dl T_B_03 : dw $0040, $0040 ; $9CC420
TD_T_B_04: dl T_B_04 : dw $0040, $0040 ; $9CC4A0
TD_T_B_05: dl T_B_05 : dw $0040, $0040 ; $9CC520
TD_T_B_06: dl T_B_06 : dw $0040, $0040 ; $9CC5A0
TD_T_B_07: dl T_B_07 : dw $0040, $0040 ; $9CC620
TD_T_B_08: dl T_B_08 : dw $0040, $0040 ; $9CC6A0
TD_T_B_09: dl T_B_09 : dw $0040, $0040 ; $9CC720
TD_T_B_0A: dl T_B_0A : dw $0040, $0040 ; $9CC7A0

SamusTileDefs_Bottom_0:
TD_B_0_00: dl B_0_00 : dw $0040, $0000 ; $9C8FC0
TD_B_0_01: dl B_0_01 : dw $0100, $00C0 ; $9C9000
TD_B_0_02: dl B_0_02 : dw $0100, $0060 ; $9BFA00

SamusTileDefs_Bottom_1:
TD_B_1_00: dl B_1_00 : dw $00C0, $00C0 ; $9CB2A0
TD_B_1_01: dl B_1_01 : dw $00C0, $00C0 ; $9CB420
TD_B_1_02: dl B_1_02 : dw $00C0, $00C0 ; $9CB5A0
TD_B_1_03: dl B_1_03 : dw $00C0, $00C0 ; $9CB720
TD_B_1_04: dl B_1_04 : dw $00C0, $00C0 ; $9CB8A0
TD_B_1_05: dl B_1_05 : dw $00C0, $00C0 ; $9CBA20
TD_B_1_06: dl B_1_06 : dw $00C0, $00C0 ; $9CBBA0
TD_B_1_07: dl B_1_07 : dw $0080, $0080 ; $9CBD20
TD_B_1_08: dl B_1_08 : dw $0080, $0080 ; $9CBE20
TD_B_1_09: dl B_1_09 : dw $0080, $0080 ; $9CBF20
TD_B_1_0A: dl B_1_0A : dw $0040, $0040 ; $9CC020
TD_B_1_0B: dl B_1_0B : dw $0080, $0080 ; $9CC0A0

SamusTileDefs_Bottom_2:
TD_B_2_00: dl B_2_00 : dw $0060, $0040 ; $9CE8A0
TD_B_2_01: dl B_2_01 : dw $0080, $0040 ; $9CE940
TD_B_2_02: dl B_2_02 : dw $00A0, $0060 ; $9CEA00
TD_B_2_03: dl B_2_03 : dw $00C0, $0080 ; $9CEB00
TD_B_2_04: dl B_2_04 : dw $0080, $0080 ; $9CEC40
TD_B_2_05: dl B_2_05 : dw $0080, $0040 ; $9CED40
TD_B_2_06: dl B_2_06 : dw $0080, $0040 ; $9CEE00
TD_B_2_07: dl B_2_07 : dw $00A0, $0060 ; $9CEEC0
TD_B_2_08: dl B_2_08 : dw $00C0, $0080 ; $9CEFC0
TD_B_2_09: dl B_2_09 : dw $00A0, $0060 ; $9CF100
TD_B_2_0A: dl B_2_0A : dw $0080, $0080 ; $9CF200
TD_B_2_0B: dl B_2_0B : dw $0080, $0080 ; $9CF300
TD_B_2_0C: dl B_2_0C : dw $0080, $0080 ; $9CF400
TD_B_2_0D: dl B_2_0D : dw $0080, $0080 ; $9CF500
TD_B_2_0E: dl B_2_0E : dw $0080, $0080 ; $9CF600
TD_B_2_0F: dl B_2_0F : dw $0080, $0080 ; $9CF700

SamusTileDefs_Bottom_3:
TD_B_3_00: dl B_3_00 : dw $0080, $0080 ; $9D9A20
TD_B_3_01: dl B_3_01 : dw $0100, $0100 ; $9D9B20
TD_B_3_02: dl B_3_02 : dw $0100, $0100 ; $9D9D20
TD_B_3_03: dl B_3_03 : dw $0100, $0100 ; $9D9F20
TD_B_3_04: dl B_3_04 : dw $0100, $0100 ; $9DA120
TD_B_3_05: dl B_4_00 : dw $00A0, $0040 ; $9DAB40
TD_B_3_06: dl B_4_01 : dw $00A0, $0040 ; $9DAC20
TD_B_3_07: dl B_4_03 : dw $0080, $0040 ; $9DADA0
TD_B_3_08: dl B_4_02 : dw $0060, $0040 ; $9DAD00
TD_B_3_09: dl B_3_09 : dw $0080, $0080 ; $9DA320
TD_B_3_0A: dl B_3_0A : dw $00A0, $0080 ; $9DA420
TD_B_3_0B: dl B_3_0B : dw $0080, $0080 ; $9DA540
TD_B_3_0C: dl B_3_0C : dw $0080, $0080 ; $9DA640

SamusTileDefs_Bottom_4:
TD_B_4_00: dl B_4_00 : dw $00A0, $0040 ; $9DAB40
TD_B_4_01: dl B_4_01 : dw $00A0, $0040 ; $9DAC20
TD_B_4_02: dl B_4_02 : dw $0060, $0040 ; $9DAD00
TD_B_4_03: dl B_4_03 : dw $0080, $0040 ; $9DADA0
TD_B_4_04: dl B_4_04 : dw $0080, $0080 ; $9DAE60
TD_B_4_05: dl B_4_05 : dw $0080, $0080 ; $9DAF60
TD_B_4_06: dl B_4_06 : dw $0080, $0080 ; $9DB060
TD_B_4_07: dl B_4_07 : dw $0080, $0040 ; $9DB160
TD_B_4_08: dl B_4_08 : dw $0060, $0040 ; $9BF500
TD_B_4_09: dl B_4_09 : dw $0060, $0040 ; $9BF5A0

SamusTileDefs_Bottom_5:
TD_B_5_00: dl B_5_00 : dw $0080, $0080 ; $9DB9A0
TD_B_5_01: dl B_5_01 : dw $0080, $0080 ; $9DBAA0
TD_B_5_02: dl B_5_02 : dw $0080, $0080 ; $9DBBA0

SamusTileDefs_Bottom_6:
TD_B_6_00: dl B_6_00 : dw $0080, $0080 ; $9DECE0
TD_B_6_01: dl B_6_01 : dw $0080, $0080 ; $9DEDE0
TD_B_6_02: dl B_6_02 : dw $0080, $0080 ; $9DEEE0
TD_B_6_03: dl B_6_03 : dw $0080, $0080 ; $9DEFE0
TD_B_6_04: dl B_6_04 : dw $0080, $0080 ; $9DF0E0
TD_B_6_05: dl B_6_05 : dw $0080, $0080 ; $9DF1E0
TD_B_6_06: dl B_6_06 : dw $0080, $0080 ; $9DF2E0
TD_B_6_07: dl B_6_07 : dw $0080, $0080 ; $9DF3E0
TD_B_6_08: dl B_6_08 : dw $0080, $0080 ; $9DF4E0
TD_B_6_09: dl B_6_09 : dw $0080, $0080 ; $9DF5E0
TD_B_6_0A: dl B_6_0A : dw $0080, $0080 ; $9DF6E0
TD_B_6_0B: dl B_6_0B : dw $0080, $0080 ; $9DF7E0
TD_B_6_0C: dl B_6_0C : dw $0080, $0080 ; $9DF8E0
TD_B_6_0D: dl B_6_0D : dw $0080, $0080 ; $9DF9E0
TD_B_6_0E: dl B_6_0E : dw $0080, $0080 ; $9DFAE0
TD_B_6_0F: dl B_6_0F : dw $0080, $0080 ; $9DFBE0
TD_B_6_10: dl B_6_10 : dw $0080, $0080 ; $9BE300
TD_B_6_11: dl B_6_11 : dw $0080, $0080 ; $9BE400
TD_B_6_12: dl B_6_12 : dw $0080, $0080 ; $9BE500
TD_B_6_13: dl B_6_13 : dw $0080, $0080 ; $9BE600
TD_B_6_14: dl B_6_14 : dw $0080, $0080 ; $9BE700
TD_B_6_15: dl B_6_15 : dw $0080, $0080 ; $9BE800
TD_B_6_16: dl B_6_16 : dw $0080, $0080 ; $9BE900
TD_B_6_17: dl B_6_17 : dw $0080, $0080 ; $9BEA00
TD_B_6_18: dl B_6_18 : dw $0080, $0080 ; $9BEB00
TD_B_6_19: dl B_6_19 : dw $0080, $0080 ; $9BEC00
TD_B_6_1A: dl B_6_1A : dw $0080, $0080 ; $9BED00
TD_B_6_1B: dl B_6_1B : dw $0080, $0080 ; $9BEE00
TD_B_6_1C: dl B_6_1C : dw $0080, $0080 ; $9BEF00
TD_B_6_1D: dl B_6_1D : dw $0080, $0080 ; $9BF000
TD_B_6_1E: dl B_6_1E : dw $0080, $0080 ; $9BF100
TD_B_6_1F: dl B_6_1F : dw $0080, $0080 ; $9BF200

SamusTileDefs_Bottom_7:
TD_B_7_00: dl B_7_00 : dw $0040, $0040 ; $9DC060
TD_B_7_01: dl B_7_01 : dw $0100, $0100 ; $9DC0E0
TD_B_7_02: dl B_7_02 : dw $0100, $0100 ; $9DC2E0

SamusTileDef_Top_Left_Skidding_Frame0: dl SamusGfx_Top_Left_Skidding_Frame0 : dw 6*$20, 6*$20 ; 1
SamusTileDef_Top_Left_ArmedSkidding_Frame0: dl SamusGfx_Top_Left_ArmedSkidding_Frame0 : dw 6*$20, 6*$20 ; 2
SamusTileDef_Top_Right_Skidding_Frame0: dl SamusGfx_Top_Right_Skidding_Frame0 : dw 6*$20, 6*$20 ; 3
SamusTileDef_Top_Right_Armed_Skidding_Frame0: dl SamusGfx_Top_Right_Armed_Skidding_Frame0 : dw 6*$20, 6*$20 ; 4
SamusTileDef_Bottom_Skidding_Frame0: dl SamusGfx_Bottom_Skidding_Frame0 : dw 5*$20, 3*$20 ; 5

SamusTileDef_Top_Left_UsingAnElevator_Frame0: dl SamusGfx_Top_Left_UsingAnElevator_Frame0 : dw 4*$20, 2*$20 ; 6
SamusTileDef_Bottom_UsingAnElevator_Frame0: dl SamusGfx_Bottom_UsingAnElevator_Frame0 : dw 2*$20, 2*$20 ; 7
SamusTileDef_Top_UsingAnElevator_Frame2: dl SamusGfx_Top_UsingAnElevator_Frame2 : dw 6*$20, 3*$20 ; 8
SamusTileDef_Bottom_UsingAnElevator_Frame2: dl SamusGfx_Bottom_UsingAnElevator_Frame2 : dw 3*$20, 3*$20 ; 9
SamusTileDef_Top_Right_UsingAnElevator_Frame0: dl SamusGfx_Top_Right_UsingAnElevator_Frame0 : dw 5*$20, 3*$20 ; A

SamusTileDef_Top_Right_Shooting_Frame0: dl SamusGfx_Top_Right_Shooting_Frame0 : dw 5*$20, 4*$20 ; B
SamusTileDef_Top_Left_Shooting_Frame0: dl SamusGfx_Top_Left_Shooting_Frame0 : dw 5*$20, 5*$20 ; C
SamusTileDef_Top_Right_DiagonalUp_Shooting_Frame0: dl SamusGfx_Top_Right_DiagonalUp_Shooting_Frame0 : dw 4*$20, 5*$20 ; D
SamusTileDef_Top_Left_DiagonalUp_Shooting_Frame0: dl SamusGfx_Top_Left_DiagonalUp_Shooting_Frame0 : dw 5*$20, 5*$20 ; E
SamusTileDef_Top_Right_DiagonalDown_Shooting_Frame0: dl SamusGfx_Top_Right_DiagonalDown_Shooting_Frame0 : dw 5*$20, 4*$20 ; F
SamusTileDef_Top_Left_DiagonalDown_Shooting_Frame0: dl SamusGfx_Top_Left_DiagonalDown_Shooting_Frame0 : dw 6*$20, 4*$20 ; 10
SamusTileDef_Bottom_DiagonalDown_Standing_Frame0: dl SamusGfx_Bottom_DiagonalDown_Standing_Frame0 : dw 5*$20, 3*$20 ; 11
SamusTileDef_Bottom_DiagonalDown_Standing_Frame1: dl SamusGfx_Bottom_DiagonalDown_Standing_Frame1 : dw 5*$20, 3*$20 ; 12
SamusTileDef_Bottom_DiagonalDown_Standing_Frame2: dl SamusGfx_Bottom_DiagonalDown_Standing_Frame2 : dw 5*$20, 3*$20 ; 13

SamusTileDef_Bottom_MidAir_Frame0: dl SamusGfx_Bottom_MidAir_Frame0 : dw 5*$20, 2*$20
SamusTileDef_Bottom_MidAir_Frame1: dl SamusGfx_Bottom_MidAir_Frame1 : dw 4*$20, 2*$20
SamusTileDef_Bottom_MidAir_Frame2: dl SamusGfx_Bottom_MidAir_Frame2 : dw 3*$20, 2*$20
SamusTileDef_Bottom_MidAir_Frame3: dl SamusGfx_Bottom_MidAir_Frame3 : dw 4*$20, 2*$20
SamusTileDef_Bottom_MidAir_Frame4: dl SamusGfx_Bottom_MidAir_Frame4 : dw 4*$20, 4*$20
SamusTileDef_Bottom_MidAir_Frame5: dl SamusGfx_Bottom_MidAir_Frame5 : dw 4*$20, 4*$20

SamusTileDef_Top_Right_Forward_MidAir_Frame0: dl SamusGfx_Top_Right_Forward_MidAir_Frame0 : dw 3*$20, 2*$20
SamusTileDef_Top_Right_Forward_MidAir_Frame1: dl SamusGfx_Top_Right_Forward_MidAir_Frame1 : dw 3*$20, 2*$20
SamusTileDef_Top_Right_Forward_MidAir_Frame2: dl SamusGfx_Top_Right_Forward_MidAir_Frame2 : dw 3*$20, 2*$20

SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame0: dl SamusGfx_Top_Right_DiagonalUp_MidAir_Frame0 : dw 3*$20, 3*$20
SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame1: dl SamusGfx_Top_Right_DiagonalUp_MidAir_Frame1 : dw 3*$20, 3*$20
SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame2: dl SamusGfx_Top_Right_DiagonalUp_MidAir_Frame2 : dw 3*$20, 3*$20

SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame0: dl SamusGfx_Top_Right_DiagonalDown_MidAir_Frame0 : dw 3*$20, 2*$20
SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame1: dl SamusGfx_Top_Right_DiagonalDown_MidAir_Frame1 : dw 3*$20, 2*$20
SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame2: dl SamusGfx_Top_Right_DiagonalDown_MidAir_Frame2 : dw 3*$20, 2*$20

SamusTileDef_Top_Right_Up_MidAir_Frame0: dl SamusGfx_Top_Right_Up_MidAir_Frame0 : dw 2*$20, 2*$20
SamusTileDef_Top_Right_Up_MidAir_Frame1: dl SamusGfx_Top_Right_Up_MidAir_Frame1 : dw 2*$20, 2*$20
SamusTileDef_Top_Right_Up_MidAir_Frame2: dl SamusGfx_Top_Right_Up_MidAir_Frame2 : dw 2*$20, 2*$20

SamusTileDef_Top_Right_Down_MidAir_Frame0: dl SamusGfx_Top_Right_Down_MidAir_Frame0 : dw 4*$20, 4*$20
SamusTileDef_Bottom_Down_MidAir_Frame0: dl SamusGfx_Bottom_Down_MidAir_Frame0 : dw 4*$20, 4*$20
SamusTileDef_Top_Right_Down_MidAir_Frame1: dl SamusGfx_Top_Right_Down_MidAir_Frame1 : dw 4*$20, 4*$20
SamusTileDef_Bottom_Down_MidAir_Frame1: dl SamusGfx_Bottom_Down_MidAir_Frame1 : dw 4*$20, 4*$20

SamusTileDef_Top_Left_Forward_MidAir_Frame0: dl SamusGfx_Top_Left_Forward_MidAir_Frame0 : dw 4*$20, 2*$20
SamusTileDef_Top_Left_Forward_MidAir_Frame1: dl SamusGfx_Top_Left_Forward_MidAir_Frame1 : dw 4*$20, 2*$20
SamusTileDef_Top_Left_Forward_MidAir_Frame2: dl SamusGfx_Top_Left_Forward_MidAir_Frame2 : dw 4*$20, 2*$20

SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame0: dl SamusGfx_Top_Left_DiagonalUp_MidAir_Frame0 : dw 3*$20, 3*$20
SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame1: dl SamusGfx_Top_Left_DiagonalUp_MidAir_Frame1 : dw 3*$20, 3*$20
SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame2: dl SamusGfx_Top_Left_DiagonalUp_MidAir_Frame2 : dw 3*$20, 3*$20

SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame0: dl SamusGfx_Top_Left_DiagonalDown_MidAir_Frame0 : dw 4*$20, 4*$20
SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame1: dl SamusGfx_Top_Left_DiagonalDown_MidAir_Frame1 : dw 4*$20, 4*$20
SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame2: dl SamusGfx_Top_Left_DiagonalDown_MidAir_Frame2 : dw 4*$20, 4*$20

SamusTileDef_Top_Left_Up_MidAir_Frame0: dl SamusGfx_Top_Left_Up_MidAir_Frame0 : dw 3*$20, 2*$20
SamusTileDef_Top_Left_Up_MidAir_Frame1: dl SamusGfx_Top_Left_Up_MidAir_Frame1 : dw 3*$20, 2*$20
SamusTileDef_Top_Left_Up_MidAir_Frame2: dl SamusGfx_Top_Left_Up_MidAir_Frame2 : dw 3*$20, 2*$20

SamusTileDef_Top_Left_Down_MidAir_Frame0: dl SamusGfx_Top_Left_Down_MidAir_Frame0 : dw 4*$20, 4*$20
SamusTileDef_Top_Left_Down_MidAir_Frame1: dl SamusGfx_Top_Left_Down_MidAir_Frame1 : dw 4*$20, 4*$20

SamusTileDef_Top_HangingOnLedge_Frame0: dl SamusGfx_Top_HangingOnLedge_Frame0 : dw 6*$20, 6*$20 ; 14
SamusTileDef_Top_HangingOnLedge_Frame1: dl SamusGfx_Top_HangingOnLedge_Frame1 : dw 6*$20, 6*$20 ; 15
SamusTileDef_Top_HangingOnLedge_Frame2: dl SamusGfx_Top_HangingOnLedge_Frame2 : dw 6*$20, 6*$20 ; 16
SamusTileDef_Top_HangingOnLedge_Frame3: dl SamusGfx_Top_HangingOnLedge_Frame3 : dw 6*$20, 6*$20 ; 17
SamusTileDef_Top_HangingOnLedge_Frame5: dl SamusGfx_Top_HangingOnLedge_Frame5 : dw 6*$20, 6*$20 ; 18
SamusTileDef_Bottom_HangingOnLedge_Frame0: dl SamusGfx_Bottom_HangingOnLedge_Frame0 : dw 3*$20, 2*$20 ; 19
SamusTileDef_Bottom_HangingOnLedge_Frame1: dl SamusGfx_Bottom_HangingOnLedge_Frame1 : dw 3*$20, 2*$20 ; 1A
SamusTileDef_Bottom_HangingOnLedge_Frame2: dl SamusGfx_Bottom_HangingOnLedge_Frame2 : dw 4*$20, 2*$20 ; 1B
SamusTileDef_Bottom_HangingOnLedge_Frame3: dl SamusGfx_Bottom_HangingOnLedge_Frame3 : dw 4*$20, 2*$20 ; 1C
SamusTileDef_Bottom_HangingOnLedge_Frame5: dl SamusGfx_Bottom_HangingOnLedge_Frame5 : dw 3*$20, 2*$20 ; 1D

SamusTileDef_Top_PullingYourselfUpFromHanging_Frame1: dl SamusGfx_Top_PullingYourselfUpFromHanging_Frame1 : dw 6*$20, 6*$20 ; 1E
SamusTileDef_Top_PullingYourselfUpFromHanging_Frame2: dl SamusGfx_Top_PullingYourselfUpFromHanging_Frame2 : dw 6*$20, 6*$20 ; 1F
SamusTileDef_Bottom_PullingYourselfUpFromHanging_Frame1: dl SamusGfx_Bottom_PullingYourselfUpFromHanging_Frame1 : dw 4*$20, 2*$20 ; 20
SamusTileDef_Bottom_PullingYourselfUpFromHanging_Frame2: dl SamusGfx_Bottom_PullingYourselfUpFromHanging_Frame2 : dw 4*$20, 2*$20 ; 21

SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame0: dl SamusGfx_Top_PullingYourselfForwardFromHanging_Frame0 : dw 5*$20, 5*$20 ; 22
SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame1: dl SamusGfx_Top_PullingYourselfForwardFromHanging_Frame1 : dw 3*$20, 3*$20 ; 23
SamusTileDef_Top_Right_PullingYourselfForwardFromHanging_Frame2: dl SamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 4*$20 ; 24
SamusTileDef_Top_Right_PullingYourselfForwardFromHanging_Frame3: dl SamusGfx_Top_Right_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 4*$20 ; 25
SamusTileDef_Top_Left_PullingYourselfForwardFromHanging_Frame2: dl SamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 2*$20 ; 26
SamusTileDef_Top_Left_PullingYourselfForwardFromHanging_Frame3: dl SamusGfx_Top_Left_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 4*$20 ; 27
SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame0: dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame0 : dw 4*$20, 2*$20 ; 28
SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame1: dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame1 : dw 3*$20, 2*$20 ; 29
SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame2: dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame2 : dw 4*$20, 2*$20 ; 2A
SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame3: dl SamusGfx_Bottom_PullingYourselfForwardFromHanging_Frame3 : dw 4*$20, 2*$20 ; 2B

SamusTileDef_Top_PullingYourselfIntoMorphBallTunnel_Frame0: dl SamusGfx_Top_PullingYourselfIntoMorphBallTunnel_Frame0 : dw 7*$20, 5*$20 ; 2C

SamusTileDef_Top_Right_ReadyToJump_HangingOnLedge_Frame0: dl SamusGfx_Top_Right_ReadyToJump_HangingOnLedge_Frame0 : dw 3*$20, 3*$20 ; 2D
SamusTileDef_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0: dl SamusGfx_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0 : dw 4*$20, 2*$20 ; 2E
SamusTileDef_Top_Left_ReadyToJump_HangingOnLedge_Frame0: dl SamusGfx_Top_Left_ReadyToJump_HangingOnLedge_Frame0 : dw 3*$20, 3*$20 ; 2F
SamusTileDef_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0: dl SamusGfx_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0 : dw 4*$20, 2*$20 ; 30

SamusTileAnims:
  dw TA_00, TA_01, TA_02, TA_03, TA_04, TA_05, TA_06, TA_07, TA_08, TA_09, TA_0A, TA_0B, TA_0C, TA_0D, TA_0E, TA_0F
  dw TA_10, TA_11, TA_12, TA_13, TA_14, TA_15, TA_16, TA_17, TA_18, TA_19, TA_1A, TA_1B, TA_1C, TA_1D, TA_1E, TA_1F
  dw TA_20, TA_21, TA_22, TA_23, TA_24, TA_25, TA_26, TA_27, TA_28, TA_29, TA_2A, TA_2B, TA_2C, TA_2D, TA_2E, TA_2F
  dw TA_30, TA_31, TA_32, TA_33, TA_34, TA_35, TA_36, TA_37, TA_38, TA_39, TA_3A, TA_3B, TA_3C, TA_3D, TA_3E, TA_3F
  dw TA_40, TA_41, TA_42, TA_43, TA_44, TA_45, TA_46, TA_47, TA_48, TA_49, TA_4A, TA_4B, TA_4C, TA_4D, TA_4E, TA_4F
  dw TA_50, TA_51, TA_52, TA_53, TA_54, TA_55, TA_56, TA_57, TA_58, TA_59, TA_5A, TA_5B, TA_5C, TA_5D, TA_5E, TA_5F
  dw TA_60, TA_61, TA_62, TA_63, TA_64, TA_65, TA_66, TA_67, TA_68, TA_69, TA_6A, TA_6B, TA_6C, TA_6D, TA_6E, TA_6F
  dw TA_70, TA_71, TA_72, TA_73, TA_74, TA_75, TA_76, TA_77, TA_78, TA_79, TA_7A, TA_7B, TA_7C, TA_7D, TA_7E, TA_7F
  dw TA_80, TA_81, TA_82, TA_83, TA_84, TA_85, TA_86, TA_87, TA_88, TA_89, TA_8A, TA_8B, TA_8C, TA_8D, TA_8E, TA_8F
  dw TA_90, TA_91, TA_92, TA_93, TA_94, TA_95, TA_96, TA_97, TA_98, TA_99, TA_9A, TA_9B, TA_9C, TA_9D, TA_9E, TA_9F
  dw TA_A0, TA_A1, TA_A2, TA_A3, TA_A4, TA_A5, TA_A6, TA_A7, TA_A8, TA_A9, TA_AA, TA_AB, TA_AC, TA_AD, TA_AE, TA_AF
  dw TA_B0, TA_B1, TA_B2, TA_B3, TA_B4, TA_B5, TA_B6, TA_B7, TA_B8, TA_B9, TA_BA, TA_BB, TA_BC, TA_BD, TA_BE, TA_BF
  dw TA_C0, TA_C1, TA_C2, TA_C3, TA_C4, TA_C5, TA_C6, TA_C7, TA_C8, TA_C9, TA_CA, TA_CB, TA_CC, TA_CD, TA_CE, TA_CF
  dw TA_D0, TA_D1, TA_D2, TA_D3, TA_D4, TA_D5, TA_D6, TA_D7, TA_D8, TA_D9, TA_DA, TA_DB, TA_DC, TA_DD, TA_DE, TA_DF
  dw TA_E0, TA_E1, TA_E2, TA_E3, TA_E4, TA_E5, TA_E6, TA_E7, TA_E8, TA_E9, TA_EA, TA_EB, TA_EC, TA_ED, TA_EE, TA_EF
  dw TA_F0, TA_F1, TA_F2, TA_F3, TA_F4, TA_F5, TA_F6, TA_F7, TA_F8, TA_F9, TA_FA, TA_FB, TA_FC

TA_0D:
TA_0E:
TA_20:
TA_21:
TA_22:
TA_23:
TA_24:
TA_33:
TA_34:
TA_39:
TA_3A:
TA_42:
TA_45:
TA_46:
TA_47:
TA_48:
TA_AC:
TA_AD:
TA_AE:
TA_AF:
TA_B0:
TA_B1:
TA_C5:
TA_C6:
TA_DF:
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00

TA_00:
TA_9B:
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_01, TD_B_0_00
  dw TD_T_0_02, TD_B_0_00
  dw TD_T_0_00, TD_B_0_00
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_03, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_04, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_05, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_06, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_07, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_08, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_09, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_0A, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_08, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_09, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01
  dw TD_T_0_0A, TD_B_0_01
  dw TD_T_0_00, TD_B_0_01

TA_01:
TA_35:
TA_3B:
TA_89:
TA_A8:
TA_D5:
TA_D9:
  dw TD_T_1_00, TD_B_1_00
  dw TD_T_1_01, TD_B_1_01
  dw TD_T_1_02, TD_B_1_02
  dw 0, 0

  dw SamusTileDef_Top_Right_Shooting_Frame0, TD_B_1_02
  dw TD_T_1_00, TD_B_1_00

TA_02:
TA_36:
TA_3C:
TA_8A:
TA_A9:
TA_D6:
TA_DA:
  dw TD_T_1_00, TD_B_1_00
  dw TD_T_1_01, TD_B_1_01
  dw TD_T_1_02, TD_B_1_02
  dw 0, 0

  dw SamusTileDef_Top_Left_Shooting_Frame0, TD_B_1_02
  dw TD_T_1_00, TD_B_1_00

TA_03:
TA_04:
TA_F7:
TA_F8:
  dw TD_T_1_0C, TD_B_1_03
  dw TD_T_1_0D, TD_B_1_04
  dw TD_T_1_0E, TD_B_1_05

TA_05:
TA_CF:
TA_F9:
  dw TD_T_1_04, TD_B_1_05
  dw TD_T_1_06, TD_B_1_03
  dw TD_T_1_05, TD_B_1_04
  dw 0, 0

  dw SamusTileDef_Top_Right_DiagonalUp_Shooting_Frame0, TD_B_1_04
  dw TD_T_1_04, TD_B_1_05

TA_06:
TA_D0:
TA_FA:
  dw TD_T_1_06, TD_B_1_05
  dw TD_T_1_04, TD_B_1_03
  dw TD_T_1_05, TD_B_1_04
  dw 0, 0

  dw SamusTileDef_Top_Left_DiagonalUp_Shooting_Frame0, TD_B_1_04
  dw TD_T_1_06, TD_B_1_05

TA_07:
TA_AA:
TA_D1:
TA_FB:
  dw TD_T_1_09, SamusTileDef_Bottom_DiagonalDown_Standing_Frame0
  dw TD_T_1_0A, SamusTileDef_Bottom_DiagonalDown_Standing_Frame1
  dw TD_T_1_08, SamusTileDef_Bottom_DiagonalDown_Standing_Frame2
  dw 0, 0

  dw SamusTileDef_Top_Right_DiagonalDown_Shooting_Frame0, TD_B_1_02
  dw TD_T_1_09, SamusTileDef_Bottom_DiagonalDown_Standing_Frame0

TA_08:
TA_AB:
TA_D2:
TA_FC:
  dw TD_T_1_08, SamusTileDef_Bottom_DiagonalDown_Standing_Frame0
  dw TD_T_1_09, SamusTileDef_Bottom_DiagonalDown_Standing_Frame1
  dw TD_T_1_0A, SamusTileDef_Bottom_DiagonalDown_Standing_Frame2
  dw 0, 0

  dw SamusTileDef_Top_Left_DiagonalDown_Shooting_Frame0, TD_B_1_02
  dw TD_T_1_08, SamusTileDef_Bottom_DiagonalDown_Standing_Frame0

TA_09:
  dw TD_T_2_00, TD_B_2_00
  dw TD_T_2_01, TD_B_2_01
  dw TD_T_2_02, TD_B_2_02
  dw TD_T_2_03, TD_B_2_03
  dw TD_T_2_04, TD_B_2_04
  dw TD_T_2_05, TD_B_2_05
  dw TD_T_2_06, TD_B_2_06
  dw TD_T_2_07, TD_B_2_07
  dw TD_T_2_08, TD_B_2_08
  dw TD_T_2_09, TD_B_2_09

TA_0A:
  dw TD_T_2_0A, TD_B_2_00
  dw TD_T_2_0B, TD_B_2_01
  dw TD_T_2_0C, TD_B_2_02
  dw TD_T_2_0D, TD_B_2_03
  dw TD_T_2_0E, TD_B_2_04
  dw TD_T_2_0F, TD_B_2_05
  dw TD_T_2_10, TD_B_2_06
  dw TD_T_2_11, TD_B_2_07
  dw TD_T_2_12, TD_B_2_08
  dw TD_T_2_13, TD_B_2_09

TA_0B:
TA_0C:
  dw TD_T_2_1A, TD_B_2_00
  dw TD_T_2_1B, TD_B_2_01
  dw TD_T_2_1C, TD_B_2_02
  dw TD_T_2_1C, TD_B_2_03
  dw TD_T_2_1B, TD_B_2_04
  dw TD_T_2_1A, TD_B_2_05
  dw TD_T_2_1B, TD_B_2_06
  dw TD_T_2_1C, TD_B_2_07
  dw TD_T_2_1C, TD_B_2_08
  dw TD_T_2_1B, TD_B_2_09

TA_0F:
TA_10:
  dw TD_T_2_14, TD_B_2_00
  dw TD_T_2_15, TD_B_2_01
  dw TD_T_2_16, TD_B_2_02
  dw TD_T_2_16, TD_B_2_03
  dw TD_T_2_15, TD_B_2_04
  dw TD_T_2_14, TD_B_2_05
  dw TD_T_2_15, TD_B_2_06
  dw TD_T_2_16, TD_B_2_07
  dw TD_T_2_16, TD_B_2_08
  dw TD_T_2_15, TD_B_2_09

TA_11:
TA_12:
  dw TD_T_2_17, TD_B_2_00
  dw TD_T_2_18, TD_B_2_01
  dw TD_T_2_19, TD_B_2_02
  dw TD_T_2_19, TD_B_2_03
  dw TD_T_2_18, TD_B_2_04
  dw TD_T_2_17, TD_B_2_05
  dw TD_T_2_18, TD_B_2_06
  dw TD_T_2_19, TD_B_2_07
  dw TD_T_2_19, TD_B_2_08
  dw TD_T_2_18, TD_B_2_09

TA_13:
TA_51:
TA_67:
TA_EC:
TA_EE:
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Right_Forward_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_14:
TA_52:
TA_68:
TA_BA:
TA_BC:
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Left_Forward_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_15:
TA_2B:
TA_ED:
  dw SamusTileDef_Top_Right_Up_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Right_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Right_Up_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Right_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Right_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Right_Up_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_16:
TA_2C:
TA_BB:
  dw SamusTileDef_Top_Left_Up_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Left_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Left_Up_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Left_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Left_Up_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Left_Up_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_17:
TA_2D:
TA_EF:
  dw SamusTileDef_Top_Right_Down_MidAir_Frame0, SamusTileDef_Bottom_Down_MidAir_Frame0
  dw SamusTileDef_Top_Right_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Right_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Right_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Right_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Right_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1

TA_18:
TA_2E:
TA_BD:
  dw SamusTileDef_Top_Left_Down_MidAir_Frame0, SamusTileDef_Bottom_Down_MidAir_Frame0
  dw SamusTileDef_Top_Left_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Left_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Left_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Left_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1
  dw SamusTileDef_Top_Left_Down_MidAir_Frame1, SamusTileDef_Bottom_Down_MidAir_Frame1

TA_19:
TA_1A:
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00

TA_1B:
TA_1C:
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00

TA_1D:
TA_1E:
TA_31:
TA_3F:
TA_79:
TA_7B:
TA_7D:
TA_7F:
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_04, TD_B_0_00
  dw TD_T_B_03, TD_B_0_00
  dw TD_T_B_0A, TD_B_0_00
  dw TD_T_B_09, TD_B_0_00
  dw TD_T_B_08, TD_B_0_00
  dw TD_T_B_07, TD_B_0_00
  dw TD_T_B_06, TD_B_0_00

TA_25:
TA_26:
TA_BF:
TA_C0:
  dw TD_T_1_03, TD_B_1_06
  dw TD_T_1_03, TD_B_1_06

TA_27:
TA_28:
TA_B4:
TA_B5:
  dw TD_T_1_00, TD_B_1_07

TA_29:
  dw TD_T_4_00, TD_B_4_04
  dw TD_T_4_01, TD_B_4_03
  dw TD_T_4_02, TD_B_4_05
  dw TD_T_4_00, TD_B_0_00
  dw TD_T_4_00, TD_B_0_00
  dw TD_T_4_01, TD_B_4_03
  dw TD_T_2_06, TD_B_4_04

TA_2A:
  dw TD_T_4_00, TD_B_4_04
  dw TD_T_4_01, TD_B_4_03
  dw TD_T_4_02, TD_B_4_05
  dw TD_T_4_00, TD_B_0_00
  dw TD_T_4_00, TD_B_0_00
  dw TD_T_4_01, TD_B_4_03
  dw TD_T_2_12, TD_B_4_04

TA_2F:
TA_30:
  dw TD_T_1_03, TD_B_4_07
  dw TD_T_1_03, TD_B_4_07

TA_37:
TA_38:
  dw TD_T_B_00, TD_B_0_00
  dw TD_T_B_02, TD_B_0_00

TA_3D:
TA_3E:
  dw TD_T_B_03, TD_B_0_00
  dw TD_T_B_01, TD_B_0_00

TA_1F:
TA_32:
TA_40:
TA_41:
TA_7A:
TA_7C:
TA_7E:
TA_80:
  dw TD_T_B_06, TD_B_0_00
  dw TD_T_B_07, TD_B_0_00
  dw TD_T_B_08, TD_B_0_00
  dw TD_T_B_09, TD_B_0_00
  dw TD_T_B_0A, TD_B_0_00
  dw TD_T_B_03, TD_B_0_00
  dw TD_T_B_04, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00

TA_43:
TA_44:
  dw TD_T_1_03, TD_B_1_0A
  dw TD_T_1_03, TD_B_1_0A

TA_49:
TA_4A:
  dw TD_T_1_00, TD_B_2_0A
  dw TD_T_1_01, TD_B_2_0B
  dw TD_T_1_02, TD_B_2_0C
  dw TD_T_1_00, TD_B_2_0D
  dw TD_T_1_01, TD_B_2_0E
  dw TD_T_1_02, TD_B_2_0F

TA_4D:
TA_F0:
  dw TD_T_2_03, TD_B_2_00
  dw TD_T_2_02, TD_B_4_01
  dw TD_T_2_03, TD_B_4_02
  dw TD_T_2_04, TD_B_4_02
  dw TD_T_2_05, TD_B_4_03
  dw TD_T_2_06, TD_B_4_04

TA_4E:
TA_BE:
  dw TD_T_2_0D, TD_B_2_00
  dw TD_T_2_0C, TD_B_4_01
  dw TD_T_2_0D, TD_B_4_02
  dw TD_T_2_0E, TD_B_4_02
  dw TD_T_2_0F, TD_B_4_03
  dw TD_T_2_12, TD_B_4_04

TA_4F:
TA_50:
  dw TD_T_3_0E, TD_B_3_06
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_4_02, TD_B_4_05

TA_53:
TA_54:
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00

TA_69:
TA_6D:
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Right_DiagonalUp_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_6A:
TA_6E:
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Left_DiagonalUp_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_6B:
TA_6F:
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Right_DiagonalDown_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_6C:
TA_70:
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame0
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame1
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame2, SamusTileDef_Bottom_MidAir_Frame2
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame3
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame1, SamusTileDef_Bottom_MidAir_Frame4
  dw SamusTileDef_Top_Left_DiagonalDown_MidAir_Frame0, SamusTileDef_Bottom_MidAir_Frame5

TA_71:
TA_72:
TA_F3:
TA_F4:
  dw TD_T_1_04, TD_B_1_08

TA_73:
TA_74:
TA_B6:
TA_B7:
TA_F5:
TA_F6:
  dw TD_T_1_08, TD_B_1_09

TA_75:
TA_76:
  dw TD_T_1_04, TD_B_2_0A
  dw TD_T_1_05, TD_B_2_0B
  dw TD_T_1_06, TD_B_2_0C
  dw TD_T_1_04, TD_B_2_0D
  dw TD_T_1_05, TD_B_2_0E
  dw TD_T_1_06, TD_B_2_0F

TA_77:
TA_78:
  dw TD_T_1_08, TD_B_2_0A
  dw TD_T_1_09, TD_B_2_0B
  dw TD_T_1_0A, TD_B_2_0C
  dw TD_T_1_08, TD_B_2_0D
  dw TD_T_1_09, TD_B_2_0E
  dw TD_T_1_0A, TD_B_2_0F

TA_81:
TA_82:
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00

TA_83:
  dw TD_T_3_09, TD_B_3_00
  dw TD_T_3_0A, TD_B_3_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04

TA_84:
  dw TD_T_3_0B, TD_B_3_00
  dw TD_T_3_0C, TD_B_3_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_01, TD_B_0_00
  dw TD_T_3_02, TD_B_0_00
  dw TD_T_3_03, TD_B_0_00
  dw TD_T_3_04, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_05, TD_B_0_00
  dw TD_T_3_06, TD_B_0_00
  dw TD_T_3_07, TD_B_0_00
  dw TD_T_3_08, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_00, TD_B_0_00
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04
  dw TD_T_3_05, TD_B_3_01
  dw TD_T_3_06, TD_B_3_01
  dw TD_T_3_07, TD_B_3_02
  dw TD_T_3_08, TD_B_3_02
  dw TD_T_3_05, TD_B_3_03
  dw TD_T_3_06, TD_B_3_03
  dw TD_T_3_07, TD_B_3_04
  dw TD_T_3_08, TD_B_3_04

TA_85:
TA_86:
TA_F1:
TA_F2:
  dw TD_T_1_0C, TD_B_1_08
  dw TD_T_1_0C, TD_B_1_08

TA_87:
TA_88:
  dw TD_T_1_03, TD_B_4_07
  dw TD_T_1_03, TD_B_4_07

TA_8B:
TA_8C:
TA_C1:
TA_C2:
  dw TD_T_1_0F, TD_B_1_06
  dw TD_T_1_0F, TD_B_1_06

TA_8D:
TA_8E:
TA_C3:
TA_C4:
  dw TD_T_1_0B, TD_B_1_06
  dw TD_T_1_0B, TD_B_1_06

TA_8F:
TA_90:
TA_93:
TA_94:
  dw TD_T_1_0F, TD_B_4_07
  dw TD_T_1_0F, TD_B_4_07

TA_91:
TA_92:
TA_95:
TA_96:
  dw TD_T_1_0B, TD_B_4_07
  dw TD_T_1_0B, TD_B_4_07

TA_97:
TA_98:
  dw TD_T_1_0F, TD_B_1_0A
  dw TD_T_1_0F, TD_B_1_0A

TA_99:
TA_9A:
  dw TD_T_1_0B, TD_B_1_0A
  dw TD_T_1_0B, TD_B_1_0A

TA_9C:
TA_9D:
  dw TD_T_1_07, TD_B_1_06
  dw TD_T_1_07, TD_B_1_06

TA_9E:
TA_9F:
TA_A0:
TA_A1:
  dw TD_T_1_07, TD_B_4_07
  dw TD_T_1_07, TD_B_4_07

TA_A2:
TA_A3:
  dw TD_T_1_07, TD_B_1_0A
  dw TD_T_1_07, TD_B_1_0A

TA_B2:
  dw TD_T_6_00, TD_B_6_00
  dw TD_T_6_01, TD_B_6_01
  dw TD_T_6_02, TD_B_6_02
  dw TD_T_6_03, TD_B_6_03
  dw TD_T_6_04, TD_B_6_04
  dw TD_T_6_05, TD_B_6_05
  dw TD_T_6_06, TD_B_6_06
  dw TD_T_6_07, TD_B_6_07
  dw TD_T_6_08, TD_B_6_08
  dw TD_T_6_09, TD_B_6_09
  dw TD_T_6_0A, TD_B_6_0A
  dw TD_T_6_0B, TD_B_6_0B
  dw TD_T_6_0C, TD_B_6_0C
  dw TD_T_6_0D, TD_B_6_0D
  dw TD_T_6_0E, TD_B_6_0E
  dw TD_T_6_0F, TD_B_6_0F
  dw TD_T_6_00, TD_B_6_00
  dw TD_T_6_01, TD_B_6_01
  dw TD_T_6_02, TD_B_6_02
  dw TD_T_6_03, TD_B_6_03
  dw TD_T_6_04, TD_B_6_04
  dw TD_T_6_05, TD_B_6_05
  dw TD_T_6_06, TD_B_6_06
  dw TD_T_6_07, TD_B_6_07
  dw TD_T_6_08, TD_B_6_08
  dw TD_T_6_09, TD_B_6_09
  dw TD_T_6_0A, TD_B_6_0A
  dw TD_T_6_0B, TD_B_6_0B
  dw TD_T_6_0C, TD_B_6_0C
  dw TD_T_6_0D, TD_B_6_0D
  dw TD_T_6_0E, TD_B_6_0E
  dw TD_T_6_0F, TD_B_6_0F
  dw TD_T_6_00, TD_B_6_10
  dw TD_T_6_01, TD_B_6_11
  dw TD_T_6_02, TD_B_6_12
  dw TD_T_6_03, TD_B_6_13
  dw TD_T_6_04, TD_B_6_14
  dw TD_T_6_05, TD_B_6_15
  dw TD_T_6_06, TD_B_6_16
  dw TD_T_6_07, TD_B_6_17
  dw TD_T_6_08, TD_B_6_18
  dw TD_T_6_09, TD_B_6_19
  dw TD_T_6_0A, TD_B_6_1A
  dw TD_T_6_0B, TD_B_6_1B
  dw TD_T_6_0C, TD_B_6_1C
  dw TD_T_6_0D, TD_B_6_1D
  dw TD_T_6_0E, TD_B_6_1E
  dw TD_T_6_0F, TD_B_6_1F
  dw TD_T_6_00, TD_B_6_10
  dw TD_T_6_01, TD_B_6_11
  dw TD_T_6_02, TD_B_6_12
  dw TD_T_6_03, TD_B_6_13
  dw TD_T_6_04, TD_B_6_14
  dw TD_T_6_05, TD_B_6_15
  dw TD_T_6_06, TD_B_6_16
  dw TD_T_6_07, TD_B_6_17
  dw TD_T_6_08, TD_B_6_18
  dw TD_T_6_09, TD_B_6_19
  dw TD_T_6_0A, TD_B_6_1A
  dw TD_T_6_0B, TD_B_6_1B
  dw TD_T_6_0C, TD_B_6_1C
  dw TD_T_6_0D, TD_B_6_1D
  dw TD_T_6_0E, TD_B_6_1E
  dw TD_T_6_0F, TD_B_6_1F
  dw TD_T_6_00, TD_B_6_00
  dw TD_T_6_00, TD_B_4_05

TA_B3:
  dw TD_T_6_10, TD_B_6_00
  dw TD_T_6_1F, TD_B_6_0F
  dw TD_T_6_1E, TD_B_6_0E
  dw TD_T_6_1D, TD_B_6_0D
  dw TD_T_6_1C, TD_B_6_0C
  dw TD_T_6_1B, TD_B_6_0B
  dw TD_T_6_1A, TD_B_6_0A
  dw TD_T_6_19, TD_B_6_09
  dw TD_T_6_18, TD_B_6_08
  dw TD_T_6_17, TD_B_6_07
  dw TD_T_6_16, TD_B_6_06
  dw TD_T_6_15, TD_B_6_05
  dw TD_T_6_14, TD_B_6_04
  dw TD_T_6_13, TD_B_6_03
  dw TD_T_6_12, TD_B_6_02
  dw TD_T_6_11, TD_B_6_01
  dw TD_T_6_10, TD_B_6_00
  dw TD_T_6_1F, TD_B_6_0F
  dw TD_T_6_1E, TD_B_6_0E
  dw TD_T_6_1D, TD_B_6_0D
  dw TD_T_6_1C, TD_B_6_0C
  dw TD_T_6_1B, TD_B_6_0B
  dw TD_T_6_1A, TD_B_6_0A
  dw TD_T_6_19, TD_B_6_09
  dw TD_T_6_18, TD_B_6_08
  dw TD_T_6_17, TD_B_6_07
  dw TD_T_6_16, TD_B_6_06
  dw TD_T_6_15, TD_B_6_05
  dw TD_T_6_14, TD_B_6_04
  dw TD_T_6_13, TD_B_6_03
  dw TD_T_6_12, TD_B_6_02
  dw TD_T_6_11, TD_B_6_01
  dw TD_T_6_10, TD_B_6_10
  dw TD_T_6_1F, TD_B_6_1F
  dw TD_T_6_1E, TD_B_6_1E
  dw TD_T_6_1D, TD_B_6_1D
  dw TD_T_6_1C, TD_B_6_1C
  dw TD_T_6_1B, TD_B_6_1B
  dw TD_T_6_1A, TD_B_6_1A
  dw TD_T_6_19, TD_B_6_19
  dw TD_T_6_18, TD_B_6_18
  dw TD_T_6_17, TD_B_6_17
  dw TD_T_6_16, TD_B_6_16
  dw TD_T_6_15, TD_B_6_15
  dw TD_T_6_14, TD_B_6_14
  dw TD_T_6_13, TD_B_6_13
  dw TD_T_6_12, TD_B_6_12
  dw TD_T_6_11, TD_B_6_11
  dw TD_T_6_10, TD_B_6_10
  dw TD_T_6_1F, TD_B_6_1F
  dw TD_T_6_1E, TD_B_6_1E
  dw TD_T_6_1D, TD_B_6_1D
  dw TD_T_6_1C, TD_B_6_1C
  dw TD_T_6_1B, TD_B_6_1B
  dw TD_T_6_1A, TD_B_6_1A
  dw TD_T_6_19, TD_B_6_19
  dw TD_T_6_18, TD_B_6_18
  dw TD_T_6_17, TD_B_6_17
  dw TD_T_6_16, TD_B_6_16
  dw TD_T_6_15, TD_B_6_15
  dw TD_T_6_14, TD_B_6_14
  dw TD_T_6_13, TD_B_6_13
  dw TD_T_6_12, TD_B_6_12
  dw TD_T_6_11, TD_B_6_11
  dw TD_T_6_10, TD_B_6_00
  dw TD_T_6_10, TD_B_4_05

TA_B8:
  dw TD_T_4_03, TD_B_4_08

TA_B9:
  dw TD_T_4_04, TD_B_4_09

TA_C7:
TA_C8:
  dw TD_T_3_0D, TD_B_3_05
  dw TD_T_3_0E, TD_B_3_06
  dw TD_T_3_0F, TD_B_3_07
  dw TD_T_3_10, TD_B_3_08

TA_C9:
TA_CD:
  dw TD_T_3_11, TD_B_3_09
  dw TD_T_3_12, TD_B_3_0A

TA_CA:
TA_CE:
  dw TD_T_3_13, TD_B_3_09
  dw TD_T_3_14, TD_B_3_0A

TA_CB:
TA_CC:
  dw TD_T_3_15, TD_B_3_0B
  dw TD_T_3_16, TD_B_3_0C

TA_D3:
TA_D4:
  dw TD_T_B_03, TD_B_7_00
  dw TD_T_B_01, TD_B_7_01
  dw TD_T_7_00, TD_B_7_02
  dw TD_T_B_01, TD_B_7_02
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_7_00, TD_B_7_02
  dw TD_T_7_01, TD_B_7_02
  dw TD_T_7_02, TD_B_7_02
  dw TD_T_7_01, TD_B_7_02
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_00, TD_B_7_01
  dw TD_T_B_00, TD_B_7_00
  dw TD_T_3_00, TD_B_3_00

TA_D7:
TA_D8:
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_01, TD_B_0_00
  dw TD_T_B_01, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00

TA_DB:
TA_DC:
  dw TD_T_1_00, TD_B_1_00
  dw TD_T_0_0B, TD_B_0_00
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0C, TD_B_0_02

TA_DD:
TA_DE:
  dw TD_T_0_0C, TD_B_0_02
  dw TD_T_0_0B, TD_B_0_00

TA_55:
TA_56:
TA_E0:
TA_E1:
  dw TD_T_1_0C, TD_B_1_0B
  dw TD_T_1_0C, TD_B_1_0B

TA_57:
TA_58:
TA_E2:
TA_E3:
  dw TD_T_1_04, TD_B_1_0B
  dw TD_T_1_04, TD_B_1_0B

TA_59:
TA_5A:
TA_E4:
TA_E5:
  dw TD_T_1_08, TD_B_1_0B
  dw TD_T_1_08, TD_B_1_0B

TA_4B:
TA_4C:
TA_A4:
TA_A5:
TA_A6:
TA_A7:
TA_E6:
TA_E7:
  dw TD_T_1_00, TD_B_1_0B
  dw TD_T_1_00, TD_B_1_0B

TA_E8:
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_01, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_5_00, TD_B_5_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_5_02, TD_B_5_02
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_04, TD_B_1_0B

TA_E9:
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_01, TD_B_0_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_3_00, TD_B_3_00
  dw TD_T_5_03, TD_B_1_07
  dw TD_T_5_00, TD_B_5_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_5_02, TD_B_5_02
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_5_03, TD_B_1_07
  dw TD_T_5_04, TD_B_1_0B
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_5_03, TD_B_1_07
  dw TD_T_5_04, TD_B_1_0B
  dw TD_T_5_03, TD_B_1_07
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_01, TD_B_5_01

TA_EA:
TA_EB:
  dw TD_T_5_00, TD_B_5_00
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_5_02, TD_B_5_02
  dw TD_T_5_01, TD_B_5_01
  dw TD_T_B_05, TD_B_0_00
  dw TD_T_5_04, TD_B_1_0B

TA_5B:
  dw SamusTileDef_Top_Right_Skidding_Frame0, SamusTileDef_Bottom_Skidding_Frame0
  dw 0, 0

  dw SamusTileDef_Top_Right_Armed_Skidding_Frame0, SamusTileDef_Bottom_Skidding_Frame0

TA_5C:
  dw SamusTileDef_Top_Left_Skidding_Frame0, SamusTileDef_Bottom_Skidding_Frame0
  dw 0, 0

  dw SamusTileDef_Top_Left_ArmedSkidding_Frame0, SamusTileDef_Bottom_Skidding_Frame0

TA_5D:
  dw SamusTileDef_Top_Right_UsingAnElevator_Frame0, SamusTileDef_Bottom_UsingAnElevator_Frame0
  dw TD_T_0_00, TD_B_0_00
  dw SamusTileDef_Top_UsingAnElevator_Frame2, SamusTileDef_Bottom_UsingAnElevator_Frame2
  dw 0, 0
  dw 0, 0

  dw SamusTileDef_Top_UsingAnElevator_Frame2, SamusTileDef_Bottom_UsingAnElevator_Frame2

TA_5E:
  dw SamusTileDef_Top_Left_UsingAnElevator_Frame0, SamusTileDef_Bottom_UsingAnElevator_Frame0
  dw TD_T_0_00, TD_B_0_00
  dw SamusTileDef_Top_UsingAnElevator_Frame2, SamusTileDef_Bottom_UsingAnElevator_Frame2
  dw 0, 0
  dw 0, 0

  dw SamusTileDef_Top_UsingAnElevator_Frame2, SamusTileDef_Bottom_UsingAnElevator_Frame2

TA_5F:
  dw SamusTileDef_Top_HangingOnLedge_Frame0, SamusTileDef_Bottom_HangingOnLedge_Frame0
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw SamusTileDef_Top_HangingOnLedge_Frame2, SamusTileDef_Bottom_HangingOnLedge_Frame2

  dw SamusTileDef_Top_HangingOnLedge_Frame3, SamusTileDef_Bottom_HangingOnLedge_Frame3
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw SamusTileDef_Top_HangingOnLedge_Frame5, SamusTileDef_Bottom_HangingOnLedge_Frame5
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw 0, 0
  dw 0, 0

  dw SamusTileDef_Top_Right_ReadyToJump_HangingOnLedge_Frame0, SamusTileDef_Bottom_Right_ReadyToJump_HangingOnLedge_Frame0

TA_60:
  dw SamusTileDef_Top_HangingOnLedge_Frame0, SamusTileDef_Bottom_HangingOnLedge_Frame0
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw SamusTileDef_Top_HangingOnLedge_Frame2, SamusTileDef_Bottom_HangingOnLedge_Frame2

  dw SamusTileDef_Top_HangingOnLedge_Frame3, SamusTileDef_Bottom_HangingOnLedge_Frame3
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw SamusTileDef_Top_HangingOnLedge_Frame5, SamusTileDef_Bottom_HangingOnLedge_Frame5
  dw SamusTileDef_Top_HangingOnLedge_Frame1, SamusTileDef_Bottom_HangingOnLedge_Frame1
  dw 0, 0
  dw 0, 0

  dw SamusTileDef_Top_Left_ReadyToJump_HangingOnLedge_Frame0, SamusTileDef_Bottom_Left_ReadyToJump_HangingOnLedge_Frame0

TA_61:
TA_62:
  dw SamusTileDef_Top_HangingOnLedge_Frame0, SamusTileDef_Bottom_HangingOnLedge_Frame0
  dw SamusTileDef_Top_PullingYourselfUpFromHanging_Frame1, SamusTileDef_Bottom_PullingYourselfUpFromHanging_Frame1
  dw SamusTileDef_Top_PullingYourselfUpFromHanging_Frame2, SamusTileDef_Bottom_PullingYourselfUpFromHanging_Frame2

TA_63:
  dw SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame0, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame0
  dw SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame1, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame1
  dw SamusTileDef_Top_Right_PullingYourselfForwardFromHanging_Frame2, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame2
  dw SamusTileDef_Top_Right_PullingYourselfForwardFromHanging_Frame3, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame3

TA_64:
  dw SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame0, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame0
  dw SamusTileDef_Top_PullingYourselfForwardFromHanging_Frame1, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame1
  dw SamusTileDef_Top_Left_PullingYourselfForwardFromHanging_Frame2, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame2
  dw SamusTileDef_Top_Left_PullingYourselfForwardFromHanging_Frame3, SamusTileDef_Bottom_PullingYourselfForwardFromHanging_Frame3

TA_65:
TA_66:
  dw SamusTileDef_Top_PullingYourselfIntoMorphBallTunnel_Frame0, 0

%padSafe($92D7D3)

org $92D91E
%padSafe($92ED24)

org $9BE300
B_6_10: incbin "gfx_original/B_6_10.gfx" ; $9BE300
B_6_11: incbin "gfx_original/B_6_11.gfx" ; $9BE400
B_6_12: incbin "gfx_original/B_6_12.gfx" ; $9BE500
B_6_13: incbin "gfx_original/B_6_13.gfx" ; $9BE600
B_6_14: incbin "gfx_original/B_6_14.gfx" ; $9BE700
B_6_15: incbin "gfx_original/B_6_15.gfx" ; $9BE800
B_6_16: incbin "gfx_original/B_6_16.gfx" ; $9BE900
B_6_17: incbin "gfx_original/B_6_17.gfx" ; $9BEA00
B_6_18: incbin "gfx_original/B_6_18.gfx" ; $9BEB00
B_6_19: incbin "gfx_original/B_6_19.gfx" ; $9BEC00
B_6_1A: incbin "gfx_original/B_6_1A.gfx" ; $9BED00
B_6_1B: incbin "gfx_original/B_6_1B.gfx" ; $9BEE00
B_6_1C: incbin "gfx_original/B_6_1C.gfx" ; $9BEF00
B_6_1D: incbin "gfx_original/B_6_1D.gfx" ; $9BF000
B_6_1E: incbin "gfx_original/B_6_1E.gfx" ; $9BF100
B_6_1F: incbin "gfx_original/B_6_1F.gfx" ; $9BF200
T_4_03: incbin "gfx_original/T_4_03.gfx" ; $9BF300
T_4_04: incbin "gfx_original/T_4_04.gfx" ; $9BF400
B_4_08: incbin "gfx_original/B_4_08.gfx" ; $9BF500
B_4_09: incbin "gfx_original/B_4_09.gfx" ; $9BF5A0
T_0_0B: incbin "gfx_original/T_0_0B.gfx" ; $9BF640
T_0_0C: incbin "gfx_original/T_0_0C.gfx" ; $9BF800
B_0_02: incbin "gfx_original/B_0_02.gfx" ; $9BFA00

org $9C8000
T_0_00: incbin "gfx_original/T_0_00.gfx" ; $9C8000
T_0_01: incbin "gfx_original/T_0_01.gfx" ; $9C8200
T_0_02: incbin "gfx_original/T_0_02.gfx" ; $9C8400
T_0_03: incbin "gfx_original/T_0_03.gfx" ; $9C8600
T_0_04: incbin "gfx_original/T_0_04.gfx" ; $9C8720
T_0_05: incbin "gfx_original/T_0_05.gfx" ; $9C8800
T_0_06: incbin "gfx_original/T_0_06.gfx" ; $9C8960
T_0_07: incbin "gfx_original/T_0_07.gfx" ; $9C8B40
T_0_08: incbin "gfx_original/T_0_08.gfx" ; $9C8C40
T_0_09: incbin "gfx_original/T_0_09.gfx" ; $9C8D80
T_0_0A: incbin "gfx_original/T_0_0A.gfx" ; $9C8EE0
B_0_00: incbin "gfx_original/B_0_00.gfx" ; $9C8FC0
B_0_01: incbin "gfx_original/B_0_01.gfx" ; $9C9000
T_1_00: incbin "gfx_original/T_1_00.gfx" ; $9C91C0
T_1_01: incbin "gfx_original/T_1_01.gfx" ; $9C93C0
T_1_02: incbin "gfx_original/T_1_02.gfx" ; $9C95C0
T_1_03: incbin "gfx_original/T_1_03.gfx" ; $9C97C0
T_1_04: incbin "gfx_original/T_1_04.gfx" ; $9C9980
T_1_05: incbin "gfx_original/T_1_05.gfx" ; $9C9B80
T_1_06: incbin "gfx_original/T_1_06.gfx" ; $9C9D80
T_1_07: incbin "gfx_original/T_1_07.gfx" ; $9C9F80
T_1_08: incbin "gfx_original/T_1_08.gfx" ; $9CA120
T_1_09: incbin "gfx_original/T_1_09.gfx" ; $9CA320
T_1_0A: incbin "gfx_original/T_1_0A.gfx" ; $9CA520
T_1_0B: incbin "gfx_original/T_1_0B.gfx" ; $9CA720
T_1_0C: incbin "gfx_original/T_1_0C.gfx" ; $9CA8A0
T_1_0D: incbin "gfx_original/T_1_0D.gfx" ; $9CAAA0
T_1_0E: incbin "gfx_original/T_1_0E.gfx" ; $9CACA0
T_1_0F: incbin "gfx_original/T_1_0F.gfx" ; $9CAEA0
T_1_10: incbin "gfx_original/T_1_10.gfx" ; $9CB0A0
B_1_00: incbin "gfx_original/B_1_00.gfx" ; $9CB2A0
B_1_01: incbin "gfx_original/B_1_01.gfx" ; $9CB420
B_1_02: incbin "gfx_original/B_1_02.gfx" ; $9CB5A0
B_1_03: incbin "gfx_original/B_1_03.gfx" ; $9CB720
B_1_04: incbin "gfx_original/B_1_04.gfx" ; $9CB8A0
B_1_05: incbin "gfx_original/B_1_05.gfx" ; $9CBA20
B_1_06: incbin "gfx_original/B_1_06.gfx" ; $9CBBA0
B_1_07: incbin "gfx_original/B_1_07.gfx" ; $9CBD20
B_1_08: incbin "gfx_original/B_1_08.gfx" ; $9CBE20
B_1_09: incbin "gfx_original/B_1_09.gfx" ; $9CBF20
B_1_0A: incbin "gfx_original/B_1_0A.gfx" ; $9CC020
B_1_0B: incbin "gfx_original/B_1_0B.gfx" ; $9CC0A0
T_B_00: incbin "gfx_original/T_B_00.gfx" ; $9CC1A0
T_B_01: incbin "gfx_original/T_B_01.gfx" ; $9CC2A0
T_B_02: incbin "gfx_original/T_B_02.gfx" ; $9CC3A0
T_B_03: incbin "gfx_original/T_B_03.gfx" ; $9CC420
T_B_04: incbin "gfx_original/T_B_04.gfx" ; $9CC4A0
T_B_05: incbin "gfx_original/T_B_05.gfx" ; $9CC520
T_B_06: incbin "gfx_original/T_B_06.gfx" ; $9CC5A0
T_B_07: incbin "gfx_original/T_B_07.gfx" ; $9CC620
T_B_08: incbin "gfx_original/T_B_08.gfx" ; $9CC6A0
T_B_09: incbin "gfx_original/T_B_09.gfx" ; $9CC720
T_B_0A: incbin "gfx_original/T_B_0A.gfx" ; $9CC7A0
T_2_00: incbin "gfx_original/T_2_00.gfx" ; $9CC820
T_2_01: incbin "gfx_original/T_2_01.gfx" ; $9CC900
T_2_02: incbin "gfx_original/T_2_02.gfx" ; $9CC9C0
T_2_03: incbin "gfx_original/T_2_03.gfx" ; $9CCAC0
T_2_04: incbin "gfx_original/T_2_04.gfx" ; $9CCBA0
T_2_05: incbin "gfx_original/T_2_05.gfx" ; $9CCC60
T_2_06: incbin "gfx_original/T_2_06.gfx" ; $9CCD20
T_2_07: incbin "gfx_original/T_2_07.gfx" ; $9CCDC0
T_2_08: incbin "gfx_original/T_2_08.gfx" ; $9CCE80
T_2_09: incbin "gfx_original/T_2_09.gfx" ; $9CCF40
T_2_0A: incbin "gfx_original/T_2_0A.gfx" ; $9CCFE0
T_2_0B: incbin "gfx_original/T_2_0B.gfx" ; $9CD080
T_2_0C: incbin "gfx_original/T_2_0C.gfx" ; $9CD120
T_2_0D: incbin "gfx_original/T_2_0D.gfx" ; $9CD1E0
T_2_0E: incbin "gfx_original/T_2_0E.gfx" ; $9CD2C0
T_2_0F: incbin "gfx_original/T_2_0F.gfx" ; $9CD380
T_2_10: incbin "gfx_original/T_2_10.gfx" ; $9CD420
T_2_11: incbin "gfx_original/T_2_11.gfx" ; $9CD4A0
T_2_12: incbin "gfx_original/T_2_12.gfx" ; $9CD560
T_2_13: incbin "gfx_original/T_2_13.gfx" ; $9CD620
T_2_14: incbin "gfx_original/T_2_14.gfx" ; $9CD6A0
T_2_15: incbin "gfx_original/T_2_15.gfx" ; $9CD8A0
T_2_16: incbin "gfx_original/T_2_16.gfx" ; $9CDAA0
T_2_17: incbin "gfx_original/T_2_17.gfx" ; $9CDCA0
T_2_18: incbin "gfx_original/T_2_18.gfx" ; $9CDEA0
T_2_19: incbin "gfx_original/T_2_19.gfx" ; $9CE0A0
T_2_1A: incbin "gfx_original/T_2_1A.gfx" ; $9CE2A0
T_2_1B: incbin "gfx_original/T_2_1B.gfx" ; $9CE4A0
T_2_1C: incbin "gfx_original/T_2_1C.gfx" ; $9CE6A0
B_2_00: incbin "gfx_original/B_2_00.gfx" ; $9CE8A0
B_2_01: incbin "gfx_original/B_2_01.gfx" ; $9CE940
B_2_02: incbin "gfx_original/B_2_02.gfx" ; $9CEA00
B_2_03: incbin "gfx_original/B_2_03.gfx" ; $9CEB00
B_2_04: incbin "gfx_original/B_2_04.gfx" ; $9CEC40
B_2_05: incbin "gfx_original/B_2_05.gfx" ; $9CED40
B_2_06: incbin "gfx_original/B_2_06.gfx" ; $9CEE00
B_2_07: incbin "gfx_original/B_2_07.gfx" ; $9CEEC0
B_2_08: incbin "gfx_original/B_2_08.gfx" ; $9CEFC0
B_2_09: incbin "gfx_original/B_2_09.gfx" ; $9CF100
B_2_0A: incbin "gfx_original/B_2_0A.gfx" ; $9CF200
B_2_0B: incbin "gfx_original/B_2_0B.gfx" ; $9CF300
B_2_0C: incbin "gfx_original/B_2_0C.gfx" ; $9CF400
B_2_0D: incbin "gfx_original/B_2_0D.gfx" ; $9CF500
B_2_0E: incbin "gfx_original/B_2_0E.gfx" ; $9CF600
B_2_0F: incbin "gfx_original/B_2_0F.gfx" ; $9CF700
T_3_00: incbin "gfx_original/T_3_00.gfx" ; $9CF800
T_3_01: incbin "gfx_original/T_3_01.gfx" ; $9CF940
T_3_02: incbin "gfx_original/T_3_02.gfx" ; $9CFB40
T_3_03: incbin "gfx_original/T_3_03.gfx" ; $9CFC40
T_3_04: incbin "gfx_original/T_3_04.gfx" ; $9CFE40

org $9D8000
T_3_09: incbin "gfx_original/T_3_09.gfx" ; $9D8000
T_3_0A: incbin "gfx_original/T_3_0A.gfx" ; $9D81C0
T_3_0B: incbin "gfx_original/T_3_0B.gfx" ; $9D82E0
T_3_0C: incbin "gfx_original/T_3_0C.gfx" ; $9D84A0
T_3_05: incbin "gfx_original/T_3_05.gfx" ; $9D85C0
T_3_06: incbin "gfx_original/T_3_06.gfx" ; $9D87C0
T_3_07: incbin "gfx_original/T_3_07.gfx" ; $9D89C0
T_3_08: incbin "gfx_original/T_3_08.gfx" ; $9D8BC0
T_3_0D: incbin "gfx_original/T_3_0D.gfx" ; $9D8DC0
T_3_0E: incbin "gfx_original/T_3_0E.gfx" ; $9D8F40
T_3_0F: incbin "gfx_original/T_3_0F.gfx" ; $9D9040
T_3_10: incbin "gfx_original/T_3_10.gfx" ; $9D9140
T_3_11: incbin "gfx_original/T_3_11.gfx" ; $9D9240
T_3_12: incbin "gfx_original/T_3_12.gfx" ; $9D9380
T_3_13: incbin "gfx_original/T_3_13.gfx" ; $9D94C0
T_3_14: incbin "gfx_original/T_3_14.gfx" ; $9D9600
T_3_15: incbin "gfx_original/T_3_15.gfx" ; $9D9720
T_3_16: incbin "gfx_original/T_3_16.gfx" ; $9D98A0
B_3_00: incbin "gfx_original/B_3_00.gfx" ; $9D9A20
B_3_01: incbin "gfx_original/B_3_01.gfx" ; $9D9B20
B_3_02: incbin "gfx_original/B_3_02.gfx" ; $9D9D20
B_3_03: incbin "gfx_original/B_3_03.gfx" ; $9D9F20
B_3_04: incbin "gfx_original/B_3_04.gfx" ; $9DA120
B_3_09: incbin "gfx_original/B_3_09.gfx" ; $9DA320
B_3_0A: incbin "gfx_original/B_3_0A.gfx" ; $9DA420
B_3_0B: incbin "gfx_original/B_3_0B.gfx" ; $9DA540
B_3_0C: incbin "gfx_original/B_3_0C.gfx" ; $9DA640
T_4_00: incbin "gfx_original/T_4_00.gfx" ; $9DA740
T_4_01: incbin "gfx_original/T_4_01.gfx" ; $9DA8C0
T_4_02: incbin "gfx_original/T_4_02.gfx" ; $9DAA00
B_4_00: incbin "gfx_original/B_4_00.gfx" ; $9DAB40
B_4_01: incbin "gfx_original/B_4_01.gfx" ; $9DAC20
B_4_02: incbin "gfx_original/B_4_02.gfx" ; $9DAD00
B_4_03: incbin "gfx_original/B_4_03.gfx" ; $9DADA0
B_4_04: incbin "gfx_original/B_4_04.gfx" ; $9DAE60
B_4_05: incbin "gfx_original/B_4_05.gfx" ; $9DAF60
B_4_06: incbin "gfx_original/B_4_06.gfx" ; $9DB060
B_4_07: incbin "gfx_original/B_4_07.gfx" ; $9DB160
T_5_00: incbin "gfx_original/T_5_00.gfx" ; $9DB220
T_5_01: incbin "gfx_original/T_5_01.gfx" ; $9DB3E0
T_5_02: incbin "gfx_original/T_5_02.gfx" ; $9DB5A0
T_5_03: incbin "gfx_original/T_5_03.gfx" ; $9DB760
T_5_04: incbin "gfx_original/T_5_04.gfx" ; $9DB860
B_5_00: incbin "gfx_original/B_5_00.gfx" ; $9DB9A0
B_5_01: incbin "gfx_original/B_5_01.gfx" ; $9DBAA0
B_5_02: incbin "gfx_original/B_5_02.gfx" ; $9DBBA0
T_7_00: incbin "gfx_original/T_7_00.gfx" ; $9DBCA0
T_7_01: incbin "gfx_original/T_7_01.gfx" ; $9DBDE0
T_7_02: incbin "gfx_original/T_7_02.gfx" ; $9DBF20
B_7_00: incbin "gfx_original/B_7_00.gfx" ; $9DC060
B_7_01: incbin "gfx_original/B_7_01.gfx" ; $9DC0E0
B_7_02: incbin "gfx_original/B_7_02.gfx" ; $9DC2E0
T_6_00: incbin "gfx_original/T_6_00.gfx" ; $9DC4E0
T_6_01: incbin "gfx_original/T_6_01.gfx" ; $9DC5E0
T_6_02: incbin "gfx_original/T_6_02.gfx" ; $9DC6E0
T_6_03: incbin "gfx_original/T_6_03.gfx" ; $9DC7E0
T_6_04: incbin "gfx_original/T_6_04.gfx" ; $9DC8E0
T_6_05: incbin "gfx_original/T_6_05.gfx" ; $9DC9E0
T_6_06: incbin "gfx_original/T_6_06.gfx" ; $9DCAE0
T_6_07: incbin "gfx_original/T_6_07.gfx" ; $9DCBE0
T_6_08: incbin "gfx_original/T_6_08.gfx" ; $9DCCE0
T_6_09: incbin "gfx_original/T_6_09.gfx" ; $9DCDE0
T_6_0A: incbin "gfx_original/T_6_0A.gfx" ; $9DCEE0
T_6_0B: incbin "gfx_original/T_6_0B.gfx" ; $9DCFE0
T_6_0C: incbin "gfx_original/T_6_0C.gfx" ; $9DD0E0
T_6_0D: incbin "gfx_original/T_6_0D.gfx" ; $9DD1E0
T_6_0E: incbin "gfx_original/T_6_0E.gfx" ; $9DD2E0
T_6_0F: incbin "gfx_original/T_6_0F.gfx" ; $9DD3E0
T_6_10: incbin "gfx_original/T_6_10.gfx" ; $9DD4E0
T_6_11: incbin "gfx_original/T_6_11.gfx" ; $9DD660
T_6_12: incbin "gfx_original/T_6_12.gfx" ; $9DD7E0
T_6_13: incbin "gfx_original/T_6_13.gfx" ; $9DD960
T_6_14: incbin "gfx_original/T_6_14.gfx" ; $9DDAE0
T_6_15: incbin "gfx_original/T_6_15.gfx" ; $9DDC60
T_6_16: incbin "gfx_original/T_6_16.gfx" ; $9DDDE0
T_6_17: incbin "gfx_original/T_6_17.gfx" ; $9DDF60
T_6_18: incbin "gfx_original/T_6_18.gfx" ; $9DE0E0
T_6_19: incbin "gfx_original/T_6_19.gfx" ; $9DE260
T_6_1A: incbin "gfx_original/T_6_1A.gfx" ; $9DE3E0
T_6_1B: incbin "gfx_original/T_6_1B.gfx" ; $9DE560
T_6_1C: incbin "gfx_original/T_6_1C.gfx" ; $9DE6E0
T_6_1D: incbin "gfx_original/T_6_1D.gfx" ; $9DE860
T_6_1E: incbin "gfx_original/T_6_1E.gfx" ; $9DE9E0
T_6_1F: incbin "gfx_original/T_6_1F.gfx" ; $9DEB60
B_6_00: incbin "gfx_original/B_6_00.gfx" ; $9DECE0
B_6_01: incbin "gfx_original/B_6_01.gfx" ; $9DEDE0
B_6_02: incbin "gfx_original/B_6_02.gfx" ; $9DEEE0
B_6_03: incbin "gfx_original/B_6_03.gfx" ; $9DEFE0
B_6_04: incbin "gfx_original/B_6_04.gfx" ; $9DF0E0
B_6_05: incbin "gfx_original/B_6_05.gfx" ; $9DF1E0
B_6_06: incbin "gfx_original/B_6_06.gfx" ; $9DF2E0
B_6_07: incbin "gfx_original/B_6_07.gfx" ; $9DF3E0
B_6_08: incbin "gfx_original/B_6_08.gfx" ; $9DF4E0
B_6_09: incbin "gfx_original/B_6_09.gfx" ; $9DF5E0
B_6_0A: incbin "gfx_original/B_6_0A.gfx" ; $9DF6E0
B_6_0B: incbin "gfx_original/B_6_0B.gfx" ; $9DF7E0
B_6_0C: incbin "gfx_original/B_6_0C.gfx" ; $9DF8E0
B_6_0D: incbin "gfx_original/B_6_0D.gfx" ; $9DF9E0
B_6_0E: incbin "gfx_original/B_6_0E.gfx" ; $9DFAE0
B_6_0F: incbin "gfx_original/B_6_0F.gfx" ; $9DFBE0
