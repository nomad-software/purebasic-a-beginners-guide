Procedure ChangeValue()
	Static Dim Numbers.l(1)
	Numbers(0) + 1
	Numbers(1) + 1
	Debug Numbers(0)
	Debug Numbers(1)
EndProcedure

For x.l = 1 To 5
	ChangeValue()
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog