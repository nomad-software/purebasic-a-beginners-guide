#APP_NAME = "Stars v1.0"
#NUMBER_OF_STARS = 10000
;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32
Global Quit.b = #False

Structure STAR
	xPos.f
	yPos.f
	xStep.f
	Color.l
EndStructure
Global Dim Stars.STAR(#NUMBER_OF_STARS)

;Simple error checking procedure
Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

;init stars
Procedure InitializeStars()
	For x = 0 To #NUMBER_OF_STARS
		Stars(x)\xPos = Random(ScrW - 1)
		Stars(x)\yPos = Random(ScrH - 1)
		If x < #NUMBER_OF_STARS / 3
			Stars(x)\xStep = (Random(10) / 100) + 0.2
			Stars(x)\Color = RGB(40, 40, 40)
		ElseIf x >= #NUMBER_OF_STARS / 3 And x < (#NUMBER_OF_STARS / 3) * 2
			Stars(x)\xStep = (Random(10) / 100) + 0.6
			Stars(x)\Color = RGB(100, 100, 100)
		Else
			Stars(x)\xStep = (Random(10) / 100) + 1.2
			Stars(x)\Color = RGB(255, 255, 255)
		EndIf
	Next x
EndProcedure

;move stars on the 'x' axis
Procedure MoveStarsX()
	For x = 0 To #NUMBER_OF_STARS
		Stars(x)\xPos - Stars(x)\xStep
		If Stars(x)\xPos < 0
			Stars(x)\xPos = ScrW - 1
			Stars(x)\yPos = Random(ScrH - 1)
		EndIf
	Next x
EndProcedure

;Initialize environment
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, #APP_NAME), "Could not open screen.")
SetFrameRate(60)
InitializeStars()

Repeat
	ClearScreen(RGB(0, 0, 0))
	StartDrawing(ScreenOutput())
		For x = 0 To #NUMBER_OF_STARS
			Plot(Stars(x)\xPos, Stars(x)\yPos, Stars(x)\Color)
		Next x
		DrawingMode(#PB_2DDrawing_Transparent)
		DrawText(20, 20, #APP_NAME, #White)
		DrawText(20, 40, Str(#NUMBER_OF_STARS)+" Animated stars", #White)
		DrawText(20, 60, "Screen Resolution: "+Str(ScrW)+" x "+Str(ScrH), #White)
		DrawText(20, 80, "Screen Bit depth: "+Str(ScrD)+"bit", #White)
	StopDrawing()
	FlipBuffers()
	MoveStarsX()
	
	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = 1
	EndIf

Until Quit = 1
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog