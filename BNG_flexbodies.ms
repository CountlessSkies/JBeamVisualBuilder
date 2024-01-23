global RL_Flexbodies, RL_FlexbodiesEdit

-- create flexbodies attributes
flexBodiesAttrib = attributes flexBodiesAttributes
(
	parameters main rollout:params
	(
		BNGgroup type: #stringTab tabSizeVariable:true default:""
		BNGpos type:#point3 default:BNGposDef
		BNGrot type:#point3 default:BNGrotDef
		BNGscale type:#point3 default:BNGscaleDef
		BNGdeformGroup type: #string ui:UIdeformGroup default:BNGdeformGroupDef
		BNGdeformMaterialBase type: #string ui:UIdeformMaterialBase default:BNGdeformMaterialBaseDef
		BNGdeformMaterialDamaged type: #string ui:UIdeformMaterialDamaged default:BNGdeformMaterialDamagedDef
		BNGdeformSound type: #string ui:UIdeformSound default:BNGdeformSoundDef
		BNGdeformVolume type: #string ui:UIdeformVolume default:BNGdeformVolumeDef
		BNGdisableMeshBreaking type: #boolean ui:UIdisableMeshBreaking default:BNGdisableMeshBreakingDef
	)
	rollout params "Flexbodies Attributes"
	(
		edittext UIdeformGroup "deformGroup" text:""
		edittext UIdeformMaterialBase "deformMaterialBase" text:""
		edittext UIdeformMaterialDamaged "deformMaterialDamaged" text:""
		edittext UIdeformSound "deformSound" text:""
		edittext UIdeformVolume "deformVolume" text:""
		checkbox UIdisableMeshBreaking "disableMeshBreaking"
	)
)

-- rollout flexbodies attributes edit
rollout RL_FlexbodiesEdit "Flexbodies Attribute Edit" width:300 height:500
(
	label lbl_3 "Label"  visible:false
	edittext UIgroup "group"  text:""
	listbox UIgroupList ""  items:#()
	button UIset "Set"  across:3 width:88 align:#left
	button UIadd "Add"  width:88 align:#center
	button UIresetGroup "Reset"  width:88 align:#right
	label lbl_1 "Label"  visible:false
	spinner UIposX "posX"  across:3 align:#left type:#float range:[0,100,1]
	spinner UIposY "posY"  align:#center type:#float range:[0,100,1]
	spinner UIposZ "posZ"  align:#right type:#float range:[0,100,1]
	spinner UIrotX "rotX"  across:3 offset:[3,0] align:#left type:#float range:[0,100,1]
	spinner UIrotY "rotY"  offset:[1,0] align:#center type:#float range:[0,100,1]
	spinner UIrotZ "rotZ"  align:#right type:#float range:[0,100,1]
	spinner UIscaleX "sclX"  across:3 offset:[5,0] align:#left type:#float range:[0,100,1]
	spinner UIscaleY "scaleY"  offset:[-4,0] align:#center type:#float range:[0,100,1]
	spinner UIscaleZ "scaleZ"  align:#right type:#float range:[0,100,1]
	label lbl_4 "Label"  visible:false
	edittext UIdeformGroup "deformGroup"  width:221 align:#right text:""
	edittext UIdeformMaterialBase "deformMaterialBase"  width:252 align:#right text:""
	edittext UIdeformMaterialDamaged "deformMaterialDamaged"  text:""
	edittext UIdeformSound "deformSound"  width:220 align:#right text:""
	edittext UIdeformVolume "deformVolume"  width:224 align:#right text:""
	checkbox UIdisableMeshBreaking "disableMeshBreaking" checked:false
	label lbl_2 "Label"  visible:false
	button UIreset "Reset"  width:274

	on UIgroup entered txt do if txt != "" do
	(
		append gr UIgroup.text
		gr = sort (makeUniqueArray gr)
		UIgroupList.items = gr
	)
	on UIgroupList rightclick i do
	(
		gr = UIgroupList.items
		deleteItem gr i
		UIgroupList.items = gr
	)
	on UIgroupList doubleClicked i do
	(
		UIgroupList.items = #()
		gr = #()
	)
	on UIset pressed do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGgroup = gr
	on UIadd pressed do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGgroup = sort(makeUniqueArray((join (obj.BNGgroup as array) gr)))
	on UIresetGroup pressed do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGgroup = #()
	on UIposX changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGpos.x = UIposX.value
	on UIposY changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGpos.x = UIposY.value
	on UIposZ changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGpos.z = UIposZ.value
	on UIrotX changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGrot.x = UIrotX.value
	on UIrotY changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGrot.y = UIrotY.value
	on UIrotZ changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGrot.z = UIrotZ.value
	on UIscaleX changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGscale.x = UIscaleX.value
	on UIscaleY changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGscale.y = UIscaleY.value
	on UIscaleZ changed v do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGscale.z = UIscaleZ.value
	on UIdeformGroup changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdeformGroup = UIdeformGroup.text
	on UIdeformMaterialBase changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdeformMaterialBase = UIdeformMaterialBase.text
	on UIdeformMaterialDamaged changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdeformMaterialDamaged = UIdeformMaterialDamaged.text
	on UIdeformSound changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdeformSound = UIdeformSound.text
	on UIdeformVolume changed txt do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdeformVolume = UIdeformVolume.text
	on UIdisableMeshBreaking changed state do for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do obj.BNGdisableMeshBreaking = UIdisableMeshBreaking.checked
	on UIreset pressed do
	(
		UIgroup.text = ""
		UIgroupList.items = #()
		gr = #()
		UIposX.value = 0
		UIposY.value = 0
		UIposZ.value = 0
		UIrotX.value = 0
		UIrotY.value = 0
		UIrotZ.value = 0
		UIscaleX.value = 0
		UIscaleY.value = 0
		UIscaleZ.value = 0
		UIdeformGroup.text = BNGdeformGroupDef
		UIdeformMaterialBase.text = BNGdeformMaterialBaseDef
		UIdeformMaterialDamaged.text = BNGdeformMaterialDamagedDef
		UIdeformSound.text = BNGdeformSoundDef
		UIdeformVolume.text = BNGdeformVolumeDef
		UIdisableMeshBreaking.checked = BNGdisableMeshBreakingDef

		for obj in getCurrentSelection() where isProperty obj "BNGdeformMaterialBase" == true do
		(
			obj.BNGgroup = BNGgroupDef
			obj.BNGpos = BNGposDef
			obj.BNGrot = BNGrotDef
			obj.BNGscale = BNGscaleDef
			obj.BNGdeformGroup = BNGdeformGroupDef
			obj.BNGdeformMaterialBase = BNGdeformMaterialBaseDef
			obj.BNGdeformMaterialDamaged = BNGdeformMaterialDamagedDef
			obj.BNGdeformSound= BNGdeformSoundDef
			obj.BNGdeformVolume = BNGdeformVolumeDef
			obj.BNGdisableMeshBreaking = BNGdisableMeshBreakingDef
		)
	)
)