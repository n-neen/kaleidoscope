lorom

!color                  =       $7ec000
!color_backup_table     =       $7exxxx
!color_index            =       $dp
!glow_table             =       $7exxxx
!colormask              =       $14

!red_mask               =       #%0000000000011111
!green_mask             =       #%0000001111100000
!blue_mask              =       #%0111110000000000

org $b8d000
    
    main:
        phx
        phy
        pha
-        
        lda !glow_index
        
        .loop:
        tax
        jsr color_down
        inc !glow_index
        cmp #$0020
        beq +
        
        bra ++
+       stz !glow_index
        bra -
++      plx
        ply
        pla
        rtl
    
    color_down:
        ;arguments:
        ;x  =   color index
        ;y  =   color mask
        ;a  =   
        lda !color_backup_table,x
        sty !colormask
        and !colormask
        sec
        sbc !color_index
        bmi .return_zero
        and !colormask
        sta !color,x
        rts
        
        
        .return_zero:
        stz !color,x
        rts


;1. back up all colors
;2. routine that takes: color index and glow index as arguments. depending on if we are rising or falling,
;   inc or dec each of the re, green, and blue components. if any of them would underflow, return 0 for that component instead
;3. loop that 