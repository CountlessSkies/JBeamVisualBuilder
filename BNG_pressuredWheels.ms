global RL_PressuredWheels

if BNGwheelsEnable == undefined and wheels == undefined and wheelsprv == undefined do
(
    global BNGwheelsEnable = false
    global wheels = #(), wheelsprv = #()
)

struct BNGpressuredWheels
(
    wheels_name,
    hubGroup,
    group,
    node1,
    node2,
    nodeS,
    nodeCoupling,
    nodeArm,
    torqueCoupling,
    torqueArm,
    wheelDir,
    radius,
    hubRadius,
    wheelOffset,
    tireWidth,
    hubWidth,
    numRays,
    enableTireReinfBeams,
    enableTireLbeams,
    enableTireSideReinfBeams,
    enableTreadReinfBeams,
    hasTire
)

global myNode1 = undefined
global myNode2 = undefined
global myNodeS = undefined
global myNodeCoupling = undefined
global myNodeArm = undefined
global myTorqueCoupling = undefined
global myTorqueArm = undefined

global BNGhubNodeWeightDef = "25"
global BNGhubFrictionCoefDef = "1"
global BNGhubNodeMaterialDef = "options.nodeMaterial"
global BNGhubTreadBeamDef = "0"
global BNGhubPeripheryBeamDef = "0"
global BNGhubSideBeamDef = "0"
global BNGwheelTreadBeamDef = "0"
global BNGwheelTreadReinfBeamDef = "0"
global BNGwheelPeripheryBeamDef = "0"
global BNGwheelSideBeamDef = "0"
global BNGwheelSideBeamExpansionDef = "0"
global BNGwheelSideReinfBeamDef = "0"
global BNGwheelSideReinfBeamExpansionDef = "0"
global BNGwheelReinfBeamDef = "0"
global BNGtriangleCollisionDef = "0"

nodeWheelAttrib = attributes nodeWheel
(
    parameters main rollout:params
    (
		BNGhubNodeWeight type:#string ui:UIhubNodeWeight default:BNGhubNodeWeightDef
        BNGhubFrictionCoef type:#string ui:UIhubFrictionCoef default:BNGhubFrictionCoefDef
        BNGhubNodeMaterial type:#string ui:UIhubNodeMaterial default:BNGhubNodeMaterialDef
        dd type:#integer ui:UIhubNodeMaterial default:1
    )
    rollout params "Nodes Wheel"
    (
		edittext UIhubNodeWeight "hubNodeWeight"
        edittext UIhubFrictionCoef "hubFrictionCoef"
        dropdownlist UIhubNodeMaterial "hubNodeMaterial" items: #("options.nodeMaterial", "|NM_METAL", "|NM_PLASTIC", "|NM_RUBBER", "|NM_GLASS", "|NM_WOOD", "|NM_FOLIAGE", "|NM_CLOTH", "|NM_WATER", "|NM_ASPHALT", "|NM_ASPHALT_WET", "|NM_SLIPPERY", "|NM_ROCK", "|NM_DIRT_DUSTY", "|NM_DIRT", "|NM_SAND", "|NM_SANDY_ROAD", "|NM_MUD", "|NM_GRAVEL", "|NM_GRASS", "|NM_ICE", "|NM_SNOW", "|NM_FIRESMALL", "|NM_FIREMEDIUM", "|NM_FIRELARGE", "|NM_SMOKESMALLBLACK", "|NM_SMOKEMEDIUMBLACK", "|NM_STEAM", "|NM_RUMBLE_STRIP", "|NM_COBBLESTONE", "|NM_FOLIAGE_THIN")
		on UIhubNodeMaterial selected i do BNGhubNodeMaterial = UIhubNodeMaterial.items[i]
    )
)

beamWheelAttrib = attributes beamWheel
(
    parameters main rollout:params
    (
        BNGhubTreadBeam type:#string ui:UIhubTreadBeam default:BNGhubTreadBeamDef
        BNGhubPeripheryBeam type:#string ui:UIhubPeripheryBeam default:BNGhubPeripheryBeamDef
        BNGhubSideBeam type:#string ui:UIhubSideBeam default:BNGhubSideBeamDef
        BNGwheelTreadBeam type:#string ui:UIwheelTreadBeam default:BNGwheelTreadBeamDef
        BNGwheelTreadReinfBeam type:#string ui:UIwheelTreadReinfBeam default:BNGwheelTreadReinfBeamDef
        BNGwheelPeripheryBeam type:#string ui:UIwheelPeripheryBeam default:BNGwheelPeripheryBeamDef
        BNGwheelSideBeam type:#string ui:UIwheelSideBeam default:BNGwheelSideBeamDef
        BNGwheelSideBeamExpansion type:#string ui:UIwheelSideBeamExpansion default:BNGwheelSideBeamExpansionDef
        BNGwheelSideReinfBeam type:#string ui:UIwheelSideReinfBeam default:BNGwheelSideReinfBeamDef
        BNGwheelSideReinfBeamExpansion type:#string ui:UIwheelSideReinfBeamExpansion default:BNGwheelSideReinfBeamExpansionDef
        BNGwheelReinfBeam type:#string ui:UIwheelReinfBeam default:BNGwheelReinfBeamDef
    )
    rollout params "Beams Wheel"
    (
        edittext UIhubTreadBeam "hubTreadBeam"
        edittext UIhubPeripheryBeam "hubPeripheryBeam"
        edittext UIhubSideBeam "hubSideBeam"
        edittext UIwheelTreadBeam "wheelTreadBeam"
        edittext UIwheelTreadReinfBeam "wheelTreadReinfBeam"
        edittext UIwheelPeripheryBeam "wheelPeripheryBeam"
        edittext UIwheelSideBeam "wheelSideBeam"
        edittext UIwheelSideBeamExpansion "wheelSideBeamExpansion"
        edittext UIwheelSideReinfBeam "wheelSideReinfBeam"
        edittext UIwheelSideReinfBeamExpansion "wheelSideReinfBeamExpansion"
        edittext UIwheelReinfBeam "wheelReinfBeam"
    )
)

triangleWheelAttrib = attributes triangleWheel
(
    parameters main rollout:params
    (
        BNGtriangleCollision type:#string ui:UItriangleCollision default:BNGtriangleCollisionDef
    )
    rollout params "Triangles Wheel"
    (
        edittext UItriangleCollision "triangleCollision"
    )
)

rollout RL_PressuredWheels "pressuredWheels" width:300 height:640
(
	checkbox wheels_enable "Enable"  checked:true
	edittext wheels_name "name"  width:241 align:#right text:""
	edittext hubGroup "hubGroup"  width:262 align:#right text:""
	edittext group "group"  width:243 align:#right text:""
    edittext radius "radius"  width:244 align:#right text:""
	edittext hubRadius "hubRadius"  width:265 align:#right text:""
	edittext wheelOffset "wheelOffset"  text:""
	edittext tireWidth "tireWidth"  width:259 align:#right text:""
	edittext hubWidth "hubWidth"  width:261 align:#right text:""
	edittext numRays "numRays"  width:259 align:#right text:""
    fn dummy_filter obj = ClassOf obj == Dummy
	pickbutton node1 "node1"  across:3 width:88 align:#left filter:dummy_filter
	pickbutton node2 "node2"  width:88 align:#center filter:dummy_filter
	pickbutton nodeS "nodeS"  width:88 align:#right filter:dummy_filter
	pickbutton nodeArm "nodeArm"  across:3 width:88 align:#left enabled:true filter:dummy_filter
	pickbutton nodeCoupling "nodeCoupling"  width:88 align:#center filter:dummy_filter
	pickbutton disable "disable"  width:88 align:#right enabled:false visible:false filter:dummy_filter
	pickbutton torqueCoupling "torqueCoupling"  across:3 width:88 align:#left filter:dummy_filter
	pickbutton torqueArm "torqueArm"  width:88 align:#center filter:dummy_filter
	pickbutton disable_copy "disable"  width:88 align:#right enabled:false visible:false filter:dummy_filter
	radiobuttons wheelDir "wheelDir"  align:#left labels:#("1", "-1") state:1
	checkbox enableTireReinfBeams "enableTireReinfBeams"  checked:false
	checkbox enableTireLbeams "enableTireLbeams"  checked:false
	checkbox enableTireSideReinfBeams "enableTireSideReinfBeams"  checked:false
	checkbox enableTreadReinfBeams "enableTreadReinfBeams"  checked:false
    checkbox hasTire "hasTire"  checked:true
	button wheels_create "Create"  across:2 width:135 align:#left
	button wheels_reset "Reset"  width:135 align:#right
	listbox pressuredWheelsList "pressuredWheels"  items:#()

    on RL_PressuredWheels open do
	(
        wheels_enable.checked = BNGwheelsEnable
		pressuredWheelsList.items = wheelsprv


	)

    on wheels_enable changed state do if state == on then BNGwheelsEnable = true else BNGwheelsEnable = false

    on node1 picked obj do
    (
        node1.text = "node1: " + obj.name
        myNode1 = obj
    )

    on node1 rightClick do
    (
        node1.text = "node1"
        myNode1 = undefined
    )

    on node2 picked obj do
    (
        node2.text = "node2: " + obj.name
        myNode2 = obj
    )

    on node2 rightClick do
    (
        node2.text = "node2"
        myNode2 = undefined
    )

    on nodeS picked obj do
    (
        nodeS.text = "nodeS: " + obj.name
        myNodeS = obj
    )

    on nodeS rightClick do
    (
        nodeS.text = "nodeS"
        myNodeS = undefined
    )

    on nodeCoupling picked obj do
    (
        nodeCoupling.text = "nodeCoupling: " + obj.name
        myNodeCoupling = obj
    )

    on nodeCoupling rightClick do
    (
        nodeCoupling.text = "nodeCoupling"
        myNodeCoupling = undefined
    )

    on nodeArm picked obj do
    (
        nodeArm.text = "nodeArm: " + obj.name
        myNodeArm = obj
    )

    on nodeArm rightClick do
    (
        nodeArm.text = "nodeArm"
        myNodeArm = undefined
    )

    on torqueCoupling picked obj do
    (
        torqueCoupling.text = "torqueCoupling: " + obj.name
        myTorqueCoupling = obj
    )

    on torqueCoupling rightClick do
    (
        torqueCoupling.text = "torqueCoupling"
        myTorqueCoupling = undefined
    )

    on torqueArm picked obj do
    (
        torqueArm.text = "torqueArm" + obj.name
        myTorqueArm = obj
    )

    on torqueArm rightClick do
    (
        torqueArm.text = "torqueArm"
        myTorqueArm = undefined
    )

	on wheels_create pressed do
	(
        if myNode1 != undefined and myNode2 != undefined and myNodeS != undefined and myNodeArm != undefined do
        (
            wheel = BNGpressuredWheels wheels_name:wheels_name.text hubGroup:hubGroup.text group:group.text node1:myNode1.name node2:myNode2.name nodeS:myNodeS.name nodeArm:myNodeArm.name enableTireReinfBeams:enableTireReinfBeams.checked enableTireLbeams:enableTireLbeams.checked enableTireSideReinfBeams:enableTireSideReinfBeams.checked enableTreadReinfBeams:enableTreadReinfBeams.checked hasTire:hasTire.checked
            wheel.wheelDir = if wheelDir.state  == 1 then 1 else -1
            
            if myNodeCoupling != undefined do wheel.nodeCoupling = myNodeCoupling.name
            if myTorqueCoupling != undefined do wheel.torqueCoupling = myTorqueCoupling.name
            if myTorqueArm != undefined do wheel.torqueArm = myTorqueArm.name

            if radius.text != "" do wheel.radius = radius.text
            if hubRadius.text != "" do wheel.hubRadius = hubRadius.text
            if wheelOffset.text != "" do wheel.wheelOffset = wheelOffset.text
            if tireWidth.text != "" do wheel.tireWidth = tireWidth.text
            if hubWidth.text != "" do wheel.hubWidth = hubWidth.text
            if numRays.text != "" do wheel.numRays = numRays.text

            append wheelsprv (wheel.wheels_name)
            append wheels wheel
            pressuredWheelsList.items = wheelsprv
        )
	)

	on wheels_reset pressed do 
	(
		wheelsprv = #()
		wheels = #()
		pressuredWheelsList.items = #()
	)

	on pressuredWheelsList rightclick i do
	(
		deleteItem wheelsprv i
		deleteItem wheels i
		pressuredWheelsList.items = wheelsprv
	)
)