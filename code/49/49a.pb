Structure PERSONALDETAILS
	FirstName.s
	LastName.s
	Home.s
EndStructure

Me.PERSONALDETAILS

Me\FirstName = "Gary"
Me\LastName = "Willoughby"
Me\Home = "A House"

Debug "First Name: " + Me\FirstName
Debug "Last Name: " + Me\LastName
Debug "Home: " + Me\Home
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog