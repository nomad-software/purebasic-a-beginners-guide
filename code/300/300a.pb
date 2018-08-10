;Returns the correct unsigned value from a UCHAR.
Procedure.w UCHAR(UCHAR.b)
	ProcedureReturn UCHAR & $FF
EndProcedure

MyUCHAR.b = 255 ; This represents '-1' signed and '255' unsigned.
Debug MyUCHAR ; This echoes the signed value of '-1'.
UnsignedValue.w = UCHAR(MyUCHAR)
Debug UnsignedValue ; This echoes the unsigned value of '255'.
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog