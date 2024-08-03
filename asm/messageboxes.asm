lorom

;skip missile station message box
org $848cda
    nop : nop : nop : nop : nop : nop : nop

;skip energy station message box
org $848cb9
    nop : nop : nop : nop : nop : nop : nop

;skip save station saved game message
org $84b026
    nop : nop : nop : nop : nop : nop : nop

;skip gunship message boxes
org $a2ab1f
	nop #12

;skip map station message box
org $848c9f
	lda #$0001
	jsl $90f084

;skip save station message box
org $848cf6
	lda #$0000 : nop
    
org $85817b  ;21 bytes
    nop #21
    ;lda #%10111011     ;color math = disabled on bg3
    ;sta $73

    ;lda #%00000000     ;subscreen layers
    ;sta $6b
    
    ;lda #%00000000     ;main screen
    ;sta $6a
