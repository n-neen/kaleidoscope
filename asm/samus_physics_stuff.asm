lorom

org $909ea1         ;samus gravity constant
    dw $1800        ;air
    dw $0580        ;water
    dw $0800        ;lava/acid
    
;remove shinespark health drain:
org $90D0CE         ;vertical
    nop : nop : nop

org $90D0FD         ;diagonal
    nop : nop : nop

org $90D129         ;horizontal
    nop : nop : nop
    
org $90d2ba         ;shinespark health check
    nop #8
    
    
org $82e74b         ;shoutout to benox50 for this idea
stz $0a9c           ;fix slowed animations from water -> spore, rain, etc., effects during door transition
                    ;this replaces a jsr $dfc7 which seems to have no effect at all, very lucky
                    ;um actually if you have i-frames during a door this results in a small amount of flickering on the other side. probably fine


;org $90ab00
;    bra $06