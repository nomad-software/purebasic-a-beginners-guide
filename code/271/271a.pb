MyByteVar.b = 1
MyWordVar.w = 2
MyLongVar.l = 3
MyQuadVar.q = 4
MyFloatVar.f = 5
MyDoubleVar.d = 6
MyStringVar.s = "Seven"
Dim MyLongArray.l(8)

Procedure MyProcedure(Test.l)
	Debug "Testing my procedure."
EndProcedure

Debug "Byte variable address: " + Str(@MyByteVar)
Debug "Word variable address: " + Str(@MyWordVar)
Debug "Long variable address: " + Str(@MyLongVar)
Debug "Quad variable address: " + Str(@MyQuadVar)
Debug "Float variable address: " + Str(@MyFloatVar)
Debug "Double variable address: " + Str(@MyDoubleVar)
Debug "String variable address: " + Str(@MyStringVar)
Debug "Array address: " + Str(@MyLongArray())
Debug "Procedure address: " + Str(@MyProcedure())
Debug "Label address: " + Str(?Label)

DataSection
	Label:
		Data.s "Testing"
EndDataSection
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog