#LIBRARY_DEMO = 0
If OpenLibrary(#LIBRARY_DEMO, "Demo.dll")
	CallFunction(#LIBRARY_DEMO, "ShowAlert")
	CloseLibrary(#LIBRARY_DEMO)
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog