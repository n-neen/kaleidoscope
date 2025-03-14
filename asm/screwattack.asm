lorom

!screwdmg   = $09ec         ;free ram. needs to be saved to sram
!screwinc   = #$0001        ;amount to increase damage for every tank collected
!80free     = $80e000       ;bank $80 freespace
!81free     = $81ff60       ;bank $81 freespace
!84free     = $84f900

org $899000                 ;overwrites reserve tank graphics
    incbin ./screwtank.gfx

org $a0a4c2
    ldy !screwdmg           ;screw attack damage (n-1)
    
;org !84free                 ;increase screw damage
;    tank:
;        lda !screwdmg
;        clc
;        adc !screwinc
;        sta !screwdmg
;        
;        lda #$0160
;        jsl $82e118
;        
;        jsr $b7ef               ;see messagebox.asm $84b7ef
;        iny : iny
;        rts
        
;oi is cookin it, y'all bookin it
;that means writing it down
;gonna lay down some caves
;all over the place
;and then get right outta town
        
org $848986 ;18 bytes
        lda !screwdmg
        clc
        adc !screwinc
        sta !screwdmg
        
        lda #$0160
        jsl $82e118
        
        jsr $b7ef               ;see messagebox.asm $84b7ef
        iny : iny
        rts
        
org $81b309
    jsr screwinit

org !81free                 ;initialize screw damage to 1 (when new game is started)
    screwinit:
        lda #$0001         
        sta !screwdmg       ;this has been moved to be run by the screw attack plm
        rts                 ;to avoid needing freespace in $81

        
;=============================================HUD
        
;display screw attack damage on hud

org $828baf             ;main gameplay loop hijack
    jsl screwdraw
        
org !80free             ;draw screw attack damage in hud
    screwdraw:
        ;lda #$00ff
        ;jsl $808233     ;debug. checks event $ff (set in quickmet config)
        ;bcc +           ;if quickmet, then set screwdmg to 2 (3)
                        ;;because we skip the init for this value
        ;lda #$0003
        ;sta !screwdmg
        
    
+       lda $09a4
        bit #$0008
        beq ++          ;if screw is not obtained, exit
        
        lda #$9dd3      ;tilemap pointer setup for hud drawing
        sta $00
        lda #$0080
        sta $02

        lda !screwdmg
        dec             ;screw does 0 damage at both 0 and 1
        ldx #$00ae		;under vanilla xray spot
        jsr $9d98		;draw it
        
        jsl $a08687     ;the thing we overwrote (handle room shaking)
++      rtl

org $84e896                             ;screw attack, chozo orb instruction list. last word
    dw $8724, #screwinstextension       ;goto our instruction list exstension
    
org !84free+30
    screwinstextension:
        dw $0001, $a2b5                 ;the draw instruction we overwrote
        dw #screwhudinit                ;our custom instruction
        ;dw $88f3, $0008 : db $0a
        dw $86bc                        ;delete
        
    screwhudinit:
        ;lda #$0001                     ;init to 1 which is actually 0
        ;sta !screwdmg         ;-------->>>>>>>>>>>>>this made no sense to do here. reverted back to init this when new save is created
        jsl $809a2e                     ;add grapple to hud tilemap
        rts

org $809a39                             ;grapple (our screw) moved to vanilla xray spot
    ldx #$002e

org $809abd                             ;grapple hud init
    lda $09a4                           ;change to check for screw collected (not grapple equipped)
    bit #$0008
    
org $8099bf                             ;hud tilemap
    dw $3438, $f439, $3439, $f438