CompilerSelect #PB_Compiler_OS
	
	CompilerCase #PB_OS_Windows
		;Windows specific code
		MessageRequester("Info", "This is being compiled on Microsoft Windows.")
	
	CompilerCase #PB_OS_Linux
		;Linux specific code
		MessageRequester("Info", "This is being compiled on Linux.")

CompilerCase #PB_OS_MacOS
		;MacOS specific code
		MessageRequester("Info", "This is being compiled on MacOS X")

	CompilerCase #PB_OS_AmigaOS
		;AmigaOS specific code
		MessageRequester("Info", "This is being compiled on Amiga OS.")
	
CompilerEndSelect
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog