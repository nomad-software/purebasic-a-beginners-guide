#WIN_MAIN = 1
#SC_EVENT = 2

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 300, 200, "Hello World", #FLAGS)
	AddKeyboardShortcut(#WIN_MAIN,#PB_Shortcut_Control|#PB_Shortcut_Z, #SC_EVENT)
	Repeat
		Event.l = WaitWindowEvent()
		Select Event
			Case #PB_Event_Menu
				Select EventMenu()
					Case #SC_EVENT
						Debug "The shortcut was pressed"
				EndSelect
		EndSelect
	Until Event = #PB_Event_CloseWindow
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog