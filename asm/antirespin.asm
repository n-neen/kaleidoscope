lorom

org $91ffee
    db $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff

org $a4891b
    sep #$30
-       lda $91ffee,x
        cmp #$ff
        bne crash
        bpl -
        cpx #$0010
        beq +
+   rep #$30
    rtl

        crash:
        pha
        phx
        phy
        php
        phb
        rts