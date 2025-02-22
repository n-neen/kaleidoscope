lorom

;polly esther (monogamous)
;taken from gossamer

;========================subtractive math, no math on bg2========================
;replaces the vanilla layer blending type $24

;without layer 3 this looks like $16
;with water this has color math on layer 3 and 1 but not 2. neat effect not obtainable with vanilla code
;wrote this a long time ago, some of this doesn't make sense to include, like the window stuff
;but i don't feel like looking critically at it rn.
;also newblend is a copy/paste of this with layer 3 disabled

org $88803e+$30
    dw #newblend
    
org $88803e+$26
    dw evennewerblend
    
org $88803e+$1e
    dw spritesonlyblend     ;see kaleidoscope.asm


org $888156         ;have space until $817a
    twentyfour:
	lda #$00
	sta $6d			;don't disable any of the subscreen area
	lda #$13
	sta $69			;direct coor, enable subscreen, enable sprites in window area
	lda #$06
	sta $6b			;subscreen layers = bg2, bg3
	lda #$a1
	sta $71			;force main screen black inside window, color math in window, direct color
	lda #$95
	sta $73			;subtractive, enable math on: sprites, bg3, bg1 = 95
    ldy #$02
rts

org $8880d4
    lda #$bf
    
org $88f200         ;have space until $817a
    newblend:
	lda #$00
	sta $6d         ;don't disable any of the subscreen area
	lda #$13
	sta $69         ;direct coor, enable subscreen, enable sprites in window area
	lda #$02
	sta $6b         ;subscreen layers = bg2, bg3
	lda #$a1
	sta $71         ;force main screen black inside window, color math in window, direct color
	lda #$95
	sta $73         ;subtractive, enable math on: sprites, bg3, bg1 = 95
    ;ldy #$02
rts

evennewerblend:
    ;LDY #$04    ; Y = 4
    LDA #$11    ;\
    STA $69     ;} Main screen layers = BG1/sprites
    LDA #$02    ;\
    STA $6B     ;} Subscreen layers = BG2/BG3
    LDA #$B1    ;\
    STA $71     ;} Enable subtractive colour math on BG1/sprites/backdrop
    RTS         

spritesonlyblend:       ;taken from eponymous item
    lda #%00010011      ;main screen layers
    sta $6a
    lda #%00010111      ;subscreen layers
    sta $6b
    lda #%10111111      ;color math enabled everywhere. subtractive math
    sta $73
    lda #%00000011      ;enable color math, enable subscreen layers
    sta $70             ;this is mainly here to overwrite whatever the room fx loaded
    rts