NewList Numbers.l()

AddElement(Numbers())
Numbers() = 25

AddElement(Numbers())
Numbers() = 50

AddElement(Numbers())
Numbers() = 75

Procedure EchoList(MyList.l())
	ForEach MyList()
		Debug MyList()
	Next
EndProcedure

EchoList(Numbers())
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog