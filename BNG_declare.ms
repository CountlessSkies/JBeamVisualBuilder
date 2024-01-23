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
global myFilePath = "", myFileName = ""
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