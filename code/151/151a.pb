Enumeration
	#WINDOW_MAIN
	#MENU_MAIN
	#MENU_QUIT
	#MENU_ABOUT
	#TEXT_INPUT
	#STRING_INPUT
	#LIST_INPUT
	#BUTTON_INTERACT
	#BUTTON_CLOSE
EndEnumeration

Global Quit.b = #False
#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WINDOW_MAIN, 0, 0, 300, 222, "Interaction", #FLAGS)
	If CreateMenu(#MENU_MAIN, WindowID(#WINDOW_MAIN))
		MenuTitle("File")
			MenuItem(#MENU_QUIT, "Quit")
		MenuTitle("Help")
			MenuItem(#MENU_ABOUT, "About...")
		If CreateGadgetList(WindowID(#WINDOW_MAIN))
			TextGadget(#TEXT_INPUT, 10, 10, 280, 20, "Enter text here:")
			StringGadget(#STRING_INPUT, 10, 30, 280, 20, "")
			ListViewGadget(#LIST_INPUT, 10, 60, 280, 100)
			ButtonGadget(#BUTTON_INTERACT, 10, 170, 120, 20, "Enter text")
			ButtonGadget(#BUTTON_CLOSE, 190, 170, 100, 20, "Close window")
			SetActiveGadget(#STRING_INPUT)
			Repeat
				Event.l = WaitWindowEvent()
				Select Event
					Case #PB_Event_Menu
						Select EventMenu()
							Case #MENU_QUIT
								Quit = #True
							Case #MENU_ABOUT
								MessageRequester("About", "This is your program description.")
						EndSelect
					Case #PB_Event_Gadget
						Select EventGadget()
							Case #BUTTON_INTERACT
								AddGadgetItem(#LIST_INPUT, -1, GetGadgetText(#STRING_INPUT))
								SetGadgetText(#STRING_INPUT, "")
								SetActiveGadget(#STRING_INPUT)
							Case #BUTTON_CLOSE
								Quit = #True
						EndSelect
				EndSelect
			Until Event = #PB_Event_CloseWindow Or Quit = #True
		EndIf
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog