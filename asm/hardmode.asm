lorom

;see also "ship.asm" for a hard mode check

!hardmodeflag       =       $09ee


;===================================================================================================
;===================================    button combo    ============================================
;===================================================================================================

org $828ba0         ;orphaned org actually belongs in the next section
    jsr hudcolor
    nop
    
org $828b0e
    jsr hardmodecheck
    nop
  
org $82fb00;
    hardmodecheck:
    jsl $8ba35b     ;the thing we overwrote
    lda $8b
    cmp #$f080      ;if pressing A+B+Y+ST+SL (abyss)
    bne +
    lda #$8000      ;set hard mode flag
    sta !hardmodeflag
    bra ++
+   stz !hardmodeflag
++  rts

;===================================================================================================
;============================   indicator that hard mode is active   ===============================
;===================================================================================================

    hudcolor:
    jsl $809b44     ;the thing we overwrote (handle hud tilemap)                            
    lda !hardmodeflag
    beq +
    lda #$140f      ;hud font color outline
    sta $7ec01a
    sta $7ec21a
    ;lda #$0000      ;hud font color middle
    ;sta $7ec01c
    ;sta $7ec21c
+   rts

;===================================================================================================
;================================    hijack to start game at ship    ===============================
;===================================================================================================

    hardmodestart:
    jsr $819b       ;the thing we overwrote (init registers for gameplay)
    lda !hardmodeflag
    beq +
    lda #$0004      ;area = maridia
    sta $079f
    lda #$0002      ;load point = 2 (the ship)
    sta $078b
    lda #$00cd
    jsl $80818e
    lda #$0001
    lda $7ed870,x
    ora $05e7       ;mark item $cd as collected (kej's block remover uses item IDs)
    sta $7ed870,x   ;removes speed blockage in room 11
+   rts

org $82804e         
    jsr hardmodestart

;===================================================================================================
;====================================    save station    ===========================================
;===================================================================================================

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
    
;===================================================================================================
;=======================================    damage    ==============================================
;===================================================================================================
    
org $91df5a     ;12 bytes here.
    lda !hardmodeflag
    beq +
    lda $12
    asl : asl   ;damage x4
    sta $12
+   nop

;===================================================================================================
;========================================    drops    ==============================================
;===================================================================================================
    
org $86f0bb
    jsr hardmodedrops_smallhealth
    
org $86f0ca
    jsr hardmodedrops_health
    
;org $86f0d9
;    jsr hardmodedrops_pb
;    
;org $86f0e8
;    jsr hardmodedrops_missile
;    
;org $86f0f7
;    jsr hardmodedrops_super
    
    
org $86f900
    hardmodedrops:
        .smallhealth:
        lda !hardmodeflag
        bne +
        lda #$0005              ;normal mode small health drop
        rts
+       lda #$0001              ;hard mode small health drop
        rts
        
        .health:
        lda !hardmodeflag
        bne +
        lda #$0014              ;normal mode small health drop
        rts
+       lda #$0002              ;hard mode small health drop
        rts
        
;        .pb:
;        ;
;        rts
;        
;        .missile:
;        ;
;        rts
;        
;        .super:
;        ;
;        rts
        