Structure FISH
	Kind.s
	Weight.s
	Color.s
EndStructure

Dim FishInTank.FISH(2)

FishInTank(0)\Kind = "Clown Fish"
FishInTank(0)\Weight = "4 oz."
FishInTank(0)\Color = "Red, White and Black"

FishInTank(1)\Kind = "Box Fish"
FishInTank(1)\Weight = "1 oz."
FishInTank(1)\Color = "Yellow"

FishInTank(2)\Kind = "Sea Horse"
FishInTank(2)\Weight = "2 oz."
FishInTank(2)\Color = "Green"

Debug FishInTank(0)\Kind+" "+FishInTank(0)\Weight+" "+FishInTank(0)\Color
Debug FishInTank(1)\Kind+" "+FishInTank(1)\Weight+" "+FishInTank(1)\Color
Debug FishInTank(2)\Kind+" "+FishInTank(2)\Weight+" "+FishInTank(2)\Color
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog