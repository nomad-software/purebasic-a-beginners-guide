;Returns the correct unsigned value from a UCHAR.
Procedure.w UCHAR(UCHAR.b)
	ProcedureReturn UCHAR & $FF
EndProcedure

;Returns the correct signed value from a TBYTE.
CompilerIf #PB_Compiler_Unicode
	Procedure.w TBYTE(TBYTE.c)
CompilerElse
	Procedure.b TBYTE(TBYTE.c)
CompilerEndIf
	ProcedureReturn TBYTE
EndProcedure

;Returns the correct unsigned value from a USHORT.
Procedure.l USHORT(USHORT.w)
	ProcedureReturn USHORT & $FFFF
EndProcedure

;Returns the correct unsigned value from a UINT.
Procedure.q UINT(UINT.l)
	ProcedureReturn UINT & $FFFFFFFF
EndProcedure

;Returns the correct unsigned value from a UINT32.
Procedure.q UINT32(UINT32.l)
	ProcedureReturn UINT32 & $FFFFFFFF
EndProcedure

;Returns the correct unsigned value from a ULONG.
Procedure.q ULONG(ULONG.l)
	ProcedureReturn ULONG & $FFFFFFFF
EndProcedure

;Returns the correct unsigned value from a ULONG32.
Procedure.q ULONG32(ULONG32.l)
	ProcedureReturn ULONG32 & $FFFFFFFF
EndProcedure
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog