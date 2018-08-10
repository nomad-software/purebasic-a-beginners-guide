Global Name.s = "Name 1"

If Not Defined(Name, #PB_Variable)
	;This will only define this variable if it hasn't been defined before
	Global Name.s = "Name 2"
EndIf

Debug Name
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog