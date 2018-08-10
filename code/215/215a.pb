; NOTE
; Due to a bug in Purebasic regarding the 3d rotation commands using
;	the wrong axis when performing rotations, this code may not perform
; as it should. To work around this bug, to make this code behave as
; normal please follow these instructions:
;
; Change line 77 to read:
; 'RotateCamera(#CAMERA_ONE, MouseYRotation, MouseXRotation, 0)'
;
;	I have spoken to Fred about this and he has assured me that this
; error will be fixed in the next update.
;
; Once the new update is released this will be fixed and the above
; steps will not be necessary.
;

Enumeration
	#TEXTURE_GLOBAL
	#TEXTURE_DETAIL
	#MATERIAL_TERRAIN
	#CAMERA_ONE
EndEnumeration

#MOVEMENT_SPEED = 1

;Set the width, height and bit depth of the screen
;Abbreviated variables are used here due to page width constraints :(
Global ScrW.l = 1024
Global ScrH.l = 768
Global ScrD.l = 32

;Other global variables
Global Quit.b = #False
Global MouseXRotation.f,MouseYRotation.f,KeyX.f,KeyZ.f,DesiredCameraHeight.f
Global CurrentCamXPos.f = 545
Global CurrentCamZPos.f = 280

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
HandleError(InitMouse(), "InitMouse() command failed.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
SetFrameRate(60)

;Set 3D Archive
Add3DArchive("Data\", #PB_3DArchive_FileSystem)

;Create Terrain
HandleError(LoadTexture(#TEXTURE_GLOBAL, "Global.png"), "Can't load texture")
HandleError(LoadTexture(#TEXTURE_DETAIL, "Detail.png"), "Can't load texture")
CreateMaterial(#MATERIAL_TERRAIN, TextureID(#TEXTURE_GLOBAL))
AddMaterialLayer(#MATERIAL_TERRAIN,TextureID(#TEXTURE_DETAIL),#PB_Material_Add)
CreateTerrain("Terrain.png", MaterialID(#MATERIAL_TERRAIN), 1, 2, 1)

;Create Viewport and 3D Camera
CreateCamera(#CAMERA_ONE, 0, 0, 100, 100)
DesiredCameraHeight.f = TerrainHeight(CurrentCamXPos, CurrentCamZPos) + 10
CameraLocate(#CAMERA_ONE,CurrentCamXPos,DesiredCameraHeight,CurrentCamZPos)

;Main loop
Repeat
	
	;Update Mouse
	If ExamineMouse()
		MouseYRotation = -MouseDeltaX() / 10
		MouseXRotation = MouseDeltaY() / 10
	EndIf
	RotateCamera(#CAMERA_ONE, MouseXRotation, MouseYRotation, 0)
	;Update Key Presses and position the Camera accordingly
	If ExamineKeyboard()
		If KeyboardPushed(#PB_Key_Left) : KeyX = -#MOVEMENT_SPEED : EndIf
		If KeyboardPushed(#PB_Key_Right) : KeyX = #MOVEMENT_SPEED : EndIf
		If KeyboardPushed(#PB_Key_Up) : KeyZ = -#MOVEMENT_SPEED : EndIf
		If KeyboardPushed(#PB_Key_Down) : KeyZ = #MOVEMENT_SPEED : EndIf
		MoveCamera(#CAMERA_ONE, KeyX, 0, KeyZ)
		KeyX = 0
		KeyZ = 0
		CurrentCamXPos.f = CameraX(#CAMERA_ONE)
		CurrentCamZPos.f = CameraZ(#CAMERA_ONE)
		DesiredCameraHeight.f = TerrainHeight(CurrentCamXPos, CurrentCamZPos) + 10
		CameraLocate(#CAMERA_ONE,CurrentCamXPos,DesiredCameraHeight,CurrentCamZPos)
	EndIf

	RenderWorld()
	FlipBuffers()

	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf

Until Quit = #True
End
; IDE Options = PureBasic v4.00 (Windows - x86)
; HideErrorLog