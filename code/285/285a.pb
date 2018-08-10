; Remember to turn on 'Create threadsafe executable' in the compiler options!

Enumeration
	#WINDOW_ROOT
	#TEXT_ONE
	#TEXT_TWO
	#TEXT_THREE
	#BUTTON_START
EndEnumeration
Global Lock.l = CreateMutex()

Procedure Update(Gadget.l)
	StartTime.l = ElapsedMilliseconds()
	Repeat
		If TryLockMutex(Lock)
			For x.l = 1 To 20
				SetGadgetText(Gadget, Str(Gadget) + " has locked the mutex. " + Str(x))
				Delay(250)
			Next x
			UnlockMutex(Lock)
			Break
		Else
			Time.s = "(" + Str((ElapsedMilliseconds() - StartTime) / 1000) + " Secs)"
			SetGadgetText(Gadget, Str(Gadget) + " is waiting for mutex. " + Time)
			Delay(1)
		EndIf
	ForEver
	SetGadgetText(Gadget, Str(Gadget) + " has finished.")
EndProcedure

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_ROOT, 0, 0, 290, 130, "'TryLockMutex()' Test", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_ROOT))
		StringGadget(#TEXT_ONE, 10, 10, 270, 20, "")
		StringGadget(#TEXT_TWO, 10, 40, 270, 20, "")
		StringGadget(#TEXT_THREE, 10, 70, 270, 20, "")
		ButtonGadget(#BUTTON_START, 95, 100, 100, 20, "Start")
		Repeat
			EventID.l = WaitWindowEvent()
			Select EventID
				Case #PB_Event_Gadget
					Select EventGadget()
						Case #BUTTON_START
							Thread1.l = CreateThread(@Update(), #TEXT_ONE)
							Thread2.l = CreateThread(@Update(), #TEXT_TWO)
							Thread2.l = CreateThread(@Update(), #TEXT_THREE)
					EndSelect
			EndSelect
		Until EventID = #PB_Event_CloseWindow
	EndIf
EndIf
End
; IDE Options = PureBasic v4.02 (Windows - x86)
; EnableThread
; HideErrorLog