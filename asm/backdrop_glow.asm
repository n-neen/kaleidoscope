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
        
        %colorinstruction($0c01, $1, 0, 15)   ;up
        %colorinstruction($0c01, $1, 1, 15)
        %colorinstruction($0c01, $1, 2, 15)
        %colorinstruction($0c01, $1, 3, 15)
        
        %colorinstruction($0c01, $1, 4, 30)
            
        %colorinstruction($0c01, $1, 3, 10)    ;down
        %colorinstruction($0c01, $1, 2, 10)
        %colorinstruction($0c01, $1, 1, 10)
        %colorinstruction($0c01, $1, 0, 30)

        dw !goto, .list
        ;warn pc            ;db62