Procedure.s DisplayValue(a.l, b.s)
	ProcedureReturn Str(a) + b
EndProcedure

x = 5
While x >= 0
	Debug DisplayValue(x, " green bottles hanging on the wall.")
	x - 1
Wend
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog