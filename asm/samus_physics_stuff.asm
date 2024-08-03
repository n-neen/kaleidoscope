lorom

org $909ea1
    dw $1900
    dw $0600
    dw $0900
    
;remove shinespark health drain:
org $90D0CE         ;vertical
    nop : nop : nop

org $90D0FD         ;diagonal
    nop : nop : nop

org $90D129         ;horizontal
    nop : nop : nop
    
org $90d2ba         ;shinespark health check
    nop #8
    