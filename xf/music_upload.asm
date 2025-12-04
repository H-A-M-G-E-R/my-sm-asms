; Changes the music routine to deduplicate samples freeing up lots of space!
; bank $83

MusicUpload:
{
    PHP
    PHB : PHK : PLB ; DB = $83 (do not remove)
    ; set apu to upload mode
    SEP #$20 : LDA #$FF : STA $2140
    REP #$20 : LDA #$BBAA : - : CMP $2140 : BNE -
    REP #$30
    ; dest address
    LDX $07F3 ; music data index
    LDA.l SampleTransferDefPointers-3,x : TAX
    LDA.l SampleTransferDefPointers&$FF0000,x : STA $2142 : INX : INX ; aram address of samples
    SEP #$20 : LDA #$01 : STA $2141 ; tell apu that the cpu's gonna upload data
    LDA #$CC : STA $2140 ; kick
    - : CMP $2140 : BNE - ; wait for apu
    ; samples
    REP #$20
    STZ $03 ; ctr
    .loop_samples
        LDA.l SampleTransferDefPointers&$FF0000,x : BEQ .done_sampleBlock
        TAY : LDA.l (SampleTransferDefPointers&$FF0000)+1,x : STA $01 : STZ $00 ; sample address
        PHX
        SEP #$20 : JSR .getByteAndIncY : XBA : JSR .getByteAndIncY : XBA : TAX ; size of sample
        JSR .getByteAndIncY : XBA : LDA $03 ; first byte
        BRA .uploadSampleByte
        .nextSampleByte
            XBA : JSR .getByteAndIncY : XBA
            - : CMP $2140 : BNE - ; wait for apu
            INC ; increment ctr
        .uploadSampleByte
            REP #$20 : STA $2140 : SEP #$20 ; transfer it
            DEX : BNE .nextSampleByte
        ; done uploading sample
        - : CMP $2140 : BNE - ; wait for apu
        INC : STA $03
        PLX : INX : INX : INX : REP #$20 : BRA .loop_samples ; next sample
    ; done with sample block
    .done_sampleBlock
    SEP #$20 : LDA $03 : DEC : - : CMP $2140 : BNE - ; wait for apu
    - : ADC #$03 : BEQ - ; set kick
    ; upload music as usual
    PHA
    REP #$20 : LDX $07F3 : LDA.l SongPointers-3,x : TAY : LDA.l SongPointers-2,x : STA $01 : STZ $00 ; music address
    SEP #$20 : PLA
    .loop_musicBlocks
        PHA
        JSR .getByteAndIncY : XBA : JSR .getByteAndIncY : XBA : TAX
        JSR .getByteAndIncY : STA $2142 : JSR .getByteAndIncY : STA $2143
        CPX #$0001 : TDC : ROL : STA $2141
        ADC #$7F
        PLA : STA $2140
        BVC .done
        - : CMP $2140 : BNE - ; wait for apu
        JSR .getByteAndIncY : XBA ; first byte
        BRA .uploadMusicByte
        .nextMusicByte
            XBA : JSR .getByteAndIncY : XBA
            - : CMP $2140 : BNE - ; wait for apu
            INC ; increment ctr
        .uploadMusicByte
            REP #$20 : STA $2140 : SEP #$20 ; transfer it
            DEX : BNE .nextMusicByte
        - : CMP $2140 : BNE - ; wait for apu
        - : ADC #$03 : BEQ - ; set kick
        BRA .loop_musicBlocks
    .done
    PLB : PLP : RTL

.getByteAndIncY
    LDA [$00],y
    INY : BEQ +
    RTS

+ : INC $02 ; next bank
    LDY #$8000
    RTS
}

pushpc
org $808F72 : JSL MusicUpload : BRA + : org $808F82 : +
pullpc
