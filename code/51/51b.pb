Structure UNIONSTRUCTURE
	StructureUnion
		One.l
		Two.l
		Three.l
	EndStructureUnion
EndStructure
Debug SizeOf(UNIONSTRUCTURE)

UnionVariable.UNIONSTRUCTURE

UnionVariable\One = 123
Debug UnionVariable\One

UnionVariable\Three = 456
Debug UnionVariable\One
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog