#LIBRARY = 0
If OpenLibrary(#LIBRARY, "User32.dll")
	MB_OK = 0
	Caption.s = "Test"
	TextString.s = "This is a Win32 API Test"
	CallFunction(#LIBRARY, "MessageBoxA", #Null, @TextString, @Caption, MB_OK)
	CloseLibrary(#LIBRARY)
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog