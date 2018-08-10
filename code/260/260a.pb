NumberOfParameters.l = CountProgramParameters()
Text.s = "List of parameters passed:" + #LF$ + #LF$

If NumberOfParameters > 0
	For x.l = 1 To NumberOfParameters
		Text.s + ProgramParameter() + #LF$
	Next x
Else
	Text.s + "None"
EndIf

MessageRequester("Info", Text)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog