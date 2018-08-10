#FILE_REPORT = 1

NewList FileContents.s()

If ReadFile(#FILE_REPORT, "Report.txt")
	While Eof(#FILE_REPORT) = #False
		AddElement(FileContents())
		FileContents() = ReadString(#FILE_REPORT)
	Wend
	CloseFile(#FILE_REPORT)
EndIf

ForEach FileContents()
	Debug FileContents()
Next
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog