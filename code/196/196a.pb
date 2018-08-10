#SPRITE_MAIN = 1
#NUMBER_OF_BALLS = 500

;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32
Global Quit.b = #False

Structure BALL
	x.f
	y.f
	XOrigin.l
	YOrigin.l
	Radius.l
	Angle.f
	Speed.f
EndStructure
Global Dim Balls.BALL(#NUMBER_OF_BALLS)

;Simple error checking procedure
Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

;Convert Degrees to Radians
Procedure.f DegToRad(Angle.f)
	ProcedureReturn Angle.f * #PI / 180
EndProcedure

;Initialize all ball data
Procedure InitialiseBalls()
	For x.l = 0 To #NUMBER_OF_BALLS
		Balls(x)\XOrigin = Random(ScrW) - 32
		Balls(x)\YOrigin = Random(ScrH) - 32
		Balls(x)\Radius = Random(190) + 10
		Balls(x)\Angle = Random(360)
		Balls(x)\Speed = Random(2) + 1
	Next x
EndProcedure

;Initialize environment
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, "Blobs"), "Could not open screen.")
SetFrameRate(60)

;Create an image
Global Offset.f = 32
If CreateSprite(#SPRITE_MAIN, 64, 64)
	If StartDrawing(SpriteOutput(#SPRITE_MAIN))
			Box(0, 0, 64, 64, RGB(255, 255, 255))
			For x.l = 220 To 1 Step -1
				Offset + 0.025
				Circle(Offset, 64 - Offset, x / 8, RGB(0, 255 - x, 0))
			Next x
		StopDrawing()
	EndIf
EndIf
TransparentSpriteColor(#SPRITE_MAIN, RGB(255, 255, 255))
InitialiseBalls()

;Main loop
Repeat
	ClearScreen(RGB(56, 76, 104))
	For x.l = 0 To #NUMBER_OF_BALLS
		Balls(x)\x=Balls(x)\XOrigin+(Balls(x)\Radius*Cos(DegToRad(Balls(x)\Angle)))
		Balls(x)\y=Balls(x)\YOrigin+(Balls(x)\Radius*Sin(DegToRad(Balls(x)\Angle)))
		Balls(x)\Angle + Balls(x)\Speed
		DisplayTransparentSprite(#SPRITE_MAIN, Balls(x)\x, Balls(x)\y)
	Next x
	FlipBuffers()

	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf

Until Quit = #True
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog