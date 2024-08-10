
;---------------------------------------------------------------------------------------------------
;|x|                                    ASAR                                                     |x|
;---------------------------------------------------------------------------------------------------
{
ORG $829446
LoadSourceMapData:
	PHB : PHK : PLB
	LDA $079F : ASL : CLC : ADC $079F : TAX
IF !DynamicMapDataPointer
	SKIP $3 : STA $00 : SKIP $3 : STA $02
ELSE
	LDA.w !MapDataTablePointer,x : STA $00 : LDA.w !MapDataTablePointer+2,x : STA $02
ENDIF
	PLB : RTL
}
