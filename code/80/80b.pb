Global NewList Numbers.l()
AddElement(Numbers())
Numbers() = 1

Procedure ChangeValue()
	Protected NewList Numbers.l()
	AddElement(Numbers())
	Numbers() = 100
EndProcedure

ChangeValue()
SelectElement(Numbers(), 1)
Debug Numbers()
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog