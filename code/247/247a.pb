CompilerIf #PB_Compiler_OS = #PB_OS_Windows
	MessageRequester("Info", "This compiler is running on Microsoft Windows")
CompilerElse
	MessageRequester("Info", "This compiler is NOT running on Microsoft Windows")
CompilerEndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog