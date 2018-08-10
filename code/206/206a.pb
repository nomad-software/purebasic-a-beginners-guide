; NOTE
; Due to a bug in Purebasic regarding the 3d rotation commands using
;	the wrong axis when performing rotations, this code may not perform
; as it should. To work around this bug, to make this code behave as
; normal please follow these instructions:
;
; Change line 62 to read:
; 'RotateCamera(#CAMERA_ONE, 0, -15, 0)'
;
; Change line 68 to read:
; 'RotateEntity(#ENTITY_INVADER, y, 0, 0)'
;
;	I have spoken to Fred about this and he has assured me that this
; error will be fixed in the next update.
;
; Once the new update is released this will be fixed and the above
; steps will not be necessary.
;

Enumeration
	#MESH
	#TEX
	#MAT
	#ENTITY_INVADER
	#LIGHT
	#CAMERA_ONE
EndEnumeration

;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32
;Other global variables
Global Quit.b = #False

;Simple error checking procedure
Procedure HandleError(Result.l, Text.s)
	If Result = 0
		MessageRequester("Error", Text, #PB_MessageRequester_Ok)
		End
	EndIf
EndProcedure

;Initialize environment
HandleError(InitEngine3D(), "InitEngine3D() command failed.")
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, ""), "Could not open screen.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
SetFrameRate(60)

Add3DArchive("Data\", #PB_3DArchive_FileSystem)

HandleError(LoadMesh(#MESH, "Invader.mesh"), "Can't load mesh")
HandleError(LoadTexture(#TEX, "Invader.png"), "Can't load texture")
HandleError(CreateMaterial(#MAT, TextureID(#TEX)), "Can't create Material")
CreateEntity(#ENTITY_INVADER, MeshID(#MESH), MaterialID(#MAT))

CreateLight(#LIGHT, RGB(255,255,255), 0, 5, 0)

CreateCamera(#CAMERA_ONE, 0, 0, 100, 100)
CameraLocate(#CAMERA_ONE, 0, 1, 2.5)
RotateCamera(#CAMERA_ONE, -15, 0, 0)

;Main loop
Repeat

	y.l + 2
	RotateEntity(#ENTITY_INVADER, 0, y, 0)
	
	RenderWorld()
	FlipBuffers()

	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf

Until Quit = #True
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog