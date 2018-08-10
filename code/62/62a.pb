Structure EMPLOYEES
	EmployeeName.s
	EmployeeClockNumber.l
	EmployeeAddress.s
	EmployeeContactNumbers.l[2]
EndStructure

Dim Company.EMPLOYEES(9)

Company(0)\EmployeeName = "Bruce Dickinson"
Company(0)\EmployeeClockNumber = 666
Company(0)\EmployeeAddress = "22 Acacia Avenue"
Company(0)\EmployeeContactNumbers[0] = 0776032666
Company(0)\EmployeeContactNumbers[1] = 0205467746

Company(1)\EmployeeName = "Adrian Smith"
Company(1)\EmployeeClockNumber = 1158
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog