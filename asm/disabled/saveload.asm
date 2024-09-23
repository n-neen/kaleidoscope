LoRom

;Based on Scyzer's save/load routine expansion
;Saves all 8 area maps 

org $81B3BF
  CPX #$0800 ; clear debug map on new file
org $819A47
  LDA.l SRAMAddressTable,X : Skip 7 : LDA.l SRAMAddressTable,X : Skip 11 : CPY #$0A00
org $819CAE
  LDA.l SRAMAddressTable,X : Skip 12 : CPY #$0A00
org $818000
  JMP SaveGame
org $818085
  JMP LoadGame

SRAMAddressTable:
	DW $0010, $0A10, $1410

CheckSumAdd:
	CLC
	ADC $14
	INC
	STA $14
	RTS

SaveGame:
	PHP
	REP #$30
	PHB
	PHX
	PHY
	
	PEA $7E7E ;set DB to 7E
	PLB
	PLB
	STZ $14
	AND #$0003
	ASL
	STA $12 ;save file index

	LDA $079F
	INC A
	XBA
	TAX

	LDY #$00FE ;copy current map to global maps
-
  LDA $07F7,Y
	STA $CD50,X
	DEX
	DEX
	DEY
	DEY
  BPL -

	LDY #$005E ;copy equipment to sram mirror
-
  LDA $09A2,Y
  STA $D7C0,Y
  DEY
  DEY
  BPL -
	
	LDA $078B ;save index
	STA $D916
	LDA $079F ;save area
	STA $D918

	LDX $12 ;save file index
	LDA.l SRAMAddressTable,X
	TAX
	
	LDY #$0000 ;copy sram mirror to sram - equipment, events, items, and doors.
-
  LDA $D7C0,Y
  STA $700000,X
  JSR CheckSumAdd
  INX
  INX
  INY
  INY
  CPY #$0160
  BNE -

  LDY #$07FE ;copy global map data to sram
-
  LDA $CD52,Y
  STA $700000,X
  INX
  INX
  DEY
  DEY
  BPL -	

	; update checksum
	LDX $12
	LDA $14
	STA $700000,X
	STA $701FF0,X
	EOR #$FFFF
	STA $700008,X
	STA $701FF8,X

	PLY
	PLX
	PLB
	PLP
	RTL

LoadGame:
	PHP
	REP #$30
	PHB
	PHX
	PHY
	
	PEA $7E7E ;set DB to 7E
	PLB
	PLB
	STZ $14
	AND #$0003
	ASL
	STA $12 ;save file index

	TAX
	LDA.l SRAMAddressTable,X
	STA $16
	TAX

	LDY #$0000 ;copy sram to sram mirror - equipment, events, items, and doors.
-
  LDA $700000,X
  STA $D7C0,Y
  JSR CheckSumAdd
  INX
  INX
  INY
  INY
  CPY #$0160
  BNE -
	
	LDY #$07FE ;copy global map data from sram
-
  LDA $700000,X
  STA $CD52,Y
  INX
  INX
  DEY
  DEY
  BPL -

	LDY #$005E ;copy equipment from sram mirror
-
  LDA $D7C0,Y
  STA $09A2,Y
  DEY
  DEY
  BPL -

	LDA $D916 ;save index
	STA $078B
	LDA $D918 ;save area
	STA $079F

	;validate checksum or wipe the save
	LDX $12
	LDA $14
	CMP $700000,X
	BNE ClearSave
	CMP $701FF0,X
	BNE ClearSave
	EOR #$FFFF
	CMP $700008,X
	BNE ClearSave
	CMP $701FF8,X
	BNE ClearSave

	PLY
	PLX
	PLB
	PLP
	CLC ;return load ok
	RTL

ClearSave:
	LDX $16
	LDY #$09FE
	LDA #$0000
-
  STA $700000,X
  INX
  INX
  DEY
  DEY
  BPL -

	PLY
	PLX
	PLB
	PLP
	SEC ;return load fail
	RTL

org $81B3B6
	JSR ClearCurrentMap
org $81FC50 ; free space
ClearCurrentMap:
  LDA #$0000
-
	STA $7E07F7,X
	INX
	INX
	CPX #$0100
	BMI -
	LDX #$0000
	RTS
