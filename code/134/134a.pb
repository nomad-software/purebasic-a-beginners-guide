Procedure DisplayTitle()
	ConsoleColor(10, 0)
	PrintN("KEY CODE FINDER")
	PrintN("")
	ConsoleColor(7, 0)
EndProcedure

Procedure DisplayEscapeText()
	PrintN("")
	ConsoleColor(8, 0)
	PrintN("Press another key or press Escape to exit")
	ConsoleColor(7, 0)
EndProcedure

If OpenConsole()

	EnableGraphicalConsole(#True)
	DisplayTitle()
	PrintN("Press a key...")
	Repeat
		KeyPressed.s = Inkey()
		RawKeyCode.l = RawKey()

		If KeyPressed <> ""

			ClearConsole()
			DisplayTitle()
			PrintN("Key Pressed: " + KeyPressed)
			PrintN("Key Code: " + Str(RawKeyCode))
			DisplayEscapeText()

		ElseIf RawKeyCode


			ClearConsole()
			DisplayTitle()
			PrintN("Key Pressed: " + "Non-ASCII")
			PrintN("Key Code: " + Str(RawKeyCode))
			DisplayEscapeText()

		Else

			Delay(1)

		EndIf

	Until KeyPressed = #ESC$
	CloseConsole()
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog