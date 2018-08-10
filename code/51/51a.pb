Structure PERSONALDETAILS
	FirstName.s
	LastName.s
	Home.s
EndStructure

Structure FULLDETAILS Extends PERSONALDETAILS
	Address.s
	Country.s
	ZipCode.s
EndStructure

User.FULLDETAILS

User\FirstName = "John"
User\LastName = "Smith"
User\Home = "A House"
User\Address = "A Street"
User\Country = "UK"
User\ZipCode = "12345"

Debug "Users First Name: " + User\FirstName
Debug "Users Last Name: " + User\LastName
Debug "Users Home: " + User\Home
Debug "Users Address: " + User\Address
Debug "Users Country: " + User\Country
Debug "Users Zip Code: " + User\ZipCode
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog