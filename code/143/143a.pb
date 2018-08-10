Enumeration
	#WIN_MAIN
	#TEXT_INPUT
	#STRING_INPUT
	#BUTTON_INTERACT
	#BUTTON_CLOSE
EndEnumeration

Global Quit.b = #False
#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 300, 200, "Interaction", #FLAGS)
	If CreateGadgetList(WindowID(#WIN_MAIN))

		TextGadget(#TEXT_INPUT, 10, 10, 280, 20, "Enter text here:")
		StringGadget(#STRING_INPUT, 10, 30, 280, 20, "")
		ButtonGadget(#BUTTON_INTERACT, 10, 170, 120, 20, "Echo text")
		ButtonGadget(#BUTTON_CLOSE, 190, 170, 100, 20, "Close window")
		SetActiveGadget(#STRING_INPUT)
		Repeat

			Event.l = WaitWindowEvent()
			Select Event
				Case #PB_Event_Gadget
					Select EventGadget()
						Case #BUTTON_INTERACT
							Debug GetGadgetText(#STRING_INPUT)
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