;The procedure Pi() is called to return the value of Pi.
;This calculation is only accurate to six decimal places.

Procedure.f Pi()
	ProcedureReturn 4 * (4 * ATan(1/5) - ATan(1/239))
EndProcedure

CircleDiameter.l = 150

Debug "A circle which has a diameter of " + Str(CircleDiameter) + "mm"
Debug "has a circumference of " + StrF(CircleDiameter * Pi()) + "mm."
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog