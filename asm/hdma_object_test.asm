lorom

;test hdma object, spawned by plm

!84free  = $f400
!88free  = $ee32


!scanone = $bf
!scantwo = $10

;plm-------------------------------------------------------------------

org $840000+!84free

    plm:
        dw .setup, .instlist
        
        .setup:
            jsl spawn
            rts
            
        .instlist:
            dw $86bc        ;delete
            
;hdma object-----------------------------------------------------------

org $880000+!88free

    spawn:
        jsl $888435
        db $00, $31 : dw hdma_instlist
        rtl
        

    hdma:
        .instlist:
            dw $8655 : db $88       ;direct hdma table in bank $88
            .loop:
            dw $7777, .direct       ;direct hdma table location
            dw $85ec, .loop         ;goto loop
                      
        .direct:
            db $1f, $00        ;under hud
            db $40, $bf
            db $40, $00
            db $40, $ff
            db $00             ;terminator
            
            ;warn pc