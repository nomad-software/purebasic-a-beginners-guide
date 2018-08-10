WeeklyAmount.l = 1024

Procedure CalculateYearlyAmount(Value.l)
	YearlyAmount.l = Value * 52
	ProcedureReturn YearlyAmount
EndProcedure

Debug CalculateYearlyAmount(WeaklyAmount)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog