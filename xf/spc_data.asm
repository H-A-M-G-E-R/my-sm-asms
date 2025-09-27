incsrc "spc_defines.asm"

org $E0A004 ; all the musics and swappable samples go here
{
SongPointers:
  dl Song03
  dl Song06
  dl Song09
  dl Song0C
  dl Song0F
  dl Song12
  dl Song15
  dl Song18
  dl Song1B
  dl Song1E
  dl Song21
  dl Song24
  dl Song27
  dl Song2A
  dl Song2D
  dl Song30
  dl Song33
  dl Song36
  dl Song39
  dl Song3C
  dl Song3F
  dl Song42
  dl Song45
  dl Song48
  dl Song4B
  dl Song4E
  dl Song51
  dl Song54
  dl Song57
  dl Song5A
  dl Song5D
  dl Song60
  dl Song63
  dl Song66
  dl Song69
  dl Song6C
  dl Song6F
  dl Song72
  dl Song75
  dl Song78
  dl Song7B
  dl Song7E
  dl Song81
  dl Song84
  dl Song87
  dl Song8A
  dl Song8D
  dl Song90
  dl Song3C
  dl Song96
  dl Song99
  dl Song9C
  dl Song9F
  dl SongA2
  dl SongA5
  dl SongA8

SampleTransferDefPointers:
  dl SampleTransferDef03
  dl SampleTransferDef06
  dl SampleTransferDef09
  dl SampleTransferDef0C
  dl SampleTransferDef0F
  dl SampleTransferDef12
  dl SampleTransferDef15
  dl SampleTransferDef18
  dl SampleTransferDef1B
  dl SampleTransferDef1E
  dl SampleTransferDef21
  dl SampleTransferDef24
  dl SampleTransferDef27
  dl SampleTransferDef2A
  dl SampleTransferDef2D
  dl SampleTransferDef30
  dl SampleTransferDef33
  dl SampleTransferDef36
  dl SampleTransferDef39
  dl SampleTransferDef3C
  dl SampleTransferDef3F
  dl SampleTransferDef42
  dl SampleTransferDef45
  dl SampleTransferDef48
  dl SampleTransferDef4B
  dl SampleTransferDef4E
  dl SampleTransferDef51
  dl SampleTransferDef54
  dl SampleTransferDef57
  dl SampleTransferDef5A
  dl SampleTransferDef5D
  dl SampleTransferDef60
  dl SampleTransferDef63
  dl SampleTransferDef66
  dl SampleTransferDef69
  dl SampleTransferDef6C
  dl SampleTransferDef6F
  dl SampleTransferDef72
  dl SampleTransferDef75
  dl SampleTransferDef78
  dl SampleTransferDef7B
  dl SampleTransferDef7E
  dl SampleTransferDef81
  dl SampleTransferDef84
  dl SampleTransferDef87
  dl SampleTransferDef8A
  dl SampleTransferDef8D
  dl SampleTransferDef90
  dl SampleTransferDef3C
  dl SampleTransferDef96
  dl SampleTransferDef99
  dl SampleTransferDef9C
  dl SampleTransferDef9F
  dl SampleTransferDefA2
  dl SampleTransferDefA5
  dl SampleTransferDefA8

SampleTransferDef03:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_2e1822edc659430c60ca1e822fefddc2
  dl Sample_a2c12bb7be2f47aee50de0c1f31959fb
  dw 0

SampleTransferDef06:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_8a3327ee61035255db2da136287c76a7
  dl Sample_c2ea4842d6ecf1dd81b09409f7a94929
  dl Sample_48972f703281c1d2c6c9c1ccdd3c3f4b
  dl Sample_2e1822edc659430c60ca1e822fefddc2
  dl Sample_3841b4150856deb8b8ee01fe35f497c3
  dl Sample_3ac9c767cae870ea42b9e05be3922f7a
  dl Sample_d7963d68e1320cda200a7e7a03d2e4a4
  dl Sample_9c53668a1b04c36d5bf80793049ec6c7
  dw 0

SampleTransferDef09:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_e252324e422454908ea0de0565f41e0d
  dl Sample_91eb0ad40cbb8edb59d1a8eb274bb61a
  dl Sample_923155b9c5895807692728099ebe975a
  dw 0

SampleTransferDef0C:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_7da9d5ac86382b33e38c59e7bbc02397
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_06fd166d0071d3476bebf3ce0d1a39ea
  dl Sample_9b3e33be9ebdd07b2922da92c7899ad8
  dl Sample_ae8e1de965071e6c9210ea1074e4ae53
  dl Sample_1c61c1d2173db51733ec9ee9638cd11f
  dl Sample_8946233beaf2ee2126e98ae1b12a6be5
  dl Sample_2822bad39b87fb8c53e54a49b8a625f0
  dw 0

SampleTransferDef0F:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_13e81bb8014411c52017120ee1c36250
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_ad67229b04d0d78fc5b618649e1045ce
  dl Sample_fac2c1c52b2a74bef3744c7b5eabc4d0
  dl Sample_16ce10a533ccd74ee3344332de770cec
  dl Sample_9bfc0e2aad37b40de39f503a14d4104d
  dl Sample_787b5f8b3014c08b47c0c0bad88c046f
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_c1125a8f0cdd64461116ab45700cf085
  dl Sample_c434725161d61d00367792494d4c6be3
  dw 0

SampleTransferDef12:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_70088be2c42db8f26aa5a6014a2e9398
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_d7596b127b18d933aa6356888257f6c3
  dl Sample_2822bad39b87fb8c53e54a49b8a625f0
  dw 0

SampleTransferDef15:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_0b39d7122c124a818f41f92a03061323
  dl Sample_70088be2c42db8f26aa5a6014a2e9398
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_b649c95c8307da16268e475b83060216
  dl Sample_2822bad39b87fb8c53e54a49b8a625f0
  dw 0

SampleTransferDef18:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_9397e4a518ad76499f1187b12a2171fe
  dl Sample_e298086596e36db363badb019772c047
  dl Sample_53702d7ee57dd2aba4eb7253fe64a3fd
  dl Sample_04ff79c5f0bfe47aa51f852ac2a1c870
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_bd72d694035b51beffc72510b314fd19
  dl Sample_2f3350d5fcd8bf5eb5f2ab5c16532226
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_da1530af58462df8494ebdc079f396b3
  dw 0

SampleTransferDef1B:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_88532f336dd55c900a0a826201019b57
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_ef25c5b6dec0eb9284501ed4e7b4825a
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_aecff530da367e51e6090043494c92bb
  dl Sample_600f26d0533ebd1132a02b2323d23eb6
  dw 0

SampleTransferDef1E:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_acff56f4282c90b04ed0178987166b41
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dw 0

SampleTransferDef21:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_ad838049f259a4f1171d73e2a9ff0c30
  dl Sample_297f19f5a80928febb2ded9fc02251b9
  dl Sample_9281b998d07d46507b9aed19337b9a6c
  dl Sample_b76c6f0440c68cfc41d66ec60f326c7b
  dw 0

SampleTransferDef24:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_ad67229b04d0d78fc5b618649e1045ce
  dl Sample_9a82d2d7c4923f5e8db69a308f25f46c
  dl Sample_da1530af58462df8494ebdc079f396b3
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_601a4b08468b4095e62779faacd92271
  dw 0

SampleTransferDef27:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_287e6c92b0fc050e3a18a21d8cdba209
  dl Sample_5d8ae2e34af3ae5f446adba2e3b84921
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_bbe78ea792aaca4886c0c6c4ebaee1a0
  dl Sample_ecfd273f3f42fe8a26eaca051537db5c
  dl Sample_53ed5b4572e6bf095c6df514da78df38
  dw 0

SampleTransferDef2A:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_5d8ae2e34af3ae5f446adba2e3b84921
  dl Sample_70088be2c42db8f26aa5a6014a2e9398
  dw 0

SampleTransferDef2D:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_d7963d68e1320cda200a7e7a03d2e4a4
  dl Sample_8e7e20296fa60ac19d652807808fbf09
  dl Sample_bbe78ea792aaca4886c0c6c4ebaee1a0
  dl Sample_e252324e422454908ea0de0565f41e0d
  dl Sample_cc665d2b4c8c68a674a8053fe691bbeb
  dl Sample_641b15dcd55d0f5bb5d923c84c24935e
  dl Sample_1fba0d95f836fd29bbe39586e53ea1ec
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_76edbd93a18de2665ef477b5ed21ccb5
  dl Sample_0e021b8c900b6db8440abf3c3b172967
  dw 0

SampleTransferDef30:
  dw $A7A0-$9F80+!p_sampleDataEnd+$400
  dl Sample_0ed7268f6428f4963a5e49d58aeb71d8
  dl Sample_af748b56afa8489cc137e7360fafc840
  dw 0

SampleTransferDef33:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_13ba3399f8fb237a89b7617fdc3c5cc4
  dl Sample_5a91dbb457653ba13ad13f9a38fe5e66
  dl Sample_386914ec5f10e96351b23ca877f4b703
  dl Sample_791c11a320b992357fb30654bb72da96
  dl Sample_d789d8b4545d918b6564cc827ee4a348
  dl Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2
  dl Sample_6c080140dbee361c456c58572403fcbc
  dl Sample_2f3350d5fcd8bf5eb5f2ab5c16532226
  dl Sample_ed9f2b452e2b39d90ee8699eea59ace8
  dl Sample_fc0a703f3d90d9667c60e64cfe3d7cf9
  dl Sample_3d36472cfb337b1b0d660795cfb1ed72
  dl Sample_3d57fd039e821278013a5fed25bfebb7
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_3841b4150856deb8b8ee01fe35f497c3
  dw 0

SampleTransferDef36:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_ad838049f259a4f1171d73e2a9ff0c30
  dl Sample_dd8eb0200756dcaddca1a987abf10663
  dl Sample_ea7f73808eeb2fefd661660fe62f37df
  dl Sample_5fa965a87e3b8bc31d49910823b4d3bc
  dw 0

SampleTransferDef39:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_2264c24a6f5bdd42acc939287e1398fc
  dl Sample_0ca2e923494667f4c3a148f312b12259
  dl Sample_f092f99be4d94f2fe921fc8664977f59
  dw 0

SampleTransferDef3C:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_da187b6a41fbf48f10b461fc7ed0d3d5
  dl Sample_4ef89861ffb6c245a4bc3930d41b5fd1
  dw 0

SampleTransferDef3F:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_7cb606e75d0a3b2d32c0978334840e7f
  dl Sample_3158d932e85680f2a75081475266fc07
  dl Sample_c9c2f52f918b7ab6174640d5c71dc49e
  dl Sample_a9ba72fbff7f59996d83162d02c4f923
  dl Sample_d7b6254dac45a1d7ada6e6833ead52ab
  dl Sample_b5e5cef7ca2abea97e422651e8512a7a
  dl Sample_90e872822e8156c45348838e598067d6
  dw 0

SampleTransferDef42:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_f13a2fcb125ccc9286eea93787f20f50
  dl Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2
  dl Sample_14513002db7f6139db33682eaa96e6ea
  dl Sample_acc05dd87e50fa2a7b7fa318dedf761a
  dl Sample_c02d28bd6a3c8317afc00be24adec7a1
  dl Sample_2f3350d5fcd8bf5eb5f2ab5c16532226
  dl Sample_502b12d73ee0a0bfbddb6902a988f6ca
  dw 0

SampleTransferDef45:
  dw $A100-$9F80+!p_sampleDataEnd+$400
  dl Sample_b649c95c8307da16268e475b83060216
  dl Sample_339e2514032d4e1335bab88b6de80e48
  dl Sample_89767433c447228a2f21fe0b1a2442f0
  dl Sample_616aa02c04ba9f2f2ff88b6fd62db5c2
  dl Sample_2822bad39b87fb8c53e54a49b8a625f0
  dl Sample_65de485131683021221ec0135ce51596
  dw 0

SampleTransferDef48:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_2f5692cd107acfd64888f4a4ede244af
  dl Sample_06fd166d0071d3476bebf3ce0d1a39ea
  dl Sample_cc665d2b4c8c68a674a8053fe691bbeb
  dl Sample_b0eb97e2caf1f746ab3b70688acbc862
  dl Sample_e81fe2bdf6473308304597a422a5f73d
  dl Sample_37b309a75099915cabe221b8f1189840
  dl Sample_c3b3f93e0b2d53bce48ae87cc36af9c7
  dl Sample_4648f271e3145cbeb3be74154c98bbc9
  dl Sample_14513002db7f6139db33682eaa96e6ea
  dl Sample_3841b4150856deb8b8ee01fe35f497c3
  dl Sample_f4b98a6e87a1b968270ab79d84403d4d
  dw 0

SampleTransferDef4B:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_5ff955130ef19a6c13a90e09bc4e4119
  dl Sample_33870d7b9fb0ae9a8ea3b27ae6560230
  dl Sample_2927a7e5bdb79ab7228c58ba371e3514
  dl Sample_878ea10e42cb89660db51cb44f1c0fc8
  dw 0

SampleTransferDef4E:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_ef6b054116253361d675341632d6a4d7
  dl Sample_2860ee6b527846bcbba36e8c75458083
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_5ff955130ef19a6c13a90e09bc4e4119
  dl Sample_33870d7b9fb0ae9a8ea3b27ae6560230
  dl Sample_e298086596e36db363badb019772c047
  dw 0

SampleTransferDef51:
  dw $A000-$9F80+!p_sampleDataEnd+$400
  dl Sample_487ca836f684610d37adb9f2e8f5d41b
  dl Sample_af748b56afa8489cc137e7360fafc840
  dw 0

SampleTransferDef54:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_ddd487c9bae3c9e4cd5f013218704614
  dl Sample_64ca79c82f5165d33781b6a33c15a0e0
  dl Sample_235717614e1e5674ae0ef641c422feaf
  dw 0

SampleTransferDef57:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_aa8041956e85a1b08499011624d59627
  dw 0

SampleTransferDef5A:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_d391220b3132f7ed7be1121ada000db3
  dl Sample_8a3f4ee7cee8ce18a51d1d096404eda5
  dw 0

SampleTransferDef5D:
  dw $A400-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_588ad9d77b6e7f35ca37ba2344ca43b4
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_bbe78ea792aaca4886c0c6c4ebaee1a0
  dl Sample_97aa7fd0c57111b1e2e3da056c59f9cf
  dl Sample_53ed5b4572e6bf095c6df514da78df38
  dw 0

SampleTransferDef60:
  dw $A180-$9F80+!p_sampleDataEnd+$400
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_f4b98a6e87a1b968270ab79d84403d4d
  dl Sample_1d2bbf84c25c871bc6e3176bc24870a4
  dl Sample_4648f271e3145cbeb3be74154c98bbc9
  dl Sample_43bc4f28d5162b86489cbd3dca2e7af7
  dl Sample_d789d8b4545d918b6564cc827ee4a348
  dl Sample_14513002db7f6139db33682eaa96e6ea
  dl Sample_fe57609e4a845c8073dd4012e9b2f49e
  dl Sample_73a339645833dc5c4a7c268916578efa
  dl Sample_d76a1e2bcbc403bc9360d154294dce53
  dw 0

SampleTransferDef63:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_5f3245a505aef0cab8f6817493b927cf
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_2f5692cd107acfd64888f4a4ede244af
  dl Sample_f4b98a6e87a1b968270ab79d84403d4d
  dl Sample_aa687b385eec6ee98f906c710aefcc97
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_2eed29c8e1dfc1aebc7a9bacb053a9e8
  dl Sample_face02e10e86fbbc2227ec86184e85fa
  dw 0

SampleTransferDef66:
  dw $B080-$9F80+!p_sampleDataEnd+$400
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_e5230fbebb607c8b32fe2959e0902347
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_14513002db7f6139db33682eaa96e6ea
  dl Sample_4648f271e3145cbeb3be74154c98bbc9
  dl Sample_37b309a75099915cabe221b8f1189840
  dl Sample_c3b3f93e0b2d53bce48ae87cc36af9c7
  dl Sample_923155b9c5895807692728099ebe975a
  dl Sample_aecff530da367e51e6090043494c92bb
  dl Sample_ff587f76a1c839d23cc16a649c7acb24
  dw 0

SampleTransferDef69:
  dw $AF00-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_4d73b345c85aeb62add04a28d133408c
  dl Sample_352d4efbf024c62ef8ef1771b6d75c88
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_2f5692cd107acfd64888f4a4ede244af
  dl Sample_281d7b2cb8917f9fc3d3ad5071dad747
  dl Sample_e81fe2bdf6473308304597a422a5f73d
  dl Sample_2046070ed30e9aaf047b5b496a0a3fcb
  dl Sample_43bc4f28d5162b86489cbd3dca2e7af7
  dl Sample_d789d8b4545d918b6564cc827ee4a348
  dw 0

SampleTransferDef6C:
  dw $A080-$9F80+!p_sampleDataEnd+$400
  dl Sample_ad838049f259a4f1171d73e2a9ff0c30
  dl Sample_f1b3383538467c6d9585a3089f2bff09
  dl Sample_878ea10e42cb89660db51cb44f1c0fc8
  dl Sample_3d03eefd2e3912bacdc75766d9f89c08
  dl Sample_ecfd273f3f42fe8a26eaca051537db5c
  dl Sample_fc0a703f3d90d9667c60e64cfe3d7cf9
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_da1530af58462df8494ebdc079f396b3
  dl Sample_e4ec38024ef64ca23f8bb5aecc52c3d6
  dl Sample_ae8e1de965071e6c9210ea1074e4ae53
  dl Sample_eefb57a8c45455334318ad6ef8bcf9dd
  dl Sample_bdd3ed2bb8600fa03669172d5130595d
  dl Sample_3ce56ddc06d6279f0865433c167956a4
  dw 0

SampleTransferDef6F:
  dw $A780-$9F80+!p_sampleDataEnd+$400
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_850852da5c349c3afa42df4f4e7b4c95
  dl Sample_f57926b4e3fe7bb2e54deb5edc499437
  dl Sample_b0408218d46b86bf204427f3abb52c5a
  dl Sample_8ffbbac2da03c55c193cbf36b1e520db
  dl Sample_641b15dcd55d0f5bb5d923c84c24935e
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_601a4b08468b4095e62779faacd92271
  dl Sample_8b80f8c8dfc034a9b10dbf6c96fe1714
  dw 0

SampleTransferDef72:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_84c6d5b414c72aecd879951c3b874549
  dl Sample_9b8c27a5d3be46e264a8815e398d9659
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_ae8e1de965071e6c9210ea1074e4ae53
  dl Sample_9b3e33be9ebdd07b2922da92c7899ad8
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_601a4b08468b4095e62779faacd92271
  dl Sample_0e021b8c900b6db8440abf3c3b172967
  dl Sample_da1530af58462df8494ebdc079f396b3
  dw 0

SampleTransferDef75:
  dw $A020-$9F80+!p_sampleDataEnd+$400
  dl Sample_1005d6ea2c154036604cf230b7eea4d9
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_91eb0ad40cbb8edb59d1a8eb274bb61a
  dl Sample_fbc65a1e54ed6d31ed29ca43776621ec
  dl Sample_4842013d9a2677e216e5246cd8c8e97e
  dl Sample_26fe057d696c01031f983274537acf76
  dw 0

SampleTransferDef78:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_070774228d4d8b89d9ca1ed89dad328a
  dl Sample_ef25c5b6dec0eb9284501ed4e7b4825a
  dl Sample_ef6b054116253361d675341632d6a4d7
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_952149bda8c138e34f1b41d599c4243f
  dl Sample_791c11a320b992357fb30654bb72da96
  dl Sample_f4ee4d04d4846fb534a4e559e83cbdf5
  dw 0

SampleTransferDef7B:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_ef25c5b6dec0eb9284501ed4e7b4825a
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_b0365c4b45f439074b99be7b0579837a
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dw 0

SampleTransferDef7E:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_0a8fa0e3956011649dbbdef01c7f5e4b
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_88532f336dd55c900a0a826201019b57
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_e252324e422454908ea0de0565f41e0d
  dl Sample_d7963d68e1320cda200a7e7a03d2e4a4
  dw 0

SampleTransferDef81:
  dw $8B00-$9F80+!p_sampleDataEnd+$400
  dl Sample_2264c24a6f5bdd42acc939287e1398fc
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_91eb0ad40cbb8edb59d1a8eb274bb61a
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_441d4eac476cad49850f2c9cc81a9aec
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_0ca2e923494667f4c3a148f312b12259
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_153af0a14dfa01b26538333fd4f5e4c1
  dl Sample_3841b4150856deb8b8ee01fe35f497c3
  dl Sample_d7963d68e1320cda200a7e7a03d2e4a4
  dw 0

SampleTransferDef84:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_ae8e1de965071e6c9210ea1074e4ae53
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_af748b56afa8489cc137e7360fafc840
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_966096e36e1cb2d211f0ca91ee2d390c
  dw 0

SampleTransferDef87:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_0ca2e923494667f4c3a148f312b12259
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_278f07e8e1ffdb96da9b899da90d9f9c
  dl Sample_797af8119579c0ab291d42bd5b294da9
  dl Sample_43c5b6101fd297c7af5a76e6733f4f0c
  dl Sample_bdd3ed2bb8600fa03669172d5130595d
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_0e021b8c900b6db8440abf3c3b172967
  dw 0

SampleTransferDef8A:
  dw $AF00-$9F80+!p_sampleDataEnd+$400
  dl Sample_89767433c447228a2f21fe0b1a2442f0
  dl Sample_25c097763664d2404536cb7b102bf640
  dl Sample_3da45843d5164e6fc5c3df7c986e81a7
  dl Sample_a2c12bb7be2f47aee50de0c1f31959fb
  dl Sample_677e567a4a0df275278c7795a4c46039
  dl Sample_0e021b8c900b6db8440abf3c3b172967
  dw 0

SampleTransferDef8D:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_3f20d9deb006a2c155ae0ceb4f2311e9
  dl Sample_bd72d694035b51beffc72510b314fd19
  dl Sample_9f3d2a485736a0b959a04bd44c0cf47b
  dl Sample_1fa5a00c1e9f4720443b33cef349150f
  dl Sample_3429be383b9039b6b0406cc1633cfca3
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_002b224c6729825252e7f39a13633f64
  dl Sample_3ac9c767cae870ea42b9e05be3922f7a
  dw 0

SampleTransferDef90:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_2e1822edc659430c60ca1e822fefddc2
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dl Sample_48972f703281c1d2c6c9c1ccdd3c3f4b
  dl Sample_278f07e8e1ffdb96da9b899da90d9f9c
  dl Sample_287e6c92b0fc050e3a18a21d8cdba209
  dw 0

SampleTransferDef96:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_2e1822edc659430c60ca1e822fefddc2
  dw 0

SampleTransferDef99:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_0ca2e923494667f4c3a148f312b12259
  dl Sample_24f2776ccd9c9315c85798b6b5e78a00
  dw 0

SampleTransferDef9C:
  dw $A000-$9F80+!p_sampleDataEnd+$400
  dl Sample_14ec84e26b9ea0857ad958b5f843bc1b
  dl Sample_0405f8f2e0514b6efa2920554df53d02
  dl Sample_f2ce9891671b6e98e6ec82c98b1cd1ab
  dl Sample_af748b56afa8489cc137e7360fafc840
  dw 0

SampleTransferDef9F:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_a0d92a11a8faee666248670e88d6ae24
  dl Sample_05f2645aa9e3762f8319fae3ba515fa8
  dl Sample_8f70ef4287d6cd29a14683e1aae3ab7d
  dw 0

SampleTransferDefA2:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_86d8f75e64b863de0c8b6c6a32a5afd7
  dl Sample_97a785af7dee81db8c178ac9bfc223b5
  dl Sample_282615d1464fdb0623504ef86c5de66b
  dl Sample_287e6c92b0fc050e3a18a21d8cdba209
  dl Sample_9b8c27a5d3be46e264a8815e398d9659
  dl Sample_5d8ae2e34af3ae5f446adba2e3b84921
  dl Sample_73cb64f395dad0784c958d0ed478f686
  dl Sample_53ed5b4572e6bf095c6df514da78df38
  dw 0

SampleTransferDefA5:
  dw $9F80-$9F80+!p_sampleDataEnd+$400
  dl Sample_da187b6a41fbf48f10b461fc7ed0d3d5
  dl Sample_5d8ae2e34af3ae5f446adba2e3b84921
  dl Sample_287e6c92b0fc050e3a18a21d8cdba209
  dl Sample_831b1863540f328224dbf6d79fb349dd
  dl Sample_8ffbbac2da03c55c193cbf36b1e520db
  dl Sample_cdc82f868779a0f3f8c85b6ddb4b7b53
  dl Sample_a607137ab681c65e6d6d9e7c667ad495
  dl Sample_e196c2a53620d4573a72e4dfd4255104
  dl Sample_d7b6254dac45a1d7ada6e6833ead52ab
  dl Sample_ac5a192f01928e331bdd5d5ad51b0b23
  dl Sample_21ce681da14ac9d581f19b02776116a9
  dw 0

SampleTransferDefA8:
  dw $A800-$9F80+!p_sampleDataEnd+$400
  dl Sample_ff8b37e06639ca6f4c8983178b73c75f
  dl Sample_850852da5c349c3afa42df4f4e7b4c95
  dl Sample_2f5692cd107acfd64888f4a4ede244af
  dl Sample_c02d28bd6a3c8317afc00be24adec7a1
  dl Sample_e5230fbebb607c8b32fe2959e0902347
  dl Sample_cc665d2b4c8c68a674a8053fe691bbeb
  dl Sample_5ff955130ef19a6c13a90e09bc4e4119
  dl Sample_8c1f02134ac346c8f14eb82059b8ef02
  dl Sample_04ff79c5f0bfe47aa51f852ac2a1c870
  dw 0

SwappableSamplePointers:
  dl SwappableSample00
  dl SwappableSample01
  dl SwappableSample02
  dl SwappableSample03
  dl SwappableSample04
  dl SwappableSample05
  dl SwappableSample06
  dl SwappableSample07
  dl SwappableSample08
  dl SwappableSample09
  dl SwappableSample0A
  dl SwappableSample0B
  dl SwappableSample0C
  dl SwappableSample0D
  dl SwappableSample0E
  dl SwappableSample0F
  dl SwappableSample10
  dl SwappableSample11
  dl SwappableSample12
  dl SwappableSample13
  dl SwappableSample14
  dl SwappableSample15
  dl SwappableSample16
  dl SwappableSample17
  dl SwappableSample18
  dl SwappableSample19
  dl SwappableSample1A
  dl SwappableSample1B
  dl SwappableSample1C
  dl SwappableSample1D
  dl SwappableSample1E
  dl SwappableSample1F
  dl SwappableSample20
  dl 0
  dl SwappableSample22
  dl SwappableSample23
  dl SwappableSample24
  dl SwappableSample25
  dl SwappableSample26
  dl SwappableSample27
  dl SwappableSample28
  dl SwappableSample29

check bankcross off

Song00: incbin "music/00.nspc"
Song03: incbin "music/03.nspc"
Song06: incbin "music/06.nspc"
Song09: incbin "music/09.nspc"
Song0C: incbin "music/0C.nspc"
Song0F: incbin "music/0F.nspc"
Song12: incbin "music/12.nspc"
Song15: incbin "music/15.nspc"
Song18: incbin "music/18.nspc"
Song1B: incbin "music/1B.nspc"
Song1E: incbin "music/1E.nspc"
Song21: incbin "music/21.nspc"
Song24: incbin "music/24.nspc"
Song27: incbin "music/27.nspc"
Song2A: incbin "music/2A.nspc"
Song2D: incbin "music/2D.nspc"
Song30: incbin "music/30.nspc"
Song33: incbin "music/33.nspc"
Song36: incbin "music/36.nspc"
Song39: incbin "music/39.nspc"
Song3C: incbin "music/3C.nspc"
Song3F: incbin "music/3F.nspc"
Song42: incbin "music/42.nspc"
Song45: incbin "music/45.nspc"
Song48: incbin "music/48.nspc"
Song4B: incbin "music/4B.nspc"
Song4E: incbin "music/4E.nspc"
Song51: incbin "music/51.nspc"
Song54: incbin "music/54.nspc"
Song57: incbin "music/57.nspc"
Song5A: incbin "music/5A.nspc"
Song5D: incbin "music/5D.nspc"
Song60: incbin "music/60.nspc"
Song63: incbin "music/63.nspc"
Song66: incbin "music/66.nspc"
Song69: incbin "music/69.nspc"
Song6C: incbin "music/6C.nspc"
Song6F: incbin "music/6F.nspc"
Song72: incbin "music/72.nspc"
Song75: incbin "music/75.nspc"
Song78: incbin "music/78.nspc"
Song7B: incbin "music/7B.nspc"
Song7E: incbin "music/7E.nspc"
Song81: incbin "music/81.nspc"
Song84: incbin "music/84.nspc"
Song87: incbin "music/87.nspc"
Song8A: incbin "music/8A.nspc"
Song8D: incbin "music/8D.nspc"
Song90: incbin "music/90.nspc"
Song96: incbin "music/96.nspc"
Song99: incbin "music/99.nspc"
Song9C: incbin "music/9C.nspc"
Song9F: incbin "music/9F.nspc"
SongA2: incbin "music/A2.nspc"
SongA5: incbin "music/A5.nspc"
SongA8: incbin "music/A8.nspc"

Sample_2e1822edc659430c60ca1e822fefddc2: dw filesize("music/Sample_2e1822edc659430c60ca1e822fefddc2.brr") : incbin "music/Sample_2e1822edc659430c60ca1e822fefddc2.brr"
Sample_a2c12bb7be2f47aee50de0c1f31959fb: dw filesize("music/Sample_a2c12bb7be2f47aee50de0c1f31959fb.brr") : incbin "music/Sample_a2c12bb7be2f47aee50de0c1f31959fb.brr"
Sample_8a3327ee61035255db2da136287c76a7: dw filesize("music/Sample_8a3327ee61035255db2da136287c76a7.brr") : incbin "music/Sample_8a3327ee61035255db2da136287c76a7.brr"
Sample_c2ea4842d6ecf1dd81b09409f7a94929: dw filesize("music/Sample_c2ea4842d6ecf1dd81b09409f7a94929.brr") : incbin "music/Sample_c2ea4842d6ecf1dd81b09409f7a94929.brr"
Sample_48972f703281c1d2c6c9c1ccdd3c3f4b: dw filesize("music/Sample_48972f703281c1d2c6c9c1ccdd3c3f4b.brr") : incbin "music/Sample_48972f703281c1d2c6c9c1ccdd3c3f4b.brr"
Sample_3841b4150856deb8b8ee01fe35f497c3: dw filesize("music/Sample_3841b4150856deb8b8ee01fe35f497c3.brr") : incbin "music/Sample_3841b4150856deb8b8ee01fe35f497c3.brr"
Sample_3ac9c767cae870ea42b9e05be3922f7a: dw filesize("music/Sample_3ac9c767cae870ea42b9e05be3922f7a.brr") : incbin "music/Sample_3ac9c767cae870ea42b9e05be3922f7a.brr"
Sample_d7963d68e1320cda200a7e7a03d2e4a4: dw filesize("music/Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr") : incbin "music/Sample_d7963d68e1320cda200a7e7a03d2e4a4.brr"
Sample_9c53668a1b04c36d5bf80793049ec6c7: dw filesize("music/Sample_9c53668a1b04c36d5bf80793049ec6c7.brr") : incbin "music/Sample_9c53668a1b04c36d5bf80793049ec6c7.brr"
Sample_24f2776ccd9c9315c85798b6b5e78a00: dw filesize("music/Sample_24f2776ccd9c9315c85798b6b5e78a00.brr") : incbin "music/Sample_24f2776ccd9c9315c85798b6b5e78a00.brr"
Sample_002b224c6729825252e7f39a13633f64: dw filesize("music/Sample_002b224c6729825252e7f39a13633f64.brr") : incbin "music/Sample_002b224c6729825252e7f39a13633f64.brr"
Sample_e252324e422454908ea0de0565f41e0d: dw filesize("music/Sample_e252324e422454908ea0de0565f41e0d.brr") : incbin "music/Sample_e252324e422454908ea0de0565f41e0d.brr"
Sample_91eb0ad40cbb8edb59d1a8eb274bb61a: dw filesize("music/Sample_91eb0ad40cbb8edb59d1a8eb274bb61a.brr") : incbin "music/Sample_91eb0ad40cbb8edb59d1a8eb274bb61a.brr"
Sample_923155b9c5895807692728099ebe975a: dw filesize("music/Sample_923155b9c5895807692728099ebe975a.brr") : incbin "music/Sample_923155b9c5895807692728099ebe975a.brr"
Sample_3429be383b9039b6b0406cc1633cfca3: dw filesize("music/Sample_3429be383b9039b6b0406cc1633cfca3.brr") : incbin "music/Sample_3429be383b9039b6b0406cc1633cfca3.brr"
Sample_153af0a14dfa01b26538333fd4f5e4c1: dw filesize("music/Sample_153af0a14dfa01b26538333fd4f5e4c1.brr") : incbin "music/Sample_153af0a14dfa01b26538333fd4f5e4c1.brr"
Sample_7da9d5ac86382b33e38c59e7bbc02397: dw filesize("music/Sample_7da9d5ac86382b33e38c59e7bbc02397.brr") : incbin "music/Sample_7da9d5ac86382b33e38c59e7bbc02397.brr"
Sample_ff8b37e06639ca6f4c8983178b73c75f: dw filesize("music/Sample_ff8b37e06639ca6f4c8983178b73c75f.brr") : incbin "music/Sample_ff8b37e06639ca6f4c8983178b73c75f.brr"
Sample_06fd166d0071d3476bebf3ce0d1a39ea: dw filesize("music/Sample_06fd166d0071d3476bebf3ce0d1a39ea.brr") : incbin "music/Sample_06fd166d0071d3476bebf3ce0d1a39ea.brr"
Sample_9b3e33be9ebdd07b2922da92c7899ad8: dw filesize("music/Sample_9b3e33be9ebdd07b2922da92c7899ad8.brr") : incbin "music/Sample_9b3e33be9ebdd07b2922da92c7899ad8.brr"
Sample_ae8e1de965071e6c9210ea1074e4ae53: dw filesize("music/Sample_ae8e1de965071e6c9210ea1074e4ae53.brr") : incbin "music/Sample_ae8e1de965071e6c9210ea1074e4ae53.brr"
Sample_1c61c1d2173db51733ec9ee9638cd11f: dw filesize("music/Sample_1c61c1d2173db51733ec9ee9638cd11f.brr") : incbin "music/Sample_1c61c1d2173db51733ec9ee9638cd11f.brr"
Sample_8946233beaf2ee2126e98ae1b12a6be5: dw filesize("music/Sample_8946233beaf2ee2126e98ae1b12a6be5.brr") : incbin "music/Sample_8946233beaf2ee2126e98ae1b12a6be5.brr"
Sample_2822bad39b87fb8c53e54a49b8a625f0: dw filesize("music/Sample_2822bad39b87fb8c53e54a49b8a625f0.brr") : incbin "music/Sample_2822bad39b87fb8c53e54a49b8a625f0.brr"
Sample_13e81bb8014411c52017120ee1c36250: dw filesize("music/Sample_13e81bb8014411c52017120ee1c36250.brr") : incbin "music/Sample_13e81bb8014411c52017120ee1c36250.brr"
Sample_ad67229b04d0d78fc5b618649e1045ce: dw filesize("music/Sample_ad67229b04d0d78fc5b618649e1045ce.brr") : incbin "music/Sample_ad67229b04d0d78fc5b618649e1045ce.brr"
Sample_fac2c1c52b2a74bef3744c7b5eabc4d0: dw filesize("music/Sample_fac2c1c52b2a74bef3744c7b5eabc4d0.brr") : incbin "music/Sample_fac2c1c52b2a74bef3744c7b5eabc4d0.brr"
Sample_16ce10a533ccd74ee3344332de770cec: dw filesize("music/Sample_16ce10a533ccd74ee3344332de770cec.brr") : incbin "music/Sample_16ce10a533ccd74ee3344332de770cec.brr"
Sample_9bfc0e2aad37b40de39f503a14d4104d: dw filesize("music/Sample_9bfc0e2aad37b40de39f503a14d4104d.brr") : incbin "music/Sample_9bfc0e2aad37b40de39f503a14d4104d.brr"
Sample_787b5f8b3014c08b47c0c0bad88c046f: dw filesize("music/Sample_787b5f8b3014c08b47c0c0bad88c046f.brr") : incbin "music/Sample_787b5f8b3014c08b47c0c0bad88c046f.brr"
Sample_441d4eac476cad49850f2c9cc81a9aec: dw filesize("music/Sample_441d4eac476cad49850f2c9cc81a9aec.brr") : incbin "music/Sample_441d4eac476cad49850f2c9cc81a9aec.brr"
Sample_c1125a8f0cdd64461116ab45700cf085: dw filesize("music/Sample_c1125a8f0cdd64461116ab45700cf085.brr") : incbin "music/Sample_c1125a8f0cdd64461116ab45700cf085.brr"
Sample_c434725161d61d00367792494d4c6be3: dw filesize("music/Sample_c434725161d61d00367792494d4c6be3.brr") : incbin "music/Sample_c434725161d61d00367792494d4c6be3.brr"
Sample_70088be2c42db8f26aa5a6014a2e9398: dw filesize("music/Sample_70088be2c42db8f26aa5a6014a2e9398.brr") : incbin "music/Sample_70088be2c42db8f26aa5a6014a2e9398.brr"
Sample_d7596b127b18d933aa6356888257f6c3: dw filesize("music/Sample_d7596b127b18d933aa6356888257f6c3.brr") : incbin "music/Sample_d7596b127b18d933aa6356888257f6c3.brr"
Sample_0b39d7122c124a818f41f92a03061323: dw filesize("music/Sample_0b39d7122c124a818f41f92a03061323.brr") : incbin "music/Sample_0b39d7122c124a818f41f92a03061323.brr"
Sample_b649c95c8307da16268e475b83060216: dw filesize("music/Sample_b649c95c8307da16268e475b83060216.brr") : incbin "music/Sample_b649c95c8307da16268e475b83060216.brr"
Sample_9397e4a518ad76499f1187b12a2171fe: dw filesize("music/Sample_9397e4a518ad76499f1187b12a2171fe.brr") : incbin "music/Sample_9397e4a518ad76499f1187b12a2171fe.brr"
Sample_e298086596e36db363badb019772c047: dw filesize("music/Sample_e298086596e36db363badb019772c047.brr") : incbin "music/Sample_e298086596e36db363badb019772c047.brr"
Sample_53702d7ee57dd2aba4eb7253fe64a3fd: dw filesize("music/Sample_53702d7ee57dd2aba4eb7253fe64a3fd.brr") : incbin "music/Sample_53702d7ee57dd2aba4eb7253fe64a3fd.brr"
Sample_04ff79c5f0bfe47aa51f852ac2a1c870: dw filesize("music/Sample_04ff79c5f0bfe47aa51f852ac2a1c870.brr") : incbin "music/Sample_04ff79c5f0bfe47aa51f852ac2a1c870.brr"
Sample_bd72d694035b51beffc72510b314fd19: dw filesize("music/Sample_bd72d694035b51beffc72510b314fd19.brr") : incbin "music/Sample_bd72d694035b51beffc72510b314fd19.brr"
Sample_2f3350d5fcd8bf5eb5f2ab5c16532226: dw filesize("music/Sample_2f3350d5fcd8bf5eb5f2ab5c16532226.brr") : incbin "music/Sample_2f3350d5fcd8bf5eb5f2ab5c16532226.brr"
Sample_da1530af58462df8494ebdc079f396b3: dw filesize("music/Sample_da1530af58462df8494ebdc079f396b3.brr") : incbin "music/Sample_da1530af58462df8494ebdc079f396b3.brr"
Sample_88532f336dd55c900a0a826201019b57: dw filesize("music/Sample_88532f336dd55c900a0a826201019b57.brr") : incbin "music/Sample_88532f336dd55c900a0a826201019b57.brr"
Sample_ef25c5b6dec0eb9284501ed4e7b4825a: dw filesize("music/Sample_ef25c5b6dec0eb9284501ed4e7b4825a.brr") : incbin "music/Sample_ef25c5b6dec0eb9284501ed4e7b4825a.brr"
Sample_0a8fa0e3956011649dbbdef01c7f5e4b: dw filesize("music/Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr") : incbin "music/Sample_0a8fa0e3956011649dbbdef01c7f5e4b.brr"
Sample_aecff530da367e51e6090043494c92bb: dw filesize("music/Sample_aecff530da367e51e6090043494c92bb.brr") : incbin "music/Sample_aecff530da367e51e6090043494c92bb.brr"
Sample_600f26d0533ebd1132a02b2323d23eb6: dw filesize("music/Sample_600f26d0533ebd1132a02b2323d23eb6.brr") : incbin "music/Sample_600f26d0533ebd1132a02b2323d23eb6.brr"
Sample_acff56f4282c90b04ed0178987166b41: dw filesize("music/Sample_acff56f4282c90b04ed0178987166b41.brr") : incbin "music/Sample_acff56f4282c90b04ed0178987166b41.brr"
Sample_ad838049f259a4f1171d73e2a9ff0c30: dw filesize("music/Sample_ad838049f259a4f1171d73e2a9ff0c30.brr") : incbin "music/Sample_ad838049f259a4f1171d73e2a9ff0c30.brr"
Sample_297f19f5a80928febb2ded9fc02251b9: dw filesize("music/Sample_297f19f5a80928febb2ded9fc02251b9.brr") : incbin "music/Sample_297f19f5a80928febb2ded9fc02251b9.brr"
Sample_9281b998d07d46507b9aed19337b9a6c: dw filesize("music/Sample_9281b998d07d46507b9aed19337b9a6c.brr") : incbin "music/Sample_9281b998d07d46507b9aed19337b9a6c.brr"
Sample_b76c6f0440c68cfc41d66ec60f326c7b: dw filesize("music/Sample_b76c6f0440c68cfc41d66ec60f326c7b.brr") : incbin "music/Sample_b76c6f0440c68cfc41d66ec60f326c7b.brr"
Sample_9a82d2d7c4923f5e8db69a308f25f46c: dw filesize("music/Sample_9a82d2d7c4923f5e8db69a308f25f46c.brr") : incbin "music/Sample_9a82d2d7c4923f5e8db69a308f25f46c.brr"
Sample_601a4b08468b4095e62779faacd92271: dw filesize("music/Sample_601a4b08468b4095e62779faacd92271.brr") : incbin "music/Sample_601a4b08468b4095e62779faacd92271.brr"
Sample_287e6c92b0fc050e3a18a21d8cdba209: dw filesize("music/Sample_287e6c92b0fc050e3a18a21d8cdba209.brr") : incbin "music/Sample_287e6c92b0fc050e3a18a21d8cdba209.brr"
Sample_5d8ae2e34af3ae5f446adba2e3b84921: dw filesize("music/Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr") : incbin "music/Sample_5d8ae2e34af3ae5f446adba2e3b84921.brr"
Sample_bbe78ea792aaca4886c0c6c4ebaee1a0: dw filesize("music/Sample_bbe78ea792aaca4886c0c6c4ebaee1a0.brr") : incbin "music/Sample_bbe78ea792aaca4886c0c6c4ebaee1a0.brr"
Sample_ecfd273f3f42fe8a26eaca051537db5c: dw filesize("music/Sample_ecfd273f3f42fe8a26eaca051537db5c.brr") : incbin "music/Sample_ecfd273f3f42fe8a26eaca051537db5c.brr"
Sample_53ed5b4572e6bf095c6df514da78df38: dw filesize("music/Sample_53ed5b4572e6bf095c6df514da78df38.brr") : incbin "music/Sample_53ed5b4572e6bf095c6df514da78df38.brr"
Sample_8e7e20296fa60ac19d652807808fbf09: dw filesize("music/Sample_8e7e20296fa60ac19d652807808fbf09.brr") : incbin "music/Sample_8e7e20296fa60ac19d652807808fbf09.brr"
Sample_cc665d2b4c8c68a674a8053fe691bbeb: dw filesize("music/Sample_cc665d2b4c8c68a674a8053fe691bbeb.brr") : incbin "music/Sample_cc665d2b4c8c68a674a8053fe691bbeb.brr"
Sample_641b15dcd55d0f5bb5d923c84c24935e: dw filesize("music/Sample_641b15dcd55d0f5bb5d923c84c24935e.brr") : incbin "music/Sample_641b15dcd55d0f5bb5d923c84c24935e.brr"
Sample_1fba0d95f836fd29bbe39586e53ea1ec: dw filesize("music/Sample_1fba0d95f836fd29bbe39586e53ea1ec.brr") : incbin "music/Sample_1fba0d95f836fd29bbe39586e53ea1ec.brr"
Sample_677e567a4a0df275278c7795a4c46039: dw filesize("music/Sample_677e567a4a0df275278c7795a4c46039.brr") : incbin "music/Sample_677e567a4a0df275278c7795a4c46039.brr"
Sample_76edbd93a18de2665ef477b5ed21ccb5: dw filesize("music/Sample_76edbd93a18de2665ef477b5ed21ccb5.brr") : incbin "music/Sample_76edbd93a18de2665ef477b5ed21ccb5.brr"
Sample_0e021b8c900b6db8440abf3c3b172967: dw filesize("music/Sample_0e021b8c900b6db8440abf3c3b172967.brr") : incbin "music/Sample_0e021b8c900b6db8440abf3c3b172967.brr"
Sample_0ed7268f6428f4963a5e49d58aeb71d8: dw filesize("music/Sample_0ed7268f6428f4963a5e49d58aeb71d8.brr") : incbin "music/Sample_0ed7268f6428f4963a5e49d58aeb71d8.brr"
Sample_af748b56afa8489cc137e7360fafc840: dw filesize("music/Sample_af748b56afa8489cc137e7360fafc840.brr") : incbin "music/Sample_af748b56afa8489cc137e7360fafc840.brr"
Sample_13ba3399f8fb237a89b7617fdc3c5cc4: dw filesize("music/Sample_13ba3399f8fb237a89b7617fdc3c5cc4.brr") : incbin "music/Sample_13ba3399f8fb237a89b7617fdc3c5cc4.brr"
Sample_5a91dbb457653ba13ad13f9a38fe5e66: dw filesize("music/Sample_5a91dbb457653ba13ad13f9a38fe5e66.brr") : incbin "music/Sample_5a91dbb457653ba13ad13f9a38fe5e66.brr"
Sample_386914ec5f10e96351b23ca877f4b703: dw filesize("music/Sample_386914ec5f10e96351b23ca877f4b703.brr") : incbin "music/Sample_386914ec5f10e96351b23ca877f4b703.brr"
Sample_791c11a320b992357fb30654bb72da96: dw filesize("music/Sample_791c11a320b992357fb30654bb72da96.brr") : incbin "music/Sample_791c11a320b992357fb30654bb72da96.brr"
Sample_d789d8b4545d918b6564cc827ee4a348: dw filesize("music/Sample_d789d8b4545d918b6564cc827ee4a348.brr") : incbin "music/Sample_d789d8b4545d918b6564cc827ee4a348.brr"
Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2: dw filesize("music/Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2.brr") : incbin "music/Sample_d128c9d6ed2fcb2db7ca41c4d88d92f2.brr"
Sample_6c080140dbee361c456c58572403fcbc: dw filesize("music/Sample_6c080140dbee361c456c58572403fcbc.brr") : incbin "music/Sample_6c080140dbee361c456c58572403fcbc.brr"
Sample_ed9f2b452e2b39d90ee8699eea59ace8: dw filesize("music/Sample_ed9f2b452e2b39d90ee8699eea59ace8.brr") : incbin "music/Sample_ed9f2b452e2b39d90ee8699eea59ace8.brr"
Sample_fc0a703f3d90d9667c60e64cfe3d7cf9: dw filesize("music/Sample_fc0a703f3d90d9667c60e64cfe3d7cf9.brr") : incbin "music/Sample_fc0a703f3d90d9667c60e64cfe3d7cf9.brr"
Sample_3d36472cfb337b1b0d660795cfb1ed72: dw filesize("music/Sample_3d36472cfb337b1b0d660795cfb1ed72.brr") : incbin "music/Sample_3d36472cfb337b1b0d660795cfb1ed72.brr"
Sample_3d57fd039e821278013a5fed25bfebb7: dw filesize("music/Sample_3d57fd039e821278013a5fed25bfebb7.brr") : incbin "music/Sample_3d57fd039e821278013a5fed25bfebb7.brr"
Sample_8c1f02134ac346c8f14eb82059b8ef02: dw filesize("music/Sample_8c1f02134ac346c8f14eb82059b8ef02.brr") : incbin "music/Sample_8c1f02134ac346c8f14eb82059b8ef02.brr"
Sample_dd8eb0200756dcaddca1a987abf10663: dw filesize("music/Sample_dd8eb0200756dcaddca1a987abf10663.brr") : incbin "music/Sample_dd8eb0200756dcaddca1a987abf10663.brr"
Sample_ea7f73808eeb2fefd661660fe62f37df: dw filesize("music/Sample_ea7f73808eeb2fefd661660fe62f37df.brr") : incbin "music/Sample_ea7f73808eeb2fefd661660fe62f37df.brr"
Sample_5fa965a87e3b8bc31d49910823b4d3bc: dw filesize("music/Sample_5fa965a87e3b8bc31d49910823b4d3bc.brr") : incbin "music/Sample_5fa965a87e3b8bc31d49910823b4d3bc.brr"
Sample_2264c24a6f5bdd42acc939287e1398fc: dw filesize("music/Sample_2264c24a6f5bdd42acc939287e1398fc.brr") : incbin "music/Sample_2264c24a6f5bdd42acc939287e1398fc.brr"
Sample_0ca2e923494667f4c3a148f312b12259: dw filesize("music/Sample_0ca2e923494667f4c3a148f312b12259.brr") : incbin "music/Sample_0ca2e923494667f4c3a148f312b12259.brr"
Sample_f092f99be4d94f2fe921fc8664977f59: dw filesize("music/Sample_f092f99be4d94f2fe921fc8664977f59.brr") : incbin "music/Sample_f092f99be4d94f2fe921fc8664977f59.brr"
Sample_da187b6a41fbf48f10b461fc7ed0d3d5: dw filesize("music/Sample_da187b6a41fbf48f10b461fc7ed0d3d5.brr") : incbin "music/Sample_da187b6a41fbf48f10b461fc7ed0d3d5.brr"
Sample_4ef89861ffb6c245a4bc3930d41b5fd1: dw filesize("music/Sample_4ef89861ffb6c245a4bc3930d41b5fd1.brr") : incbin "music/Sample_4ef89861ffb6c245a4bc3930d41b5fd1.brr"
Sample_7cb606e75d0a3b2d32c0978334840e7f: dw filesize("music/Sample_7cb606e75d0a3b2d32c0978334840e7f.brr") : incbin "music/Sample_7cb606e75d0a3b2d32c0978334840e7f.brr"
Sample_3158d932e85680f2a75081475266fc07: dw filesize("music/Sample_3158d932e85680f2a75081475266fc07.brr") : incbin "music/Sample_3158d932e85680f2a75081475266fc07.brr"
Sample_c9c2f52f918b7ab6174640d5c71dc49e: dw filesize("music/Sample_c9c2f52f918b7ab6174640d5c71dc49e.brr") : incbin "music/Sample_c9c2f52f918b7ab6174640d5c71dc49e.brr"
Sample_a9ba72fbff7f59996d83162d02c4f923: dw filesize("music/Sample_a9ba72fbff7f59996d83162d02c4f923.brr") : incbin "music/Sample_a9ba72fbff7f59996d83162d02c4f923.brr"
Sample_d7b6254dac45a1d7ada6e6833ead52ab: dw filesize("music/Sample_d7b6254dac45a1d7ada6e6833ead52ab.brr") : incbin "music/Sample_d7b6254dac45a1d7ada6e6833ead52ab.brr"
Sample_b5e5cef7ca2abea97e422651e8512a7a: dw filesize("music/Sample_b5e5cef7ca2abea97e422651e8512a7a.brr") : incbin "music/Sample_b5e5cef7ca2abea97e422651e8512a7a.brr"
Sample_90e872822e8156c45348838e598067d6: dw filesize("music/Sample_90e872822e8156c45348838e598067d6.brr") : incbin "music/Sample_90e872822e8156c45348838e598067d6.brr"
Sample_f13a2fcb125ccc9286eea93787f20f50: dw filesize("music/Sample_f13a2fcb125ccc9286eea93787f20f50.brr") : incbin "music/Sample_f13a2fcb125ccc9286eea93787f20f50.brr"
Sample_14513002db7f6139db33682eaa96e6ea: dw filesize("music/Sample_14513002db7f6139db33682eaa96e6ea.brr") : incbin "music/Sample_14513002db7f6139db33682eaa96e6ea.brr"
Sample_acc05dd87e50fa2a7b7fa318dedf761a: dw filesize("music/Sample_acc05dd87e50fa2a7b7fa318dedf761a.brr") : incbin "music/Sample_acc05dd87e50fa2a7b7fa318dedf761a.brr"
Sample_c02d28bd6a3c8317afc00be24adec7a1: dw filesize("music/Sample_c02d28bd6a3c8317afc00be24adec7a1.brr") : incbin "music/Sample_c02d28bd6a3c8317afc00be24adec7a1.brr"
Sample_502b12d73ee0a0bfbddb6902a988f6ca: dw filesize("music/Sample_502b12d73ee0a0bfbddb6902a988f6ca.brr") : incbin "music/Sample_502b12d73ee0a0bfbddb6902a988f6ca.brr"
Sample_339e2514032d4e1335bab88b6de80e48: dw filesize("music/Sample_339e2514032d4e1335bab88b6de80e48.brr") : incbin "music/Sample_339e2514032d4e1335bab88b6de80e48.brr"
Sample_89767433c447228a2f21fe0b1a2442f0: dw filesize("music/Sample_89767433c447228a2f21fe0b1a2442f0.brr") : incbin "music/Sample_89767433c447228a2f21fe0b1a2442f0.brr"
Sample_616aa02c04ba9f2f2ff88b6fd62db5c2: dw filesize("music/Sample_616aa02c04ba9f2f2ff88b6fd62db5c2.brr") : incbin "music/Sample_616aa02c04ba9f2f2ff88b6fd62db5c2.brr"
Sample_65de485131683021221ec0135ce51596: dw filesize("music/Sample_65de485131683021221ec0135ce51596.brr") : incbin "music/Sample_65de485131683021221ec0135ce51596.brr"
Sample_2f5692cd107acfd64888f4a4ede244af: dw filesize("music/Sample_2f5692cd107acfd64888f4a4ede244af.brr") : incbin "music/Sample_2f5692cd107acfd64888f4a4ede244af.brr"
Sample_b0eb97e2caf1f746ab3b70688acbc862: dw filesize("music/Sample_b0eb97e2caf1f746ab3b70688acbc862.brr") : incbin "music/Sample_b0eb97e2caf1f746ab3b70688acbc862.brr"
Sample_e81fe2bdf6473308304597a422a5f73d: dw filesize("music/Sample_e81fe2bdf6473308304597a422a5f73d.brr") : incbin "music/Sample_e81fe2bdf6473308304597a422a5f73d.brr"
Sample_37b309a75099915cabe221b8f1189840: dw filesize("music/Sample_37b309a75099915cabe221b8f1189840.brr") : incbin "music/Sample_37b309a75099915cabe221b8f1189840.brr"
Sample_c3b3f93e0b2d53bce48ae87cc36af9c7: dw filesize("music/Sample_c3b3f93e0b2d53bce48ae87cc36af9c7.brr") : incbin "music/Sample_c3b3f93e0b2d53bce48ae87cc36af9c7.brr"
Sample_4648f271e3145cbeb3be74154c98bbc9: dw filesize("music/Sample_4648f271e3145cbeb3be74154c98bbc9.brr") : incbin "music/Sample_4648f271e3145cbeb3be74154c98bbc9.brr"
Sample_f4b98a6e87a1b968270ab79d84403d4d: dw filesize("music/Sample_f4b98a6e87a1b968270ab79d84403d4d.brr") : incbin "music/Sample_f4b98a6e87a1b968270ab79d84403d4d.brr"
Sample_5ff955130ef19a6c13a90e09bc4e4119: dw filesize("music/Sample_5ff955130ef19a6c13a90e09bc4e4119.brr") : incbin "music/Sample_5ff955130ef19a6c13a90e09bc4e4119.brr"
Sample_33870d7b9fb0ae9a8ea3b27ae6560230: dw filesize("music/Sample_33870d7b9fb0ae9a8ea3b27ae6560230.brr") : incbin "music/Sample_33870d7b9fb0ae9a8ea3b27ae6560230.brr"
Sample_2927a7e5bdb79ab7228c58ba371e3514: dw filesize("music/Sample_2927a7e5bdb79ab7228c58ba371e3514.brr") : incbin "music/Sample_2927a7e5bdb79ab7228c58ba371e3514.brr"
Sample_878ea10e42cb89660db51cb44f1c0fc8: dw filesize("music/Sample_878ea10e42cb89660db51cb44f1c0fc8.brr") : incbin "music/Sample_878ea10e42cb89660db51cb44f1c0fc8.brr"
Sample_ef6b054116253361d675341632d6a4d7: dw filesize("music/Sample_ef6b054116253361d675341632d6a4d7.brr") : incbin "music/Sample_ef6b054116253361d675341632d6a4d7.brr"
Sample_2860ee6b527846bcbba36e8c75458083: dw filesize("music/Sample_2860ee6b527846bcbba36e8c75458083.brr") : incbin "music/Sample_2860ee6b527846bcbba36e8c75458083.brr"
Sample_487ca836f684610d37adb9f2e8f5d41b: dw filesize("music/Sample_487ca836f684610d37adb9f2e8f5d41b.brr") : incbin "music/Sample_487ca836f684610d37adb9f2e8f5d41b.brr"
Sample_ddd487c9bae3c9e4cd5f013218704614: dw filesize("music/Sample_ddd487c9bae3c9e4cd5f013218704614.brr") : incbin "music/Sample_ddd487c9bae3c9e4cd5f013218704614.brr"
Sample_64ca79c82f5165d33781b6a33c15a0e0: dw filesize("music/Sample_64ca79c82f5165d33781b6a33c15a0e0.brr") : incbin "music/Sample_64ca79c82f5165d33781b6a33c15a0e0.brr"
Sample_235717614e1e5674ae0ef641c422feaf: dw filesize("music/Sample_235717614e1e5674ae0ef641c422feaf.brr") : incbin "music/Sample_235717614e1e5674ae0ef641c422feaf.brr"
Sample_aa8041956e85a1b08499011624d59627: dw filesize("music/Sample_aa8041956e85a1b08499011624d59627.brr") : incbin "music/Sample_aa8041956e85a1b08499011624d59627.brr"
Sample_d391220b3132f7ed7be1121ada000db3: dw filesize("music/Sample_d391220b3132f7ed7be1121ada000db3.brr") : incbin "music/Sample_d391220b3132f7ed7be1121ada000db3.brr"
Sample_8a3f4ee7cee8ce18a51d1d096404eda5: dw filesize("music/Sample_8a3f4ee7cee8ce18a51d1d096404eda5.brr") : incbin "music/Sample_8a3f4ee7cee8ce18a51d1d096404eda5.brr"
Sample_588ad9d77b6e7f35ca37ba2344ca43b4: dw filesize("music/Sample_588ad9d77b6e7f35ca37ba2344ca43b4.brr") : incbin "music/Sample_588ad9d77b6e7f35ca37ba2344ca43b4.brr"
Sample_97aa7fd0c57111b1e2e3da056c59f9cf: dw filesize("music/Sample_97aa7fd0c57111b1e2e3da056c59f9cf.brr") : incbin "music/Sample_97aa7fd0c57111b1e2e3da056c59f9cf.brr"
Sample_1d2bbf84c25c871bc6e3176bc24870a4: dw filesize("music/Sample_1d2bbf84c25c871bc6e3176bc24870a4.brr") : incbin "music/Sample_1d2bbf84c25c871bc6e3176bc24870a4.brr"
Sample_43bc4f28d5162b86489cbd3dca2e7af7: dw filesize("music/Sample_43bc4f28d5162b86489cbd3dca2e7af7.brr") : incbin "music/Sample_43bc4f28d5162b86489cbd3dca2e7af7.brr"
Sample_fe57609e4a845c8073dd4012e9b2f49e: dw filesize("music/Sample_fe57609e4a845c8073dd4012e9b2f49e.brr") : incbin "music/Sample_fe57609e4a845c8073dd4012e9b2f49e.brr"
Sample_73a339645833dc5c4a7c268916578efa: dw filesize("music/Sample_73a339645833dc5c4a7c268916578efa.brr") : incbin "music/Sample_73a339645833dc5c4a7c268916578efa.brr"
Sample_d76a1e2bcbc403bc9360d154294dce53: dw filesize("music/Sample_d76a1e2bcbc403bc9360d154294dce53.brr") : incbin "music/Sample_d76a1e2bcbc403bc9360d154294dce53.brr"
Sample_5f3245a505aef0cab8f6817493b927cf: dw filesize("music/Sample_5f3245a505aef0cab8f6817493b927cf.brr") : incbin "music/Sample_5f3245a505aef0cab8f6817493b927cf.brr"
Sample_aa687b385eec6ee98f906c710aefcc97: dw filesize("music/Sample_aa687b385eec6ee98f906c710aefcc97.brr") : incbin "music/Sample_aa687b385eec6ee98f906c710aefcc97.brr"
Sample_2eed29c8e1dfc1aebc7a9bacb053a9e8: dw filesize("music/Sample_2eed29c8e1dfc1aebc7a9bacb053a9e8.brr") : incbin "music/Sample_2eed29c8e1dfc1aebc7a9bacb053a9e8.brr"
Sample_face02e10e86fbbc2227ec86184e85fa: dw filesize("music/Sample_face02e10e86fbbc2227ec86184e85fa.brr") : incbin "music/Sample_face02e10e86fbbc2227ec86184e85fa.brr"
Sample_e5230fbebb607c8b32fe2959e0902347: dw filesize("music/Sample_e5230fbebb607c8b32fe2959e0902347.brr") : incbin "music/Sample_e5230fbebb607c8b32fe2959e0902347.brr"
Sample_ff587f76a1c839d23cc16a649c7acb24: dw filesize("music/Sample_ff587f76a1c839d23cc16a649c7acb24.brr") : incbin "music/Sample_ff587f76a1c839d23cc16a649c7acb24.brr"
Sample_4d73b345c85aeb62add04a28d133408c: dw filesize("music/Sample_4d73b345c85aeb62add04a28d133408c.brr") : incbin "music/Sample_4d73b345c85aeb62add04a28d133408c.brr"
Sample_352d4efbf024c62ef8ef1771b6d75c88: dw filesize("music/Sample_352d4efbf024c62ef8ef1771b6d75c88.brr") : incbin "music/Sample_352d4efbf024c62ef8ef1771b6d75c88.brr"
Sample_281d7b2cb8917f9fc3d3ad5071dad747: dw filesize("music/Sample_281d7b2cb8917f9fc3d3ad5071dad747.brr") : incbin "music/Sample_281d7b2cb8917f9fc3d3ad5071dad747.brr"
Sample_2046070ed30e9aaf047b5b496a0a3fcb: dw filesize("music/Sample_2046070ed30e9aaf047b5b496a0a3fcb.brr") : incbin "music/Sample_2046070ed30e9aaf047b5b496a0a3fcb.brr"
Sample_f1b3383538467c6d9585a3089f2bff09: dw filesize("music/Sample_f1b3383538467c6d9585a3089f2bff09.brr") : incbin "music/Sample_f1b3383538467c6d9585a3089f2bff09.brr"
Sample_3d03eefd2e3912bacdc75766d9f89c08: dw filesize("music/Sample_3d03eefd2e3912bacdc75766d9f89c08.brr") : incbin "music/Sample_3d03eefd2e3912bacdc75766d9f89c08.brr"
Sample_e4ec38024ef64ca23f8bb5aecc52c3d6: dw filesize("music/Sample_e4ec38024ef64ca23f8bb5aecc52c3d6.brr") : incbin "music/Sample_e4ec38024ef64ca23f8bb5aecc52c3d6.brr"
Sample_eefb57a8c45455334318ad6ef8bcf9dd: dw filesize("music/Sample_eefb57a8c45455334318ad6ef8bcf9dd.brr") : incbin "music/Sample_eefb57a8c45455334318ad6ef8bcf9dd.brr"
Sample_bdd3ed2bb8600fa03669172d5130595d: dw filesize("music/Sample_bdd3ed2bb8600fa03669172d5130595d.brr") : incbin "music/Sample_bdd3ed2bb8600fa03669172d5130595d.brr"
Sample_3ce56ddc06d6279f0865433c167956a4: dw filesize("music/Sample_3ce56ddc06d6279f0865433c167956a4.brr") : incbin "music/Sample_3ce56ddc06d6279f0865433c167956a4.brr"
Sample_850852da5c349c3afa42df4f4e7b4c95: dw filesize("music/Sample_850852da5c349c3afa42df4f4e7b4c95.brr") : incbin "music/Sample_850852da5c349c3afa42df4f4e7b4c95.brr"
Sample_f57926b4e3fe7bb2e54deb5edc499437: dw filesize("music/Sample_f57926b4e3fe7bb2e54deb5edc499437.brr") : incbin "music/Sample_f57926b4e3fe7bb2e54deb5edc499437.brr"
Sample_b0408218d46b86bf204427f3abb52c5a: dw filesize("music/Sample_b0408218d46b86bf204427f3abb52c5a.brr") : incbin "music/Sample_b0408218d46b86bf204427f3abb52c5a.brr"
Sample_8ffbbac2da03c55c193cbf36b1e520db: dw filesize("music/Sample_8ffbbac2da03c55c193cbf36b1e520db.brr") : incbin "music/Sample_8ffbbac2da03c55c193cbf36b1e520db.brr"
Sample_8b80f8c8dfc034a9b10dbf6c96fe1714: dw filesize("music/Sample_8b80f8c8dfc034a9b10dbf6c96fe1714.brr") : incbin "music/Sample_8b80f8c8dfc034a9b10dbf6c96fe1714.brr"
Sample_84c6d5b414c72aecd879951c3b874549: dw filesize("music/Sample_84c6d5b414c72aecd879951c3b874549.brr") : incbin "music/Sample_84c6d5b414c72aecd879951c3b874549.brr"
Sample_9b8c27a5d3be46e264a8815e398d9659: dw filesize("music/Sample_9b8c27a5d3be46e264a8815e398d9659.brr") : incbin "music/Sample_9b8c27a5d3be46e264a8815e398d9659.brr"
Sample_1005d6ea2c154036604cf230b7eea4d9: dw filesize("music/Sample_1005d6ea2c154036604cf230b7eea4d9.brr") : incbin "music/Sample_1005d6ea2c154036604cf230b7eea4d9.brr"
Sample_fbc65a1e54ed6d31ed29ca43776621ec: dw filesize("music/Sample_fbc65a1e54ed6d31ed29ca43776621ec.brr") : incbin "music/Sample_fbc65a1e54ed6d31ed29ca43776621ec.brr"
Sample_4842013d9a2677e216e5246cd8c8e97e: dw filesize("music/Sample_4842013d9a2677e216e5246cd8c8e97e.brr") : incbin "music/Sample_4842013d9a2677e216e5246cd8c8e97e.brr"
Sample_26fe057d696c01031f983274537acf76: dw filesize("music/Sample_26fe057d696c01031f983274537acf76.brr") : incbin "music/Sample_26fe057d696c01031f983274537acf76.brr"
Sample_070774228d4d8b89d9ca1ed89dad328a: dw filesize("music/Sample_070774228d4d8b89d9ca1ed89dad328a.brr") : incbin "music/Sample_070774228d4d8b89d9ca1ed89dad328a.brr"
Sample_952149bda8c138e34f1b41d599c4243f: dw filesize("music/Sample_952149bda8c138e34f1b41d599c4243f.brr") : incbin "music/Sample_952149bda8c138e34f1b41d599c4243f.brr"
Sample_f4ee4d04d4846fb534a4e559e83cbdf5: dw filesize("music/Sample_f4ee4d04d4846fb534a4e559e83cbdf5.brr") : incbin "music/Sample_f4ee4d04d4846fb534a4e559e83cbdf5.brr"
Sample_b0365c4b45f439074b99be7b0579837a: dw filesize("music/Sample_b0365c4b45f439074b99be7b0579837a.brr") : incbin "music/Sample_b0365c4b45f439074b99be7b0579837a.brr"
Sample_966096e36e1cb2d211f0ca91ee2d390c: dw filesize("music/Sample_966096e36e1cb2d211f0ca91ee2d390c.brr") : incbin "music/Sample_966096e36e1cb2d211f0ca91ee2d390c.brr"
Sample_278f07e8e1ffdb96da9b899da90d9f9c: dw filesize("music/Sample_278f07e8e1ffdb96da9b899da90d9f9c.brr") : incbin "music/Sample_278f07e8e1ffdb96da9b899da90d9f9c.brr"
Sample_797af8119579c0ab291d42bd5b294da9: dw filesize("music/Sample_797af8119579c0ab291d42bd5b294da9.brr") : incbin "music/Sample_797af8119579c0ab291d42bd5b294da9.brr"
Sample_43c5b6101fd297c7af5a76e6733f4f0c: dw filesize("music/Sample_43c5b6101fd297c7af5a76e6733f4f0c.brr") : incbin "music/Sample_43c5b6101fd297c7af5a76e6733f4f0c.brr"
Sample_25c097763664d2404536cb7b102bf640: dw filesize("music/Sample_25c097763664d2404536cb7b102bf640.brr") : incbin "music/Sample_25c097763664d2404536cb7b102bf640.brr"
Sample_3da45843d5164e6fc5c3df7c986e81a7: dw filesize("music/Sample_3da45843d5164e6fc5c3df7c986e81a7.brr") : incbin "music/Sample_3da45843d5164e6fc5c3df7c986e81a7.brr"
Sample_3f20d9deb006a2c155ae0ceb4f2311e9: dw filesize("music/Sample_3f20d9deb006a2c155ae0ceb4f2311e9.brr") : incbin "music/Sample_3f20d9deb006a2c155ae0ceb4f2311e9.brr"
Sample_9f3d2a485736a0b959a04bd44c0cf47b: dw filesize("music/Sample_9f3d2a485736a0b959a04bd44c0cf47b.brr") : incbin "music/Sample_9f3d2a485736a0b959a04bd44c0cf47b.brr"
Sample_1fa5a00c1e9f4720443b33cef349150f: dw filesize("music/Sample_1fa5a00c1e9f4720443b33cef349150f.brr") : incbin "music/Sample_1fa5a00c1e9f4720443b33cef349150f.brr"
Sample_14ec84e26b9ea0857ad958b5f843bc1b: dw filesize("music/Sample_14ec84e26b9ea0857ad958b5f843bc1b.brr") : incbin "music/Sample_14ec84e26b9ea0857ad958b5f843bc1b.brr"
Sample_0405f8f2e0514b6efa2920554df53d02: dw filesize("music/Sample_0405f8f2e0514b6efa2920554df53d02.brr") : incbin "music/Sample_0405f8f2e0514b6efa2920554df53d02.brr"
Sample_f2ce9891671b6e98e6ec82c98b1cd1ab: dw filesize("music/Sample_f2ce9891671b6e98e6ec82c98b1cd1ab.brr") : incbin "music/Sample_f2ce9891671b6e98e6ec82c98b1cd1ab.brr"
Sample_a0d92a11a8faee666248670e88d6ae24: dw filesize("music/Sample_a0d92a11a8faee666248670e88d6ae24.brr") : incbin "music/Sample_a0d92a11a8faee666248670e88d6ae24.brr"
Sample_05f2645aa9e3762f8319fae3ba515fa8: dw filesize("music/Sample_05f2645aa9e3762f8319fae3ba515fa8.brr") : incbin "music/Sample_05f2645aa9e3762f8319fae3ba515fa8.brr"
Sample_8f70ef4287d6cd29a14683e1aae3ab7d: dw filesize("music/Sample_8f70ef4287d6cd29a14683e1aae3ab7d.brr") : incbin "music/Sample_8f70ef4287d6cd29a14683e1aae3ab7d.brr"
Sample_86d8f75e64b863de0c8b6c6a32a5afd7: dw filesize("music/Sample_86d8f75e64b863de0c8b6c6a32a5afd7.brr") : incbin "music/Sample_86d8f75e64b863de0c8b6c6a32a5afd7.brr"
Sample_97a785af7dee81db8c178ac9bfc223b5: dw filesize("music/Sample_97a785af7dee81db8c178ac9bfc223b5.brr") : incbin "music/Sample_97a785af7dee81db8c178ac9bfc223b5.brr"
Sample_282615d1464fdb0623504ef86c5de66b: dw filesize("music/Sample_282615d1464fdb0623504ef86c5de66b.brr") : incbin "music/Sample_282615d1464fdb0623504ef86c5de66b.brr"
Sample_73cb64f395dad0784c958d0ed478f686: dw filesize("music/Sample_73cb64f395dad0784c958d0ed478f686.brr") : incbin "music/Sample_73cb64f395dad0784c958d0ed478f686.brr"
Sample_831b1863540f328224dbf6d79fb349dd: dw filesize("music/Sample_831b1863540f328224dbf6d79fb349dd.brr") : incbin "music/Sample_831b1863540f328224dbf6d79fb349dd.brr"
Sample_cdc82f868779a0f3f8c85b6ddb4b7b53: dw filesize("music/Sample_cdc82f868779a0f3f8c85b6ddb4b7b53.brr") : incbin "music/Sample_cdc82f868779a0f3f8c85b6ddb4b7b53.brr"
Sample_a607137ab681c65e6d6d9e7c667ad495: dw filesize("music/Sample_a607137ab681c65e6d6d9e7c667ad495.brr") : incbin "music/Sample_a607137ab681c65e6d6d9e7c667ad495.brr"
Sample_e196c2a53620d4573a72e4dfd4255104: dw filesize("music/Sample_e196c2a53620d4573a72e4dfd4255104.brr") : incbin "music/Sample_e196c2a53620d4573a72e4dfd4255104.brr"
Sample_ac5a192f01928e331bdd5d5ad51b0b23: dw filesize("music/Sample_ac5a192f01928e331bdd5d5ad51b0b23.brr") : incbin "music/Sample_ac5a192f01928e331bdd5d5ad51b0b23.brr"
Sample_21ce681da14ac9d581f19b02776116a9: dw filesize("music/Sample_21ce681da14ac9d581f19b02776116a9.brr") : incbin "music/Sample_21ce681da14ac9d581f19b02776116a9.brr"
Sample_a80ea0fc490094056ac89913c1d71887: dw filesize("music/Sample_a80ea0fc490094056ac89913c1d71887.brr") : incbin "music/Sample_a80ea0fc490094056ac89913c1d71887.brr"

SwappableSample00: incbin "swappable_samples/00.nspc"
SwappableSample01: incbin "swappable_samples/01.nspc"
SwappableSample02: incbin "swappable_samples/02.nspc"
SwappableSample03: incbin "swappable_samples/03.nspc"
SwappableSample04: incbin "swappable_samples/04.nspc"
SwappableSample05: incbin "swappable_samples/05.nspc"
SwappableSample06: incbin "swappable_samples/06.nspc"
SwappableSample07: incbin "swappable_samples/07.nspc"
SwappableSample08: incbin "swappable_samples/08.nspc"
SwappableSample09: incbin "swappable_samples/09.nspc"
SwappableSample0A: incbin "swappable_samples/0A.nspc"
SwappableSample0B: incbin "swappable_samples/0B.nspc"
SwappableSample0C: incbin "swappable_samples/0C.nspc"
SwappableSample0D: incbin "swappable_samples/0D.nspc"
SwappableSample0E: incbin "swappable_samples/0E.nspc"
SwappableSample0F: incbin "swappable_samples/0F.nspc"
SwappableSample10: incbin "swappable_samples/10.nspc"
SwappableSample11: incbin "swappable_samples/11.nspc"
SwappableSample12: incbin "swappable_samples/12.nspc"
SwappableSample13: incbin "swappable_samples/13.nspc"
SwappableSample14: incbin "swappable_samples/14.nspc"
SwappableSample15: incbin "swappable_samples/15.nspc"
SwappableSample16: incbin "swappable_samples/16.nspc"
SwappableSample17: incbin "swappable_samples/17.nspc"
SwappableSample18: incbin "swappable_samples/18.nspc"
SwappableSample19: incbin "swappable_samples/19.nspc"
SwappableSample1A: incbin "swappable_samples/1A.nspc"
SwappableSample1B: incbin "swappable_samples/1B.nspc"
SwappableSample1C: incbin "swappable_samples/1C.nspc"
SwappableSample1D: incbin "swappable_samples/1D.nspc"
SwappableSample1E: incbin "swappable_samples/1E.nspc"
SwappableSample1F: incbin "swappable_samples/1F.nspc"
SwappableSample20: incbin "swappable_samples/20.nspc"
SwappableSample22: incbin "swappable_samples/22.nspc"
SwappableSample23: incbin "swappable_samples/23.nspc"
SwappableSample24: incbin "swappable_samples/24.nspc"
SwappableSample25: incbin "swappable_samples/25.nspc"
SwappableSample26: incbin "swappable_samples/26.nspc"
SwappableSample27: incbin "swappable_samples/27.nspc"
SwappableSample28: incbin "swappable_samples/28.nspc"
SwappableSample29: incbin "swappable_samples/29.nspc"

padbyte $FF : pad $FFFFFF : db $FF
check bankcross full
}
