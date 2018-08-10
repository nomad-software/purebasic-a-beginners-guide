If OpenConsole()
	PrintN("1. Official Purebasic Home")
	PrintN("2. Official Purebasic Forums")
	PrintN("3. PureArea.net")
	PrintN("")
	PrintN("Enter a number from 1 To 3 and press Return: ")
	Destination.s = Input()
	Select Destination
		Case "1"
			RunProgram("http://www.purebasic.com")
		Case "2"
			RunProgram("http://forums.purebasic.com")
		Case "3"
			RunProgram("http://www.purearea.net")
	EndSelect
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog