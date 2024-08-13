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

org $90AB00         ;maptile exploring nonsense removal (tundain)
BRA $06


org $a099bd         ;projectile-to-projectile collision granularity
    and #$ffe0      ;higher number=more precision and more lag
    skip 5          ;vanilla=#$ffe0
    and #$ffe0
    skip 7
    and #$ffe0
    skip 5
    and #$ffe0
    
    
    
org $88e046
    lda #$001c      ;suit pickup layer blending mode (varia)