Dim Numbers.l(2)

Numbers(0) = 100
Numbers(1) = 200
Numbers(2) = 300

*ArrayPointer = @Numbers()

Debug PeekL(*ArrayPointer)
Debug PeekL(*ArrayPointer + 4)
Debug PeekL(*ArrayPointer + 8)
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog