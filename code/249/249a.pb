CompilerSelect #PB_Compiler_OS

	CompilerCase #PB_OS_AmigaOS
		;AmigaOS specific code
		MessageRequester("Error", "This source code does not support Amiga OS.")
		
	CompilerDefault
		;This code will compile on all other operating systems.
		MessageRequester("Info", "This is code will compile fine on this OS.")
	
CompilerEndSelect
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog