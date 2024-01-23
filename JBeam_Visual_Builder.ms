-- declare
-- check if layer Nodes, Beams, Triangles, Flexbodies, Hydros exist or not. If not create them
if (lay = layerManager.getLayerFromName "Nodes") == undefined then
(
	global layerNodes = layerManager.newLayer()
	layerNodes.setname "Nodes"
)
else global layerNodes = layerManager.getLayerFromName "Nodes"

if (lay = layerManager.getLayerFromName "Beams") == undefined then
(
	global layerBeams = layerManager.newLayer()
	layerBeams.setname "Beams"
)
else global layerBeams = layerManager.getLayerFromName "Beams"

if (lay = layerManager.getLayerFromName "Triangles") == undefined then
(
	global layerTriangles = layerManager.newLayer()
	layerTriangles.setname "Triangles"
	layerTriangles.visibility = 0.5
)
else global layerTriangles = layerManager.getLayerFromName "Triangles"

if (lay = layerManager.getLayerFromName "Flexbodies") == undefined then
(
	global layerFlexbodies = layerManager.newLayer()
	layerFlexbodies.setname "Flexbodies"
)
else global layerFlexbodies = layerManager.getLayerFromName "Flexbodies"

if (lay = layerManager.getLayerFromName "Hydros") == undefined then
(
	global layerHydros = layerManager.newLayer()
	layerHydros.setname "Hydros"
)
else global layerHydros = layerManager.getLayerFromName "Hydros"

/* if (lay = layerManager.getLayerFromName "Slots") == undefined then
(
	global layerSlots = layerManager.newLayer()
	layerSlots.setname "Slots"
	layerSlots.on = false
	layerSlots.isfrozen = true
)
else global layerSlots = layerManager.getLayerFromName "Hydros" */

-- declare rollouts
global RL_Info
global RL_Others
global RL_File
global RL_Preview
global rlf, rlf2, rlf3

global myNodeName
global rlfMoved = [0,0,0]
global BNGpart = "porsche_main"
global BNGauthors = "Sintel"
global BNGname = "Porsche"
global BNGslotType = "main"
global ssBuffer = stringStream "", strmFile = stringStream ""
global myOne = undefined
global myRef = undefined, myBack = undefined, myLeft = undefined, myUp = undefined, myLCorner = undefined, myRCorner = undefined
global gr = #(), ie = #(), ii = #()
global myFilePath = ""/* , myFileName = "" */
global orderByVerts = #()

-- declare flexbodies attributes default value
global BNGposDef = [0,0,0]
global BNGrotDef = [0,0,0]
global BNGscaleDef = [0,0,0]
global BNGdeformMaterialBaseDef = ""
global BNGdeformMaterialDamagedDef = ""
global BNGdeformSoundDef = ""
global BNGdeformVolumeDef = ""
global BNGdisableMeshBreakingDef = false

-- viewport display
fileIn "BNG_visualize.ms"

-- create rollout floater
rlf = newRolloutFloater "JBeam Visual Builder v0.1" 300 800

-- pressureWheels
fileIn "BNG_pressuredWheels.ms"

-- powertrain
fileIn "BNG_powertrain.ms"

-- nodes attributes
fileIn "BNG_nodes.ms"

-- beams attributes
fileIn "BNG_beams.ms"

-- triangles attributes
fileIn "BNG_triangles.ms"

-- flexbodies attributes
fileIn "BNG_flexbodies.ms"

-- slots
fileIn "BNG_slots.ms"

-- variables
fileIn "BNG_variables.ms"

-- glowmaps
fileIn "BNG_glowMaps.ms"

-- materials
fileIn "BNG_materials.ms"

-- cameras
fileIn "BNG_camera.ms"

/* fn clearDeadNodes array = 
(
	if array.count != 0 do (for i = array.count to 1 by -1 where not isValidNode array[i] do deleteItem array i)
	array
) */

-- JBeam function
fileIn "BNG_jbeamFunction.ms"

-- create rollout creating node
rollout RL_Nodes "Nodes" width:300 height:500
(
	label lbl3 "prefix" across:3 align:#left offset:[-0,2]
	edittext node_name_prefix "" width:130 offset:[-53,2] labelOnTop:true text:"n" bold:false readOnly:false
	button create_node "Create NODE"  width:90 align:#right
	button create_node_from_edtpl "AUTO STRUCTURE" across:2 width:155 align:#left
	spinner dummy_size "Nodes size" /* type:#integer */ width:80 offset:[0,3] align:#right range:[1,100,6]
	label lbl_1 "refNodes"  align:#left
	fn dummy_filter obj = ClassOf obj == Dummy
	pickbutton UIref "ref"  across:3 width:85 align:#left filter:dummy_filter
	pickbutton UIback "back"  across:3 width:85 align:#center filter:dummy_filter
	pickbutton UIleft "left"  width:85 align:#right filter:dummy_filter
	pickbutton UIup "up"  across:3 width:85 align:#left filter:dummy_filter
	pickbutton UIlCorner "L-Corner"  width:85 align:#center filter:dummy_filter
	pickbutton UIrCorner "R-Corner"  width:85 align:#right filter:dummy_filter
	button clear_select "Clear"  width:155 align:#left across:2
	checkbutton node_attrib_edt "NODEs Edit" checked:false width:100 align:#right

	-- create function uniquify nodes name
	fn uniquifyNodeName =
	(
		layerNodes.nodes &theNodes
		theNewNode = #()
		theSuffix = #()
		initialSuffix = 1

		for i = 1 to theNodes.count do
		(
			if findString theNodes[i].name node_name_prefix.text == 1 do append theNewNode theNodes[i]
		)

		free theNodes

		for i = 1 to theNewNode.count do
		(
			b = replace theNewNode[i].name 1 node_name_prefix.text.count ""
			append theSuffix (b as integer)
		)

		free theNewNode

		sort theSuffix

		while findItem theSuffix initialSuffix != 0 do initialSuffix += 1

		myNodeName = node_name_prefix.text + (initialSuffix as string)
	)

	on create_node pressed do
	(
		uniquifyNodeName()

		myNode = Dummy pos:[0,0,0]  boxsize:[0.06, 0.06, 0.06]	
		myNode.name = myNodeName

		custAttributes.add myNode nodeAttrib -- tạo Node Attributes cho Dummy
		custAttributes.add myNode nodeWheelAttrib -- tạo Node Attributes cho Dummy

		layerNodes.addNode myNode -- add Dummy vào layer Nodes
	)

	on create_node_from_edtpl pressed do
	(
		edtpl = getCurrentSelection()

		for i = 1 to edtpl.count where ClassOf edtpl[i] == Editable_Poly do
		(
			poslist = polyop.getVerts edtpl[i] #{1..edtpl[i].numVerts} node:edtpl[i]
			for j = 1 to edtpl[i].numVerts do
			(
				uniquifyNodeName()

				myNode = Dummy pos:poslist[j] boxsize:[0.06, 0.06, 0.06]
				myNode.name = myNodeName

				custAttributes.add myNode nodeAttrib -- tạo Node Attributes cho Dummy
				custAttributes.add myNode nodeWheelAttrib -- tạo Node Attributes cho Dummy

				layerNodes.addNode myNode -- add Dummy vào layer Nodes

				append orderByVerts myNode
			)
		)

		undo off
		disableSceneRedraw()
		suspendEditing alwaysSuspend:true
		for i = 1 to edtpl.count where ClassOf edtpl[i] == Editable_Poly do
		(
			for j = 1 to edtpl[i].numFaces do
			(
				vertlist = polyop.getFaceVerts edtpl[i] j
				if vertlist.count == 4 do
				(
					lineFrom2Point orderByVerts[vertlist[1]] orderByVerts[vertlist[3]]
					lineFrom2Point orderByVerts[vertlist[2]] orderByVerts[vertlist[4]]
				)
			)
			for j = 1 to polyop.getNumEdges edtpl[i] do
			(
				vertlist = polyop.getEdgeVerts edtpl[i] j
				lineFrom2Point orderByVerts[vertlist[1]] orderByVerts[vertlist[2]]
			)

			for j = 1 to edtpl[i].numFaces do
			(
				vertlist = polyop.getFaceVerts edtpl[i] j
				if vertlist.count == 4 do
				(
					triangleFrom3Point orderByVerts[vertlist[1]] orderByVerts[vertlist[2]] orderByVerts[vertlist[4]]
					triangleFrom3Point orderByVerts[vertlist[2]] orderByVerts[vertlist[3]] orderByVerts[vertlist[4]]
				)
				if vertlist.count == 3 do
				(
					triangleFrom3Point orderByVerts[vertlist[1]] orderByVerts[vertlist[2]] orderByVerts[vertlist[3]]
				)
			)
		)
		resumeEditing()
		enableSceneRedraw()
		undo on

		free orderByVerts
	)

	on node_attrib_edt changed state do if state == on then
	(
		rlf3 = newRolloutFloater "Nodes Attributes Edit" 313 850
		rlf3.pos = rlf.pos + [310,0]
		addRollout RL_NodesEdit rlf3
	)
	else closeRolloutFloater rlf3

	on dummy_size changed v do for obj in objects do if ClassOf obj == Dummy do obj.boxsize = [dummy_size.value * 0.01, dummy_size.value * 0.01, dummy_size.value * 0.01]

	on UIref picked obj do
	(
		UIref.text = "ref: " + obj.name
		myRef = UIref.object
	)

	on UIref rightClick do
	(
		UIref.text = "ref"
		myRef = undefined
	)

	on UIback picked obj do
	(
		UIback.text = "back: " + obj.name
		myBack = UIback.object
	)

	on UIback rightClick do
	(
		UIback.text = "back"
		myBack = undefined
	)

	on UIleft picked obj do
	(
		UIleft.text = "left: " + obj.name
		myLeft = UIleft.object
	)

	on UIleft rightClick do
	(
		UIleft.text = "left"
		myLeft = undefined
	)

	on UIup picked obj do
	(
		UIup.text = "up: " + obj.name
		myUp = UIup.object
	)

	on UIup rightClick do
	(
		UIup.text ="up"
		myUp = undefined
	)

	on UIlCorner picked obj do
	(
		UIlCorner.text = "lCorner: " + obj.name
		myLCorner = UIlCorner.object
	)

	on UIlCorner rightClick do
	(
		UIlCorner.text = "L-Corner"
		myLCorner = undefined
	)

	on UIrCorner picked obj do
	(
		UIrCorner.text = "rCorner: " + obj.name
		myRCorner = UIrCorner.object
	)

	on UIrCorner rightClick do
	(
		UIrCorner.text = "R-Corner"
		myRCorner = undefined
	)

	on clear_select pressed do
	(
		myRef = undefined
		UIref.text = "ref"
		myBack = undefined
		UIback.text = "back"
		myLeft = undefined
		UIleft.text = "left"
		myUp = undefined
		UIup.text = "up"
		myLCorner = undefined
		UIlCorner.text = "L-Corner"
		myRCorner = undefined
		UIrCorner.text = "R-Corner"
	)

	on RL_Nodes close do
	(
		DestroyDialog RL_Preview 
		DestroyDialog RL_NodesEdit
		if ClassOf rlf2 == RolloutFloater do closeRolloutFloater rlf2
		if ClassOf rlf3 == RolloutFloater do closeRolloutFloater rlf3
		DestroyDialog RL_TrianglesEdit
		DestroyDialog RL_FlexbodiesEdit
		DestroyDialog RL_SlotsEdit
		DestroyDialog RL_Visualize
		DestroyDialog RL_HydrosEdit
		DestroyDialog RL_Variables
		DestroyDialog RL_GlowMaps
		DestroyDialog RL_Cameras
		DestroyDialog RL_Materials
		DestroyDialog RL_PressuredWheels
	)
)

-- tạo rollout tạo Beams
rollout RL_Beams "Beams" width:300 height:500
(
	button creat_beam_selection "BEAMs from NODEs"  width:155 across:2 align:#left
	checkbutton beam_attrib_edt "BEAMs Edit" checked:false width:100 align:#right
	fn dummy_filter obj = ClassOf obj == Dummy
	pickbutton UIone "ONE" width:70 across:3 align:#left filter:dummy_filter
	button UItoAllSelected "To ALL SELECTED" width:140 offset:[-5,0]
	colorpicker beams_color color:(color 223 146 146) align:#right
	button make_hydro "BEAMs to HYDROs" width:155 across:2 align:#left
	checkbutton hydro_attrib_edt "HYDROs Edit" width:100 align:#right checked:false

	on creat_beam_selection pressed do
	(
		myNodes = getCurrentSelection()

		i = 1
		while i <= myNodes.count do
		(
			if ClassOf myNodes[i] != Dummy then deleteItem myNodes i else i = i + 1
		)

		for i = 1 to myNodes.count - 1 do
		(
			for j = i to myNodes.count - 1 do
			(
				lineFrom2Point myNodes[i] myNodes[j+1]
			)
		)
	)

	on UIone picked obj do
	(
		UIone.text = obj.name
		myOne = UIone.object
	)

	on UIone rightClick do
	(
		UIone.text = "ONE"
		myOne = undefined
	)

	on UItoAllSelected pressed do
	(
		for obj in getCurrentSelection() where ClassOf obj == Dummy do lineFrom2Point myOne obj
	)

	on beams_color changed clr do for obj in objects where ClassOf obj == SplineShape do obj.wireColor = clr

	on make_hydro pressed do
	(
		for obj in getCurrentSelection() where ClassOf obj == SplineShape do
		(
			custAttributes.add obj hydroAttrib
			layerHydros.addNode obj
		)
	)

	on hydro_attrib_edt changed state do if state == on then CreateDialog RL_HydrosEdit pos:(rlf.pos + [310,0]) else DestroyDialog RL_HydrosEdit

	on beam_attrib_edt changed state do	if state == on then
	(
		rlf2 = newRolloutFloater "Beams Attributes Edit" 313 850
		rlf2.pos = rlf.pos + [310,0]
		addRollout RL_BeamsEdit rlf2
	)
	else closeRolloutFloater rlf2
)

-- tạo rollout tạo triangle
rollout RL_Triangles "Triangles" width:300 height:500
(
	button create_triangle "TRIANGLEs From SELECTIONs" across:2  width:165 align:#left
	spinner trisVisibility "Visibility" type:#integer width:80 offset:[0,3] align:#right range:[0,100,50]
	button flip_triangle "FLIP TRIANGLE(s)"  width:155 across:2 align:#left
	checkbutton triangle_attrib_edt "TRIANGLEs Edit" checked:false width:100 align:#right

	on create_triangle pressed do
	(
		myNodes = getCurrentSelection()

		i = 1
		while i <= myNodes.count do
		(
			if ClassOf myNodes[i] != Dummy then deleteItem myNodes i else i = i + 1
		)

		for i = 1 to myNodes.count - 2 do
		(
			for j = i to myNodes.count - 2 do
			(
				for k = j to myNodes.count - 2 do
				(
					triangleFrom3Point myNodes[i] myNodes[j+1] myNodes [k+2]
				)
			)
		)
	)

	on trisVisibility changed v do layerTriangles.visibility = trisVisibility.value * 0.01

	on flip_triangle pressed do
	(
		myTriangles = getCurrentSelection()
		for i = 1 to myTriangles.count where isProperty myTriangles[i] "BNGdragCoef" == true do
		(
			meshop.flipNormals myTriangles[i] 1
			update myTriangles[i]

			/* b = myTriangles[i].BNGid1
			myTriangles[i].BNGid1 = myTriangles[i].BNGid2
			myTriangles[i].BNGid2 = b */
			if myTriangles[i].flip == false then myTriangles[i].flip = true else myTriangles[i].flip = false
		)
	)

	on triangle_attrib_edt changed state do
	(
		if state == on then CreateDialog RL_TrianglesEdit pos:(rlf.pos + [310,0]) else DestroyDialog RL_TrianglesEdit
	)
)

-- tạo rollout tạo Flexbodies
rollout RL_Flexbodies "Flexbodies" width:300 height:500
(
	button create_attrib "Make FLEXBODIES" across:2 width:155 align:#left
	checkbutton flexbodies_attrib_edt "FLEXBODIES Edit" width:100 align:#right

	on create_attrib pressed do
	(
		for obj in getCurrentSelection() do
		(
			custAttributes.add obj flexBodiesAttrib
			layerFlexBodies.addNode obj
		)
	)

	on flexbodies_attrib_edt changed state do
	(
		if state == on then CreateDialog RL_FlexbodiesEdit pos:(rlf.pos + [310,0]) else DestroyDialog RL_FlexbodiesEdit
	)
)

-- rollout tạo Info
rollout RL_Info "Info" width:300 height:500
(
	edittext UIpart "part       "  align:#right text:"porsche_main"
	edittext UIauthors "authors "  align:#right text:"Sintel"
	edittext UIname "name     "  align:#right text:"Porsche"
	edittext UIslotType "slotType"  align:#right text:"main"

	on UIpart entered txt do
	(
		BNGpart = UIpart.text
	)

	on UIauthors entered txt do
	(
		BNGauthors = UIauthors.text
	)

	on UIname entered txt do
	(
		BNGname = UIname.text
	)

	on UIslotType entered txt do
	(
		BNGslotType = UIslotType.text
	)
)

rollout RL_Others "Others" width:300 height:500
(
	checkbutton visualize "Visualize" checked:false across:2 width:155 align:#left
	checkbutton UImaterials "Materials" width:100 align:#right checked:false
	checkbutton UIslotsEdit "Slots" align:#left width:85 checked:false across:3
	checkbutton UIcameras "Camera" align:#center width:85 checked:false
	checkbutton UI1pressuredWheels "pressuredWheels" align:#right width:85 checked:false visible:false
	checkbutton UIvariables "Variables" align:#left width:85 across:3 checked:false
	checkbutton UIglowMaps "Glow Maps" align:#center width:85 checked:false
	checkbutton UItriggers "Triggers" align:#right width:85 checked:false
	checkbutton UIpowertrain "Powertrain" align:#left width:128 checked:false across:2
	checkbutton UIpressuredWheels "pressuredWheels" align:#right width:128 checked:false
	
	on UIvariables changed state do if state == on then CreateDialog RL_Variables pos:(rlf.pos + [310,0]) else DestroyDialog RL_Variables
	on UIglowMaps changed state do if state == on then CreateDialog RL_GlowMaps pos:(rlf.pos +[310,0]) else DestroyDialog RL_GlowMaps
	on visualize changed state do if state == on then CreateDialog RL_Visualize pos:(rlf.pos + [310,0]) else DestroyDialog RL_Visualize
	on UIcameras changed state do if state == on then CreateDialog RL_Cameras pos:(rlf.pos + [310,0]) else DestroyDialog RL_Cameras
	on UImaterials changed state do if state == on then CreateDialog RL_Materials pos:(rlf.pos + [310,0]) else DestroyDialog RL_Materials
	on UIslotsEdit changed state do if state == on then CreateDialog RL_SlotsEdit pos:(rlf.pos + [310,0]) else DestroyDialog RL_SlotsEdit
	on UIpowertrain changed state do if state == on then CreateDialog RL_Powertrain pos:(rlf.pos + [310,0]) else DestroyDialog RL_Powertrain
	on UIpressuredWheels changed state do if state == on then CreateDialog RL_PressuredWheels pos:(rlf.pos + [310,0]) else DestroyDialog RL_PressuredWheels
)

-- create rollout creating file
rollout RL_File "File" width:330 height:500
(
	edittext UIfilePath ""  across:2 offset:[0,2] width:200 align:#left text:"" readOnly:true
	button UIbrowse "Browse"  width:53 align:#right
	checkbutton UIpreview "Preview" checked:false width:100 across:2 align:#left
	button UIgenerate "Generate" width:155 align:#right

	on UIbrowse pressed do
	(
		myFilePath = getSaveFileName caption:"Choose where to save JBeam file" types:"JBeam(*.jbeam)|*.jbeam"
		if myFilePath != undefined do
		(
			UIfilePath.text = myFilePath
			if doesFileExist myFilePath == false do
			(
				myFile = createfile myFilePath
				close myFile
			)
		)
	)

	on UIpreview changed state do
	(
		if state == on then CreateDialog RL_Preview pos:(rlf.pos + [310,0]) else DestroyDialog RL_Preview
	)

	on UIgenerate pressed do
	(
		if doesFileExist myFilePath == true do
		(
			strmFile = openfile myFilePath mode:"w"
			createJBeam strmFile
			close strmFile
		)
	)
)

-- tạo rollout About
rollout RL_About "About" width:300 height:500
(
	label lbl_1 "Created by Sintel"  align:#left
)

-- rollout preview
rollout RL_Preview "Preview" width:600 height:600
(
	label lbl_3 "Label"  visible:false
	/* edittext UIpreview ""  height:505 text:"" readOnly:true */
	dotNetControl netpreview "System.Windows.Forms.Textbox" width:580 height:520 align:#center
	label lbl_2 "Label"  visible:false
	button UIgenerate "Generate Preview"  width:274

	on RL_Preview open do
	(
		netPreview.Font = dotNetObject "System.Drawing.Font" "MS Sans Serif" 8 ((dotNetClass "System.Drawing.FontStyle").Regular)
        netPreview.BorderStyle = (dotNetClass "System.Windows.Forms.BorderStyle").FixedSingle
        netPreview.BackColor = (dotNetClass "System.Drawing.Color").fromARGB (((colorMan.getColor #background) * 255)[1] as integer) (((colorMan.getColor #background) * 255)[2] as integer) (((colorMan.getColor #background) * 255)[3] as integer)
        netPreview.ForeColor = (dotNetClass "System.Drawing.Color").fromARGB (((colorMan.getColor #text) * 255)[1] as integer) (((colorMan.getColor #text) * 255)[2] as integer) (((colorMan.getColor #text) * 255)[3] as integer)
        netPreview.MultiLine = true
		netPreview.AcceptsTab = true
		netPreview.AcceptsReturn = true
        netPreview.WordWrap = false
        netPreview.ScrollBars = (dotNetClass "System.Windows.Forms.ScrollBars").Both
        netPreview.Text = ""
	)

	on UIGenerate pressed do
	(
		createJBeam ssBuffer

		netPreview.text = ssBuffer as string

		ssBuffer = stringStream ""
	)
)

addRollout RL_Nodes rlf
addRollout RL_Beams rlf
addRollout RL_Triangles rlf
addRollout RL_Flexbodies rlf
addRollout RL_Info rlf
addRollout RL_Others rlf
addRollout RL_File rlf
addRollout RL_About rlf rolledUp:true