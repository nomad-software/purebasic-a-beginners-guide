Structure FAMILY
	Father.s
	Mother.s
	Children.s[2]
	Surname.s
EndStructure

Family.FAMILY

Family\Father = "Peter"
Family\Mother = "Sarah"
Family\Children[0] = "John"
Family\Children[1] = "Jane"
Family\Surname = "Smith"

Debug "Family Members:"
Debug Family\Father + " " + Family\Surname
Debug Family\Mother + " " + Family\Surname
Debug Family\Children[0] + " " + Family\Surname
Debug Family\Children[1] + " " + Family\Surname
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog