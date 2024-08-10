
;---------------------------------------------------------------------------------------------------
;|x|                                    DOORBIT CAPSRRITE LIST                                   |x|
;---------------------------------------------------------------------------------------------------
{
MACRO DoorSprite(variant, direction, page, y, x)
{
;Please comment out the line for the compiler you are using

	DW <variant><<13|<direction><<11|<page><<10|<y><<5|<x>	;for asar
;	DW <variant><<2|<direction><<1|<page><<5|<y><<5|<x>		;for xkas
}
ENDMACRO

;Door tilecheck macro: %DoorSprite(variant, direction, page, y, x)
; x         : X coordinate of tile to change (range: $00 - $1F, higher value will partly change Y value!)
; y         : Y coordinate of tile to change (range: $00 - $1F, higher value will affect the page bit!)
; page      : in which side of the area the tile is. Setting this bit is equal to X = +$20.
;	0 for left map page
;	1 for right map page
; direction : changes in which side of the tile the door sprite gets set
	!Up = 0
	!Down = 1
	!Left = 2
	!Right = 3
; variant   : type of door to display. (S : single door; D : dobble door)
	!Red_S = 0
	!Green_S = 1
	!Yellow_S = 2
	!Gray_S = 3
	!Red_D = 4
	!Green_D = 5
	!Yellow_D = 6
	!Gray_D = 7
;You can use these defines in there respective argument for better visualisation.
;
;
;When using the hex editor: this is the doorsprite check bitmask:   tttd dpyy yyyx xxxx
; x = X coordinate of map
; y = Y coordinate of map
; p = page bit (0 = left half of map; 1 = right half of map)
;              (counts as X = +$20, or Y = +$20 when using vertical area)
; d = direction (00 = top; 01 = bottom; 10 = left; 11 = right)
; t = variant (x00 = red door; x01 = green door; x10 = yellow door; x11 = grey door)
;             (x: 0 = single door; 1 = whole door)
; Setting it all to zero will not change spawn doorcap sprite.

ORG !Freespace_DoorbitSpritelock
DoorSpriteCheckList:
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $000 - $003
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $004 - $007
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $008 - $00B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $00C - $00F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $010 - $013
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $014 - $017
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $018 - $01B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $01C - $01F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $020 - $023
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $024 - $027
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $028 - $02B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $02C - $02F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $030 - $033
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $034 - $037
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $038 - $03B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $03C - $03F

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $040 - $043
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $044 - $047
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $048 - $04B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $04C - $04F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $050 - $053
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $054 - $057
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $058 - $05B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $05C - $05F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $060 - $063
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $064 - $067
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $068 - $06B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $06C - $06F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $070 - $073
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $074 - $077
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $078 - $07B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $07C - $07F

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $080 - $083
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $084 - $087
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $088 - $08B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $08C - $08F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $090 - $093
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $094 - $097
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $098 - $09B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $09C - $09F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0A0 - $0A3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0A4 - $0A7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0A8 - $0AB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0AC - $0AF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0B0 - $0B3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0B4 - $0B7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0B8 - $0BB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0BC - $0BF

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0C0 - $0C3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0C4 - $0C7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0C8 - $0CB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0CC - $0CF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0D0 - $0D3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0D4 - $0D7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0D8 - $0DB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0DC - $0DF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0E0 - $0E3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0E4 - $0E7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0E8 - $0EB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0EC - $0EF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0F0 - $0F3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0F4 - $0F7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0F8 - $0FB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $0FC - $0FF


	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $100 - $103
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $104 - $107
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $108 - $10B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $10C - $10F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $110 - $113
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $114 - $117
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $118 - $11B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $11C - $11F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $120 - $123
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $124 - $127
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $128 - $12B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $12C - $12F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $130 - $133
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $134 - $137
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $138 - $13B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $13C - $13F

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $140 - $143
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $144 - $147
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $148 - $14B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $14C - $14F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $150 - $153
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $154 - $157
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $158 - $15B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $15C - $15F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $160 - $163
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $164 - $167
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $168 - $16B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $16C - $16F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $170 - $173
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $174 - $177
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $178 - $17B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $17C - $17F

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $180 - $183
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $184 - $187
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $188 - $18B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $18C - $18F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $190 - $193
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $194 - $197
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $198 - $19B
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $19C - $19F
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1A0 - $1A3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1A4 - $1A7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1A8 - $1AB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1AC - $1AF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1B0 - $1B3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1B4 - $1B7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1B8 - $1BB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1BC - $1BF

	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1C0 - $1C3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1C4 - $1C7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1C8 - $1CB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1CC - $1CF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1D0 - $1D3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1D4 - $1D7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1D8 - $1DB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1DC - $1DF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1E0 - $1E3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1E4 - $1E7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1E8 - $1EB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1EC - $1EF
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1F0 - $1F3
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1F4 - $1F7
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1F8 - $1FB
	%DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00) : %DoorSprite(0, 0, 0, $00, $00)	;door $1FC - $1FF
}
