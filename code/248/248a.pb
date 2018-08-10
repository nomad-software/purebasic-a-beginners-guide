#DEMO = #True

CompilerIf #DEMO

	;Demo code
	MessageRequester("Info", "This is a demo, You must buy the full version.")

CompilerElse

	;Full version code
	Procedure.d MyPI()
		ProcedureReturn ACos(-1)
	EndProcedure

	Test.s = "This is the full version." + #LF$ + #LF$
	Test.s + "The value of Pi is: " + StrD(MyPI(), 16)
	MessageRequester("Info", Test)

CompilerEndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog