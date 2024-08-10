
;---------------------------------------------------------------------------------------------------
;|x|                                    XKAS                                                     |x|
;---------------------------------------------------------------------------------------------------
{
ORG $829446
LoadSourceMapData:
	PHB : PHK : PLB
	LDA $079F : ASL : CLC : ADC $079F : TAX
	LDA.w !MapDataTablePointer,x : STA $00 : LDA.w !MapDataTablePointer+2,x : STA $02
	PLB : RTL
}
