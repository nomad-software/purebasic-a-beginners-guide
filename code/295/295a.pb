DesktopInfo.RECT
DesktopHandle.l = GetDesktopWindow_()
GetClientRect_(DesktopHandle, @DesktopInfo)

DesktopSize.s = "Your current desktop size is: "
DesktopSize + Str(DesktopInfo\right) + " x "
DesktopSize + Str(DesktopInfo\bottom)
Debug DesktopSize
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog