#IMAGE_MAIN = 1
;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32
Global Quit.b = #False
XOrigin.f = (ScrW / 2) - 64 : YOrigin.f = (ScrH / 2) - 64

;Simple error checking procedure
Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

;Initialize environment
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, "Blobs"), "Could not open screen.")
SetFrameRate(60)

;Create an image
If CreateImage(#IMAGE_MAIN, 128, 128)
	If StartDrawing(ImageOutput(#IMAGE_MAIN))
			For x.l = 255 To 0 Step -1
				Circle(64, 64, x / 4, RGB(0, 0, 255 - x))
			Next x
		StopDrawing()
	EndIf
EndIf

;Convert Degrees to Radians
Procedure.f DegToRad(Angle.f)
	ProcedureReturn Angle.f * #PI / 180
EndProcedure

;Main loop
Repeat
	ClearScreen(RGB(0, 0, 0))
	Angle.f + 2.0
	Radius.f = ((ScrH / 2) - 100) * Sin(DegToRad(Angle))

	StartDrawing(ScreenOutput())
		For x.l = 0 To 359 Step 45
			XPos.f = XOrigin + (Radius * Cos(DegToRad(Angle + x)))
			YPos.f = YOrigin + (Radius * Sin(DegToRad(Angle + x)))
			DrawImage(ImageID(#IMAGE_MAIN), XPos, YPos)
		Next x
	StopDrawing()

	FlipBuffers()
	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf
Until Quit = #True
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog