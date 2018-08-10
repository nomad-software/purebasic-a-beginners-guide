For x = 0 To 2
	For y = 0 To 2
		z.l = 0
		While z =< 10
			Debug x * y + z
			z + 1
		Wend
	Next y
Next x

; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog