Dim TestArray.l(999)

For x = 0 To 999
	TestArray(x) = x
Next x

For x = 0 To 999
	Debug TestArray(x)
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog