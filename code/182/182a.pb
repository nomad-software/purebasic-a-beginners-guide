Global Quit.b = #False

;Simple error checking procedure
Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
HandleError(OpenScreen(1024, 768, 32, "Fullscreen"), "Could not open screen.")

Repeat
	ClearScreen(RGB(0, 0, 0))

	;Drawing operations go here

	FlipBuffers(2)
	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf
Until Quit = #True
End

; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog