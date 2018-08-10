;Run this program with the Debugger off!

;Set the error handler
OnErrorGoto(?ErrorHandler)

;Trigger a classic 'divide by zero' error.
Null.l = 0
TestVariable.l = 100 / Null

;Handle any system error that occurs
ErrorHandler:
Text.s = "Error count:" + #TAB$ + #TAB$ + Str(GetErrorCounter()) + #CRLF$
Text.s + "Error ID number:" + #TAB$ + #TAB$ + Str(GetErrorNumber()) + #CRLF$
Text.s + "Error description:" + #TAB$ + #TAB$ + GetErrorDescription() + #CRLF$
Text.s + "Error occurred on line:" + #TAB$ + Str(GetErrorLineNR()) + #CRLF$
Text.s + "Error occurred in module:" + #TAB$ + GetErrorModuleName() + #CRLF$
MessageRequester("ERROR", Text)
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; DisableDebugger
; HideErrorLog