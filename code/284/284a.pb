; Remember to turn on 'Create threadsafe executable' in the compiler options!

Global ConsoleAccess.l = CreateMutex()

Procedure DrawNumbers(ThreadNumber.l)
	LockMutex(ConsoleAccess)
		ConsoleLocate(ThreadNumber * 20, 0)
		ConsoleColor((ThreadNumber + 1) * 3, 0)
		Print("Thread " + Str(ThreadNumber) + " locked.")
		For x.l = 1 To 20
			ConsoleLocate(ThreadNumber * 20, x + 1)
			Print(Str(x))
			Delay(75)
		Next x
	UnlockMutex(ConsoleAccess)
EndProcedure

If OpenConsole()
	EnableGraphicalConsole(#True)
	Thread0.l = CreateThread(@DrawNumbers(), 0)
	Thread1.l = CreateThread(@DrawNumbers(), 1)
	Thread2.l = CreateThread(@DrawNumbers(), 2)
	WaitThread(Thread0)
	WaitThread(Thread1)
	WaitThread(Thread2)
	ConsoleLocate(0, 23)
	Print("Press Return to quit") : Input()
	CloseConsole()
EndIf
End
; IDE Options = PureBasic v4.02 (Windows - x86)
; EnableThread
; HideErrorLog