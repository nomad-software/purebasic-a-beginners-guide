#SOUND_FILE = 1
If InitSound()

	CatchSound(#SOUND_FILE, ?SoundFile)
	PlaySound(#SOUND_FILE)

	StartTime.l = ElapsedMilliseconds()
	Repeat
		Delay(1)
	Until ElapsedMilliseconds() > StartTime + 8000
	End
EndIf

DataSection
	SoundFile:
		IncludeBinary "Intro.wav"
EndDataSection
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog