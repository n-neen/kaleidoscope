;title screen logo sprite

org $8DC696                 ;palette fx object
    dw  $C655, $0142,  ; Palette FX object colour index = 0142h
        $0003,
        $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, 
        $C595,        ; Done
        $0003, 
        $0401, $0000, $0000, $0401, $0401, $0401, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $0C03, $0401, $0401, $0802, $0802, $0802, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $1004, $0402, $0802, $0C03, $0C03, $0C03, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $1806, $0803, $0C03, $1004, $1405, $1004, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $1C07, $0C03, $0C04, $1405, $1806, $1405, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $2409, $0C04, $1005, $1806, $1C07, $1806, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $0003, 
        $302C, $1406, $1807, $2008, $280A, $2409, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000,
        $C595,        ; Done
        $C5CF         ; Delete
    
    
org $8ce1e9+$140            ;palette
    ;dw $74BE, $302C, $280A, $2409, $2008, $1807, $1406, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
    ;dw $74BE, $302C, $1406, $1807, $2008, $2409, $280A, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
    dw $74BE, $302C, $1406, $1807, $2008, $280A, $2409, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
    
    
org $9580D8                 ;graphics
    incbin "./logo_title_compressed_graphics.bin"
    
    
org $8C879D                 ;spritemaps
    DW $001C
    DB $5B,$80,$FE,$6A,$30
    DB $5B,$80,$EE,$4A,$30
    DB $4B,$80,$FE,$68,$30
    DB $4B,$80,$EE,$48,$30
    DB $3B,$80,$FE,$66,$30
    DB $3B,$80,$EE,$46,$30
    DB $2B,$80,$FE,$64,$30
    DB $2B,$80,$EE,$44,$30
    DB $1B,$80,$FE,$62,$30
    DB $1B,$80,$EE,$42,$30
    DB $0B,$80,$FE,$60,$30
    DB $0B,$80,$EE,$40,$30
    DB $06,$80,$00,$2E,$30
    DB $06,$80,$F0,$0E,$30
    DB $F6,$81,$00,$2C,$30
    DB $F6,$81,$F0,$0C,$30
    DB $E6,$81,$00,$2A,$30
    DB $E6,$81,$F0,$0A,$30
    DB $D6,$81,$00,$28,$30
    DB $D6,$81,$F0,$08,$30
    DB $C6,$81,$00,$26,$30
    DB $C6,$81,$F0,$06,$30
    DB $B6,$81,$00,$24,$30
    DB $B6,$81,$F0,$04,$30
    DB $A6,$81,$00,$22,$30
    DB $A6,$81,$F0,$02,$30
    DB $96,$81,$00,$20,$30
    DB $96,$81,$F0,$00,$30


org $88eb67
    jsr backdropglow
    nop #5
    
org $88fa00
    backdropglow:
    jsl $888435
    db $00, $31 : dw $eb85
    
    ldy #$c5c6                          ;see "backdrop_glow.asm"
    jsl $8dc4e9                         ;c5c6 is the original one and is used ingame. 8200 was made for this.
    rts


org $8cbc5d                             ;hdma tables for title screen gradient

TitleSequenceHDMATables:
    dw TitleSequenceHDMATables_0                                         ;8CBC5D;
    dw TitleSequenceHDMATables_0                                         ;8CBC5F;
    dw TitleSequenceHDMATables_0                                         ;8CBC61;
    dw TitleSequenceHDMATables_0                                         ;8CBC63;
    dw TitleSequenceHDMATables_1                                         ;8CBC65;
    dw TitleSequenceHDMATables_2                                         ;8CBC67;
    dw TitleSequenceHDMATables_3                                         ;8CBC69;
    dw TitleSequenceHDMATables_4                                         ;8CBC6B;
    dw TitleSequenceHDMATables_5                                         ;8CBC6D;
    dw TitleSequenceHDMATables_6                                         ;8CBC6F;
    dw TitleSequenceHDMATables_7                                         ;8CBC71;
    dw TitleSequenceHDMATables_8                                         ;8CBC73;
    dw TitleSequenceHDMATables_9                                         ;8CBC75;
    dw TitleSequenceHDMATables_A                                         ;8CBC77;
    dw TitleSequenceHDMATables_B                                         ;8CBC79;
    dw TitleSequenceHDMATables_C                                         ;8CBC7B;

TitleSequenceHDMATables_0:
    db  $04, $EF,
        $04, $EE,
        $04, $ED,
        $04, $EC,
        $04, $EB,
        $04, $EA,
        $04, $E9,
        $04, $E8,
        $04, $E7,
        $04, $E6,
        $05, $E5,
        $06, $E4,
        $08, $E3,
        $09, $E2,
        $09, $E1,
        $33, $E0,
        $04, $E0,
        $0C, $E1,
        $0A, $E2,
        $0A, $E3,
        $07, $E4,
        $06, $E5,
        $05, $E6,
        $05, $E7,
        $05, $E8,
        $05, $E9,
        $06, $EA,
        $05, $EB,
        $05, $EC,
        $05, $ED,
        $05, $EE,
        $01, $EF,
        $00, $00                                                        

TitleSequenceHDMATables_1:
    db  $40, $E0, 
        $40, $E0, 
        $10, $E0, 
        $30, $E1, 
        $28, $E2, 
        $28, $E3, 
        $1C, $E4, 
        $18, $E5,
        $14, $E6, 
        $14, $E7, 
        $14, $E8, 
        $14, $E9, 
        $18, $EA, 
        $14, $EB, 
        $14, $EC, 
        $14, $ED,
        $14, $EE, 
        $04, $EF, 
        $00, $00  

TitleSequenceHDMATables_2:
    db  $40, $E0, 
        $40, $E0, 
        $0E, $E0, 
        $2A, $E1, 
        $23, $E2, 
        $23, $E3, 
        $19, $E4, 
        $15, $E5,
        $12, $E6, 
        $12, $E7, 
        $12, $E8, 
        $12, $E9, 
        $15, $EA, 
        $12, $EB, 
        $12, $EC, 
        $12, $ED,
        $12, $EE, 
        $04, $EF, 
        $00, $00                                        

TitleSequenceHDMATables_3:
    db  $40, $E0, 
        $40, $E0, 
        $0C, $E0, 
        $24, $E1, 
        $1E, $E2, 
        $1E, $E3, 
        $15, $E4, 
        $12, $E5,
        $0F, $E6, 
        $0F, $E7, 
        $0F, $E8, 
        $0F, $E9, 
        $12, $EA, 
        $0F, $EB, 
        $0F, $EC, 
        $0F, $ED,
        $0F, $EE, 
        $03, $EF, 
        $00, $00

TitleSequenceHDMATables_4:
    db  $40, $E0, 
        $40, $E0, 
        $0A, $E0, 
        $1E, $E1, 
        $19, $E2, 
        $19, $E3, 
        $12, $E4, 
        $0F, $E5,
        $0D, $E6, 
        $0D, $E7, 
        $0D, $E8, 
        $0D, $E9, 
        $0F, $EA, 
        $0D, $EB, 
        $0D, $EC, 
        $0D, $ED,
        $0D, $EE, 
        $03, $EF, 
        $00, $00                                        

TitleSequenceHDMATables_5:
    db  $08, $E2, 
        $12, $E1, 
        $64, $E0, 
        $02, $E0, 
        $08, $E0, 
        $18, $E1, 
        $14, $E2, 
        $14, $E3, 
        $0E, $E4, 
        $0C, $E5, 
        $0A, $E6, 
        $0A, $E7, 
        $0A, $E8, 
        $0A, $E9, 
        $0C, $EA, 
        $0A, $EB,
        $0A, $EC, 
        $0A, $ED, 
        $0A, $EE, 
        $02, $EF, 
        $00, $00                        

TitleSequenceHDMATables_6:
    db  $08, $E2, 
        $12, $E1, 
        $64, $E0, 
        $02, $E0, 
        $08, $E0, 
        $17, $E1, 
        $13, $E2, 
        $13, $E3, 
        $0E, $E4, 
        $0C, $E5, 
        $0A, $E6, 
        $0A, $E7, 
        $0A, $E8, 
        $0A, $E9, 
        $0C, $EA, 
        $0A, $EB, 
        $0A, $EC, 
        $0A, $ED, 
        $0A, $EE, 
        $02, $EF, 
        $00, $00                        

