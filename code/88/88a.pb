Structure COUNTRY
	Name.s
	Population.s
EndStructure

Dim Countries.COUNTRY(3)

Countries(0)\Name = "England"
Countries(0)\Population = "57,000,000"

Countries(1)\Name = "Northern Ireland"
Countries(1)\Population = "2,000,000"

Countries(2)\Name = "Scotland"
Countries(2)\Population = "5,200,000"

Countries(3)\Name = "Wales"
Countries(3)\Population = "3,100,000"

Procedure EchoArray(MyArray.COUNTRY(1))
	For x.l = 0 To 3
		Debug MyArray(x)\Name + "  -  " + "Population: " + MyArray(x)\Population
	Next x
EndProcedure

EchoArray(Countries())
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog