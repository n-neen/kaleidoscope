lorom

org $8B9F29         ;remove title demos (attract mode)

LDA $1F53

org $8289ea         ;skip hex map
    ;inc $0998
    ;rts
    
    jsl $819e3e    ;vanilla code in this spot
    rts
    
org $81a98a         ;hex map 'PLANET ZEBES' sprite removal
    nop #4