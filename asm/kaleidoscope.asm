lorom


;====================================================================================================================
;============================================= ｋ ａ ｌ ｅ ｉ ｄ ｏ ｓ ｃ ｏ ｐ ｅ ==============================================
;====================================================================================================================



;=============================================includes

incsrc ./macros.asm

;=============================================graphics
org $898900                                         ;overwrites x-ray graphics
    incbin ./kaleidoscopeitem.gfx

org $84e30f                                         ;in x-ray plm instruction list (non-orb, non-hidden version)
    db $01, $01, $01, $01, $01, $01, $01, $01       ;which palette to use for each of the 8x8 tiles

;=============================================defines

;!noblend  = $9e              ;flag for moving layers. so we don't write to layer blending adresses twice
!bg1x           = $b1
!bg1y           = $b3
!bg2x           = $b5
!bg2y           = $b7
!90free         = $90fe00
!backdropbackup = $0dd8
!backdropflag   = $0dda
!echocooldown   = $0613

;=============================================main item funcionality code
org $91caf2
    db $40, $06             ;x-ray hdma object type and target
                            ;$05 = drawing mode
                            ;$06 = mosaic
                            ;vanilla=type $41
                    
org $8887c5                 ;handle moving x-ray up/down
    rts                     ;creates freespace until $87df
    
org $888744
    jsr spikesuit

org $888896                 ;hdma table routine gone, plenty of space here
    xraydamage:
    
        lda $179c
        cmp #$0007          ;bad hack dont look
        beq +
        
        lda $0c1e
        cmp #$8029
        beq +               ;spark echoes can only exist in these two projectile slots
        lda $0c20           ;so we explicitly check for these to exist. if they do,
        cmp #$8029          ;skip over the call to where we spawn our echoes
        beq +               ;the result is you have to wait for the current ones to go offscreen
        
        lda !echocooldown
        bne +
        jsl longshort       ;code for spawning speed echoes
        +

    kaleidoscope:
    
    backdrop:
        lda !backdropflag
        bmi ++
        lda $7ec000
        sta !backdropbackup
        lda #$0400          ;backdrop color during scope only
        sta $7ec000
        lda #$8000
        sta !backdropflag
++

        %subtract(!bg1x, #$0005)
        %subtract(!bg1y, #$0005)
        %add(!bg2x, #$0005)
        %add(!bg2y, #$0005)
        
        lda $8b             ;controller input
        .right:
            dec !bg1x
            bra ++
        .L:
            %add(!bg1x, $05e5)
            ;lda !bg1x
            ;clc
            ;adc $05e5
            ;sta !bg1x
            sta !bg1y
            bra ++
        .R:
            %add(!bg2x, $05e5)
            ;lda !bg2x
            ;clc
            ;adc $05e5
            ;sta !bg2x
            sta !bg2y
            
++      rts
;warn pc ;$8933

org $888a19                 ;hijack for restoring backdrop color (set previously, see above)
    jsr restorebackdrop
    nop

org $88801f                 ;layer blending x-ray: can show blocks
    jsr spritesonlyblend
    ;jsr moveblend
    ;nop : nop : nop
    
org $88802b                 ;layer blending x-ray: can't show blocks
    jsr spritesonlyblend
    ;jsr moveblend
    ;nop : nop : nop
    
org $888037                 ;layer blending x-ray: fire flea room
    jsr spritesonlyblend
    ;jsr moveblend
    ;nop : nop : nop
    
org $88ff00
    spritesonlyblend:
        sep #$20
        lda #%00000011      ;main screen layers = 1+2
        sta $6a
        lda #%00010011      ;subscreen layers = 1+2+sprites
        sta $6b
        lda #%10111111      ;color math enabled everywhere. subtractive math
        sta $73
        lda #%00000011      ;enable color math, enable subscreen layers
        sta $70             ;this is mainly here to overwrite whatever the room fx loaded
        rep #$20
        rts
        
    restorebackdrop:
        lda !backdropbackup
        sta $7ec000
        stz !backdropflag
        rts
        
    spikesuit:
        lda $179c           ;another phantoon hack
        cmp #$0007
        beq +
        lda #$0001
        sta $0a68
        jsr xraydamage
    +   rts
        
org $90fff0
    longshort:              ;speed echoes spawn
        jsr $d40d           ;d40d
        lda #$0008          ;gonna b real here, i think the check on lines 45-50 makes this cooldown entirely unnecessary but whatever
        sta !echocooldown
        rtl
        
org $91d2c3                 ;skip backdrop color set to grey during xray
    nop #10
    
org $91d29a                 ;skip backdrop setting
    nop #15
    
org $888974                 ;skip backdrop color set to black at end of xray
    nop #4
    
org $888709                 ;skip subscreen color math backdrop color setting
    nop #15
    
org $888a74                 ;skip subscreen color math backdrop color setting
    nop #12

;=============================================HUD

org $809a49
    ldx #$0028
org $809d6e+8
    dw $0028
    
;hud shortcut to kaleidoscope:
org $9094f2         ;overwriting some grapple beam scrolling thing
    lda $09a4       ;if xray not collected, exit
    bpl +

    lda $09b6       ;dash binding
    ora #$0830      ;L+R+up
    cmp $8b         ;if not pressing L+R+[dash]+up, exit
    bne +
    
    lda #$0005
    sta $0a04       ;activate xray hud index as one-time use item
    sta $09d2
+   jmp $9557
    ;warn pc

;=============================================slutty hack fix don't look ok
;for the projectile counter bug

;org $90ac65
;    cmp #$0006
;org $90ac86
;    cmp #$0005
    
org $828b8e
    jsr sparkcheck
    nop #7
    
org $82fd00
    sparkcheck:
    lda $0a78
    bne ++
    dec !echocooldown
    bmi +
    bra ++
+   stz !echocooldown

    over:
++  rts
    ;warn pc