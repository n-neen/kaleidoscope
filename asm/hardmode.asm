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

org $848100         ;if hardmode, then delete save station
    saveinithijack:
    lda !hardmodeflag
    bne +
    ldx $1c87,y
    lda #$b04d
    jsr $82b4
    rts
+   lda #$aae3      ;set inst list pointer to a list that just contains a delete instruction
    sta $1d27,y
    rts
    
org $91df5a     ;12 bytes here.
    lda !hardmodeflag
    beq +
    lda $12
    asl : asl   ;damage x4
    sta $12
+   nop
