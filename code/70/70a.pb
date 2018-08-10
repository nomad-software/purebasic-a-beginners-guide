Structure GIRL
	Name.s
	Weight.s
EndStructure

NewList Girls.GIRL()

AddElement(Girls())
Girls()\Name = "Mia"
Girls()\Weight = "8.5 Stone"

AddElement(Girls())
Girls()\Name = "Big Rosie"
Girls()\Weight = "19 stone"

AddElement(Girls())
Girls()\Name = "Sara"
Girls()\Weight = "10 Stone"

SortStructuredList(Girls(), 0, OffsetOf(GIRL\Name), #PB_Sort_String)

ForEach Girls()
	Debug Girls()\Name + " : " + Girls()\Weight
Next
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog