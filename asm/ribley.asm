lorom

;ridley area checks. just change all check for area 2 into 5

org $a6a15f
    cmp #$0005
    
org $a6a36c
    cpy #$0005
    
org $a6a427
    cmp #$0005
    
org $a6a46c
    cmp #$0005
    
org $a6a47b
    cmp #$0005
    
org $a6d917
    cmp #$0005
    
org $a6d93e
    cmp #$0005
    
org $a6df8d
    cmp #$0005
    
org $a6e4d5
    cmp #$0005
    
;ridley palette fade-in (bg1/2, not sprite palettes)

org $a6a4d6
    rts
    
org $a6a1e0
    nop #8
    
;ridley start escape sequence

org $a6c5ea
    jsr ridleyescapetimer
    nop #4

org $a6febc
    ridleyescapetimer:
    
    lda #$0005      ;\
    sta $18e3       ;| start earthquake:
    lda #$ffff      ;| type 5, timer $ffff
    sta $1840       ;/
    
    jsl $a6c23f     ;set up escape text
    
    lda #$000e
    jsl $8081fa     ;set escape event
    
    lda #$0007
    jsl $808fc1     ;queue music track
    
    rts
    

    
;Start_Esc_on GrayDoor by Oi27, embedded here just because:
;---------------------------------
;Main ASM; start escape timer when a specific gray door starts flashing.
lorom

!DoorIndex = #$0000	;PLM index of door to trigger escape
!freeram = $1776	;speed2 of enemy $1F. Clears automatically between rooms.
					;ASM will break if you use enemy index $1F in the same room.
org $809E20 
LDA #$0400    ;Set escape timer to 4 minutes, 0 seconds.

org $8FFEA0
LDA !DoorIndex : ASL A : PHA		;\
LDA #$004E : SEC : SBC $01,s : TAX	;|-Take !DoorIndex as the shown PLM index of the gray door, index PLM RAM with it
PLA									;|
LDA $1CD7,x							;| Note PLMs index through their RAM backward for some reason. Lower PLM indices are stored at higher addresses.
CMP #$BD0F							;/ Check if the door's pre-instruction pointer is set to be a flashing gray door.
BNE +
    
LDA !freeram : BNE ++	;Branch if !freeram is not 0. This routine increments it, so the timer code here will only run once instead of every frame the door is flashing.
	;LDA #$FF24 : JSL $808FC1		;\
	;LDA #$0005 : JSL $808FC1        ;/-Uncomment these lines to change music to escape
    LDX $0330							;\
    LDA #$0400 : STA $D0,X           	;|-Load Timer GFX
    LDA #$C000 : STA $D2,X            	;|
    LDA #$B0B0 : STA $D4,X            	;|
    LDA #$7E00 : STA $D5,X            	;|
    TXA : CLC : ADC #$0007 : STA $0330  ;/
    
    LDA #$0002 : STA $0943            ;\-Set Timer Handling
    LDA #$E0E6 : STA $0A5A            ;|
    LDA #$0002 : STA $0947            ;/
	INC !freeram
++
+
RTS


