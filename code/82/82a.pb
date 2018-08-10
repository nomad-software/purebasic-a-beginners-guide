Procedure ChangeValue()
	Static a.l
	a + 1
	Debug a
EndProcedure

For x.l = 1 To 5
	ChangeValue()
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog