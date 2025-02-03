lorom

!return         =       $c654
!setcolorindex  =       $c655
!done           =       $c595
!goto           =       $c61e
!delete         =       $c5cf

incsrc ./macros.asm

org $8dc5c6
    pfo:
        dw !return, .list
        
org $8dd9d0
    .list:
        dw !setcolorindex, $0000        ;7ec000, the screen backdrop color
        
        %colorinstruction($0c01, $1, 0, 16)   ;up
        %colorinstruction($0c01, $1, 1, 16)
        %colorinstruction($0c01, $1, 2, 16)
        %colorinstruction($0c01, $1, 3, 16)
        
        %colorinstruction($0c01, $1, 4, 40)
            
        %colorinstruction($0c01, $1, 3, 10)    ;down
        %colorinstruction($0c01, $1, 2, 10)
        %colorinstruction($0c01, $1, 1, 10)
        %colorinstruction($0c01, $1, 0, 30)

        dw !goto, .list
        ;warn pc            ;db62
        
        
org $8d8200             ;same deal: backdrop glow, but this one is for the title screen

!waitscale  =   $0003

    titlepfo:
        dw !return, .list
        
        .list:
            dw !setcolorindex, $0000        ;7ec000, the screen backdrop color
            
            dw !waitscale*1, $0000, !done   ;up
            dw !waitscale*2, $0401, !done
            dw !waitscale*3, $0802, !done
            dw !waitscale*4, $0803, !done
            dw !waitscale*5, $0C04, !done
            dw !waitscale*5, $1004, !done
            dw !waitscale*5, $1405, !done
            dw !waitscale*5, $1406, !done
            dw !waitscale*5, $1807, !done
            dw !waitscale*5, $1c08, !done
            dw !waitscale*5, $2009, !done
            
            dw !waitscale*10, $2009, !done   ;dwell
            
            dw !waitscale*6, $2009, !done
            dw !waitscale*5, $1c08, !done
            dw !waitscale*4, $1807, !done
            dw !waitscale*3, $1406, !done
            dw !waitscale*2, $1405, !done
            dw !waitscale*1, $1004, !done
            dw !waitscale*1, $0C04, !done
            dw !waitscale*1, $0803, !done
            dw !waitscale*1, $0802, !done
            dw !waitscale*1, $0401, !done
            dw !waitscale*1, $0000, !done   ;down




            dw !goto, .list
        ;warn pc