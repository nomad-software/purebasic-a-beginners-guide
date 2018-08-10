Weight.l = 12

Select Weight
	Case 0
		Debug "No Weight"
	Case 1, 2, 3
		Debug "Light"
	Case 4 To 15
		Debug "Medium"
	Case 16 To 30
		Debug "Heavy"
	Default
		Debug "Massive"
EndSelect
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog