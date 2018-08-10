Title.s = "Information"
Message.s = "This is the default style message requester"
MessageRequester(Title, Message, #PB_MessageRequester_Ok)

Message.s = "In this style you can choose 'Yes' or 'No'."
Result.l = MessageRequester(Title, Message, #PB_MessageRequester_YesNo)

If Result = #PB_MessageRequester_Yes
	Debug "You pressed 'Yes'"
Else
	Debug "You pressed 'No'"
EndIf
Message.s = "In this style you can choose 'Yes' or 'No' or 'Cancel'."
Result.l = MessageRequester(Title, Message, #PB_MessageRequester_YesNoCancel)

Select Result
	Case #PB_MessageRequester_Yes
		Debug "You pressed 'Yes'"
	Case #PB_MessageRequester_No
		Debug "You pressed 'No'"
	Case #PB_MessageRequester_Cancel
		Debug "You pressed 'Cancel'"
EndSelect
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog