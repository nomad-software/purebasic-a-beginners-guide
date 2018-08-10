Structure SCREENCOORDS
	x.w
	y.w
EndStructure

Coordinates.l = %00000011000000000000010000000000
*Screen.SCREENCOORDS = @Coordinates

Debug *Screen\x
Debug *Screen\y
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog