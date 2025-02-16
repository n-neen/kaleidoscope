lorom

incsrc ./macros.asm

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
    lda #$0016      ;suit pickup layer blending mode (varia)
    
org $88e07c
    lda #$0024      ;suit pickup layer blending mode (gravity)
    
org $88e09d
    jsr pbsuit
    
org $88f300
    pbsuit:
    %laypowerbomb(0080, 0080)
    ldx #$0000
    rts
    
;org $81b324         ;default buttons/moonwalk flag
    ;lda #$8000      ;jump binding = B
    ;skip 3
    ;lda #$4000      ;dash binding = Y
    ;skip 9
    ;lda #$0080      ;item cancel binding = A
org $81b35d
    ;nop #3
    ;skip 3
    ;lda #$0001      ;turn on moonwalk
    ;sta $09e4
    
; Discovered by moehr
; caauyjdp pointed this out to RT-55J
; RT-55J pointed this out to me (neen)
org $A08C3F : LDA #$0200

;extend hud to $20 scanlines        ;currently disabled

;org $8096a2
;    ldy #$001f
;    
;org $8096ea
;    ldy #$001f
;    
;org $80972c
;    ldy #$001f
;    
;org $80976a
;    ldy #$001f
;    
;org $8097d3
;    ldy #$001f
;    
;org $82e22a     ;black out all doors (vanilla = bne $3f)
;    bra $3f

org $a3fff0         ;shot reaction (for no enemy kill count inc)
    jsl $a2b94d
    rtl
    
    ;fff5:          ;touch reaction (same as above)
    jsl $a2b947
    rtl
    
org $8dd900     ;hyper beam color index
    ;dw $c655, $00c0
    
org $8ffff0      ;solid scroll test
    db $0a, $01
    db $80
    
org $84e27d
    dw $af26
    
org $84e28f                     ;spring ball hijack
    dw #ballfix
    dw $8724, #instextension    ;goto instruction list extension

    
org $84af1c
    instextension:
    dw $8899
    dw $8bdd : db $02
    dw $88f3, $0002 : db $08
    ;warn pc
    dw $8724, $dfa9     ;goto empty item inst list

    ballfix:
    phx
    phy
    pha
    
    lda $09a4
    ora #$0002
    sta $09a4
    
    lda $09a2
    ora #$0002
    sta $09a2
    
    jsl $91e633
    
    pla
    ply
    plx
    rts

    
org $a8ab89             ;remove kago screenshake
    nop #12