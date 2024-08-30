lorom

macro subtract(addr, amount)
    lda <addr>
    sec
    sbc <amount>
    sta <addr>
endmacro
        
macro add(addr, amount)
    lda <addr>
    clc
    adc <amount>
    sta <addr>
endmacro

macro leftshift(addr, repeats)
    !a #= 0
    lda <addr>
    while !a < <repeats>
        asl
        a #= a+1
    endif
    sta <addr>
endmacro

macro rightshift(addr, repeats)
    !a #= 0
    lda <addr>
    while !a < <repeats>
        lsr
        a #= a+1
    endif
    sta <addr>
endmacro

macro singledrawinst(label, tile)
    .<label>:
    dw $0001, $00<tile>, $0000
endmacro

;macro marco()
;    <>
;endmacro
