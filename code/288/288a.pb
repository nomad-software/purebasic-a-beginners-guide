ProcedureDLL AttachProcess(Instance.l)
	Global Message.s = "This is my DLL."
EndProcedure

ProcedureDLL ShowAlert()
	MessageRequester("Alert", Message)
EndProcedure
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog