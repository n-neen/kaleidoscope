; PERMA_BLOCK_PLM
;----------------------
;Room Argument is an item ID, just like a missile tank.
;Sets item bit when the block under it is broken. Try not to make it a skippable block.
;On return visits to the room, it searches about a screen's area around itself for tiles with the same Tile Type and BTS as the block under the PLM.
;Tiles are replaced by air, BTS 00.
;Code by Kej, commented by Oi27


!84Free = $84FE00

org !84Free
PlmHeaders:
	dw PermaBlock_setup, PermaBlock_inst

PermaBlock:
.inst
	dw $86B4	; Sleep. Preinstruction handles the rest of the code.
.setup
;[X] PLM tile index
;[Y] PLM index
	TDC : STA $1E17,y    ;clear a variable in case the RAM was not initialized to zero.
	TYX
	LDA $1DC7,x : JSL $80818E
	LDA $7ED870,x : AND $05E7 : BNE +             ;|
	LDA #.preInst_checkDestruction : STA $1CD7,y  ;|-if item bit is NOT already set, give it a preinstruction and return.
	RTS                                           ;|
	
+	
;[X] PLM index
;[Y] PLM index
	TYX
	LDA $1C87,x
	LSR A
	TAX
;[X] PLM tile index
	LDA $7F6402,x
	AND #$00FF
	PHA
;Push BTS of PLM block
	TXA
	ASL A
	TAX
	LDA $7F0002,x
	AND #$F000
	ORA $01,s
	STA $01,s
;[$01,s] = T0BB
;T  = tile type
;BB = BTS of block
	TXA
	LSR A
;[A] = tile index to PLM BTS
;[X] = tile index to PLM Graphic 
;[Y] is set negative bc loop increments it at the start & they want it to start at 0.
	LDY #$FFFF
-	
	INY         ;|
	SEC         ;|-Decrement [A] by room width until it is above the top of the room.
	SBC $07A5   ;|
	BPL -       ;|
;[Y] = number of rows between PLM and top of room.
	CLC         ;|
	ADC $07A5   ;|-bring [A] back to the top of the screen and push it to the stack.
	PHA         ;|
;[$01,s] = 00XX : XX = X position of PLM, as a tile index to BTS RAM.
;[$03,s] = T0BB : T  = tile type : BB = BTS of block
	SEC
	SBC #$0009
;[A] = X coordinate of PLM - 9 (???)
-	
	INC A       ;|-Makes sure [A] is not offscreen.
	BMI -       ;|
	
	PHA
;[$01,s] = 00XX : XX = X position of PLM, as a tile index to BTS RAM, minus 9 but capped to be onscreen.
;[$03,s] = 00XX : XX = X position of PLM, as a tile index to BTS RAM.
;[$05,s] = T0BB : T  = tile type : BB = BTS of block
	LDA $03,s   ;|
	CLC         ;|
	ADC #$0008  ;|
	CMP $07A5   ;| [A] = X position of PLM, as a tile index to BTS RAM, plus 8, and capped to be onscreen.
	BMI +       ;|
	LDA $07A5   ;|
	DEC A       ;|
				;|
+	            ;|-Could be seen as calculating the right bounds of the area to check.
	SEC
	SBC $01,s
	STA $03,s
;[$01,s] = 00XX : XX = X position of PLM, as a tile index to BTS RAM, minus 9 but capped to be onscreen.
;[$03,s] = 00XX : XX = Width of detection area. X position of PLM, as a tile index to BTS RAM, plus 8, minus the left bound.
;[$05,s] = T0BB : T  = tile type : BB = BTS of block
	LDA $07A5
	LSR A
	LSR A
	LSR A
	LSR A
	DEC A
	TAX
	TYA
;[A] = number of rows between PLM and top of room.
;[X] = 0RR0 : RR = room width in blocks*4-1.
;[Y] = number of rows between PLM and top of room.
	SEC
	SBC #$0009
-	
	INC A
	BMI -
;[A] = number of rows between PLM and top of room, -9 and capped to be onscreen.
	ASL A
	ASL A
	ASL A
	ASL A
	PHA
;[$01,s] = 0YY0 : YY = Number of rows collision to check on top, times 4? top bound of collision detection??
;[$03,s] = 00XX : XX = X position of PLM, as a tile index to BTS RAM, minus 9 but capped to be onscreen.
;[$05,s] = 00XX : XX = Width of detection area. X position of PLM, as a tile index to BTS RAM, plus 8, minus the left bound.
;[$07,s] = T0BB : T  = tile type : BB = BTS of block

;[X] = 0RR0 : RR = room width in blocks*4-1.
;[Y] = number of rows between PLM and top of room.
	LDA #$0000
-	
	CLC          ;|
	ADC $01,s    ;|-Multiplies 0YY0 number of rows to check by 0RR0 room width*4-1. This seems like it would get a really high number...
	DEX          ;|
	BPL -        ;|
				 ;|[A] = 0YY0 * 
	ADC $03,s
	STA $03,s    ;[$03,s] = (0YY0 * 0RR0-1)+00XX position of left bound to check.
	PLA
	PEA $0000
;[$01,s] = RRII : RR rows loop iterator : II tiles iterator within row.
;[$03,s] = (0YY0 * 0RR0-1)+00XX position of left bound to check.
;[$05,s] = 00XX : XX = Width of detection area. X position of PLM, as a tile index to BTS RAM, plus 8, minus the left bound.
;[$07,s] = T0BB : T  = tile type : BB = BTS of block

;[X] = FFFF : It got decremented all the way to negative.
;[Y] = number of rows between PLM and top of room.
..nextRow	
	LDA $02,s   ;|
	INC A       ;|
	STA $02,s   ;|-Increment the high byte of $01,s
	AND #$00FF  ;|-Quit if it equals $12
	CMP #$0012  ;|
	BEQ ..done  ;|
	
	DEC A
	TAY
;[Y] = loop counter from high byte of $01,s?
	LDA $03,s
	SEC
	SBC $07A5
-	
	CLC
	ADC $07A5
	DEY
	BPL -
;[A] = current row to check maybe. (0YY0 * 0RR0-1)+00XX-00RR+(00RR * [loop iterator])
	CMP #$31E0 ;not sure the significance of this value.
	BPL ..done
	TAX
..checkRow	
	LDA $7F6402,x
	AND #$00FF
	PHA
;[$01,s] = 00BB : BTS of block to check
;[$01,s] = RRII : RR rows loop iterator : II tiles iterator within row.
;[$05,s] = (0YY0 * 0RR0-1)+00XX position of left bound to check.
;[$07,s] = 00XX : XX = Width of detection area. X position of PLM, as a tile index to BTS RAM, plus 8, minus the left bound.
;[$09,s] = T0BB : T  = tile type : BB = BTS of block
	TXA
	ASL A
	TAX
	LDA $7F0002,x
	AND #$F000
	ORA $01,s
	CMP $09,s
	BNE ..skipTile
	
	JSR .rout_moveDraw  ;|
	STA $7F0002,x       ;|
	TXA                 ;|-Draws air using PLM draw routines
	LSR A               ;|-Sets BTS to 0 as well.
	TAX                 ;|
	SEP #$20            ;|
	LDA #$00            ;|
	STA $7F6402,x       ;|
	REP #$20            ;|
	BRA +
	
..skipTile	
	TXA        ;|
	LSR A      ;|Does a standalone version of the indexing code done above
	TAX        ;|
+	
	INX
	PLA
;[$01,s] = RRII : RR rows loop iterator : II tiles iterator within row.
;[$03,s] = (0YY0 * 0RR0-1)+00XX position of left bound to check.
;[$05,s] = 00XX : XX = Width of detection area. X position of PLM, as a tile index to BTS RAM, plus 8, minus the left bound.
;[$07,s] = T0BB : T  = tile type : BB = BTS of block
	LDA $01,s
	INC A
	STA $01,s
	AND #$00FF
	CMP $05,s
	BNE ..checkRow
	
	LDA $01,s    ;|
	AND #$FF00   ;|-Reset tiles-within-row iterator.
	STA $01,s    ;|
	BRA ..nextRow
	
..done	
	PLA
	PLA
	PLA
	PLA
	LDA #$86BC      ;Tell instruction list to delete PLM
	STA $1CD7,x
	RTS
	
.preInst
..checkDestruction
	LDA $1C87,x     ;|
	TAX             ;|-wait until the PLM is on top of air (player destroys block)
	LDA $7F0002,x   ;|
	CMP #$00FF      ;|
	BNE +
	
	LDX $1C27       ;|
	LDA $1DC7,x     ;|
	JSL $80818E     ;|
	LDA $7ED870,x	;|-mark item bit
	ORA $05E7       ;|
	STA $7ED870,x   ;|
	LDX $1C27       ;|
	LDA #$86BC		;Tell instruction list to delete PLM
	STA $1CD7,x
+	
	RTS

.rout
..moveDraw
;[X] = tile index of block into $7F0002
	PHX
	PHY
	TXA
	LDX $1C27     ;[X] = currently processing PLM
	STA $1C87,x   ;Store [A] to this PLM's location (tile index into level data)
	LDA #$9497	  ;air draw instruction
	STA $7EDE6C,x ;store to PLM draw instruction RAM
	JSL $848290	  ;calc PLM coords
	JSR $8DAA	  ;draw PLM
	PLY
	PLX
	LDA #$00FF
	RTS	
