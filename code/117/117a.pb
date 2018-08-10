#TEXTFILE = 1

If ReadFile(#TEXTFILE, "TextFile.txt")
	Debug ReadString(#TEXTFILE)
	CloseFile(#TEXTFILE)
Else
	MessageRequester("Error", "Could not open the file: 'TextFile.txt'.")
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog