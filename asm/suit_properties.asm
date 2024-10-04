lorom

;balance suits

org $8de37c         ;heat damage check = only varia (item $0001)
    bit #$0001
    bne $2a