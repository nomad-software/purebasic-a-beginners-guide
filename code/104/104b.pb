#FILE_RHYME = 1

Dim Rhyme.s(3)

Rhyme(0) = "Baa baa black sheep, have you any wool?"
Rhyme(1) = "Yes sir, yes sir, three bags full!"
Rhyme(2) = "One for the master, one for the dame,"
Rhyme(3) = "And one for the little boy who lives down the lane."

If CreateFile(#FILE_RHYME, "Baa baa.txt")
		For x.l = 0 To 3
			WriteStringN(#FILE_RHYME, Rhyme(x))
		Next x
		CloseFile(#FILE_RHYME)
EndIf
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog