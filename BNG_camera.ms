global RL_Cameras

if (lay = layerManager.getLayerFromName "Cams") == undefined then
(
	global layerCams = layerManager.newLayer()
	layerCams.setname "Cams"
)

camExAttrib = attributes camEx
(
    parameters main rollout:params
    (
        Ex type:#integer default:1
        distance type:#string ui:UIdistance default:"0"
        distanceMin type:#string ui:UIdistanceMin default:"0"
        offsetX type:#string ui:UIoffsetX default:"0"
        offsetY type:#string ui:UIoffsetY default:"0"
        offsetZ type:#string ui:UIoffsetZ default:"0"
    )
    rollout params "cameraExternal"
    (
        edittext UIdistance "distance"
        edittext UIdistanceMin "distanceMin"
        edittext UIoffsetX "offsetX"
        edittext UIoffsetY "offsetY"
        edittext UIoffsetZ "offsetZ"
    )
)

camChAttrib = attributes camCh
(
    parameters main rollout:params
    (
        Ch type:#integer default:1
        distance type:#string ui:UIdistance default:"0"
        distanceMin type:#string ui:UIdistanceMin default:"0"
        offsetX type:#string ui:UIoffsetX default:"0"
        offsetY type:#string ui:UIoffsetY default:"0"
        offsetZ type:#string ui:UIoffsetZ default:"0"
    )
    rollout params "cameraExternal"
    (
        edittext UIdistance "distance"
        edittext UIdistanceMin "distanceMin"
        edittext UIoffsetX "offsetX"
        edittext UIoffsetY "offsetY"
        edittext UIoffsetZ "offsetZ"
    )
)

camInAttrib = attributes camIn
(
    parameters main rollout:params
    (
        type type:#string ui:UItype default:"dash"
        id1 type:#string ui:UIid1
        id2 type:#string ui:UIid2
        id3 type:#string ui:UIid3
        id4 type:#string ui:UIid4
        id5 type:#string ui:UIid5
        id6 type:#string ui:UIid6
        nodeWeight type:#string ui:UInodeWeight default:"0"
        selfCollision type:#boolean ui:UIrightHandCamera default:true
        collision type:#boolean ui:UIrightHandCamera default:true
        rightHandCamera type:#boolean ui:UIrightHandCamera default:false
        beamSpring type:#string ui:UIbeamSpring default:"0"
        beamDamp type:#string ui:UIbeamDamp default:"0"
        beamDeform type:#string ui:UIbeamDeform default:"0"
        beamStrength type:#string ui:UIbeamStrength default:"0"
        idRef type:#string ui:UIidRef
        idBack type:#string ui:UIidBack
        idUp type:#string ui:UIidUp
    )
    rollout params "cameraInternal"
    (
        edittext UItype "type"
        edittext UIid1 "id1"
        edittext UIid2 "id2"
        edittext UIid3 "id3"
        edittext UIid4 "id4"
        edittext UIid5 "id5"
        edittext UIid6 "id6"
        edittext UinodeWeight "nodeWeight"
        edittext UIselftCollision "selfCollision"
        edittext UIcollision "collision"
        edittext UIrightHandCamera "rightHandCamera"
        edittext UIbeamSpring "beamSpring"
        edittext UIbeamDamp "beamDamp"
        edittext UIbeamDeform "beamDeform"
        edittext UIbeamStrength "beamStrength"
        edittext UIidRef "idRef"
        edittext UIidBack "idBack"
        edittext UIidUp "idUp"
    )
)

try(destroydialog RL_Cameras)catch()
rollout RL_Cameras "Cameras" width:300 height:550
(
	checkbox camsEnable "Enable"  checked:true
	edittext distance "distance"  width:233 align:#right text:"0"
	edittext distanceMin "distanceMin"  width:249 align:#right text:"0"
	edittext defaultRotationX "defaultRotationX"  text:"0"
    edittext defaultRotationY "defaultRotationY"  text:"0"
    edittext defaultRotationZ "defaultRotationZ"  text:"0"
	edittext offsetX "offsetX"  width:228 align:#right text:"0"
	edittext offsetY "offsetY"  width:228 align:#right text:"0"
	edittext offsetZ "offsetZ"  width:228 align:#right text:"0"
	edittext type "type"  width:215 align:#right text:"dash"
    fn dummy_filter obj = ClassOf obj == Dummy
	pickbutton id1 "id1"  across:3 width:88 align:#left filter:dummy_filter
	pickbutton id2 "id2"  width:88 align:#center filter:dummy_filter
	pickbutton id3 "id3"  width:88 align:#right filter:dummy_filter
	pickbutton id4 "id4"  across:3 width:88 align:#left filter:dummy_filter
	pickbutton id5 "id5"  width:88 align:#center filter:dummy_filter
	pickbutton id6 "id6"  width:88 align:#right filter:dummy_filter
	edittext nodeWeight "nodeWeight"  width:251 align:#right text:"0"
	checkbox selfCollision "selfCollision"  checked:true
	checkbox collision "colision"  checked:true
	checkbox rightHandCamera "rightHandCamera"  checked:true
	edittext beamSpring "beamSpring"  width:249 align:#right text:"0"
	edittext beamDamp "beamDamp"  width:246 align:#right text:"0"
	edittext beamDeform "beamDeform"  width:254 align:#right text:"0"
	edittext beamStrength "beamStrength"  width:261 align:#right text:"0"
	label lbl_1 "Label"  visible:false
	button cameraExternal "cameraExternal"  width:200 align:#center
	button cameraChase "cameraChase"  width:200 align:#center
	button cameraInternal "cameraInternal"  width:200 align:#center

    on id1 picked obj do
    (
        id1.text = "id1: " + obj.name
    )
    on id1 rightClick do
    (
        id1.text = "id1"
        id1.object = undefined
    )
    on id2 picked obj do
    (
        id2.text = "id2: " + obj.name
    )
    on id2 rightClick do
    (
        id2.text = "id2"
        id2.object = undefined
    )
    on id3 picked obj do
    (
        id3.text = "id3: " + obj.name
    )
    on id3 rightClick do
    (
        id3.text = "id3"
        id3.object = undefined
    )
    on id4 picked obj do
    (
        id4.text = "id4: " + obj.name
    )
    on id4 rightClick do
    (
        id4.text = "id4"
        id4.object = undefined
    )
    on id5 picked obj do
    (
        id5.text = "id5: " + obj.name
    )
    on id5 rightClick do
    (
        id5.text = "id5"
        id5.object = undefined
    )
    on id6 picked obj do
    (
        id6.text = "id6: " + obj.name
    )
    on id6 rightClick do
    (
        id6.text = "id6"
        id6.object = undefined
    )

    on cameraExternal pressed do
    (
        cam = Freecamera()
        cam.rotation.x_rotation = 90
        cam.rotation.y_rotation = 0
        cam.rotation.z_rotation = 180
        WorldAlignPivot cam
        custAttributes.add cam camExAttrib
        cam.distance = distance.text
        cam.distanceMin = distanceMin.text
        cam.offsetX = offsetX.text
        cam.offsetY = offsetY.text
        cam.offsetZ = offsetZ.text
        layerCams.addNode cam
    )

    on cameraChase pressed do
    (
        cam = Freecamera()
        cam.rotation.x_rotation = 90
        cam.rotation.y_rotation = 0
        cam.rotation.z_rotation = 180
        WorldAlignPivot cam
        custAttributes.add cam camChAttrib
        cam.distance = distance.text
        cam.distanceMin = distanceMin.text
        if defaultRotationX.text as float != undefined do cam.transform = cam.transform * (rotateXmatrix (defaultRotationX.text as float))
        if defaultRotationY.text as float != undefined do cam.transform = cam.transform * (rotateYMatrix (defaultRotationY.text as float))
        if defaultRotationZ.text as float != undefined do cam.transform = cam.transform * (rotateZMatrix (defaultRotationZ.text as float))
        cam.offsetX = offsetX.text
        cam.offsetY = offsetY.text
        cam.offsetZ = offsetZ.text
        layerCams.addNode cam
    )

    /* on cameraInternal pressed do
    (

    ) */
)