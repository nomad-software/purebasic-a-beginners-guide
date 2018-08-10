; Returns a String containing a floating point number that’s been rounded up.
; 'Number' = Number to round up and return as a String.
; 'DecimalPlaces' = Number of decimal places to round up to.

Procedure.s StrFRound(Number.f, DecimalPlaces.l)
	Protected R.f
	Protected T.f
	If DecimalPlaces < 0
		DecimalPlaces = 0
	EndIf
	R.f = 0.5 * Pow(10, -1 * DecimalPlaces)
	T.f = Pow(10, DecimalPlaces)
	ProcedureReturn StrF(Int((Number + R) * T) / T, DecimalPlaces)
EndProcedure

Debug StrFRound(3.1415927, 4)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog