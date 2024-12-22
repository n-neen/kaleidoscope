lorom

!setindex   =   $c655
!done       =   $c595
!goto       =   $c61e

;brinstar pfo list: $80 bit
org $83ac86+14
    dw #pfo_acid

org $8d8060
    pfo_acid:
        dw #.preinst, #.inst
        
    .preinst:
        rts
        
    .inst:
        dw !setindex, $0002
        
        dw $0004, $75CE, $7C50, $5410, !done       ;up
        dw $0004, $71CE, $7850, $500F, !done
        dw $0004, $71CE, $7470, $4C2F, !done
        dw $0004, $71EF, $6CB0, $484E, !done
        dw $0004, $6DEF, $68D0, $446E, !done
        dw $0004, $6DEF, $64F0, $406D, !done
        dw $0004, $6A10, $6110, $3C8D, !done
        dw $0004, $6A10, $5D30, $3CAD, !done
        dw $0004, $6A10, $5950, $38CC, !done
        dw $0004, $6A10, $5550, $34CC, !done
        dw $0004, $6631, $5170, $34EC, !done
        dw $0004, $6631, $5190, $30EB, !done
        dw $0004, $6631, $4D90, $30EB, !done
        dw $0004, $6631, $4DB0, $2D0B, !done
        dw $0004, $6631, $49B0, $2D0B, !done
        
        dw $0020, $6652, $49D0, $2D2B, !done       ;dwell here
        
        dw $0005, $6631, $49B0, $2D0B, !done       ;down
        dw $0005, $6631, $4DB0, $2D0B, !done
        dw $0005, $6631, $4D90, $30EB, !done
        dw $0005, $6631, $5190, $30EB, !done
        dw $0005, $6631, $5170, $34EC, !done
        dw $0005, $6A10, $5550, $34CC, !done
        dw $0005, $6A10, $5950, $38CC, !done
        dw $0005, $6A10, $5D30, $3CAD, !done
        dw $0005, $6A10, $6110, $3C8D, !done
        dw $0005, $6DEF, $64F0, $406D, !done
        dw $0005, $6DEF, $68D0, $446E, !done
        dw $0005, $71EF, $6CB0, $484E, !done
        dw $0005, $71CE, $7470, $4C2F, !done
        dw $0005, $71CE, $7850, $500F, !done
        dw $0005, $75CE, $7C50, $5410, !done

        dw !goto, .inst+4
        
        ;warn pc
        ;81a3