TitleSequenceHDMATables_7:
    db  $06, $E3, 
        $10, $E2, 
        $10, $E1, 
        $5A, $E0, 
        $07, $E0, 
        $15, $E1, 
        $12, $E2, 
        $12, $E3, 
        $0D, $E4, 
        $0B, $E5, 
        $09, $E6, 
        $09, $E7, 
        $09, $E8, 
        $09, $E9, 
        $0B, $EA, 
        $09, $EB, 
        $09, $EC, 
        $09, $ED, 
        $09, $EE, 
        $02, $EF, 
        $00, $00                        

TitleSequenceHDMATables_8:
    db  $06, $E3, 
        $10, $E2, 
        $10, $E1, 
        $5A, $E0, 
        $07, $E0, 
        $14, $E1, 
        $11, $E2, 
        $11, $E3, 
        $0C, $E4, 
        $0A, $E5, 
        $09, $E6, 
        $09, $E7, 
        $09, $E8, 
        $09, $E9, 
        $0A, $EA, 
        $09, $EB, 
        $09, $EC, 
        $09, $ED, 
        $09, $EE, 
        $02, $EF, 
        $00, $00                        

TitleSequenceHDMATables_9:
    db  $02, $E5, 
        $09, $E4, 
        $0C, $E3, 
        $0E, $E2, 
        $0E, $E1, 
        $4D, $E0, 
        $06, $E0, 
        $12, $E1,
        $0F, $E2, 
        $0F, $E3, 
        $0B, $E4, 
        $09, $E5, 
        $08, $E6, 
        $08, $E7, 
        $08, $E8, 
        $08, $E9,
        $09, $EA, 
        $08, $EB, 
        $08, $EC, 
        $08, $ED, 
        $08, $EE, 
        $02, $EF, 
        $00, $00        

TitleSequenceHDMATables_A:
    db  $02, $E5, 
        $09, $E4, 
        $0C, $E3, 
        $0E, $E2, 
        $0E, $E1, 
        $4D, $E0, 
        $06, $E0, 
        $11, $E1, 
        $0E, $E2, 
        $0E, $E3, 
        $0A, $E4, 
        $09, $E5, 
        $08, $E6, 
        $08, $E7, 
        $08, $E8, 
        $08, $E9,
        $09, $EA, 
        $08, $EB, 
        $08, $EC, 
        $08, $ED, 
        $08, $EE, 
        $02, $EF, 
        $00, $00  

TitleSequenceHDMATables_B:
    db  $05, $E8, 
        $05, $E7, 
        $05, $E6, 
        $07, $E5, 
        $08, $E4, 
        $0A, $E3, 
        $0C, $E2, 
        $0C, $E1,
        $40, $E0, 
        $05, $E0, 
        $0F, $E1, 
        $0D, $E2, 
        $0D, $E3, 
        $09, $E4, 
        $08, $E5, 
        $07, $E6,
        $07, $E7, 
        $07, $E8, 
        $07, $E9, 
        $08, $EA, 
        $07, $EB, 
        $07, $EC, 
        $07, $ED, 
        $07, $EE,
        $02, $EF, 
        $00, $00  

TitleSequenceHDMATables_C:
    db  $05, $E8, 
        $05, $E7, 
        $05, $E6, 
        $07, $E5, 
        $08, $E4, 
        $0A, $E3, 
        $0C, $E2, 
        $0C, $E1, 
        $40, $E0, 
        $05, $E0, 
        $0E, $E1, 
        $0C, $E2, 
        $0C, $E3, 
        $08, $E4, 
        $07, $E5, 
        $06, $E6,
        $06, $E7, 
        $06, $E8, 
        $06, $E9, 
        $07, $EA, 
        $06, $EB, 
        $06, $EC, 
        $06, $ED, 
        $06, $EE,
        $02, $EF,
        $00, $00                                                
