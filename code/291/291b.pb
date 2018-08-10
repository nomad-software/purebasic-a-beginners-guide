#LIBRARY = 0
If OpenLibrary(#LIBRARY, "Demo.dll")
	ReturnValue.l = CallFunction(#LIBRARY, "MultiplyValues", 22, 33)
	Debug ReturnValue
	CloseLibrary(#LIBRARY)
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog