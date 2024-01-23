-- create function creating line between 2 point and creating beam attributes and skinning to those 2 points
fn lineFrom2Point pointA pointB =
(
	myBeam = SplineShape pos:[0,0,0] wireColor:(color 223 146 146)

	addNewSpline myBeam
	addKnot myBeam 1 #corner #line pointA.pos
	addKnot myBeam 1 #corner #line pointB.pos
	updateShape myBeam

	custAttributes.add myBeam beamAttrib
	custAttributes.add myBeam beamWheelAttrib
	/* myBeam.BNGid1 = pointA.name
	myBeam.BNGid2 = pointB.name */

	addModifier myBeam (skin())
	skinOps.addbone myBeam.skin pointA 0 node:myBeam
	skinOps.addbone myBeam.skin pointB 0 node:myBeam

	layerBeams.addNode myBeam -- add the line to layer beams
)

-- create function creating triangle from 3 points and creating triangle attributes and skinning to those 3 points
fn triangleFrom3Point pointA pointB pointC =
(
	my3NodesPos = #()
	append my3NodesPos pointA.pos
	append my3NodesPos pointB.pos
	append my3NodesPos pointC.pos

	myTriangle = mesh vertices:my3nodesPos faces:#([1,2,3]) materialIDS:#(1) wireColor:(color 154 185 229) renderByLayer:true

	custAttributes.add myTriangle triangleAttrib
	custAttributes.add myTriangle triangleWheelAttrib
	/* myTriangle.BNGid1 = pointA.name
	myTriangle.BNGid2 = pointB.name
	myTriangle.BNGid3 = pointC.name */

	addModifier myTriangle (skin())
	skinOps.addbone myTriangle.skin pointA 0 node:myTriangle
	skinOps.addbone myTriangle.skin pointB 0 node:myTriangle
	skinOps.addbone myTriangle.skin pointC 0 node:myTriangle

	layerTriangles.addNode myTriangle -- add triangle to layer triangles
)

-- create function creating jbeam
fn createJBeam ssBuffer =
(
	format "{\r\n" to:ssBuffer
	format "\"%\":\r\n" BNGpart to:ssBuffer
	format "{\r\n" to:ssBuffer
	format "\t\"information\":\r\n" to:ssBuffer 
	format "\t{\r\n" to:ssBuffer
	format "\t\t\"authors\": \"%\"" BNGauthors to:ssBuffer
	format ",\r\n\t\t\"name\": \"%\"\r\n" BNGname to:ssBuffer
	format "\t}" to:ssBuffer
	format ",\r\n\t\"slotType\": \"%\"" BNGslotType to:ssBuffer
	
	-- refnodes
	if myRef != undefined and myBack != undefined and myLeft != undefined and myUp != undefined do
	(
		format ",\r\n\t\"refNodes\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer
		format "\t\t[\"ref:\", \"back:\", \"left:\", \"up:\"" to:ssBuffer
	)
	if myLCorner != undefined and myRCorner != undefined do format ", \"leftCorner:\", \"rightCorner:\"" to:ssBuffer
	if myRef != undefined and myBack != undefined and myLeft != undefined and myUp != undefined do
	(
		format "],\r\n" to:ssBuffer
		format "\t\t[\"%\", \"%\", \"%\", \"%\"" myRef.name myBack.name myLeft.name myUp.name to:ssBuffer
		if myLCorner != undefined and myRCorner != undefined do
		(
			format ", \"%\", \"%\"" myLCorner.name myRCorner.name to:ssBuffer
		)
		format "]" to:ssBuffer -- đóng ngoặc xuống dòng
	)
	if myRef != undefined and myBack != undefined and myLeft != undefined and myUp != undefined do format "\r\n\t]" to:ssBuffer

	-- slots
	if BNGslotsEnable == true do
	(
		format ",\r\n\t\"slots\":" to:ssBuffer
		format "\r\n\t[" to:ssBuffer
		format "\r\n\t\t[\"type\", \"default\", \"description\"]" to:ssBuffer
		for i = 1 to slts.count do
		(
			format ",\r\n\t\t[\"%\", \"%\", \"%\"" slts[i].type slts[i].default slts[i].description to:ssBuffer
			if slts[i].coreSlot != false or slts[i].nodeOffset != [0,0,0] or slts[i].nodeMove != [0,0,0] do format ", {" to:ssBuffer
			if slts[i].coreSlot != false do format "\"coreSlot\": %" slts[i].coreSlot to:ssBuffer
			if slts[i].nodeOffset != [0,0,0] do format ", \"nodeOffset\": {\"x\":%, \"y\":%, \"z\":%}" slts[i].nodeOffset.x slts[i].nodeOffset.y slts[i].nodeOffset.z to:ssBuffer
			if slts[i].nodeMove != [0,0,0] do format ", \"nodeMove\": {\"x\":%, \"y\":%, \"z\":%}" slts[i].nodeMove.x slts[i].nodeMove.y slts[i].nodeMove.z to:ssBuffer
			if slts[i].coreSlot != false or slts[i].nodeOffset != [0,0,0] or slts[i].nodeMove != [0,0,0] do format "}" to:ssBuffer
			format "]" to:ssBuffer
		)
		format "\r\n\t]" to:ssBuffer
	)

	-- variables
	if BNGvarsEnable == true do
	(
		format ",\r\n\t\"variables\":" to:ssBuffer
		format "\r\n\t[" to:ssBuffer
		format "\r\n\t\t[\"name\", \"type\", \"unit\", \"category\", \"default\", \"min\", \"max\", \"title\", \"decsription\"]" to:ssBuffer
		for i = 1 to vars.count do
		(
			format ",\r\n\t\t[\"%\", \"%\", \"%\", \"%\", %, %, %, \"%\", \"%\"" vars[i].var_name vars[i].var_type vars[i].var_unit vars[i].var_category vars[i].var_default vars[i].var_min vars[i].var_max vars[i].var_title vars[i].var_description to:ssBuffer
			if vars[i].var_subCategory != "" or vars[i].var_stepDis != 0 or vars[i].var_minDis != 0 or vars[i].var_maxDis != 0 do format ", {" to:ssBuffer
			if vars[i].var_subCategory != "" do format "\"subCategory\": \"%\"" vars[i].var_subCategory to:ssBuffer
			if vars[i].var_stepDis != 0 do format "\"stepDis\": %" vars[i].var_stepDis to:ssBuffer
			if vars[i].var_minDis != 0 do format "\"minDis\": %" vars[i].var_minDis to:ssBuffer
			if vars[i].var_maxDis != 0 do format "\"maxDis\": %" vars[i].var_maxDis to:ssBuffer
			if vars[i].var_subCategory != "" or vars[i].var_stepDis != 0 or vars[i].var_minDis != 0 or vars[i].var_maxDis != 0 do format "}" to:ssBuffer
			format "]" to:ssBuffer
		)
		format "\r\n\t]" to:ssBuffer
	)

	-- cams
	layerCams.nodes &theCams
	if theCams.count > 0 do for i = 1 to theCams.count do
	(
		if isProperty theCams[i] "Ex" == true do
		(
			format ",\r\n\t\"cameraExternal\":" to:ssBuffer
			format "\r\n\t{" to:ssBuffer
			if theCams[i].distance as float != undefined then format "\r\n\t\t\"distance\": %" theCams[i].distance to:ssBuffer else format "\r\n\t\t\"distance\": \"%\"" theCams[i].distance to:ssBuffer
			if theCams[i].distanceMin as float != undefined then format ",\r\n\t\t\"distanceMin\": %" theCams[i].distanceMin to:ssBuffer else format ",\r\n\t\t\"distanceMin\": \"%\"" theCams[i].distanceMin to:ssBuffer
			format ",\r\n\t\t\"offset\": {\"x\": %, \"y\": %, \"z\": %}" theCams[i].offsetX theCams[i].offsetY theCams[i].offsetZ to:ssBuffer
			format ",\r\n\t\t\"fov\": %" theCams[i].fov to:ssBuffer
			format "\r\n\t}" to:ssBuffer
		)
		if isProperty theCams[i] "Ch" == true do
		(
			format ",\r\n\t\"cameraChase\":" to:ssBuffer
			format "\r\n\t{" to:ssBuffer
			if theCams[i].distance as float != undefined then format "\r\n\t\t\"distance\": %" theCams[i].distance to:ssBuffer else format "\r\n\t\t\"distance\": \"%\"" theCams[i].distance to:ssBuffer
			if theCams[i].distanceMin as float != undefined then format ",\r\n\t\t\"distanceMin\": %" theCams[i].distanceMin to:ssBuffer else format ",\r\n\t\t\"distanceMin\": \"%\"" theCams[i].distanceMin to:ssBuffer
			format ",\r\n\t\t\"defaultRotation\": {\"x\": %, \"y\": %, \"z\": %}" (formattedPrint theCams[i].rotation.x_rotation format:".2f") (formattedPrint theCams[i].rotation.y_rotation format:".2f") (formattedPrint theCams[i].rotation.z_rotation format:".2f") to:ssBuffer
			format ",\r\n\t\t\"offset\": {\"x\": %, \"y\": %, \"z\": %}" theCams[i].offsetX theCams[i].offsetY theCams[i].offsetZ to:ssBuffer
			format ",\r\n\t\t\"fov\": %" theCams[i].fov to:ssBuffer
			format "\r\n\t}" to:ssBuffer
		)
	)

	-- glowmaps
	if BNGglowsEnable == true do
	(
		format ",\r\n\t\"glowMap\":" to:ssBuffer
		format "\r\n\t{" to:ssBuffer
		if glows.count > 0 do
		(
			format "\r\n\t\t\"%\": {\"simpleFunction\": " glows[1].glows_dummyMaterial to:ssBuffer
			if glows[1].glows_simpleFunction.count > 1 do format "{" to:ssBuffer
			format "%" glows[1].glows_simpleFunction[1] to:ssBuffer
			if glows[1].glows_simpleFunction.count > 1 do for i = 2 to glows[1].glows_simpleFunction.count do format ", %" glows[1].glows_simpleFunction[i] to:ssBuffer
			if glows[1].glows_simpleFunction.count > 1 do format "}" to:ssBuffer
			format ", \"off\": \"%\", \"on\": \"%\"" glows[1].glows_off glows[1].glows_on to:ssBuffer
			if glows[1].glows_on_intense != "" do format ", \"on_intense\": \"%\"" glows[1].glows_on_intense to:ssBuffer
			format "}" to:ssBuffer
		)
		if glows.count > 1 do
		(
			for i = 2 to glows.count do
			(
				format ",\r\n\t\t\"%\": {\"simpleFunction\": " glows[i].glows_dummyMaterial to:ssBuffer
				if glows[i].glows_simpleFunction.count > 1 do format "{" to:ssBuffer
				format "%" glows[i].glows_simpleFunction[1] to:ssBuffer
				if glows[i].glows_simpleFunction.count > 1 do for j = 2 to glows[i].glows_simpleFunction.count do format ", %" glows[i].glows_simpleFunction[j] to:ssBuffer
				if glows[i].glows_simpleFunction.count > 1 do format "}" to:ssBuffer
				format ", \"off\": \"%\", \"on\": \"%\"" glows[i].glows_off glows[i].glows_on to:ssBuffer
				if glows[i].glows_on_intense != "" do format ", \"on_intense\": \"%\"" glows[i].glows_on_intense to:ssBuffer
				format "}" to:ssBuffer
			)
		)

		format "\r\n\t}" to:ssBuffer
	)

	-- nodes
	layerNodes.nodes &theNodes
	if theNodes.count != 0 do
	(
		format ",\r\n\t\"nodes\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer -- mở ngoặc vuông
		format "\t\t[\"id\", \"posX\", \"posY\", \"posZ\"]" to:ssBuffer
	)
	for i = 1 to theNodes.count do
	(
		format ",\r\n\t\t[\"%\", %, %, %" theNodes[i].name (formattedPrint theNodes[i].pos.x format:".2f") (formattedPrint theNodes[i].pos.y format:".2f") (formattedPrint theNodes[i].pos.z format:".2f") to:ssBuffer

		aaTitle = #()
		aaValue = #()

		if theNodes[i].BNGnodeWeight != BNGnodeWeightDef do
		(
			append aaTitle "nodeWeight"
			append aaValue theNodes[i].BNGnodeWeight
		)
		if theNodes[i].BNGcollision != BNGcollisionDef do
		(
			append aaTitle "collision"
			append aaValue theNodes[i].BNGcollision
		)
		if theNodes[i].BNGselfCollision != BNGselfCollisionDef do
		(
			append aaTitle "selfCollision"
			append aaValue theNodes[i].BNGselfCollision
		)
		if theNodes[i].BNGgroup.count > 0 do
		(
			append aaTitle "group"
			append aaValue theNodes[i].BNGgroup
		)
		if theNodes[i].BNGfrictionCoef != BNGfrictionCoefDef do
		(
			append aaTitle "frictionCoef"
			append aaValue theNodes[i].BNGfrictionCoef
		)
		if theNodes[i].BNGnodeMaterial != BNGnodeMaterialDef do
		(
			append aaTitle "nodeMaterial"
			append aaValue theNodes[i].BNGnodeMaterial
		)
		if theNodes[i].BNGfixed != BNGfixedDef do
		(
			append aaTitle "fixed"
			append aaValue theNodes[i].BNGfixed
		)
		if theNodes[i].BNGbreakGroup != BNGbreakGroupDef do
		(
			append aaTitle "breakGroup"
			append aaValue theNodes[i].BNGbreakGroup
		)
		if theNodes[i].BNGcouplerLock != BNGcouplerLockDef do
		(
			append aaTitle "couplerLock"
			append aaValue theNodes[i].BNGcouplerLock
		)
		if theNodes[i].BNGimportElectrics.count > 0 do
		(
			append aaTitle "importElectrics"
			append aaValue theNodes[i].BNGimportElectrics
		)
		if theNodes[i].BNGimportInputs.count > 0 do
		(
			append aaTitle "importInputs"
			append aaValue theNodes[i].BNGimportInputs
		)
		if theNodes[i].BNGsurfaceCoef != BNGsurfaceCoefDef do
		(
			append aaTitle "surfaceCoef"
			append aaValue theNodes[i].BNGsurfaceCoef
		)
		if theNodes[i].BNGvolumeCoef != BNGvolumeCoefDef do
		(
			append aaTitle "volumeCoef"
			append aaValue theNodes[i].BNGvolumeCoef
		)

		if aaValue.count > 0 do
		(
			format ", {" to:ssBuffer
			if ClassOf aaValue[1] != ArrayParameter then
			(
				if ClassOf aaValue[1] == BooleanClass then format "\"%\": %" aaTitle[1] aaValue[1] to:ssBuffer else
				(
					if aaValue[1] as float == undefined then format "\"%\": \"%\"" aaTitle[1] aaValue[1] to:ssBuffer else
					(
						if (aaValue[1] as float) == (aaValue[1] as integer) then format "\"%\": %" aaTitle[1] (aaValue[1] as integer) to:ssBuffer else  format "\"%\": %" aaTitle[1] (aaValue[1] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[1].count == 1 then format "\"%\": \"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer else
				(
					format "\"%\": [\"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer
					for j = 2 to aaValue[1].count do format ", \"%\"" aaValue[1][j] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			if aaValue.count > 1 do for j = 2 to aaTitle.count do if ClassOf aaValue[j] != ArrayParameter then
			(
				if ClassOf aaValue[j] == BooleanClass then format ", \"%\": %" aaTitle[j] aaValue[j] to:ssBuffer else
				(
					if aaValue[j] as float == undefined then format ", \"%\": \"%\"" aaTitle[j] aaValue[j] to:ssBuffer else
					(
						if (aaValue[j] as float) == (aaValue[j] as integer) then format ", \"%\": %" aaTitle[j] (aaValue[j] as integer) to:ssBuffer else  format ", \"%\": %" aaTitle[j] (aaValue[j] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[j].count == 1 then format ", \"%\": \"%\"" aaTitle[j] aaValue[j][1] to:ssBuffer else
				(
					format ", \"%\": [\"%\"" aaTitle[i] aaValue[i][1] to:ssBuffer
					for k = 2 to aaValue[j].count do format ", \"%\"" aaValue[j][k] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			format "}" to:ssBuffer
		)

		free aaTitle
		free aaValue

		format "]" to:ssBuffer
	)
	if theNodes.count != 0 do format "\r\n\t]" to:ssBuffer -- đóng ngoặc vuông
	free theNodes

	-- beams
	layerBeams.nodes &theBeams
	if theBeams.count != 0 do
	(
		format ",\r\n\t\"beams\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer -- mở ngoặc vuông
		format "\t\t[\"id1:\", \"id2:\"]" to:ssBuffer
	)
	if theBeams.count != 0 do for i = 1 to theBeams.count do
	(
		format ",\r\n\t\t[\"%\", \"%\"" (skinOps.GetBoneName theBeams[i].modifiers[1] 1 0) (skinOps.GetBoneName theBeams[i].modifiers[1] 2 0) to:ssBuffer

		aaTitle = #()
		aaValue = #()

		if theBeams[i].BNGbeamType != BNGbeamTypeDef do
		(
			append aaTitle "beamType"
			append aaValue theBeams[i].BNGbeamType
		)
		if theBeams[i].BNGbeamSpring != BNGbeamSpringDef do
		(
			append aaTitle "beamSpring"
			append aaValue theBeams[i].BNGbeamSpring
		)
		if theBeams[i].BNGbeamDamp != BNGbeamDampDef do
		(
			append aaTitle "beamDamp"
			append aaValue theBeams[i].BNGbeamDamp
		)
		if theBeams[i].BNGbeamStrength != BNGbeamStrengthDef do
		(
			append aaTitle "beamStrength"
			append aaValue theBeams[i].BNGbeamStrength
		)
		if theBeams[i].BNGbeamDeform != BNGbeamDeformDef do
		(
			append aaTitle "beamDeform"
			append aaValue theBeams[i].BNGbeamDeform
		)
		if theBeams[i].BNGbeamPrecompression != BNGbeamPrecompressionDef do
		(
			append aaTitle "beamPrecompression"
			append aaValue theBeams[i].BNGbeamPrecompression
		)
		if theBeams[i].BNGbeamPrecompressionRange != BNGbeamPrecompressionRangeDef do
		(
			append aaTitle "beamPrecompressionRange"
			append aaValue theBeams[i].BNGbeamPrecompressionRange
		)
		if theBeams[i].BNGbeamPrecompressionTime != BNGbeamPrecompressionTimeDef do
		(
			append aaTitle "beamPrecompressionTime"
			append aaValue theBeams[i].BNGbeamPrecompressionTime
		)
		if theBeams[i].BNGbreakGroup != BNGbreakGroupDef do
		(
			append aaTitle "breakGroup"
			append aaValue theBeams[i].BNGbreakGroup
		)
		if theBeams[i].BNGbreakGroupType != BNGbreakGroupTypeDef do
		(
			append aaTitle "breakGroupType"
			append aaValue theBeams[i].BNGbreakGroupType
		)
		if theBeams[i].BNGdampCutoffHz != BNGdampCutoffHzDef do
		(
			append aaTitle "dampCutoffHz"
			append aaValue theBeams[i].BNGdampCutoffHz
		)
		if theBeams[i].BNGdeformLimit != BNGdeformLimitDef do
		(
			append aaTitle "deformLimit"
			append aaValue theBeams[i].BNGdeformLimit
		)
		if theBeams[i].BNGdeformLimitExpansion != BNGdeformLimitExpansionDef do
		(
			append aaTitle "deformLimitExpansion"
			append aaValue theBeams[i].BNGdeformLimitExpansion
		)
		if theBeams[i].BNGoptional != BNGoptionalDef do
		(
			append aaTitle "optional"
			append aaValue theBeams[i].BNGoptional
		)
		if theBeams[i].BNGdeformGroup != BNGdeformGroupDef do
		(
			append aaTitle "deformGroup"
			append aaValue theBeams[i].BNGdeformGroup
		)
		if theBeams[i].BNGdeformationTriggerRatio != BNGdeformationTriggerRatioDef do
		(
			append aaTitle "deformationTriggerRatio"
			append aaValue theBeams[i].BNGdeformationTriggerRatio
		)
		if theBeams[i].BNGbeamType == "|BOUNDED" do
		(
			if theBeams[i].BNGbeamLongBound != BNGbeamLongBoundDef do
			(
				append aaTitle "beamLongBound"
				append aaValue theBeams[i].BNGbeamLongBound
			)
			if theBeams[i].BNGbeamShortBound != BNGbeamShortBoundDef do
			(
				append aaTitle "beamShortBound"
				append aaValue theBeams[i].BNGbeamShortBound
			)
			if theBeams[i].BNGboundZone != BNGboundZoneDef do
			(
				append aaTitle "boundZone"
				append aaValue theBeams[i].BNGboundZone
			)
			if theBeams[i].BNGbeamLongBoundRange != BNGbeamLongBoundRangeDef do
			(
				append aaTitle "beamLongBoundRange"
				append aaValue theBeams[i].BNGbeamLongBoundRange
			)
			if theBeams[i].BNGbeamShortBoundRange != BNGbeamShortBoundRangeDef do
			(
				append aaTitle "beamShortBoundRange"
				append aaValue theBeams[i].BNGbeamShortBoundRange
			)
			if theBeams[i].BNGbeamLimitSpring != BNGbeamLimitSpringDef do
			(
				append aaTitle "beamLimitSpring"
				append aaValue theBeams[i].BNGbeamLimitSpring
			)
			if theBeams[i].BNGbeamLimitDamp != BNGbeamLimitDampDef do
			(
				append aaTitle "beamLimitDamp"
				append aaValue theBeams[i].BNGbeamLimitDamp
			)
			if theBeams[i].BNGbeamLimitDampRebound != BNGbeamLimitDampReboundDef do
			(
				append aaTitle "beamLimitDampRebound"
				append aaValue theBeams[i].BNGbeamLimitDampRebound
			)
			if theBeams[i].BNGbeamDampRebound != BNGbeamDampReboundDef do
			(
				append aaTitle "beamDampRebound"
				append aaValue theBeams[i].BNGbeamDampRebound
			)
			if theBeams[i].BNGbeamDampFast != BNGbeamDampFastDef do
			(
				append aaTitle "beamDampFast"
				append aaValue theBeams[i].BNGbeamDampFast
			)
			if theBeams[i].BNGbeamDampReboundFast != BNGbeamDampReboundFastDef do
			(
				append aaTitle "beamDampReboundFast"
				append aaValue theBeams[i].BNGbeamDampReboundFast
			)
			if theBeams[i].BNGbeamDampVelocitySplit != BNGbeamDampVelocitySplitDef do
			(
				append aaTitle "beamDampVelocitySplit"
				append aaValue theBeams[i].BNGbeamDampVelocitySplit
			)
		)
		if theBeams[i].BNGbeamType == "|SUPPORT" do
		(
			if theBeams[i].BNGbeamLongBound != BNGsbBeamLongBoundDef do
			(
				append aaTitle "beamLongBound"
				append aaValue theBeams[i].BNGbeamLongBound
			)
		)
		if theBeams[i].BNGbeamType == "|PRESSURED" do
		(
			if theBeams[i].BNGpressure != BNGpressureDef do
			(
				append aaTitle "pressure"
				append aaValue theBeams[i].BNGpressure
			)
			if theBeams[i].BNGpressurePSI != BNGpressurePSIDef do
			(
				append aaTitle "pressurePSI"
				append aaValue theBeams[i].BNGpressurePSI
			)
			if theBeams[i].BNGsurface != BNGsurfaceDef do
			(
				append aaTitle "surface"
				append aaValue theBeams[i].BNGsurface
			)
			if theBeams[i].BNGvolumeCoef != BNGpbVolumeCoefDef do
			(
				append aaTitle "volumeCoef"
				append aaValue theBeams[i].BNGvolumeCoef
			)
			if theBeams[i].BNGmaxPressure != BNGmaxPressureDef do
			(
				append aaTitle "maxPressure"
				append aaValue theBeams[i].BNGmaxPressure
			)
			if theBeams[i].BNGmaxPressurePSI != BNGmaxPressurePSIDef do
			(
				append aaTitle "maxPressurePSI"
				append aaValue theBeams[i].BNGmaxPressurePSI
			)
		)
		if theBeams[i].BNGbeamType == "|ANISOTROPIC" do
		(
			if theBeams[i].BNGspringExpansion != BNGspringExpansionDef do
			(
				append aaTitle "springExpansion"
				append aaValue theBeams[i].BNGspringExpansion
			)
			if theBeams[i].BNGdampExpansion != BNGdampExpansionDef do
			(
				append aaTitle "dampExpansion"
				append aaValue theBeams[i].BNGdampExpansion
			)
			if theBeams[i].BNGbeamLongBound != BNGabBeamLongBoundDef do
			(
				append aaTitle "beamLongBound"
				append aaValue theBeams[i].BNGbeamLongBound
			)
			if theBeams[i].BNGtransitionZone != BNGtransitionZoneDef do
			(
				append aaTitle "transitionZone"
				append aaValue theBeams[i].BNGtransitionZone
			)
		)

		if aaValue.count > 0 do
		(
			format ", {" to:ssBuffer
			if ClassOf aaValue[1] != ArrayParameter then
			(
				if ClassOf aaValue[1] == BooleanClass then format "\"%\": %" aaTitle[1] aaValue[1] to:ssBuffer else
				(
					if aaValue[1] as float == undefined then format "\"%\": \"%\"" aaTitle[1] aaValue[1] to:ssBuffer else
					(
						if (aaValue[1] as float) == (aaValue[1] as integer) then format "\"%\": %" aaTitle[1] (aaValue[1] as integer) to:ssBuffer else  format "\"%\": %" aaTitle[1] (aaValue[1] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[1].count == 1 then format "\"%\": \"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer else
				(
					format "\"%\": [\"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer
					for j = 2 to aaValue[1].count do format ", \"%\"" aaValue[1][j] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			if aaValue.count > 1 do for j = 2 to aaTitle.count do if ClassOf aaValue[j] != ArrayParameter then
			(
				if ClassOf aaValue[j] == BooleanClass then format ", \"%\": %" aaTitle[j] aaValue[j] to:ssBuffer else
				(
					if aaValue[j] as float == undefined then format ", \"%\": \"%\"" aaTitle[j] aaValue[j] to:ssBuffer else
					(
						if (aaValue[j] as float) == (aaValue[j] as integer) then format ", \"%\": %" aaTitle[j] (aaValue[j] as integer) to:ssBuffer else  format ", \"%\": %" aaTitle[j] (aaValue[j] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[j].count == 1 then format ", \"%\": \"%\"" aaTitle[j] aaValue[j][1] to:ssBuffer else
				(
					format ", \"%\": [\"%\"" aaTitle[i] aaValue[i][1] to:ssBuffer
					for k = 2 to aaValue[j].count do format ", \"%\"" aaValue[j][k] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			format "}" to:ssBuffer
		)

		free aaTitle
		free aaValue
		
		format "]" to:ssBuffer
	)
	if theBeams.count != 0 do format "\r\n\t]" to:ssBuffer --đóng ngoặc vuông
	free theBeams

	-- triangles
	layerTriangles.nodes &theTriangles
	if theTriangles.count != 0 do
	(
		format ",\r\n\t\"triangles\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer -- mở ngoặc vuông
		format "\t\t[\"id1:\", \"id2:\", \"id3:\"]" to:ssBuffer
	)
	if theTriangles.count != 0 do for i = 1 to theTriangles.count do
	(
		if theTriangles[i].flip == false then format ",\r\n\t\t[\"%\", \"%\", \"%\"" (skinOps.GetBoneName theTriangles[i].modifiers[1] 1 0) (skinOps.GetBoneName theTriangles[i].modifiers[1] 2 0) (skinOps.GetBoneName theTriangles[i].modifiers[1] 3 0) to:ssBuffer else format ",\r\n\t\t[\"%\", \"%\", \"%\"" (skinOps.GetBoneName theTriangles[i].modifiers[1] 2 0) (skinOps.GetBoneName theTriangles[i].modifiers[1] 1 0) (skinOps.GetBoneName theTriangles[i].modifiers[1] 3 0) to:ssBuffer

		aaTitle = #()
		aaValue = #()

		if theTriangles[i].BNGdragCoef != BNGdragCoefDef do
		(
			append aaTitle "dragCoef"
			append aaValue theTriangles[i].BNGdragCoef
		)
		if theTriangles[i].BNGLiftCoef != BNGLiftCoefDef do
		(
			append aaTitle "LiftCoef"
			append aaValue theTriangles[i].BNGLiftCoef
		)
		if theTriangles[i].BNGstallAngle != BNGstallAngleDef do
		(
			append aaTitle "stallAngle"
			append aaValue theTriangles[i].BNGstallAngle
		)
		if theTriangles[i].BNGtriangleType != BNGtriangleTypeDef do
		(
			append aaTitle "triangleType"
			append aaValue theTriangles[i].BNGtriangleType
		)
		if theTriangles[i].BNGpressureGroup != BNGpressureGroupDef do
		(
			append aaTitle "pressureGroup"
			append aaValue theTriangles[i].BNGpressureGroup
		)
		if theTriangles[i].BNGbreakGroup != BNGbreakGroupDef do
		(
			append aaTitle "breakGroup"
			append aaValue theTriangles[i].BNGbreakGroup
		)
		if theTriangles[i].BNGoptional != BNGoptionalDef do
		(
			append aaTitle "optional"
			append aaValue theTriangles[i].BNGoptional
		)
		if theTriangles[i].BNGgroundModel != BNGgroundModelDef do
		(
			append aaTitle "groundModel"
			append aaValue theTriangles[i].BNGgroundModel
		)

		if aaValue.count > 0 do
		(
			format ", {" to:ssBuffer
			if ClassOf aaValue[1] != ArrayParameter then
			(
				if ClassOf aaValue[1] == BooleanClass then format "\"%\": %" aaTitle[1] aaValue[1] to:ssBuffer else
				(
					if aaValue[1] as float == undefined then format "\"%\": \"%\"" aaTitle[1] aaValue[1] to:ssBuffer else
					(
						if (aaValue[1] as float) == (aaValue[1] as integer) then format "\"%\": %" aaTitle[1] (aaValue[1] as integer) to:ssBuffer else  format "\"%\": %" aaTitle[1] (aaValue[1] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[1].count == 1 then format "\"%\": \"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer else
				(
					format "\"%\": [\"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer
					for j = 2 to aaValue[1].count do format ", \"%\"" aaValue[1][j] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			if aaValue.count > 1 do for j = 2 to aaTitle.count do if ClassOf aaValue[j] != ArrayParameter then
			(
				if ClassOf aaValue[j] == BooleanClass then format ", \"%\": %" aaTitle[j] aaValue[j] to:ssBuffer else
				(
					if aaValue[j] as float == undefined then format ", \"%\": \"%\"" aaTitle[j] aaValue[j] to:ssBuffer else
					(
						if (aaValue[j] as float) == (aaValue[j] as integer) then format ", \"%\": %" aaTitle[j] (aaValue[j] as integer) to:ssBuffer else  format ", \"%\": %" aaTitle[j] (aaValue[j] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[j].count == 1 then format ", \"%\": \"%\"" aaTitle[j] aaValue[j][1] to:ssBuffer else
				(
					format ", \"%\": [\"%\"" aaTitle[i] aaValue[i][1] to:ssBuffer
					for k = 2 to aaValue[j].count do format ", \"%\"" aaValue[j][k] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			format "}" to:ssBuffer
		)

		free aaTitle
		free aaValue

		format "]" to:ssBuffer
	)
	if theTriangles.count != 0 do format "\r\n\t]" to:ssBuffer --đóng ngoặc vuông
	free theTriangles

	-- hydros
	layerHydros.nodes &theHydros
	if theHydros.count != 0 do
	(
		format ",\r\n\t\"hydros\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer -- mở ngoặc vuông
		format "\t\t[\"id1:\", \"id2:\"]" to:ssBuffer
	)

	if theHydros.count != 0 do for i = 1 to theHydros.count do
	(
		format ",\r\n\t\t[\"%\", \"%\"" theHydros[i].BNGid1 theHydros[i].BNGid2 to:ssBuffer

		aaTitle = #()
		aaValue = #()

		if theHydros[i].BNGbeamType != BNGbeamTypeDef do
		(
			append aaTitle "beamType"
			append aaValue theHydros[i].BNGbeamType
		)
		if theHydros[i].BNGbeamSpring != BNGbeamSpringDef do
		(
			append aaTitle "beamSpring"
			append aaValue theHydros[i].BNGbeamSpring
		)
		if theHydros[i].BNGbeamDamp != BNGbeamDampDef do
		(
			append aaTitle "beamDamp"
			append aaValue theHydros[i].BNGbeamDamp
		)
		if theHydros[i].BNGbeamStrength != BNGbeamStrengthDef do
		(
			append aaTitle "beamStrength"
			append aaValue theHydros[i].BNGbeamStrength
		)
		if theHydros[i].BNGbeamDeform != BNGbeamDeformDef do
		(
			append aaTitle "beamDeform"
			append aaValue theHydros[i].BNGbeamDeform
		)
		if theHydros[i].BNGbeamPrecompression != BNGbeamPrecompressionDef do
		(
			append aaTitle "beamPrecompression"
			append aaValue theHydros[i].BNGbeamPrecompression
		)
		if theHydros[i].BNGbeamPrecompressionRange != BNGbeamPrecompressionRangeDef do
		(
			append aaTitle "beamPrecompressionRange"
			append aaValue theHydros[i].BNGbeamPrecompressionRange
		)
		if theHydros[i].BNGbeamPrecompressionTime != BNGbeamPrecompressionTimeDef do
		(
			append aaTitle "beamPrecompressionTime"
			append aaValue theHydros[i].BNGbeamPrecompressionTime
		)
		if theHydros[i].BNGbreakGroup != BNGbreakGroupDef do
		(
			append aaTitle "breakGroup"
			append aaValue theHydros[i].BNGbreakGroup
		)
		if theHydros[i].BNGbreakGroupType != BNGbreakGroupTypeDef do
		(
			append aaTitle "breakGroupType"
			append aaValue theHydros[i].BNGbreakGroupType
		)
		if theHydros[i].BNGdampCutoffHz != BNGdampCutoffHzDef do
		(
			append aaTitle "dampCutoffHz"
			append aaValue theHydros[i].BNGdampCutoffHz
		)
		if theHydros[i].BNGdeformLimit != BNGdeformLimitDef do
		(
			append aaTitle "deformLimit"
			append aaValue theHydros[i].BNGdeformLimit
		)
		if theHydros[i].BNGdeformLimitExpansion != BNGdeformLimitExpansionDef do
		(
			append aaTitle "deformLimitExpansion"
			append aaValue theHydros[i].BNGdeformLimitExpansion
		)
		if theHydros[i].BNGoptional != BNGoptionalDef do
		(
			append aaTitle "optional"
			append aaValue theHydros[i].BNGoptional
		)
		if theHydros[i].BNGdeformGroup != BNGdeformGroupDef do
		(
			append aaTitle "deformGroup"
			append aaValue theHydros[i].BNGdeformGroup
		)
		if theHydros[i].BNGdeformationTriggerRatio != BNGdeformationTriggerRatioDef do
		(
			append aaTitle "deformationTriggerRatio"
			append aaValue theHydros[i].BNGdeformationTriggerRatio
		)
		if theHydros[i].BNGinputSource != BNGinputSourceDef do
		(
			append aaTitle "inputSource"
			append aaValue theHydros[i].BNGinputSource
		)
		if theHydros[i].BNGfactor != BNGfactorDef do
		(
			append aaTitle "factor"
			append aaValue theHydros[i].BNGfactor
		)
		if theHydros[i].BNGoutLimit != BNGoutLimitDef do
		(
			append aaTitle "outLimit"
			append aaValue theHydros[i].BNGoutLimit
		)
		if theHydros[i].BNGinLimit != BNGinLimitDef do
		(
			append aaTitle "inLimit"
			append aaValue theHydros[i].BNGinLimit
		)
		if theHydros[i].BNGinputFactor != BNGinputFactorDef do
		(
			append aaTitle "inputFactor"
			append aaValue theHydros[i].BNGinputFactor
		)
		if theHydros[i].BNGinputCenter != BNGinputCenterDef do
		(
			append aaTitle "inputCenter"
			append aaValue theHydros[i].BNGinputCenter
		)
		if theHydros[i].BNGinRate != BNGinRateDef do
		(
			append aaTitle "inRate"
			append aaValue theHydros[i].BNGinRate
		)
		if theHydros[i].BNGoutRate != BNGoutRateDef do
		(
			append aaTitle "outRate"
			append aaValue theHydros[i].BNGoutRate
		)
		if theHydros[i].BNGsteeringWheelLock != BNGsteeringWheelLockDef do
		(
			append aaTitle "steeringWheelLock"
			append aaValue theHydros[i].BNGsteeringWheelLock
		)

		if aaValue.count > 0 do
		(
			format ", {" to:ssBuffer
			if ClassOf aaValue[1] != ArrayParameter then
			(
				if ClassOf aaValue[1] == BooleanClass then format "\"%\": %" aaTitle[1] aaValue[1] to:ssBuffer else
				(
					if aaValue[1] as float == undefined then format "\"%\": \"%\"" aaTitle[1] aaValue[1] to:ssBuffer else
					(
						if (aaValue[1] as float) == (aaValue[1] as integer) then format "\"%\": %" aaTitle[1] (aaValue[1] as integer) to:ssBuffer else  format "\"%\": %" aaTitle[1] (aaValue[1] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[1].count == 1 then format "\"%\": \"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer else
				(
					format "\"%\": [\"%\"" aaTitle[1] aaValue[1][1] to:ssBuffer
					for j = 2 to aaValue[1].count do format ", \"%\"" aaValue[1][j] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			if aaValue.count > 1 do for j = 2 to aaTitle.count do if ClassOf aaValue[j] != ArrayParameter then
			(
				if ClassOf aaValue[j] == BooleanClass then format ", \"%\": %" aaTitle[j] aaValue[j] to:ssBuffer else
				(
					if aaValue[j] as float == undefined then format ", \"%\": \"%\"" aaTitle[j] aaValue[j] to:ssBuffer else
					(
						if (aaValue[j] as float) == (aaValue[j] as integer) then format ", \"%\": %" aaTitle[j] (aaValue[j] as integer) to:ssBuffer else  format ", \"%\": %" aaTitle[j] (aaValue[j] as float) to:ssBuffer
					)
				)
			)
			else
			(
				if aaValue[j].count == 1 then format ", \"%\": \"%\"" aaTitle[j] aaValue[j][1] to:ssBuffer else
				(
					format ", \"%\": [\"%\"" aaTitle[i] aaValue[i][1] to:ssBuffer
					for k = 2 to aaValue[j].count do format ", \"%\"" aaValue[j][k] to:ssBuffer
					format "]" to:ssBuffer
				)
			)
			format "}" to:ssBuffer
		)

		free aaTitle
		free aaValue
		
		format "]" to:ssBuffer
	)
	if theHydros.count != 0 do format "\r\n\t]" to:ssBuffer --đóng ngoặc vuông
	free theHydros
	
	-- flexbodies
	layerFlexbodies.nodes &theFlexbodies
	if theFlexbodies.count != 0 do
	(
		format ",\r\n\t\"flexbodies\":\r\n" to:ssBuffer
		format "\t[\r\n" to:ssBuffer -- mở ngoặc vuông
		format "\t\t[\"mesh\", \"[group]:\", \"nonFlexMaterials\"]" to:ssBuffer
	)
	if theFlexbodies.count != 0 do for i = 1 to theFlexbodies.count do
	(
		aaTitle = #()
		aaValue = #()

		append aaTitle "mesh"
		append aaValue theFlexbodies[i].name

		if theFlexbodies[i].BNGgroup != BNGgroupDef do
		(
			append aaTitle "group"
			append aaValue theFlexbodies[i].BNGgroup
		)
		if theFlexbodies[i].BNGpos != BNGposDef do
		(
			append aaTitle "pos"
			append aaValue theFlexbodies[i].BNGpos
		)
		if theFlexbodies[i].BNGrot != BNGrotDef do
		(
			append aaTitle "rot"
			append aaValue theFlexbodies[i].BNGrot
		)
		if theFlexbodies[i].BNGscale != BNGscaleDef do
		(
			append aaTitle "scale"
			append aaValue theFlexbodies[i].BNGscale
		)
		if theFlexbodies[i].BNGdeformGroup.count != 0 do
		(
			append aaTitle "deformGroup"
			append aaValue theFlexbodies[i].BNGdeformGroup
		)
		if theFlexbodies[i].BNGdeformMaterialBase != BNGdeformMaterialBaseDef do
		(
			append aaTitle "deformMaterialBase"
			append aaValue theFlexbodies[i].BNGdeformMaterialBase
		)
		if theFlexbodies[i].BNGdeformMaterialDamaged != BNGdeformMaterialDamagedDef do
		(
			append aaTitle "deformMaterialDamaged"
			append aaValue theFlexbodies[i].BNGdeformMaterialDamaged
		)
		if theFlexbodies[i].BNGdeformSound != BNGdeformSoundDef do
		(
			append aaTitle "deformSound"
			append aaValue theFlexbodies[i].BNGdeformSound
		)
		if theFlexbodies[i].BNGdeformVolume != BNGdeformVolumeDef do
		(
			append aaTitle "deformVolume"
			append aaValue theFlexbodies[i].BNGdeformVolume
		)
		if theFlexbodies[i].BNGdisableMeshBreaking != BNGdisableMeshBreakingDef do
		(
			append aaTitle "disableMeshBreaking"
			append aaValue theFlexbodies[i].BNGdisableMeshBreaking
		)

		format ",\r\n\t\t[\"%\"" aaValue[1] to:ssBuffer
		format ", [\"%\"" aaValue[2][1] to:ssBuffer
		if aaValue[2].count > 1 do for k = 2 to aaValue[2].count do format ", \"%\"" aaValue[2][k] to:ssBuffer
		format "]" to:ssBuffer
		if aaValue.count > 2 do
		(
			format ", [], {" to:ssBuffer
			for j = 3 to aaValue.count do if ClassOf aaValue[j] != point3 then format ", \"%\": \"%\"" aaTitle[j] aaValue[j] to:ssBuffer else format ", \"%\": {\"%\", \"%\", \"%\"}" aaTitle[j] aaValue[j].x aaValue[j].y aaValue[j].z to:ssBuffer
			format "}" to:ssBuffer
		)

		free aaTitle
		free aaValue

		format "]" to:ssBuffer
	)
	
	if theFlexbodies.count != 0 do format "\r\n\t]" to:ssBuffer --đóng ngoặc vuông
	free theFlexbodies

	-- pressureWheels
	if BNGwheelsEnable == true do
	(
		format ",\r\n\t\"pressureWheels\":\r\n\t[\r\n\t\t[\"name\",\"hubGroup\",\"group\",\"node1:\",\"node2:\",\"nodeS\",\"nodeArm:\",\"wheelDir\"]" to:ssBuffer
		if wheels.count > 0 do for i = 1 to wheels.count do
		(
			format ",\r\n\t\t[\"%\", \"%\", \"%\", \"%\", \"%\", \"%\", \"%\", %" wheels[i].wheels_name wheels[i].hubGroup wheels[i].group wheels[i].node1 wheels[i].node2 wheels[i].nodeS wheels[i].nodeArm wheels[i].wheelDir to:ssBuffer
			
			aaTitle = #()
			aaValue = #()
			
			if wheels[i].radius != undefined do
			(
				append aaTitle "radius"
				append aaValue wheels[i].radius
			)
			if wheels[i].hubRadius != undefined do
			(
				append aaTitle "hubRadius"
				append aaValue wheels[i].hubRadius
			)
			if wheels[i].wheelOffset != undefined do
			(
				append aaTitle "wheelOffset"
				append aaValue wheels[i].wheelOffset
			)
			if wheels[i].tireWidth != undefined do
			(
				append aaTitle "tireWidth"
				append aaValue wheels[i].tireWidth
			)
			if wheels[i].hubWidth != undefined do
			(
				append aaTitle "hubWidth"
				append aaValue wheels[i].hubWidth
			)
			if wheels[i].numRays != undefined do
			(
				append aaTitle "numRays"
				append aaValue wheels[i].numRays
			)
			if wheels[i].enableTireReinfBeams != false do
			(
				append aaTitle "enableTireReinfBeams"
				append aaValue wheels[i].enableTireReinfBeams
			)
			if wheels[i].enableTireLBeams != false do
			(
				append aaTitle "enableTireLBeams"
				append aaValue wheels[i].enableTireLBeams
			)
			if wheels[i].enableTireSideReinfBeams != false do
			(
				append aaTitle "enableTireSideReinfBeams"
				append aaValue wheels[i].enableTireSideReinfBeams
			)
			if wheels[i].enableTreadReinfBeams != false do
			(
				append aaTitle "enableTreadReinfBeams"
				append aaValue wheels[i].enableTreadReinfBeams
			)
			if wheels[i].hasTire != true do
			(
				append aaTitle "hasTire"
				append aaValue wheels[i].hasTire
			)

			if aaValue.count > 0 do
			(
				format ", {" to:ssBuffer
				if ClassOf aaValue[1] == BooleanClass then format "\"%\": %" aaTitle[1] aaValue[1] to:ssBuffer else
				(
					if aaValue[1] as float == undefined then format "\"%\": \"%\"" aaTitle[1] aaValue[1] to:ssBuffer else
					(
						if aaTitle[1] != "numRays" then format "\"%\": %" aaTitle[1] (aaValue[1] as float) to:ssBuffer else format "\"%\": %" aaTitle[1] (aaValue[1] as integer) to:ssBuffer
					)
				)
				if aaValue.count > 1 do for i = 2 to aaValue.count do
				(
					if ClassOf aaValue[i] == BooleanClass then format ", \"%\": %" aaTitle[i] aaValue[i] to:ssBuffer else
					(
						if aaValue[i] as float == undefined then format ", \"%\": \"%\"" aaTitle[i] aaValue[i] to:ssBuffer else
						(
							if aaTitle[i] != "numRays" then format ", \"%\": %" aaTitle[i] (aaValue[i] as float) to:ssBuffer else format ", \"%\": %" aaTitle[i] (aaValue[i] as integer) to:ssBuffer
						)
					)
				)
				if aaValue.count > 0 do format "}" to:ssBuffer
			)
			format "]" to:ssBuffer
		)
		format "\r\n\t]" to:ssBuffer
	)

	format "\r\n}\r\n" to:ssBuffer -- đóng ngoặc 2
	format "}\r\n" to:ssBuffer -- đóng ngoặc 1 fixed
)

fn createMaterial vPath ssBuffer2 =
(
	format "{" to:ssBuffer2
	layerFlexbodies.nodes &theFlexbodies
	mats = #()
	if theFlexbodies.count > 0 do for i = 1 to theFlexbodies.count where theFlexbodies[i].material != undefined do
	(
		if ClassOf theFlexbodies[i].material == PhysicalMaterial do append mats theFlexbodies[i].material
		if ClassOf theFlexbodies[i].material == Multimaterial do for j = 1 to theFlexbodies[i].material.materialList.count where ClassOf theFlexbodies[i].material.materialList[j] == PhysicalMaterial do append mats theFlexbodies[i].material.materialList[j]
	)
	mats = makeUniqueArray mats

	if mats.count > 0 do
	(
		format "\r\n\"%\":" mats[1].name to:ssBuffer2
		format "\r\n{" to:ssBuffer2
		format "\r\n\t\"name\": \"%\"" mats[1].name to:ssBuffer2
		format ",\r\n\t\"mapTo\": \"%\"" mats[1].name to:ssBuffer2
		format ",\r\n\t\"class\": \"Material\"" to:ssBuffer2
		format ",\r\n\t\"Stages\":" to:ssBuffer2
		format "\r\n\t[" to:ssBuffer2
		format "\r\n\t\t{" to:ssBuffer2
		if ClassOf mats[1].base_color_map == Bitmaptexture then format "\r\n\t\t\t\"baseColorMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].base_color_map.fileName) to:ssBuffer2 else format "\r\n\t\t\t\"baseColorFactor\": [%, %, %, 1]" mats[1].base_color.r/255 mats[1].base_color.g/255 mats[1].base_color.b/255 to:ssBuffer2
		if ClassOf mats[1].coat_map == Bitmaptexture then format ",\r\n\t\t\t\"clearCoatMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].coat_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"clearCoatFactor\": %" mats[1].coating to:ssBuffer2
		format ",\r\n\t\t\t\"clearCoatRoughnessFactor\": %" mats[1].coat_roughness to:ssBuffer2
		if ClassOf mats[1].emit_color_map == Bitmaptexture then format ",\r\n\t\t\t\"emissiveMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].emit_color_map.fileName) to:ssBuffer2
		if ClassOf mats[1].metalness_map == Bitmaptexture then format ",\r\n\t\t\t\"metallicMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].metalness_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"metallicFactor\": %" mats[1].metalness to:ssBuffer2
		if ClassOf mats[1].bump_map == Normal_Bump do if ClassOf mats[1].bump_map.normal_map == Bitmaptexture do format ",\r\n\t\t\t\"normalMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].bump_map.normal_map.fileName) to:ssBuffer2
		if ClassOf mats[1].roughness_map == Bitmaptexture then format ",\r\n\t\t\t\"roughnessMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].roughness_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"roughnessFactor\": %" mats[1].roughness to:ssBuffer2
		if ClassOf mats[1].transparency_map == Bitmaptexture then format "\r\n\t\t\t\"opacityMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[1].transparency_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"opacityFactor\": %" (1 - mats[1].transparency) to:ssBuffer2
		format "\r\n\t\t}" to:ssBuffer2
		format "\r\n\t]" to:ssBuffer2
		format ",\r\n\t\"version\": 1.5" to:ssBuffer2
		format "\r\n}" to:ssBuffer2
	)
	if mats.count > 1 do for i = 2 to mats.count do
	(
		format "\r\n\"%\":" mats[i].name to:ssBuffer2
		format "\r\n{" to:ssBuffer2
		format "\r\n\t\"name\": \"%\"" mats[i].name to:ssBuffer2
		format ",\r\n\t\"mapTo\": \"%\"" mats[i].name to:ssBuffer2
		format ",\r\n\t\"class\": \"Material\"" to:ssBuffer2
		format ",\r\n\t\"Stages\":" to:ssBuffer2
		format "\r\n\t[" to:ssBuffer2
		format "\r\n\t\t{" to:ssBuffer2
		if ClassOf mats[i].base_color_map == Bitmaptexture then format "\r\n\t\t\t\"baseColorMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].base_color_map.fileName) to:ssBuffer2 else format "\r\n\t\t\t\"baseColorFactor\": [%, %, %, 1]" mats[i].base_color.r/255 mats[i].base_color.g/255 mats[i].base_color.b/255 to:ssBuffer2
		if ClassOf mats[i].coat_map == Bitmaptexture then format ",\r\n\t\t\t\"clearCoatMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].coat_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"clearCoatFactor\": %" mats[i].coating to:ssBuffer2
		format ",\r\n\t\t\t\"clearCoatRoughnessFactor\": %" mats[i].coat_roughness to:ssBuffer2
		if ClassOf mats[i].emit_color_map == Bitmaptexture then format ",\r\n\t\t\t\"emissiveMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].emit_color_map.fileName) to:ssBuffer2
		if ClassOf mats[i].metalness_map == Bitmaptexture then format ",\r\n\t\t\t\"metallicMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].metalness_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"metallicFactor\": %" mats[i].metalness to:ssBuffer2
		if ClassOf mats[i].bump_map == Normal_Bump do if ClassOf mats[i].bump_map.normal_map == Bitmaptexture do format ",\r\n\t\t\t\"normalMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].bump_map.normal_map.fileName) to:ssBuffer2
		if ClassOf mats[i].roughness_map == Bitmaptexture then format ",\r\n\t\t\t\"roughnessMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].roughness_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"roughnessFactor\": %" mats[i].roughness to:ssBuffer2
		if ClassOf mats[i].transparency_map == Bitmaptexture then format "\r\n\t\t\t\"opacityMap\": \"/vehicles/%/%\"" vPath (filenameFromPath mats[i].transparency_map.fileName) to:ssBuffer2 else format ",\r\n\t\t\t\"opacityFactor\": %" (1 - mats[i].transparency) to:ssBuffer2
		format "\r\n\t\t}" to:ssBuffer2
		format "\r\n\t]" to:ssBuffer2
		format ",\r\n\t\"version\": 1.5" to:ssBuffer2
		format "\r\n}" to:ssBuffer2
	)
	format "\r\n}" to:ssBuffer2
)