Enumeration
	#MESH
	#TEXTURE
	#MATERIAL
	#ENTITY
	#CAMERA_ONE
	#LIGHT_ONE
	#LIGHT_TWO
	#PARTICLE_ONE
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

;Convert Degrees to Radians
Procedure.f DegToRad(Angle.f)
	ProcedureReturn Angle.f * #PI / 180
EndProcedure

;Initialize environment
HandleError(InitEngine3D(), "InitEngine3D() command failed.")
HandleError(InitSprite(), "InitSprite() command failed.")
HandleError(OpenScreen(ScrW, ScrH, ScrD, ""), "Could not open screen.")
HandleError(InitKeyboard(), "InitKeyboard() command failed.")
SetFrameRate(60)

Add3DArchive("Data\", #PB_3DArchive_FileSystem)
Parse3DScripts()
CreateEntity(#ENTITY, LoadMesh(#MESH, "Statue.mesh"), #PB_Material_None)

LoadTexture(#TEXTURE, "Flame.png")
	CreateMaterial(#MATERIAL, TextureID(#TEXTURE))
	DisableMaterialLighting(#MATERIAL, 1)
	MaterialBlendingMode(#MATERIAL, #PB_Material_Add)

CreateParticleEmitter(#PARTICLE_ONE, 2, 2, 0,#PB_Particle_Point,12.9, 69, 15.7)
	ParticleSize(#PARTICLE_ONE, 5, 5)
	ParticleMaterial(#PARTICLE_ONE, MaterialID(#MATERIAL))
	ParticleEmissionRate(#PARTICLE_ONE, 50)
	ParticleTimeToLive(#PARTICLE_ONE, 0.25, 0.25)
	ParticleColorRange(#PARTICLE_ONE, RGB(255, 0, 0), RGB(255, 200, 0))
	ParticleVelocity(#PARTICLE_ONE, 1, 10)

CreateLight(#LIGHT_ONE, RGB(255,255,255))
CreateLight(#LIGHT_TWO, RGB(255, 200, 0), 12.9, 72, 15.7)
CreateCamera(#CAMERA_ONE, 0, 0, 100, 100)

;Main loop
Repeat

	Angle.f + 0.5
	PosX.f = 75 * Sin(DegToRad(Angle))
	PosY.f = (50 * Sin(DegToRad(Angle / 2))) + 65
	PosZ.f = 75 * Cos(DegToRad(Angle))
	LightLocate(#LIGHT_ONE, PosX, PosY + 100, PosZ)
	LightColor(#LIGHT_TWO, RGB(255, Random(200), 0))
	CameraLocate(#CAMERA_ONE, PosX, PosY, PosZ)
	CameraLookAt(#CAMERA_ONE, 0, 60, 0)
	RenderWorld()
	FlipBuffers()

	ExamineKeyboard()
	If KeyboardReleased(#PB_Key_Escape)
		Quit = #True
	EndIf
Until Quit = #True
End

; IDE Options = PureBasic 4.40 Beta 5 (Windows - x64)
; HideErrorLog