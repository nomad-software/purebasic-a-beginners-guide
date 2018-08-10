ProcedureDLL AttachProcess(Instance.l)
	Global MyFloat.f = 3.1415927
EndProcedure

ProcedureDLL.l GetPi()
	ProcedureReturn @MyFloat
EndProcedure
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog