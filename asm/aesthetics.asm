lorom

;org $8deed9         ;color index to glow in brinstar $02 bit. starts at $7ec000
;    dw $0036        ;third palette blend color

;org $8deff9         ;brinstar 4 glow, color index
;    dw $0192        ;onto samus. whole suit, looks good.

org $8880f0         ;layer blending $1c
    lda #$bf        ;subtractive, volor math everywhere
    
    ;0c03 backdrop brin tileset
    
org $91d9b2
    ;
    
org $91da50
    dw $9b80, $9c20, $9c60, $9b20, $9b40, $9b60     ;screw palette pointers (power suit)
    
    
org $848332
db $2B              ;xray $8000 argument plm crash fix (by amoeba)