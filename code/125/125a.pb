;Run this program with the Debugger off!

;Handle any system error that occurs
Procedure ErrorHandler()
	Text.s = "Error count:" + #TAB$ + Str(GetErrorCounter()) + #CRLF$
	Text.s + "Error ID number:" + #TAB$ + Str(GetErrorNumber()) + #CRLF$
	Text.s + "Error description:" + #TAB$ + GetErrorDescription() + #CRLF$
	Text.s + "Occurred on line:" + #TAB$ + Str(GetErrorLineNR()) + #CRLF$
	Text.s + "Occurred in module:" + #TAB$ + GetErrorModuleName() + #CRLF$+#CRLF$
	Text.s + "Would you like to continue execution of the program?"
	ReturnValue.l = MessageRequester("ERROR", Text, #PB_MessageRequester_YesNo)
	If ReturnValue = #PB_MessageRequester_No
		End
	EndIf
EndProcedure

;Set the error handler
OnErrorGosub(@ErrorHandler())

;Trigger a classic 'divide by zero' error.
Null.l = 0
TestVariable.l = 100 / Null

;If the program reaches here then the program was resumed
MessageRequester("STATUS", "The program was allowed to continue running.")
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; DisableDebugger
; HideErrorLog