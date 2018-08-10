Structure COORDINATES
	x.l
	y.l
EndStructure
Point.COORDINATES

Procedure IncreaseValues(*Var.COORDINATES)
	*Var\x + 10
	*Var\y + 10
EndProcedure

Point\x = 100
Point\y = 100

IncreaseValues(@Point)
Debug Point\x
Debug Point\y
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog