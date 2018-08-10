Dim Countries.s(3, 1)

Countries(0,0) = "England"
Countries(0,1) = "57,000,000"

Countries(1, 0) = "Northern Ireland"
Countries(1,1) = "2,000,000"

Countries(2, 0) = "Scotland"
Countries(2,1) = "5,200,000"

Countries(3, 0) = "Wales"
Countries(3,1) = "3,100,000"

Procedure EchoArray(MyArray.s(2))
	For x.l = 0 To 3
		Debug MyArray(x,0) + "  -  " + "Population: " + MyArray(x,1)
	Next x
EndProcedure

EchoArray(Countries())
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog