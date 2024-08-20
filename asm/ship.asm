lorom

org $a2ab1f         ;rewrite up to ab3c
    lda $7ed900
    ora #$0004
    sta $7ed900
    lda #$0002
    sta $078b
    lda $0952
    jsl $818000
    bra there
    
    org $a2ab40
    there:



    ;7ed900     2 bit is save 1? so 4 bit is save 2