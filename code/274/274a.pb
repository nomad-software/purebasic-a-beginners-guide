Structure MEALS
	Breakfast.s
	Dinner.s
	Tea.s
EndStructure

Procedure.l GetMeals()
	Static Gary.MEALS
	Gary\Breakfast = "Cornflakes"
	Gary\Dinner = "Cheese Sandwiches"
	Gary\Tea = "Spaghetti bolognese"
	ProcedureReturn @Gary
EndProcedure

*Gary.MEALS = GetMeals()

Debug *Gary\Breakfast
Debug *Gary\Dinner
Debug *Gary\Tea
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog