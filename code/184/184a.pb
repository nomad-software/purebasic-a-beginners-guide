InitSprite()
If ExamineScreenModes()
	While NextScreenMode()
		Width.l = ScreenModeWidth()
		Height.l = ScreenModeHeight()
		BitDepth.l = ScreenModeDepth()
		Debug Str(Width)+" x "+Str(Height)+" x "+Str(BitDepth)
	Wend
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog