; Remember to turn on 'Create threadsafe executable' in the compiler options!

Procedure DrawNumbers(Unused.l)
	For x.l = 1 To 20
		PrintN(Str(x))
		Delay(75)
	Next x
EndProcedure

If OpenConsole()
	ThreadID.l = CreateThread(@DrawNumbers(), 0)
	WaitThread(ThreadID)
	Print("Press Return to quit") : Input()
	CloseConsole()
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; EnableThread
; HideErrorLog