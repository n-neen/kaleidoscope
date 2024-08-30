lorom

;plm argument:
;high byte = x distance away (signed byte)
;low byte  = y distance away (signed byte)

!84free     =   $84fd00
!setpreinst =   $86c1
!goto       =   $8724
!thisblock  =   $0dc4
!plmx       =   $1c29               ;only valid after calling $848290
!plmy       =   $1c2b               ;^/


org !84free
    plm:
        dw #.init, #.inst
        
    .init:
        rts
    
    .inst:
        dw !setpreinst, #.main
        dw !goto, .inst
        
    .main:                          ;x=plm index here
        jsl $848290                 ;calculate plm coordinates
        
        lda $1dc7,x                 ;plm argument low byte
        and #$00ff
        bmi .negativey
        
        ;*waves arms*
        
        lda $1dc7,x                 ;plm argument high byte
        and #$ff00
        bmi .negativex
        
        .negativex:
            ;to
        .negativey:
            ;do
        
        rts