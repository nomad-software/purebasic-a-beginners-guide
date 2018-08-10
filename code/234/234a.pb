Enumeration
	#WINDOW_ROOT
	#SOUND_FILE
	#TEXT_FILE
	#BUTTON_CHOOSE_FILE
	#TEXT_VOLUME
	#TRACKBAR_VOLUME
	#TEXT_PAN
	#TRACKBAR_PAN
	#BUTTON_PLAY_FILE
	#BUTTON_PAUSE_FILE
	#BUTTON_STOP_FILE
EndEnumeration

Global FileName.s = ""
Global FilePaused.b = #False

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_ROOT, 0, 0, 500, 215, "MP3 Player", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_ROOT))
		TextGadget(#TEXT_FILE, 10, 10, 480, 20, "", #PB_Text_Border)
		ButtonGadget(#BUTTON_CHOOSE_FILE, 10, 40, 150, 20, "Choose MP3 File...")
		TextGadget(#TEXT_VOLUME, 10, 70, 480, 20, "Volume")
		TrackBarGadget(#TRACKBAR_VOLUME, 10, 90, 480, 20, 0, 100)
		SetGadgetState(#TRACKBAR_VOLUME, 100)
		TextGadget(#TEXT_PAN, 10, 120, 480, 20, "Pan")
		TrackBarGadget(#TRACKBAR_PAN, 10, 140, 480, 20, 0, 200)
		SetGadgetState(#TRACKBAR_PAN, 100)
		ButtonGadget(#BUTTON_PLAY_FILE, 10, 180, 100, 20, "Play")
		ButtonGadget(#BUTTON_PAUSE_FILE, 130, 180, 100, 20, "Pause")
		ButtonGadget(#BUTTON_STOP_FILE, 250, 180, 100, 20, "Stop")
		
		If InitMovie()
			Repeat
				Event.l = WaitWindowEvent()
				Select Event
					Case #PB_Event_Gadget
					
						Select EventGadget()
							Case #BUTTON_CHOOSE_FILE
								FileName=OpenFileRequester("Choose","","MP3 File (*.mp3)|*.mp3",0)
								If filename <> ""
									SetGadgetText(#TEXT_FILE, GetFilePart(FileName))
									LoadMovie(#SOUND_FILE, filename)
								EndIf
								
							Case #TRACKBAR_VOLUME, #TRACKBAR_PAN
								If filename <> ""
									Volume.l = GetGadgetState(#TRACKBAR_VOLUME)
									Balance.l = GetGadgetState(#TRACKBAR_PAN) - 100
									MovieAudio(#SOUND_FILE, Volume, Balance)
								EndIf
			
							Case #BUTTON_PLAY_FILE
								If filename <> ""
									PlayMovie(#SOUND_FILE, #Null)
									FilePaused = #False
									SetGadgetText(#BUTTON_PAUSE_FILE, "Pause")
								EndIf
								
							Case #BUTTON_PAUSE_FILE
								If filename <> ""
									If FilePaused = #False
										PauseMovie(#SOUND_FILE)
										FilePaused = #True
										SetGadgetText(#BUTTON_PAUSE_FILE, "Resume")
									Else
										ResumeMovie(#SOUND_FILE)
										FilePaused = #False
										SetGadgetText(#BUTTON_PAUSE_FILE, "Pause")
									EndIf
								EndIf
			
							Case #BUTTON_STOP_FILE
								If filename <> ""
									StopMovie(#SOUND_FILE)
									FilePaused = #False
									SetGadgetText(#BUTTON_PAUSE_FILE, "Pause")
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