Structure FISH
	Kind.s
	Weight.s
	Color.s
EndStructure

NewList FishInTank.FISH()
AddElement(FishInTank())
FishInTank()\Kind = "Clown Fish"
FishInTank()\Weight = "4 oz."
FishInTank()\Color = "Red, White and Black"

AddElement(FishInTank())
FishInTank()\Kind = "Box Fish"
FishInTank()\Weight = "1 oz."
FishInTank()\Color = "Yellow"

AddElement(FishInTank())
FishInTank()\Kind = "Sea Horse"
FishInTank()\Weight = "2 oz."
FishInTank()\Color = "Green"

ForEach FishInTank()
	Debug FishInTank()\Kind+" "+FishInTank()\Weight+" "+FishInTank()\Color
Next
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog