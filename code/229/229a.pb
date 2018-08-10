Enumeration
	#WINDOW_ROOT
	#SOUND_FILE
	#TEXT_FILE
	#BUTTON_CHOOSE_FILE
	#TEXT_VOLUME
	#TRACKBAR_VOLUME
	#TEXT_PAN
	#TRACKBAR_PAN
	#TEXT_FREQUENCY
	#TRACKBAR_FREQUENCY
	#BUTTON_PLAY_FILE
	#BUTTON_STOP_FILE
EndEnumeration

Global FileName.s = ""

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_ROOT, 0, 0, 500, 250, "Sound Player", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_ROOT))
		TextGadget(#TEXT_FILE, 10, 10, 480, 20, "", #PB_Text_Border)
		ButtonGadget(#BUTTON_CHOOSE_FILE, 10, 40, 150, 20, "Choose Wave File...")
		
		TextGadget(#TEXT_VOLUME, 10, 70, 480, 20, "Volume")
		TrackBarGadget(#TRACKBAR_VOLUME, 10, 90, 480, 20, 0, 100)
		SetGadgetState(#TRACKBAR_VOLUME, 100)
		
		TextGadget(#TEXT_PAN, 10, 120, 480, 20, "Pan")
		TrackBarGadget(#TRACKBAR_PAN, 10, 140, 480, 20, 0, 200)
		SetGadgetState(#TRACKBAR_PAN, 100)

		TextGadget(#TEXT_FREQUENCY, 10, 170, 480, 20, "Frequency")
		TrackBarGadget(#TRACKBAR_FREQUENCY, 10, 190, 480, 20, 100, 10000)
		SetGadgetState(#TRACKBAR_FREQUENCY, 4400)

		ButtonGadget(#BUTTON_PLAY_FILE, 10, 220, 100, 20, "Play File")
		ButtonGadget(#BUTTON_STOP_FILE, 130, 220, 100, 20, "Stop Sound")
		
		If InitSound()
			Repeat
				Event.l = WaitWindowEvent()
				Select Event
					Case #PB_Event_Gadget
					
						Select EventGadget()
							Case #BUTTON_CHOOSE_FILE
								FileName=OpenFileRequester("Choose","","Wave File (*.wav)|*.wav",0)
								If filename <> ""
									SetGadgetText(#TEXT_FILE, GetFilePart(FileName))
									LoadSound(#SOUND_FILE, filename)
								EndIf
								
							Case #TRACKBAR_VOLUME
								If filename <> ""
									SoundVolume(#SOUND_FILE, GetGadgetState(#TRACKBAR_VOLUME))
								EndIf

							Case #TRACKBAR_PAN
								If filename <> ""
									SoundPan(#SOUND_FILE, GetGadgetState(#TRACKBAR_PAN) - 100)
								EndIf
			
							Case #TRACKBAR_FREQUENCY
								If filename <> ""
									SoundFrequency(#SOUND_FILE,GetGadgetState(#TRACKBAR_FREQUENCY) * 10)
								EndIf
			
							Case #BUTTON_PLAY_FILE
								If filename <> ""
									PlaySound(#SOUND_FILE)
								EndIf
			
							Case #BUTTON_STOP_FILE
								If filename <> ""
									StopSound(#SOUND_FILE)
								EndIf
						EndSelect
			
				EndSelect
			Until Event = #PB_Event_CloseWindow
		EndIf
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog