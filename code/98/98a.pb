Text.s = "This is a test"

For x.l = 1 To Len(Text)
	Debug Mid(Text, x, 1) + "  :  " + Str(Asc(Mid(Text, x, 1)))
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog