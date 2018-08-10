#FILE_MP3 = 1

; Change this to the location of a MP3 file of your own:
MP3File.s = "Test.mp3"

If ReadFile(#FILE_MP3, MP3File)
	FileSeek(#FILE_MP3, Lof(#FILE_MP3) - 128)
	For x.l = 1 To 3
		Text.s + Chr(ReadByte(#FILE_MP3))
	Next x
	CloseFile(#FILE_MP3)
	If Text = "TAG"
		Debug "'" + MP3File + "' has an ID3v1 tag embedded within it."
	Else
		Debug "'" + MP3File + "' does not have an ID3v1 tag embedded within it."
	EndIf
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog