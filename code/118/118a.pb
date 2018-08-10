#TEXTFILE = 1

Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

HandleError(ReadFile(#TEXTFILE,"TextFile.txt"),"Couldn’t open: 'TextFile.txt'.")
Debug ReadString(#TEXTFILE)
CloseFile(#TEXTFILE)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog