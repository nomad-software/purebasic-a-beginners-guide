Dim Numbers.l(2, 2)

Numbers(0, 0) = 1
Numbers(0, 1) = 2
Numbers(0, 2) = 3
Numbers(1, 0) = 4
Numbers(1, 1) = 5
Numbers(1, 2) = 6
Numbers(2, 0) = 7
Numbers(2, 1) = 8
Numbers(2, 2) = 9

For x = 0 To 2
	For y = 0 To 2
		Debug Numbers(x, y)
	Next y
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog