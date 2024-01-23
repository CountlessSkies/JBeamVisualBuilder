global RL_Triangles, RL_TrianglesEdit

-- declare triangle attributes default value
global BNGdragCoefDef = "100"
global BNGLiftCoefDef = "100"
global BNGstallAngleDef = "0.58"
global BNGtriangleTypeDef = "NORMALTYPE"
global BNGpressureGroupDef = ""
global BNGgroundModelDef = "ASPHALT"
global BNGtrPressureDef = "1"
global BNGtrPressurePSIDef = "1"
global BNGtrMaxPressureDef = "FLT-MAX"
global BNGtrMaxPressurePSIDef = "FLT-MAX"

triangleAttrib = attributes triangle
(
	parameters main rollout:params
	(
		/* BNGid1 type: #string default:""
		BNGid2 type: #string default:""
		BNGid3 type: #string default:"" */
		flip type: #boolean default:false
		BNGdragCoef type: #string ui:UIdragCoef default:BNGdragCoefDef
		BNGLiftCoef type: #string ui:UILiftCoef default:BNGLiftCoefDef
		BNGstallAngle type: #string ui:UIstallAngle default:BNGstallAngleDef
		BNGtriangleType type: #string ui:UItriangleType default:BNGtriangleTypeDef
		dd type: #integer ui:UItriangleType default:1
		BNGpressureGroup type: #string ui:UIpressureGroup default:BNGpressureGroupDef
		BNGpressure type:#string ui:UIpressure default:BNGtrPressureDef
		BNGpressurePSI type:#string ui:UIpressurePSI default:BNGtrPressurePSIDef
		BNGmaxPressure type:#string ui:UImaxPressure default:BNGtrmaxPressureDef
		BNGmaxPressurePSI type:#string ui:UImaxPressurePSI default:BNGtrmaxPressurePSIDef
		BNGbreakGroup type: #string ui:UIbreakGroup default:BNGbreakGroupDef
		BNGoptional type: #boolean ui:UIoptional default:BNGoptionalDef
		BNGgroundModel type: #string default:BNGgroundModelDef
		dd2 type: #integer ui:UIgroundModel default:9
	)
	rollout params "Triangles"
	(
		edittext UIdragCoef "dragCoef"
		edittext UILiftCoef "LiftCoef"
		edittext UIstallAngle "stallAngle"
		dropdownlist UItriangleType "triangleType" items: #("NORMALTYPE", "NONCOLLIDABLE")
		on UItriangleType selected i do BNGtriangleType = UItriangleType.items[i]
		edittext UIpressureGroup "pressureGroup"
		edittext UIpressure "pressure"
		edittext UIpressurePSI "pressurePSI"
		edittext UImaxPressure "maxPressure"
		edittext UImaxPressurePSI "maxPressurePSI"
		edittext UIbreakGroup "breakGroup"
		checkbox UIoptional "optional"
		dropdownlist UIgroundModel "groundModel" items: #("METAL", "PLASTIC", "RUBBER", "GLASS", "WOOD", "FOLIAGE", "CLOTH", "WATER", "ASPHALT", "ASPHALT_WET", "SLIPPERY", "ROCK", "DIRT_DUSTY", "DIRT", "SAND", "SANDY_ROAD", "MUD", "GRAVEL", "GRASS", "ICE", "SNOW", "FIRESMALL", "FIREMEDIUM", "FIRELARGE", "SMOKESMALLBLACK", "SMOKEMEDIUMBLACK", "STEAM", "RUMBLE_STRIP", "COBBLESTONE", "FOLIAGE_THIN")
		on UIgroundModel selected i do BNGgroundModel = UIgroundModel.items[i]
	)
)

-- rollout triangles attribute edit
rollout RL_TrianglesEdit "Triangles Attribute Edit" width:300 height:400
(
	label lbl_1 "Label"  visible:false
	edittext UIdragCoef "dragCoef" text:BNGdragCoefDef default:BNGdragCoefDef align:#right width:245
	edittext UILiftCoef "LiftCoef" text:BNGLiftCoefDef align:#right width:238
	edittext UIstallAngle "stallAngle" text:BNGstallAngleDef align:#right width:246
	dropdownList UItriangleType "triangleType"  items:#("NORMALTYPE", "NONCOLLIDABLE")
	edittext UIpressureGroup "pressureGroup" text:BNGpressureGroupDef align:#right width:271
	edittext UIbreakGroup "breakGroup" text:BNGbreakGroupDef align:#right width:256
	edittext UIpressure "Pressure" width:258 align:#right text:BNGtrPressureDef
	edittext UIpressurePSI "PressurePSI"  width:258 align:#right text:BNGtrPressurePSIDef
	edittext UImaxPressure "MaxPressure"  width:278 align:#right text:BNGtrMaxPressureDef
	edittext UImaxPressurePSI "MaxPressurePSI"  width:278 align:#right text:BNGtrMaxPressurePSIDef
	checkbox UIoptional "optional" checked:BNGoptionalDef offset:[74,0]
	dropdownList UIgroundModel "groundModel"  items:#("METAL", "PLASTIC", "RUBBER", "GLASS", "WOOD", "FOLIAGE", "CLOTH", "WATER", "ASPHALT", "ASPHALT_WET", "SLIPPERY", "ROCK", "DIRT_DUSTY", "DIRT", "SAND", "SANDY_ROAD", "MUD", "GRAVEL", "GRASS", "ICE", "SNOW", "FIRESMALL", "FIREMEDIUM", "FIRELARGE", "SMOKESMALLBLACK", "SMOKEMEDIUMBLACK", "STEAM", "RUMBLE_STRIP", "COBBLESTONE", "FOLIAGE_THIN")
	edittext UItriangleCollision "triangleCollision"  text:BNGtriangleCollisionDef
	label lbl_2 "Label"  visible:false
	button UIreset "Reset"  width:274

	on UIdragCoef changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGdragCoef = UIdragCoef.text
	on UILiftCoef changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGLiftCoef = UILiftCoef.text
	on UIstallAngle changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGstallAngle = UIstallAngle.text
	on UItriangleType selected i do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGtriangleType = UItriangleType.items[i]
	on UIpressureGroup changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGpressureGroup = UIpressureGroup.text
	on UIbreakGroup changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGbreakGroup = UIbreakGroup.text
	on UIoptional changed state do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGoptional = UIoptional.checked
	on UIgroundModel selected i do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGgroundModel = UIgroundModel.items[i]
	on UIpressure changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGpressure = UIpressure.text
	on UIpressurePSI changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGPressurePSI = UIpressurePSI.text
	on UImaxPressure changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGmaxPressure = UImaxPressure.text
	on UImaxPressurePSI changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGmaxPressurePSI = UImaxPressurePSI.text
	on UItriangleCollision changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdragCoef" == true do obj.BNGtriangleCollision = UItriangleCollision.text

	on UIreset pressed do
	(
		UIdragCoef.text = BNGdragCoefDef
		UILiftCoef.text = BNGLiftCoefDef
		UIstallAngle.text = BNGstallAngleDef
		UItriangleType.selection = 1
		UIpressureGroup.text = BNGpressureGroupDef
		UIbreakGroup.text = BNGbreakGroupDef
		UIoptional.state = BNGoptionalDef
		UIgroundModel.selection = 1
		UIpressure.text = BNGtrPressureDef
		UIpressurePSI.text = BNGtrPressurePSIDef
		UImaxPressure.text = BNGtrMaxPressureDef
		UImaxPressurePSI.text = BNGtrMaxPressurePSIDef
		UItriangleCollision.text = BNGtriangleCollisionDef

		for obj in getCurrentSelection() where ClassOf obj == Editable_mesh do
		(
			obj.BNGdragCoef = BNGdragCoefDef
			obj.BNGLiftCoef = BNGLiftCoefDef
			obj.BNGstallAngle = BNGstallAngleDef
			obj.BNGtriangleType = BNGtriangleTypeDef
			obj.BNGpressureGroup = BNGpressureGroupDef
			obj.BNGbreakGroup = BNGbreakGroupDef
			obj.BNGoptional = BNGoptionalDef
			obj.BNGgroundModel = BNGgroundModelDef
			obj.BNGpressure = BNGtrPressureDef
			obj.BNGpressurePSI = BNGtrPressurePSIDef
			obj.BNGmaxPressure = BNGtrMaxPressureDef
			obj.BNGmaxPressurePSI = BNGtrMaxPressurePSIDef
			obj.BNGtriangleCollision = BNGtriangleCollisionDef
		)
	)
)