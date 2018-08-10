;Count parameters
NumberOfParameters.l = CountProgramParameters()

;Add all command line parameters to a linked list
Global NewList Parameters.s()
If NumberOfParameters > 0
	For x.l = 1 To NumberOfParameters
		AddElement(Parameters())
		Parameters() = UCase(ProgramParameter())
	Next x
EndIf

;Check to see if a particular parameter was passed
Procedure ParameterPassed(Parameter.s)
	ForEach Parameters()
		If Parameter = Parameters()
			ProcedureReturn #True
		EndIf
	Next 
	ProcedureReturn #False
EndProcedure

;Check to see if the parameter 'Mouse' was passed
If ParameterPassed("MOUSE")
	MessageRequester("Info", "'Mouse' was specified as a parameter.")
EndIf
;Check to see if the parameter 'Cat' was passed
If ParameterPassed("CAT")
	MessageRequester("Info", "'Cat' was specified as a parameter.")
EndIf
;Check to see if the parameter 'Dog' was passed
If ParameterPassed("DOG")
	MessageRequester("Info", "'Dog' was specified as a parameter.")
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog