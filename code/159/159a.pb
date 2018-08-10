Enumeration
	#WIN_MAIN
	#IMAGE_MEMORY
	#IMAGE_DISPLAY
	#BUTTON_CLOSE
EndEnumeration

Global Quit.b = #False

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered

If OpenWindow(#WIN_MAIN, 0, 0, 300, 200, "Image Example", #FLAGS)
	If CreateGadgetList(WindowID(#WIN_MAIN))
		If CatchImage(#IMAGE_MEMORY, ?Image)
			ImageGadget(#IMAGE_DISPLAY, 10, 10, 280, 150, ImageID(#IMAGE_MEMORY))
			ButtonGadget(#BUTTON_CLOSE, 100, 170, 100, 20, "Close window")
			Repeat
				Event.l = WaitWindowEvent()
				Select Event
					Case #PB_Event_Gadget
						Select EventGadget()
							Case #BUTTON_CLOSE
								Quit = #True
						EndSelect
				EndSelect
			Until Event = #PB_Event_CloseWindow Or Quit = #True
		EndIf
	EndIf
EndIf
End

DataSection
	Image:
		IncludeBinary "image.bmp"
EndDataSection
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog