lorom

!hardmodeflag       =       $09ee

org $81b369
    jsr hardmodecheck
    
org $81f200
    hardmodecheck:
    lda $8b
    cmp #$3030      ;if pressing l, r, start, select:
    bne +
    lda #$8000      ;set hard mdoe flag
    sta !hardmodeflag
+   rts

org $84b76f         ;save station init
    dw saveinithijack

org $848100
    saveinithijack:
    lda !hardmodeflag
    bne +
    ldx $1c87,y
    lda #$b04d
    jsr $82b4
    rts
+   lda #$aae3
    sta $1d27,y
    rts