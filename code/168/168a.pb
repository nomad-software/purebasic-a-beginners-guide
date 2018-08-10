#WINDOW_MAIN = 1

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_MAIN, 0, 0, 200, 240, "Window Drawing", #FLAGS)

	If StartDrawing(WindowOutput(#WINDOW_MAIN))
			Box(15, 15, 75, 75, RGB(255, 0, 0))
			Circle(140, 125, 45, RGB(35, 158, 70))
			;The next 2D drawing commands draw a triangle
			LineXY(62, 140, 112, 220, RGB(0, 0, 255))
			LineXY(112, 220, 12, 220, RGB(0, 0, 255))
			LineXY(12, 220, 62, 140, RGB(0, 0, 255))
			FillArea(62, 180, RGB(0, 0, 255), RGB(0, 0, 255))
		StopDrawing()
	EndIf

	Repeat
		Event.l = WaitWindowEvent()
	Until Event = #PB_Event_CloseWindow
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog