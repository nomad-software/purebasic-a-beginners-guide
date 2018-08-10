; Remember to turn on 'Create threadsafe executable' in the compiler options!

Enumeration
	#WINDOW_ROOT
	#LIST_ONE
	#LIST_TWO
	#BUTTON_TEST
EndEnumeration


;Insert text into the specified list gadget
Procedure InsertText(Gadget.l)
	For x.l = 1 To 25
		AddGadgetItem(Gadget, -1, Str(x))
		Delay(100)
	Next x
EndProcedure

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_ROOT, 0, 0, 290, 200, "Thread Test", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_ROOT))
		ListViewGadget(#LIST_ONE, 10, 10, 130, 150)
		ListViewGadget(#LIST_TWO, 150, 10, 130, 150)
		ButtonGadget(#BUTTON_TEST, 95, 170, 100, 20, "Start Test")
		Repeat
			EventID.l = WaitWindowEvent()
			Select EventID
				Case #PB_Event_Gadget
					Select EventGadget()
						Case #BUTTON_TEST
							Thread1.l = CreateThread(@InsertText(), #LIST_ONE)
							Thread2.l = CreateThread(@InsertText(), #LIST_TWO)
					EndSelect
			EndSelect
		Until EventID = #PB_Event_CloseWindow
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; EnableThread
; HideErrorLog