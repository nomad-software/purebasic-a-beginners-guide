Dim Countries.s(3)

Countries(0) = "England"
Countries(1) = "Northern Ireland"
Countries(2) = "Scotland"
Countries(3) = "Wales"

Procedure EchoArray(MyArray.s(1))
	For x.l = 0 To 3
		Debug MyArray(x)
	Next x
EndProcedure

EchoArray(Countries())
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog