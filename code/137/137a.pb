#WINDOW_MAIN = 1

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_MAIN, 0, 0, 300, 200, "Hello World", #FLAGS)
	Repeat
		Event.l = WaitWindowEvent()
	Until Event = #PB_Event_CloseWindow
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog