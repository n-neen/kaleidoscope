lorom

;ship saves to save slot 2 in maridia now

org $a2ab1f
    lda $7ed900     ;inside save array
    ora #$0004      ;maridia save 2 is 4 bit here
    sta $7ed900
    lda #$0002      ;save index 2
    sta $078b
    lda $0952       ;get save slot
    jsl $818000     ;save to sram
    bra there
    
    org $a2ab40     ;skip over some unused bytes
    there:



    ;7ed900     2 bit is save 1? so 4 bit is save 2