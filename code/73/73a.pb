a.l = 10

Debug a
Gosub Calculation
Debug a
End

RunAgain:
a.l = 20
Debug a
Gosub Calculation
Debug a
End

Calculation:
	If a = 10
		FakeReturn
		Goto RunAgain
	Else
		a = a * 5 + 5
	EndIf
Return
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog