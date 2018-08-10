#SOUND_FILE = 1
If InitSound()

	LoadSound(#SOUND_FILE, "Intro.wav")
	PlaySound(#SOUND_FILE)

	StartTime.l = ElapsedMilliseconds()
	Repeat
		Delay(1)
	Until ElapsedMilliseconds() > StartTime + 8000
	End
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog