Enumeration
	#WINDOW_MAIN
	#IMAGE_GADGET
	#IMAGE_SMALL
	#IMAGE_MAIN
	#FONT_MAIN
EndEnumeration

Global ImageWidth = 400
Global ImageHeight = 200
Global XPos.l, YPos.l, LoadedImageWidth.l, LoadedImageHeight.l

Global File.s
Global RequesterText.s = "Choose an image"
Global DefaultFile.s = ""
Global Pattern.s = "Bitmap (*.bmp)|*.bmp|Icon (*.ico)|*.ico"
File = OpenFileRequester(RequesterText, DefaultFile, Pattern, 0)

If File
	LoadImage(#IMAGE_SMALL, File)
	LoadedImageWidth = ImageWidth(#IMAGE_SMALL)
	LoadedImageHeight = ImageHeight(#IMAGE_SMALL)
	If CreateImage(#IMAGE_MAIN, ImageWidth,ImageHeight)
		If StartDrawing(ImageOutput(#IMAGE_MAIN))
			Box(0, 0,ImageWidth, ImageHeight, RGB(255, 255, 255))
			For x.l = 1 To 1000
				XPos = Random(ImageWidth) - (ImageWidth(#IMAGE_SMALL) / 2)
				YPos = Random(ImageHeight) - (ImageHeight(#IMAGE_SMALL) / 2)
				DrawImage(ImageID(#IMAGE_SMALL), XPos, YPos)
			Next x
			DrawingMode(#PB_2DDrawing_Outlined)
			Box(0, 0, ImageWidth, ImageHeight, RGB(0, 0, 0))
			StopDrawing()
		EndIf
	EndIf
	#TEXT = "Drawing Using Images"
	#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
	If OpenWindow(#WINDOW_MAIN,0,0,ImageWidth+20,ImageHeight+20,#TEXT,#FLAGS)
		If CreateGadgetList(WindowID(#WINDOW_MAIN))
			ImageGadget(#IMAGE_GADGET,10,10,ImageWidth,ImageHeight,ImageID(#IMAGE_MAIN))
		EndIf
		Repeat
			Event.l = WaitWindowEvent()
		Until Event = #PB_Event_CloseWindow
	EndIf
	End
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog