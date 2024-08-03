lorom

!94free = $94b200

org $9498ac+8               ;air fool xray bts 04
    dw #tile
    
org !94free
    tile:
        jsl $808111
        and #$2fff
        clc
        adc $0a4e
        sta $0a4e
        rts
        