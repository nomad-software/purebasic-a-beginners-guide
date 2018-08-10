Enumeration
	#WINDOW_MAIN
	#MENU_MAIN
	#MENU_CHILD
	#MENU_QUIT
	#MENU_ABOUT
EndEnumeration

Global Quit.b = #False
#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WINDOW_MAIN, 0, 0, 300, 200, "Menu Example", #FLAGS)
	If CreateMenu(#MENU_MAIN, WindowID(#WINDOW_MAIN))
		MenuTitle("File")
			OpenSubMenu("Parent Menu Item")
				MenuItem(#MENU_CHILD, "Sub Menu Item")
			CloseSubMenu()
			MenuBar()
			MenuItem(#MENU_QUIT, "Quit")
		MenuTitle("Help")
			MenuItem(#MENU_ABOUT, "About...")
		Repeat
			Event.l = WaitWindowEvent()
			Select Event
				Case #PB_Event_Menu
					Select EventMenu()
						Case #MENU_CHILD
							Debug "Sub menu item selected."
						Case #MENU_QUIT
							Quit = #True
						Case #MENU_ABOUT
							MessageRequester("About", "This is where you describe your program.")
					EndSelect
			EndSelect
		Until Event = #PB_Event_CloseWindow Or Quit = #True
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog