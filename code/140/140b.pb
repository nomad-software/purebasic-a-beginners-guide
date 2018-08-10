Enumeration
	#WIN_MAIN
	#BUTTON_INTERACT
	#BUTTON_CLOSE
EndEnumeration

Global Quit.b = #False
#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 300, 200, "Interaction", #FLAGS)
	If CreateGadgetList(WindowID(#WIN_MAIN))

		ButtonGadget(#BUTTON_INTERACT, 10, 170, 100, 20, "Click me")
		ButtonGadget(#BUTTON_CLOSE, 190, 170, 100, 20, "Close window")
		Repeat

			Event.l = WaitWindowEvent()
			Select Event
				Case #PB_Event_Gadget
					Select EventGadget()

						Case #BUTTON_INTERACT
							Debug "The button was pressed."
						Case #BUTTON_CLOSE
							Quit = #True
					EndSelect
			EndSelect

		Until Event = #PB_Event_CloseWindow Or Quit = #True

	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog