;-------Less Tedious Tilemaps-------------------
;-----For Game Over and File Select-------------
;----------OmegaDragnet9------------------------

;This has made my workflow easier.
;Figured I'd share.

;This ASAR-friendly version only uses defines.

lorom

;-----------------------------------------------
;----------------DEFINES------------------------
;-----------------------------------------------

;Number Tops

!0T = $0000
!1T = $0001
!2T = $0002
!3T = $0003
!4T = $0004
!5T = $0005
!6T = $0006
!7T = $0007
!8T = $0008
!9T = $0008		;BC in the tilemap it's blank

;Number Bottoms

!0B = $0010
!1B = $0011
!2B = $0012
!3B = $0013
!4B = $0014
!5B = $0015
!6B = $0016
!7B = $0017
!8B = $0018
!9B = $0019

;Letter Tops

!AT = $000A
!BT = $000B
!CT = $000C
!DT = $000D
!ET = $000E
!FT = $000E 	;BC in the tilemap it's blank
!GT = $0006		;Top of Six
!HT = $0021
!IT = $0022
!JT = $0023
!KT = $0024
!LT = $0025
!MT = $0026
!NT = $0027
!OT = $0000		;Top of Zero
!PT = $000B		;Top of B
!QT = $0000		;Top of Zero
!RT = $000B		;Top of B
!ST = $002B
!TT = $002C
!UT = $002D
!VT = $002D		;Same as UT
!WT = $002F
!XT = $0040
!YT = $0041
!ZT = $0042

;Letter Bottoms

!AB = $001A
!BB = $001B
!CB = $001C
!DB = $001D
!EB = $001E
!FB = $001F
!GB = $0030
!HB = $0031
!IB = $0011		;Same as 1 bottom
!JB = $0033
!KB = $0034
!LB = $0035
!MB = $0036
!NB = $0037
!OB = $0010		;Same as zero bottom
!PB = $0038
!QB = $0039
!RB = $003A
!SB = $003B
!TB = $0011		;Same as 1 bottom
!UB = $0010		;Same as zero bottom
!VB = $003E
!WB = $003F
!XB = $0050
!YB = $0011		;Same as 1 bottom
!ZB = $0052

;Symbols 

!ExclamationT = $0022
!ExclamationB = $0053
!QuestionT = $0044
!QuestionB = $0054
!CrossT = $0045
!CrossB = $0055
!MinusT = $0046
!MinusB = $0056
!ParenLT = $0047
!ParenLB = $0057
!ParenRT = $0048
!ParenRB = $0058

;Lowercase Numbers

!0 = $0060
!1 = $0061
!2 = $0062
!3 = $0063
!4 = $0064
!5 = $0065
!6 = $0066
!7 = $0067
!8 = $0068
!9 = $0069

;Lowercase Letters

!A = $006A
!B = $006B
!C = $006C
!D = $006D
!E = $006E
!F = $006F
!G = $0070
!H = $0071
!I = $0072
!J = $0073
!K = $0074
!L = $0075
!M = $0076
!N = $0077
!O = $0078
!P = $0079
!Q = $007A
!R = $007B
!S = $007C
!T = $007D
!U = $007E
!V = $007F
!W = $0080
!X = $0081
!Y = $0082
!Z = $0083

!Exclamation = $0084
!Question = $0085
!Plus = $0086
!Minus = $0087
!Period = $0088
!Comma = $0089
!LeftPar = $008A
!RightPar = $008B
!Colon = $008C

!SPACE = $000F
!END = $FFFF
!ENDLINE = $FFFE


;-----------------------------------------------
;----------------TILEMAPS-----------------------
;-----------------------------------------------

;Demonstration of this system in action.

;Tilemap Format by P.J Boy

;yxpPPPtttttttttt

;y,x are flips
;p is priority
;PPP are palette bits
;t   tile index



org $819304  

DW !SPACE,!SPACE,!SPACE,!SPACE,!SPACE,!T,!R,!Y,!SPACE,!A,!G,!A,!I,!N,!Question,!END


org $819334          

DW !END



;------------GAME OVER BABY METROID--------------------------------------

;Silences sounds of Baby Metroid during Game Over Screen so you
;feel less guilty about failing the mission.
;At least I do now... :)  

org $82BC0C

LDA #$0001
JSL $80914D
BRA $DB

org $82BC15

LDA #$0001
JSL $80914D
BRA $D2

org $82BC1E

LDA #$0001
JSL $80914D
BRA $C9



org $8190cd             ;skip handling baby metroid
    nop #4
    
org $82bb9e             ;sip drawing baby metroid
    plb
    rtl