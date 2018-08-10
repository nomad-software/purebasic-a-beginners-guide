Structure FLAGS
	Country.s
	Flag.s
EndStructure

NewList Info.FLAGS()

AddElement(Info())
Info()\Country = "Great Britain"
Info()\Flag = "Union Jack"

AddElement(Info())
Info()\Country = "USA"
Info()\Flag = "Stars And Stripes"

AddElement(Info())
Info()\Country = "France"
Info()\Flag = "Tricolore"

Procedure EchoList(MyList.FLAGS())
	ForEach MyList()
		Debug MyList()\Country + "'s flag is the " + MyList()\Flag
	Next
EndProcedure

EchoList(Info())
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog