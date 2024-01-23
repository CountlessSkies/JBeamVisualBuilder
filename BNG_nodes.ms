global RL_Nodes, RL_NodesEdit

/* struct BNGelectrics (lowhighbeam, reverse, signal_L, signal_R)
struct BNGinputs (brake, parkingbreak) */

-- declare node attributes default text
global BNGnodeWeightDef = "25"
global BNGcollisionDef = true
global BNGselfCollisionDef = false
global BNGgroupDef = #()
global BNGfrictionCoefDef = "1"
global BNGnodeMaterialDef = "options.nodeMaterial"
global BNGfixedDef = false
global BNGcouplerStrengthDef = "FLT MAX"
global BNGcouplerTagDef = ""
global BNGcouplerRadiusDef = "0"
/* global BNGcouplerTagDef = #() */
global BNGbreakGroupDef = ""
global BNGcouplerLockDef = false
global BNGimportElectricsDef = #()
global BNGimportInputsDef = #()
global BNGsurfaceCoefDef = "0.1"
global BNGvolumeCoefDef = "0.1" -- duplicated attribute 1
global BNGnoLoadCoefDef = "1"
global BNGfullLoadCoefDef = "0"
global BNGstribeckExponentDef = "1.75"
global BNGstribeckVelMult = "1.0"
global BNGsoftnessCoefDef = "0.5"
global BNGtreadCoefDef = "0.5"
global BNGtagCoef = ""
global BNGloadSensitivitySlopeDef = "0"
global BNGpairedNodeDef = ""

-- create node attributes
nodeAttrib = attributes node
(
    parameters main rollout:params
    (
		BNGnodeWeight type: #string ui:UInodeWeight default:BNGnodeWeightDef
        BNGcollision type: #boolean ui:UIcollision default:BNGcollisionDef
        BNGselfCollision type: #boolean ui:UIselfCollision
        BNGgroup type: #stringTab tabSizeVariable:true
        BNGfrictionCoef type: #string ui:UIfrictionCoef default:BNGfrictionCoefDef
        BNGnodeMaterial type: #string ui:UInodeMaterial default:BNGnodeMaterialDef
		dd type: #integer ui:UInodeMaterial default:1
        BNGfixed type: #boolean ui:UIfixed
		BNGcouplerStrength type:#string ui:UIcouplerStrength default:BNGcouplerStrengthDef
		BNGcouplerTag type:#string ui:UIcouplerTag default:BNGcouplerTagDef
		BNGcouplerRadius type:#string ui:UIcouplerRadius default:BNGcouplerRadiusDef
		BNGbreakGroup type: #string ui:UIbreakGroup default:BNGbreakGroupDef
		BNGcouplerLock type: #boolean ui:UIcouplerLock
		BNGimportElectrics type: #stringTab tabSizeVariable:true
		BNGimportInputs type: #stringTab tabSizeVariable:true
		BNGsurfaceCoef type: #string ui:UIsurfaceCoef default:BNGsurfaceCoefDef
		BNGvolumeCoef type: #string ui:UIvolumeCoef default:BNGvolumeCoefDef
    )
    rollout params "Nodes"
    (
		edittext UInodeWeight "nodeWeight"
        checkbox UIcollision "collision"
        checkbox UIselfCollision "selfCollision"
        edittext UIfrictionCoef "frictionCoef"
        dropdownlist UInodeMaterial "nodeMaterial" items: #("options.nodeMaterial", "|NM_METAL", "|NM_PLASTIC", "|NM_RUBBER", "|NM_GLASS", "|NM_WOOD", "|NM_FOLIAGE", "|NM_CLOTH", "|NM_WATER", "|NM_ASPHALT", "|NM_ASPHALT_WET", "|NM_SLIPPERY", "|NM_ROCK", "|NM_DIRT_DUSTY", "|NM_DIRT", "|NM_SAND", "|NM_SANDY_ROAD", "|NM_MUD", "|NM_GRAVEL", "|NM_GRASS", "|NM_ICE", "|NM_SNOW", "|NM_FIRESMALL", "|NM_FIREMEDIUM", "|NM_FIRELARGE", "|NM_SMOKESMALLBLACK", "|NM_SMOKEMEDIUMBLACK", "|NM_STEAM", "|NM_RUMBLE_STRIP", "|NM_COBBLESTONE", "|NM_FOLIAGE_THIN")
		on UInodeMaterial selected i do BNGnodeMaterial = UInodeMaterial.items[i]
        checkbox UIfixed "fixed"
		edittext UIcouplerStrength "couplerStrength"
		edittext UIcouplerTag "couplerTag"
		edittext UIcouplerRadius "couplerRadius"
		edittext UIbreakGroup "breakGroup"
		checkbox UIcouplerLock "couplerLock"
		edittext UIsurfaceCoef "surfaceCoef"
		edittext UIvolumeCoef "volumeCoef"
    )
)

-- rollout node attribute edit
rollout RL_NodesEdit "Nodes Attribute Edit" width:300 height:930
(
	label lbl_4 "Label"  visible:false
	edittext UInodeWeight "nodeWeight" width:251 align:#right text:BNGnodeWeightDef
	checkbox UIcollision "collision"  align:#left checked:BNGcollisionDef
	checkbox UIselfCollision "selfCollision"  align:#left checked:BNGselfCollisionDef
	edittext UIgroup "group"  text:"" align:#right width:222
	listbox UIgroupList ""  height:8 items:#()
	button UIset "Set"  across:3 width:88 align:#left
	button UIadd "Add"  width:88 align:#center
	button UIresetGroup "Reset"  width:88 align:#left
	edittext UIfrictionCoef "frictionCoef" width:249 align:#right text:BNGfrictionCoefDef
	dropdownList UInodeMaterial "nodeMaterial"  items:#("options.nodeMaterial", "|NM_METAL", "|NM_PLASTIC", "|NM_RUBBER", "|NM_GLASS", "|NM_WOOD", "|NM_FOLIAGE", "|NM_CLOTH", "|NM_WATER", "|NM_ASPHALT", "|NM_ASPHALT_WET", "|NM_SLIPPERY", "|NM_ROCK", "|NM_DIRT_DUSTY", "|NM_DIRT", "|NM_SAND", "|NM_SANDY_ROAD", "|NM_MUD", "|NM_GRAVEL", "|NM_GRASS", "|NM_ICE", "|NM_SNOW", "|NM_FIRESMALL", "|NM_FIREMEDIUM", "|NM_FIRELARGE", "|NM_SMOKESMALLBLACK", "|NM_SMOKEMEDIUMBLACK", "|NM_STEAM", "|NM_RUMBLE_STRIP", "|NM_COBBLESTONE", "|NM_FOLIAGE_THIN")
	checkbox UIfixed "fixed"  align:#left checked:BNGfixedDef
	edittext UIcouplerStrength "couplerStrength" width:270 align:#right text:BNGcouplerStrengthDef
	edittext UIcouplerTag "couplerTag" width:246 align:#right text:BNGcouplerTagDef
	edittext UIcouplerRadius "couplerRadius" width:260 align:#right text:BNGcouplerRadiusDef
	edittext UIbreakGroup "breakGroup" width:249 align:#right text:BNGbreakGroupDef
	checkbox UIcouplerLock "couplerLock"  align:#left checked:BNGcouplerLockDef
	edittext UIimportElectrics "importElectrics" width:262 align:#right text:""
	listbox UIimportElectricsList ""  height:8 items:#()
	button UIset2 "Set"  across:3 width:88 align:#left
	button UIadd2 "Add"  width:88 align:#center
	button UIreset2 "Reset"  width:88 align:#left
	edittext UIimportInputs "importInputs" width:254 align:#right text:""
	listbox UIimportInputsList ""  height:8 items:#()
	button UIset3 "Set"  across:3 width:88 align:#left
	button UIadd3 "Add"  width:88 align:#center
	button UIreset3 "Reset"  width:88 align:#left
	edittext UIsurfaceCoef "surfaceCoef"  text:BNGsurfaceCoefDef width:252 align:#right
	edittext UIvolumeCoef "volumeCoef"  text:BNGvolumeCoefDef width:250 align:#right
	edittext UIhubNodeWeight "hubNodeWeight" text:BNGhubNodeWeightDef width:270 align:#right
	edittext UIhubFrictionCoef "hubFrictionCoef" text:BNGhubFrictionCoefDef width:269 align:#right
	edittext UIhubNodeMaterial "hubNodeMaterial" text:BNGhubNodeMaterialDef
	label lbl_5 "Label"  visible:false
	button UIreset "Reset"  width:274

	on UInodeWeight changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGnodeWeight = UInodeweight.text
	on UIcollision changed state do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGcollision = UIcollision.checked
	on UIselfCollision changed state do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGselfCollision = UIselfCollision.checked
	on UIgroup entered txt do if txt != "" do
	(
		append gr UIgroup.text
		gr = sort (makeUniqueArray gr)
		UIgroupList.items = gr
	)
	on UIgroupList leftclick i do
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
	on UIimportElectrics entered txt do if txt != "" do
	(
		append ie UIimportElectrics.text
		ie = sort (makeUniqueArray ie)
		UIimportElectricsList.items = ie
	)
	on UIimportElectricsList leftclick i do
	(
		ie = UIimportElectricsList.items
		deleteItem ie i
		UIimportElectricsList.items = ie
	)
	on UIimportElectricsList doubleClicked i do
	(
		UIimportElectricsList.items = #()
		ie = #()
	)
	on UIimportInputs entered txt do if txt != "" do
	(
		append ii UIimportInputs.text
		ii = sort (makeUniqueArray ii)
		UIimportInputsList.items = ii
	)
	on UIimportInputsList leftclick i do
	(
		ii = UIimportInputsList.items
		deleteItem ie i
		UIimportInputsList.items = ii
	)
	on UIimportInputsList doubleClicked i do
	(
		UIimportInputsList.items = #()
		ii = #()
	)
	on UIset pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGgroup = gr
	on UIadd pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGgroup = sort(makeUniqueArray((join (obj.BNGgroup as array) gr)))
	on UIresetGroup pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGgroup = #()
	on UIset2 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportElectrics = ie
	on UIadd2 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportElectrics = sort(makeUniqueArray((join (obj.BNGimportElectrics as array) ie)))
	on UIreset2 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportElectrics = #()
	on UIset3 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportInputs = ii
	on UIadd3 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportInputs = sort(makeUniqueArray((join (obj.BNGimportInputs as array) ii)))
	on UIreset3 pressed do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGimportInputs = #()
	on RL_NodesEdit close do (gr = #())
	on UIfrictionCoef changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGfrictionCoef = UIfrictionCoef.text
	on UInodeMaterial selected i do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGnodeMaterial = UInodeMaterial.items[i]
	on UIfixed changed state do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGfixed = UIfixed.checked
	on UIcouplerStrength changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGcouplerStrength = UIcouplerStrength.text
	on UIcouplerTag changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGcouplerTag = UIcouplerTag.text
	on UIcouplerRadius changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGcouplerRadius = UIcouplerRadius.text
	on UIbreakGroup changed txt do if txt != "" do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGbreakGroup = UIbreakGroup.text
	on UIcouplerLock changed state do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGcouplerLock = UIcouplerLock.checked
	on UIsurfaceCoef changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGsurfaceCoef = UIsurfaceCoef.text
	on UIvolumeCoef changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGvolumeCoef = UIvolumeCoef.text
	on UIhubNodeWeight changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGhubNodeWeight = UIhubNodeWeight.text
	on UIhubFrictionCoef changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.BNGhubFrictionCoef = UIhubFrictionCoef.text
	on UIhubNodeMaterial changed txt do for obj in getCurrentSelection() where ClassOf obj == Dummy do obj.hubNodeMaterial = UIhubNodeMaterial.text
	on UIreset pressed do
	(
		UInodeweight.text = BNGnodeWeightDef
		UIcollision.state = BNGcollisionDef
		UIselfCollision.state = BNGselfCollisionDef
		UIgroup.text = ""
		UIgroupList.items = #()
		gr = #()
		UIfrictionCoef.text = BNGfrictionCoefDef
		UInodeMaterial.selection = 1
		UIfixed.state = BNGfixedDef
		UIcouplerStrength.text = BNGcouplerStrengthDef
		UIcouplerTag.text = BNGcouplerTagDef
		UIcouplerRadius.text = BNGcouplerRadiusDef
		UIbreakGroup.text = ""
		UIcouplerLock.state = BNGcouplerLockDef
		UIimportElectrics.text = ""
		UIimportElectricsList.items = #()
		ie = #()
		UIimportInputs.text = ""
		UIimportInputsList.items = #()
		ii = #()
		UIsurfaceCoef.text = BNGsurfaceCoefDef
		UIvolumeCoef.text = BNGvolumeCoefDef
		UIhubNodeWeight.text = BNGhubNodeWeightDef
		UIhubFrictionCoef.text = BNGhubFrictionCoefDef
		UIhubNodeMaterial.text = BNGhubNodeMaterialDef

		for obj in getCurrentSelection() where ClassOf obj == Dummy do
		(
			obj.BNGnodeWeight = BNGnodeWeightDef
			obj.BNGcollision = BNGcollisionDef
			obj.BNGselfCollision = BNGselfCollisionDef
			obj.BNGgroup = BNGgroupDef
			obj.BNGfrictionCoef = BNGfrictionCoefDef
			obj.BNGnodeMaterial = BNGnodeMaterialDef
			obj.BNGfixed = BNGfixedDef
			obj.BNGcouplerStrength = BNGcouplerStrengthDef
			obj.BNGcouplerTag = BNGcouplerTagDef
			obj.BNGcouplerRadius = BNGcouplerRadiusDef
			obj.BNGbreakGroup = BNGbreakGroupDef
			obj.BNGcouplerLock = BNGcouplerLockDef
			obj.BNGimportElectrics = BNGimportElectricsDef
			obj.BNGimportInputs = BNGimportInputsDef
			obj.BNGsurfaceCoef = BNGsurfaceCoefDef
			obj.BNGvolumeCoef = BNGvolumeCoefDef
			obj.BNGhubNodeWeight = BNGhubNodeWeightDef
			obj.BNGhubFrictionCoef = BNGhubFrictionCoefDef
			obj.BNGhubNodeMaterial = BNGhubNodeMaterialDef
		)
	)
)