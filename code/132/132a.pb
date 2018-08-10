If OpenConsole()

	EnableGraphicalConsole(#True)

	Repeat

		ConsoleColor(10, 0)
		PrintN("TIMES TABLES GENERATOR")
		PrintN("")
		ConsoleColor(7, 0)
		PrintN("Please enter a number, then press Return...")
		PrintN("")

		Number.q = ValQ(Input())
		If Number = 0
			ClearConsole()
			Continue
		Else
			Break
		EndIf

	ForEver
PrintN("")

	For x.l = 1 To 10
		PrintN(Str(x) + " x " + StrQ(Number) + " = " + StrQ(x * Number))
	Next x
	PrintN("")

	Print("Press Return to exit...")
	Input()
	CloseConsole()
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog