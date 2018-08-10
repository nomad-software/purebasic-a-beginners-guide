For x.l = 1 To 10
	Counter = 0
	Repeat
		If x = 5
			Break 2
		EndIf
		Counter + 1
	Until Counter > 1
	Debug x
Next
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog