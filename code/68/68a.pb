Structure WEAPON
	Name.s
	Range.l
EndStructure

Dim Weapons.WEAPON(2)

Weapons(0)\Name = "Phased Plasma Rifle"
Weapons(0)\Range = 40

Weapons(1)\Name = "SVD-Dragunov Sniper Rifle"
Weapons(1)\Range = 3800

Weapons(2)\Name = "HK-MP5 Sub-Machine Gun"
Weapons(2)\Range = 300
SortStructuredArray(Weapons(), 0, OffsetOf(WEAPON\Range), #PB_Sort_Long)

For x.l = 0 To 2
	Debug Weapons(x)\Name + " : " + Str(Weapons(x)\Range)
Next x
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog