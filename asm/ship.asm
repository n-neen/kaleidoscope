lorom

;ship saves to save 2 in maridia now

!hardmodeflag       =       $09ee

org $a2ab1f
    ;lda !hardmodeflag   ;see "hardmode.asm"            ;trying out hardmode with saving allowed but only at the ship
    ;bne there
    lda $7ed900         ;inside save array
    ora #$0004          ;maridia save 2 is 4 bit here
    sta $7ed900
    lda #$0002          ;save index 2
    sta $078b
    lda $0952           ;get save slot
    jsl $818000         ;save to sram
    bra there
    
    org $a2ab40     ;skip over some unused bytes
    there:

org $82b6d4         ;skip ship icon on pause map
    nop #7
    
org $82b78f         ;skip ship icon on file select map
    nop #7