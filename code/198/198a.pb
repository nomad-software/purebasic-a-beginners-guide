UsePNGImageDecoder()

Enumeration
	#SPRITE_2D
	#SPRITE_3D
EndEnumeration

#NUMBER_OF_FLOWERS = 150

;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32
;Other global variables
Global Quit.b = #False
Global XOrigin.l = ScrW / 2
Global YOrigin.l = ScrH / 2

Structure FLOWER
	XPos.f
	YPos.f
	Width.f
	Height.f
	Angle.f
	Radius.f
	RadiusStep.f
EndStructure
Global Dim Flowers.FLOWER(#NUMBER_OF_FLOWERS)

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

;Initialize all flowers
Procedure InitialiseAllFlowers()
	For x.l = 0 To #NUMBER_OF_FLOWERS
		Flowers(x)\Width = 0
		Flowers(x)\Height = 0
		Flowers(x)\Angle = Random(360)
		Flowers(x)\Radius = 1.0
		Flowers(x)\RadiusStep = (Random(30) / 10) + 1.0
	Next x
EndProcedure

;Reset a flower
Procedure ResetFlower(Index.l)
	Flowers(Index)\Width = 0
	Flowers(Index)\Height = 0
	Flowers(Index)\Angle = Random(360)
	Flowers(Index)\Radius = 1.0
	Flowers(Index)\RadiusStep = (Random(30) / 10) + 1.0
	ProcedureReturn
EndProcedure

;Initialize environment
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(InitSprite3D(), "InitSprite3D() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, "Flowers"), "Could not open screen.")
SetFrameRate(60)
Sprite3DQuality(1)

;Load sprite
LoadSprite(#SPRITE_2D,"Flower.png",#PB_Sprite_Texture|#PB_Sprite_AlphaBlending)
CreateSprite3D(#SPRITE_3D, #SPRITE_2D)

InitialiseAllFlowers()

;Main loop
Repeat

	ClearScreen(RGB(200, 100, 100))
	
	HandleError(Start3D(), "Start3D() command failed.")
		For x.l = 0 To #NUMBER_OF_FLOWERS
			Flowers(x)\Width + 1.5
			Flowers(x)\Height + 1.5
			Flowers(x)\Angle + 1.0
			If Flowers(x)\Width > 512.0 Or Flowers(x)\Height > 512.0
				Flowers(x)\Width = 512.0
				Flowers(x)\Height = 512.0
			EndIf
			If Flowers(x)\Radius > ScrW
				ResetFlower(x)
			EndIf
			Flowers(x)\Radius + Flowers(x)\RadiusStep
			Flowers(x)\XPos=XOrigin+(Flowers(x)\Radius*Cos(DegToRad(Flowers(x)\Angle)))
			Flowers(x)\YPos=YOrigin+(Flowers(x)\Radius*Sin(DegToRad(Flowers(x)\Angle)))
			Flowers(x)\XPos - Flowers(x)\Radius / 3.5
			Flowers(x)\YPos - Flowers(x)\Radius / 3.5
			ZoomSprite3D(#SPRITE_3D, Flowers(x)\Width, Flowers(x)\Height)
			RotateSprite3D(#SPRITE_3D, Flowers(x)\Angle, 0)
			DisplaySprite3D(#SPRITE_3D, Flowers(x)\XPos, Flowers(x)\YPos)
		Next x
	Stop3D()

	FlipBuffers()

	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf

Until Quit = #True
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog