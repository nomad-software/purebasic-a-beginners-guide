ProcedureDLL AttachProcess(Instance.l)
	Global MyString.s = "Lorem ipsum dolor sit amet."
EndProcedure

ProcedureDLL.s GetString()
	ProcedureReturn MyString
EndProcedure
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog