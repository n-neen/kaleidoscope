lorom

;org defines

!84free = $84f950
!8ffree = $8ff300
!aafree = $aaf800

;plm instruction defines

!moveright  = $abd6
!goto       = $8724
!settimer   = $874e
!checktimer = $873f
!delete     = $86bc

org !8ffree                     ;use as main room asm
    lda $0e50
    cmp $0e52                   ;if enemy quota for room not met, exit
    bne +
    jsl $8483d7                 ;spawn plm
    db $0b, $1b : dw #crumbler  ;location and type to spawn
    stz $07df                   ;zero pointer (won't run after this)
+   rts
    

org !84free
    crumbler:
        dw #.init, #.inst
        
        .init:
        rts
        
        .inst:
        dw !settimer : db $04
        .next:
        dw $0004, #.frameone
        dw $0008, #.frametwo
        dw $0008, #.framethree
        dw $0008, #.framefour
        dw $0001, #.blanktile
        dw !moveright
        dw !checktimer, #.next
        dw !delete
        
        .frameone:
            dw $0001, $0052, $0000
        
        .frametwo:
            dw $0001, $0053, $0000 
        
        .framethree:
            dw $0001, $0054, $0000 
            
        .framefour:
            dw $0001, $0055, $0000 

        .blanktile:
            dw $0001, $00ff, $0000
            
            
org $aab263
    jsr btcounter : nop
    
org !aafree
    btcounter:              ;make bt inc the enemy counter. because it doesn't normally
        inc $0e50
        jsl $a0baa4         ;the thing we overwrote (spawn bt drops)
        rts
        