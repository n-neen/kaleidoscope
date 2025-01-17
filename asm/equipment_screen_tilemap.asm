lorom

;L/R button spritemaps:

org $82c465     ;L/R highlight
    ;
    
    
org $82c48f     ;pressed L button
    ;
    
    
org $82c4a0     ;pressed R button
    ;
    
    
    
    
;pause screen layers and tilemap

org $829346     ;hijack for below
    jsr colorfix

org $82f900     ;restore subscreen backdrop color during unpause
    colorfix:
    lda #$e0e0
    sta $74
    sta $75
    inc $0998
    rts

org $82a0cb     ;7 bytes here (bg4 settings, useless space
    nop #7
    ;lda #$7fff
    ;sta $7ec200
    

org $82a0d2
    lda #%00010001      ;main screen layers
    
org $82a0e0             ;22 bytes
    lda #%10000000      ;blue
    sta $74
    lda #%01001111      ;green
    sta $75
    lda #%00100011      ;red
    sta $76
    lda #%10101101      ;color math settings
    sta $71
    lda #%00000010      ;subscreen layers
    sta $6b
    nop
    rts
    

org $82bff6     ;vanilla's speed booster slot (we just bring the bottom of the box up by one
    dw $B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942
    
org $82c066     ;speedbooster bitmask
    dw $0000

org $82c086     ;speedbooster tilemap ram offset (idk just throw it away somewhere idk
    dw $ffff
    

org $b6e800     ;bg1 tilemap for equipment screen
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$2800,$0800,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$28BE,$28BE,$68BD,$2801,$293A,$293B,$293C,$293D,$293E,$293F,$2801,$28BD,$28BE,$28BE,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25B3,$65B3,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25BC,$25BD,$25BE,$25C3,$65C3,$65BE,$65BD,$65BC,$3941,$3942,$3942,$3943,$28F6,$28F7,$28F8,$7943,$3942,$3942,$7941,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25CC,$25CD,$25CE,$25D3,$65D3,$65CE,$65CD,$65CC,$3940,$0CFF,$0D00,$0D01,$0D02,$0D03,$0D04,$0D05,$0CD4,$0CD4,$7940,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25DC,$25DD,$25EC,$25ED,$257C,$257D,$257E,$257F,$7954,$0CFF,$0CD0,$0CD1,$0CD2,$0CD3,$0D03,$0D04,$0D05,$0CD4,$7940,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25F0,$25F1,$25FC,$25FD,$65FD,$65FC,$65F1,$65F0,$B941,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$F941,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2570,$2571,$2572,$2573,$2574,$6572,$6571,$6570,$3941,$3942,$3942,$3943,$29B0,$29B1,$29B2,$7943,$3942,$3942,$7941,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2580,$2581,$2594,$2583,$2584,$2578,$2586,$2587,$3940,$08FF,$0920,$0921,$0922,$0923,$0917,$0918,$090F,$091F,$7940,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$2590,$2591,$25A4,$25A5,$65A5,$2588,$2596,$2597,$7954,$08FF,$08D5,$08D6,$08D7,$08D4,$08D4,$08D4,$08D4,$08D4,$7940,$0800,
       $0000,$0000,$0000,$3941,$3943,$38F9,$38FA,$38FB,$7943,$7941,$0000,$2945,$25A0,$25A1,$25B4,$25B5,$65B5,$65B4,$25A6,$25A7,$3940,$08FF,$0910,$0911,$0912,$0913,$0914,$0915,$0916,$08D4,$7940,$0800,
       $0000,$0000,$0000,$3940,$08FF,$08D8,$08D9,$08DA,$08E7,$7940,$3945,$2955,$0000,$25C9,$25C4,$25C5,$65C5,$65C4,$0000,$0000,$3940,$08FF,$08E0,$08E1,$08E2,$08E3,$08E4,$08E5,$08E6,$08D4,$7940,$0800,
       $0000,$0000,$0000,$3940,$08FF,$08DB,$08DC,$08D4,$08D4,$3954,$3955,$0000,$0000,$0000,$25D4,$25D5,$65D5,$65D4,$0000,$0000,$B941,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$F941,$0800,
       $0000,$0000,$0000,$3940,$08FF,$08DD,$08DE,$08DF,$08D4,$7940,$0000,$0000,$0000,$0000,$25B6,$25B7,$65B7,$65B6,$0000,$0000,$3941,$3942,$3942,$3943,$2CA0,$2CA1,$2CA2,$7943,$3942,$3942,$7941,$0800,
       $0000,$0000,$0000,$3940,$08FF,$08E8,$08E9,$08EA,$08EB,$7940,$0000,$0000,$0000,$0000,$25C6,$25C7,$65C7,$65C6,$0000,$0000,$3940,$0CFF,$0D30,$0D31,$0D32,$0D33,$0D34,$0D35,$0D36,$0CD4,$7940,$0000,
       $0000,$0000,$0000,$3940,$08FF,$08EC,$08ED,$08EE,$08EF,$7940,$0000,$0000,$0000,$0000,$25D6,$05D7,$45D7,$65D6,$0000,$0000,$3940,$0CFF,$0CF0,$0CF1,$0CF2,$0CF3,$0CF4,$0CF5,$0CD4,$0CD4,$7940,$0000,
       $0000,$0000,$0000,$B941,$B942,$B942,$B942,$B942,$B942,$F941,$0000,$0000,$0000,$0000,$258F,$0000,$0000,$658F,$0000,$F955,$B941,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$B942,$F941,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$258E,$259E,$259F,$0000,$0000,$659F,$25EE,$259D,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$25AD,$25AE,$25AF,$0000,$0000,$65AF,$25FE,$65AD,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,
       $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
        
        
        ;$31d0,$0000,$0000,$0000,$0000,$0000,$3941
        ;$35d0,$0000,$0000,$0000,$0000,$0000,$0000
        ;$31d0,$0000,$0000,$0000,$0000,$0000,$0000
        ;$35d0,$0000,$0000,$0000,$0000,$0000,$0000
        ;$31d0,$0000,$0000,$0000,$0000,$0000,$0000
        ;$35d0,$0000,$0000,$0000,$0000,$0000,$3941