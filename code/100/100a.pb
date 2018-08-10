String.s = "I like to go fishing and catch lots of fish"
StringToFind.s = "fish"

FirstOccurrence.l = FindString(String, StringToFind, 1)
SecondOccurrence.l = FindString(String, StringToFind, FirstOccurrence + 1)
Debug "Index of the first occurrence: " + Str(FirstOccurrence)
Debug "Index of the second occurrence: " + Str(SecondOccurrence)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog