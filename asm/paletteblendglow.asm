lorom

incsrc ./macros.asm

;instructions

!setindex   =   $c655
!done       =   $c595
!goto       =   $c61e

;macro colorentry(color, diff, times)
;    dw (<color>)+((<diff>)*(<times>))
;endmacro

org $8d8000
    pfo:
        dw #.preinst, #.inst
        
    .preinst:
        rts
        
    .inst:
        dw !setindex, $0032                 ;start at $c032, palette blend color 0
        
        dw $000f
        %colorentry($001f, 0, 1)            ;ramp up
        %colorentry($5c05, 0, 1)
        %colorentry($0843, 0, 1)
        dw !done
        
        dw $000f
        %colorentry($001f, -2, 1)
        %colorentry($5c05, 3<<10, -1)
        %colorentry($0843, 4<<5, 2)
        dw !done
        
        dw $000f
        %colorentry($001f, -4, 2)
        %colorentry($5c05, 3<<10, -2)
        %colorentry($0843, 4<<5, 3)
        dw !done
        
        dw $000f
        %colorentry($001f, -4, 4)
        %colorentry($5c05, 3<<10, -4)
        %colorentry($0843, 4<<5, 4)
        dw !done
        
        dw $0040
        %colorentry($001f, -4, 4)
        %colorentry($5c05, 3<<10, -5)       ;dwell
        %colorentry($0843, 4<<5, 5)
        dw !done
        
        dw $0008
        %colorentry($001f, -3, 3)
        %colorentry($5c05, 3<<10, -3)       ;ramp down
        %colorentry($0843, 3<<5, 5)
        dw !done
        
        dw $0008
        %colorentry($001f, -3, 2)
        %colorentry($5c05, 3<<10, -2)
        %colorentry($0843, 3<<5, 3)
        dw !done
        
        dw $0008
        %colorentry($001f, -3, 1)
        %colorentry($5c05, 3<<10, -1)
        %colorentry($0843, 3<<5, 1)
        dw !done
        
        dw !goto, .inst+4
        
        ;warn pc        ;805d