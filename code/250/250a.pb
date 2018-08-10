CompilerSelect #PB_Compiler_OS

	CompilerCase #PB_OS_MacOS
		CompilerError "This source code does not support MacOS."

	CompilerDefault
		MessageRequester("Info", "This is code will compile fine on this OS.")

CompilerEndSelect
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog