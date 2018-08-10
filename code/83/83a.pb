Procedure ChangeValue()
	Static NewList Numbers.l()
	If CountList(Numbers()) = 0
		AddElement(Numbers())
	EndIf
	SelectElement(Numbers(), 1)
	Numbers() + 1
	Debug Numbers()
EndProcedure

For x.l = 1 To 5
	ChangeValue()
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog