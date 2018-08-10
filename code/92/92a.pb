Procedure.l AddTogether(a.l, b.l)
	ProcedureReturn a + b
EndProcedure

Debug AddTogether(AddTogether(2, 3), AddTogether(4, 1))
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog