Enumeration
	#WIN_MAIN
	#MENU_MAIN
	#M_QUIT
	#M_ABOUT
EndEnumeration

Global Quit.b = #False
#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 300, 200, "Menu Example", #FLAGS)
	If CreateMenu(#MENU_MAIN, WindowID(#WIN_MAIN))

		MenuTitle("File")
			MenuItem(#M_QUIT, "Quit" + #TAB$ + "Ctrl+Q")
		MenuTitle("Help")
			MenuItem(#M_ABOUT, "About..." + #TAB$ + "Ctrl+A")

		AddKeyboardShortcut(#WIN_MAIN,#PB_Shortcut_Control|#PB_Shortcut_Q,#M_QUIT)
		AddKeyboardShortcut(#WIN_MAIN,#PB_Shortcut_Control|#PB_Shortcut_A,#M_ABOUT)
		
		Repeat

			Event.l = WaitWindowEvent()
			Select Event
				Case #PB_Event_Menu
					Select EventMenu()
						Case #M_QUIT
							Quit = #True
						Case #M_ABOUT
							MessageRequester("About", "This is where you describe your program.")
					EndSelect
			EndSelect

		Until Event = #PB_Event_CloseWindow Or Quit = #True

	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog