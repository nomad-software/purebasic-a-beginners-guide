;Run this program with the Debugger off!

#ERROR_READFILE = 1
#ERROR_WRITEFILE = 2
#FILE_TEXT = 1

;Set the error handler
OnErrorGoto(?ErrorHandler)

If ReadFile(#FILE_TEXT, "Report.txt") = #False
	;If the file read fails then fire an error
	SetErrorNumber(#ERROR_READFILE)
EndIf
End

;Handle any custom error that occurs
ErrorHandler:
Text.s = "Error count:" + #TAB$ + #TAB$ + Str(GetErrorCounter()) + #CRLF$
Text.s + "Error ID number:" + #TAB$ + #TAB$ + Str(GetErrorNumber()) + #CRLF$
Select GetErrorNumber()
	Case #ERROR_READFILE
		Description.s = "The file could not be read."
	Case #ERROR_WRITEFILE
		Description.s = "The file could not be written."
EndSelect
Text.s + "Error description:" + #TAB$ + #TAB$ + Description + #CRLF$
Text.s + "Error occurred on line:" + #TAB$ + Str(GetErrorLineNR()) + #CRLF$
Text.s + "Error occurred in module:" + #TAB$ + GetErrorModuleName() + #CRLF$
MessageRequester("ERROR", Text)
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; DisableDebugger
; HideErrorLog