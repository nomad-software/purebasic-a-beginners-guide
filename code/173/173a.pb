Enumeration
	#WINDOW_MAIN
	#IMAGE_GADGET
	#IMAGE_MAIN
	#FONT_MAIN
EndEnumeration

Global ImageWidth = 401
Global ImageHeight = 201
Global XPos.l, YPos.l, Width.l, Height.l, Red.l, Green.l, Blue.l
Global Text.s = "Purebasic - 2D Drawing Example"



Procedure.l MyRandom(Maximum.l)
	Repeat
		Number.l = Random(Maximum)
	Until (Number % 10) = 0
	ProcedureReturn Number
EndProcedure

If CreateImage(#IMAGE_MAIN, ImageWidth, ImageHeight)
	If StartDrawing(ImageOutput(#IMAGE_MAIN))
			For x.l = 0 To 1500
				XPos.l = MyRandom(ImageWidth) + 1
				YPos.l = MyRandom(ImageHeight) + 1
				Width.l = (MyRandom(100) - 1) + 10
				Height.l = (MyRandom(100) - 1) + 10
				Red.l = Random(255)
				Green.l = Random(255)
				Blue.l = Random(255)
				Box(XPos, YPos, Width, Height, RGB(Red, Green, Blue))
				DrawingMode(#PB_2DDrawing_Outlined)
				Box(XPos - 1, YPos - 1, Width + 2, Height + 2, RGB(0, 0, 0))
				DrawingMode(#PB_2DDrawing_Default)
			Next x
			LineXY(ImageWidth - 1, 0, ImageWidth - 1, ImageHeight, RGB(0, 0, 0))
			LineXY(0, ImageHeight - 1, ImageWidth, ImageHeight - 1, RGB(0, 0, 0))
			Box(10, 10, 230, 30, RGB(90, 105, 134))
			DrawingMode(#PB_2DDrawing_Outlined)
			Box(10, 10, 231, 31, RGB(0, 0, 0))
			DrawingMode(#PB_2DDrawing_Transparent)
			DrawText(21, 18, Text, RGB(0, 0, 0))
			DrawText(19, 18, Text, RGB(0, 0, 0))
			DrawText(21, 16, Text, RGB(0, 0, 0))
			DrawText(19, 16, Text, RGB(0, 0, 0))
			DrawText(20, 17, Text, RGB(255, 255, 255))
		StopDrawing()
	EndIf
EndIf

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_MAIN,0,0,ImageWidth+20,ImageHeight+20,"Abstract",#FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_MAIN))
		ImageGadget(#IMAGE_GADGET,10,10,ImageWidth,ImageHeight,ImageID(#IMAGE_MAIN))
	EndIf
	Repeat
		Event.l = WaitWindowEvent()
	Until Event = #PB_Event_CloseWindow
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog