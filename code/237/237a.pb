Enumeration
	#WINDOW_ROOT
	#BUTTON_PREVIOUS
	#BUTTON_PLAY
	#BUTTON_STOP
	#BUTTON_NEXT
	#BUTTON_EJECT
	#TEXT_STATUS
	#PROGRESS_SONG
	#LIST_TRACKS
EndEnumeration

;Global variables, etc.
Global NumberOfTracks.l
Global CurrentTrack.l

;Convert seconds into a String containing minutes
Procedure.s ConvertToMin(Seconds.l)
	ProcedureReturn Str(Seconds / 60) + ":" + Str(Seconds % 60)
EndProcedure

;Set the current track
Procedure UpdateStatusText(Track.l)
	If NumberOfTracks > 0
		TrackLength.l = AudioCDTrackLength(Track)
		TrackLengthString.s = ConvertToMin(TrackLength)
		TrackTimings.s = " (" + TrackLengthString + ")"
		SetGadgetText(#TEXT_STATUS, "Track: " + Str(Track) + TrackTimings)
		SetGadgetState(#PROGRESS_SONG, 0)
		If AudioCDStatus() > 0
			TimeElapsed.l = AudioCDTrackSeconds()
			TrackTimings.s=" ("+ConvertToMin(TimeElapsed)+" / "+TrackLengthString+")"
			SetGadgetText(#TEXT_STATUS, "Track: " + Str(Track) + TrackTimings)
			Progress.f = (100 / TrackLength) * TimeElapsed
			SetGadgetState(#PROGRESS_SONG, Progress)
		EndIf
		SetGadgetState(#LIST_TRACKS, Track - 1)
	Else
		SetGadgetText(#TEXT_STATUS, "Please insert an Audio CD")
	EndIf
EndProcedure

;Move to next track
Procedure NextTrack()
	If CurrentTrack < NumberOfTracks
		CurrentTrack + 1
		UpdateStatusText(CurrentTrack)
		If AudioCDStatus() > 0
			PlayAudioCD(CurrentTrack, NumberOfTracks)
		EndIf
	EndIf
EndProcedure

;Move to previous track
Procedure PreviousTrack()
	If CurrentTrack > 1
		CurrentTrack - 1
		UpdateStatusText(CurrentTrack)
		If AudioCDStatus() > 0
			PlayAudioCD(CurrentTrack, NumberOfTracks)
		EndIf
	EndIf
EndProcedure

;Populate the list to show all tracks on a disc
Procedure PopulateTrackListing()
	ClearGadgetItemList(#LIST_TRACKS)
	NumberOfTracks = AudioCDTracks()
	If NumberOfTracks > 0
		For x.l = 1 To NumberOfTracks
			TrackLength.s = ConvertToMin(AudioCDTrackLength(x))
			AddGadgetItem(#LIST_TRACKS, -1, "Track "+Str(x)+" ("+TrackLength+")")
		Next x
		If CurrentTrack = 0
			CurrentTrack = 1
		EndIf
	Else
		CurrentTrack = 0
	EndIf
EndProcedure

#FLAGS = #PB_Window_SystemMenu | #PB_Window_ScreenCentered
If OpenWindow(#WINDOW_ROOT, 0, 0, 320, 250, "CD Player", #FLAGS)
	If CreateGadgetList(WindowID(#WINDOW_ROOT))
		ButtonGadget(#BUTTON_PREVIOUS, 10, 10, 60, 20, "Previous")
		ButtonGadget(#BUTTON_PLAY, 70, 10, 60, 20, "Play")
		ButtonGadget(#BUTTON_STOP, 130, 10, 60, 20, "Stop")
		ButtonGadget(#BUTTON_NEXT, 190, 10, 60, 20, "Next")
		ButtonGadget(#BUTTON_EJECT, 250, 10, 60, 20, "Eject")
		TextGadget(#TEXT_STATUS, 10, 40, 300, 20, "", #PB_Text_Center)
		ProgressBarGadget(#PROGRESS_SONG, 10, 65, 300, 10, 0, 100, #PB_ProgressBar_Smooth)
		ListViewGadget(#LIST_TRACKS, 10, 90, 300, 150)
		
		If InitAudioCD()
			PopulateTrackListing()
			
			StartTime.l = ElapsedMilliseconds()
		
			Repeat
				Event.l = WindowEvent()
				Select Event
					Case #PB_Event_Gadget
						Select EventGadget()
							Case #BUTTON_PREVIOUS
								PreviousTrack()
							Case #BUTTON_PLAY
								If NumberOfTracks > 0
									PlayAudioCD(CurrentTrack, NumberOfTracks)
								EndIf
							Case #BUTTON_STOP
								StopAudioCD()
							Case #BUTTON_NEXT
								NextTrack()
							Case #BUTTON_EJECT
								EjectAudioCD(#True)
								PopulateTrackListing()
							Case #LIST_TRACKS
								If EventType() = #PB_EventType_LeftDoubleClick
									CurrentTrack = GetGadgetState(#LIST_TRACKS) + 1
									UpdateStatusText(CurrentTrack)
									PlayAudioCD(CurrentTrack, NumberOfTracks)
								EndIf
						EndSelect
				EndSelect
				
				CurrentTime.l = ElapsedMilliseconds()
				If CurrentTime > StartTime + 1000
					PopulateTrackListing()
					UpdateStatusText(CurrentTrack)
					StartTime.l = ElapsedMilliseconds()
				EndIf
				Delay(1)
				
			Until Event = #PB_Event_CloseWindow
			StopAudioCD()
		EndIf
	EndIf
EndIf
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog