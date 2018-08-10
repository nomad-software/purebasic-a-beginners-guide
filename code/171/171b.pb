Enumeration
	#WINDOW_MAIN
	#IMAGE_GADGET
	#IMAGE_MAIN
EndEnumeration

If CreateImage(#IMAGE_MAIN, 180, 220)
	If StartDrawing(ImageOutput(#IMAGE_MAIN))
			;Because a new image has a Black background, draw a white one instead:
			Box(0, 0, 180, 220, RGB(255, 255, 255))
			;Now, continue drawing the shapes:
			Box(5, 5, 75, 75, RGB(255, 0, 0))
			Circle(130, 115, 45, RGB(35, 158, 70))
			LineXY(52, 130, 102, 210, RGB(0, 0, 255))
			LineXY(102, 210, 2, 210, RGB(0, 0, 255))
			LineXY(2, 210, 52, 130, RGB(0, 0, 255))
			FillArea(52, 170, RGB(0, 0, 255), RGB(0, 0, 255))
		StopDrawing()
	EndIf
EndIf

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WINDOW_MAIN, 0, 0, 200, 240, "Drawing On A New Image", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_MAIN))
		ImageGadget(#IMAGE_GADGET, 10, 10, 180, 220, ImageID(#IMAGE_MAIN))
		Repeat
			Event.l = WaitWindowEvent()
		Until Event = #PB_Event_CloseWindow
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog