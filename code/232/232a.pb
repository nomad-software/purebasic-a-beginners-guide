#MODULE_FILE = 1

If InitSound()
	If InitModule()

		LoadModule(#MODULE_FILE, "Eighth.mod")
		PlayModule(#MODULE_FILE)

		StartTime.l = ElapsedMilliseconds()
		Repeat
			Delay(1)
		Until ElapsedMilliseconds() > StartTime + 15000

		StopModule(#MODULE_FILE)

		End
	EndIf
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog