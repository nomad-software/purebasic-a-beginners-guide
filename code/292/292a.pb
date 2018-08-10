#LIBRARY = 0
If OpenLibrary(#LIBRARY, "Demo.dll")
	*ReturnValue = CallFunction(#LIBRARY, "GetString")
	Debug PeekS(*ReturnValue)
	CloseLibrary(#LIBRARY)
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog