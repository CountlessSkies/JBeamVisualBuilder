global RL_Visualize

fn  ViewportNodeNameDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.name as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportNodeWeightDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGnodeWeight as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportCollisionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGcollision as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportSelfCollisionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGselfCollision as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportNodeGroupDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGgroup as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportFrictionCoefDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGfrictionCoef as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportNodeMaterialDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGnodeMaterial as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportFixedDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGfixed as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportNodeBreakGroupDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGbreakGroup as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportCouplerLockDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGcouplerLock as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportImportElectricsDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGimportElectrics as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportImportInputsDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGimportInputs as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportSurfaceCoefDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGsurfaceCoef as string) color:Red
    )
    gw.UpdateScreen()
)
fn  ViewportNodeVolumeCoefDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == Dummy do
    (
        gw.text obj.pos (obj.BNGvolumeCoef as string) color:Red
    )
    gw.UpdateScreen()
)
-- beams
fn  ViewportBeamTypeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamType as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamSpringDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamSpring as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamDampDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamDamp as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamStrengthDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamStrength as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamDeformDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamDeform as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamPrecompressionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamPrecompression as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamPrecompressionRangeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamPrecompressionRange as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamPrecompressionTimeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamPrecompressionTime as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamBreakGroupDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbreakGroup as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBreakGroupTypeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbreakGroupType as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDampCutoffHzDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdampCutoffHz as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDeformLimitDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdeformLimit as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDeformLimitExpansionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdeformLimitExpansion as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamOptionalDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGoptional as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDeformGroupDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdeformGroup as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDeformationTriggerRatioDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdeformationTriggerRatio as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamLongBoundDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamLongBound as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamShortBoundDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamShortBound as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBoundZoneDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGboundZone as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamLongBoundRangeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamLongBoundRange as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamShortBoundRangeDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamShortBoundRange as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamLimitSpringDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamLimitSpring as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamLimitDampDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamLimitDamp as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamLimitDampReboundDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamLimitDampRebound as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamDampFastDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamDampFast as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamDampReboundFastDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamDampReboundFast as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamDampVelocitySplitDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGbeamDampVelocitySplit as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportPressureDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGpressure as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportPressurePSIDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGpressurePSI as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportSurfaceDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGsurface as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportBeamVolumeCoefDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGvolumeCoef as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportMaxPressureDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGmaxPressure as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportMaxPressurePSIDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGmaxPressurePSI as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportPressureDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGpressure as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportSpringExpansionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGspringExpansion as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportDampExpansionDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGdampExpansion as string) color:White
    )
    gw.UpdateScreen()
)
fn  ViewportTransitionZoneDisplay =
(
    gw.setTransform (Matrix3 1)
    for obj in objects where ClassOf obj == SplineShape do
    (
        gw.text obj.center (obj.BNGtransitionZone as string) color:White
    )
    gw.UpdateScreen()
)

-- create rollout visualize
rollout RL_Visualize "Visualize" width:300 height:850
(
	group "Nodes" (
	checkbutton UInodeName "name" across:2 width:135 align:#left
	checkbutton UInodeWeight "nodeWeight" width:135 align:#right
	checkbutton UIcollision "collision" across:2 width:135 align:#left
	checkbutton UIselfCollision "selfCollision" width:135 align:#right
	checkbutton UInodeGroup "group" across:2 width:135 align:#left
	checkbutton UIfrictionCoef "frictionCoef" width:135 align:#right
	checkbutton UInodeMaterial "nodeMaterial" across:2 width:135 align:#left
	checkbutton UIfixed "fixed" width:135 align:#right
	checkbutton UInodeBreakGroup "breakGroup" across:2 width:135 align:#left
	checkbutton UIcouplerLock "couplerLock" width:135 align:#right
	checkbutton UIimportElectrics "importElectrics" across:2 width:135 align:#left
	checkbutton UIimportInputs "importInputs" width:135 align:#right
	checkbutton UIsurfaceCoef "surfaceCoef" across:2 width:135 align:#left
	checkbutton UInodeVolumeCoef "volumeCoef" width:135 align:#right
	)
	group "Beams" (
	checkbutton UIbeamType "beamType"  across:2 width:135 align:#left
	checkbutton UIbeamSpring "beamSpring"  width:135 align:#right
	checkbutton UIbeamDamp "beamDamp"  across:2 width:135 align:#left
	checkbutton UIbeamStrength "beamStrength"  width:135 align:#right
	checkbutton UIbeamDeform "beamDeform"  across:2 width:135 align:#left
	checkbutton UIbeamPrecompression "beamPrecompression"  width:135 align:#right
	checkbutton UIbeamPrecompressionRange "beamPrecompressionRange"  across:2 width:135 align:#left
	checkbutton UIbeamPrecompressionTime "beamPrecompressionTime"  width:135 align:#right
	checkbutton UIbeamBreakGroup "breakGroup"  across:2 width:135 align:#left
	checkbutton UIbreakGroupType "breakGroupType"  width:135 align:#right
	checkbutton UIdampCutoffHz "dampCutoffHz"  across:2 width:135 align:#left
	checkbutton UIdeformLimit "deformLimit"  width:135 align:#right
	checkbutton UIdeformLimitExpansion "deformLimitExpansion"  across:2 width:135 align:#left
	checkbutton UIbeamOptional "optional"  width:135 align:#right
	checkbutton UIdeformGroup "deformGroup"  across:2 width:135 align:#left
	checkbutton UIdeformationTriggerRatio "deformationTriggerRatio"  width:135 align:#right
	checkbutton UIbeamLongBound "beamLongBound"  across:2 width:135 align:#left
	checkbutton UIbeamShortBound "beamShortBound"  width:135 align:#right
	checkbutton UIboundZone "boundZone"  across:2 width:135 align:#left
	checkbutton UIbeamLongBoundRange "beamLongBoundRange"  width:135 align:#right
	checkbutton UIbeamShortBoundRange "beamShortBoundRange"  across:2 width:135 align:#left
	checkbutton UIbeamLimitSpring "beamLimitSpring"  width:135 align:#right
	checkbutton UIbeamLimitDamp "beamLimitDamp"  across:2 width:135 align:#left
	checkbutton UIbeamLimitDampRebound "beamLimitDampRebound"  width:135 align:#right
	checkbutton UIbeamDampFast "beamDampFast"  across:2 width:135 align:#left
	checkbutton UIbeamDampReboundFast "beamDampReboundFast"  width:135 align:#right
	checkbutton UIbeamDampVelocitySplit "beamDampVelocitySplit"  across:2 width:135 align:#left
	checkbutton UIpressure "pressure"  width:135 align:#right
	checkbutton UIpressurePSI "pressurePSI"  across:2 width:135 align:#left
	checkbutton UIsurface "surface"  width:135 align:#right
	checkbutton UIbeamVolumeCoef "volumeCoef"  across:2 width:135 align:#left
	checkbutton UImaxPressure "maxPressure"  width:135 align:#right
	checkbutton UImaxPressurePSI "maxPressurePSI"  across:2 width:135 align:#left
	checkbutton UIspringExpansion "springExpansion"  width:135 align:#right
	checkbutton UIdampExpansion "dampExpansion"  across:2 width:135 align:#left
	checkbutton UItransitionZone "transitionZone"  width:135 align:#right
	)
	group "Triangles" (
	checkbutton UIdragCoef "dragCoef"  across:2 width:135 align:#left
	checkbutton UILiftCoef "LiftCoef"  width:135 align:#right
	checkbutton UIstallAngle "stallAngle"  across:2 width:135 align:#left
	checkbutton UItriangleType "triangleType"  width:135 align:#right
	checkbutton UIpressureGroup "pressureGroup"  across:2 width:135 align:#left
	checkbutton UItrisBreakGroup "breakGroup"  width:135 align:#right
	checkbutton UItrisOptional "optional"  across:2 width:135 align:#left
	checkbutton UIgroundModel "groundModel"  width:135 align:#right
	)
	on UInodeName changed state do if state == on then registerRedrawViewsCallback ViewportNodeNameDisplay else unregisterRedrawViewsCallback ViewportNodeNameDisplay
	on UInodeWeight changed state do if state == on then registerRedrawViewsCallback ViewportNodeWeightDisplay else unregisterRedrawViewsCallback ViewportNodeWeightDisplay
	on UIcollision changed state do if state == on then registerRedrawViewsCallback ViewportCollisionDisplay else unregisterRedrawViewsCallback ViewportCollisionDisplay
	on UIselfCollision changed state do if state == on then registerRedrawViewsCallback ViewportSelfCollisionDisplay else unregisterRedrawViewsCallback ViewportSelfCollisionDisplay
	on UInodeGroup changed state do if state == on then registerRedrawViewsCallback ViewportNodeGroupDisplay else unregisterRedrawViewsCallback ViewportNodeGroupDisplay
	on UIfrictionCoef changed state do if state == on then registerRedrawViewsCallback ViewportFrictionCoefDisplay else unregisterRedrawViewsCallback ViewportFrictionCoefDisplay
	on UInodeMaterial changed state do if state == on then registerRedrawViewsCallback ViewportNodeMaterialDisplay else unregisterRedrawViewsCallback ViewportNodeMaterialDisplay
	on UIfixed changed state do if state == on then registerRedrawViewsCallback ViewportFixedDisplay else unregisterRedrawViewsCallback ViewportFixedDisplay
	on UInodeBreakGroup changed state do if state == on then registerRedrawViewsCallback ViewportNodeBreakGroupDisplay else unregisterRedrawViewsCallback ViewportNodeBreakGroupDisplay
	on UIcouplerLock changed state do if state == on then registerRedrawViewsCallback ViewportCouplerLockDisplay else unregisterRedrawViewsCallback ViewportCouplerLockDisplay
	on UIimportElectrics changed state do if state == on then registerRedrawViewsCallback ViewportImportElectricsDisplay else unregisterRedrawViewsCallback ViewportImportElectricsDisplay
	on UIimportInputs changed state do if state == on then registerRedrawViewsCallback ViewportImportInputsDisplay else unregisterRedrawViewsCallback ViewportImportInputsDisplay
	on UIsurfaceCoef changed state do if state == on then registerRedrawViewsCallback ViewportSurfaceCoefDisplay else unregisterRedrawViewsCallback ViewportSurfaceCoefDisplay
	on UInodeVolumeCoef changed state do if state == on then registerRedrawViewsCallback ViewportNodeVolumeCoefDisplay else unregisterRedrawViewsCallback ViewportNodeVolumeCoefDisplay
	on UIbeamType changed state do if state == on then registerRedrawViewsCallback ViewportBeamTypeDisplay else unregisterRedrawViewsCallback ViewportBeamTypeDisplay
	on UIbeamSpring changed state do if state == on then registerRedrawViewsCallback ViewportBeamSpringDisplay else unregisterRedrawViewsCallback ViewportBeamSpringDisplay
	on UIbeamDamp changed state do if state == on then registerRedrawViewsCallback ViewportBeamDampDisplay else unregisterRedrawViewsCallback ViewportBeamDampDisplay
	on UIbeamStrength changed state do if state == on then registerRedrawViewsCallback ViewportBeamStrengthDisplay else unregisterRedrawViewsCallback ViewportBeamStrengthDisplay
	on UIbeamDeform changed state do if state == on then registerRedrawViewsCallback ViewportBeamDeformDisplay else unregisterRedrawViewsCallback ViewportBeamDeformDisplay
	on UIbeamPrecompression changed state do if state == on then registerRedrawViewsCallback ViewportBeamPrecompressionDisplay else unregisterRedrawViewsCallback ViewportBeamPrecompressionDisplay
	on UIbeamPrecompressionRange changed state do if state == on then registerRedrawViewsCallback ViewportbeamPrecompressionRangeDisplay else unregisterRedrawViewsCallback ViewportbeamPrecompressionRangeDisplay
	on UIbeamPrecompressionTime changed state do if state == on then registerRedrawViewsCallback ViewportbeamPrecompressionTimeDisplay else unregisterRedrawViewsCallback ViewportbeamPrecompressionTimeDisplay
	on UIbeamBreakGroup changed state do if state == on then registerRedrawViewsCallback ViewportBeamBreakGroupDisplay else unregisterRedrawViewsCallback ViewportBeamBreakGroupDisplay
	on UIbreakGroupType changed state do if state == on then registerRedrawViewsCallback ViewportBreakGroupTypeDisplay else unregisterRedrawViewsCallback ViewportBreakGroupTypeDisplay
	on UIdampCutoffHz changed state do if state == on then registerRedrawViewsCallback ViewportDampCutoffHzDisplay else unregisterRedrawViewsCallback ViewportDampCutoffHzDisplay
	on UIdeformLimit changed state do if state == on then registerRedrawViewsCallback ViewportDeformLimitDisplay else unregisterRedrawViewsCallback ViewportDeformLimitDisplay
	on UIdeformLimitExpansion changed state do if state == on then registerRedrawViewsCallback ViewportDeformLimitExpansionDisplay else unregisterRedrawViewsCallback ViewportDeformLimitExpansionDisplay
	on UIbeamOptional changed state do if state == on then registerRedrawViewsCallback ViewportBeamOptionalDisplay else unregisterRedrawViewsCallback ViewportBeamOptionalDisplay
	on UIdeformGroup changed state do if state == on then registerRedrawViewsCallback ViewportDeformGroupDisplay else unregisterRedrawViewsCallback ViewportDeformGroupDisplay
	on UIdeformationTriggerRatio changed state do if state == on then registerRedrawViewsCallback ViewportDeformationTriggerRatioDisplay else unregisterRedrawViewsCallback ViewportDeformationTriggerRatioDisplay
	on UIbeamLongBound changed state do if state == on then registerRedrawViewsCallback ViewportBeamLongBoundDisplay else unregisterRedrawViewsCallback ViewportBeamLongBoundDisplay
	on UIbeamShortBound changed state do if state == on then registerRedrawViewsCallback ViewportBeamShortBoundDisplay else unregisterRedrawViewsCallback ViewportBeamShortBoundDisplay
	on UIboundZone changed state do if state == on then registerRedrawViewsCallback ViewportBoundZoneDisplay else unregisterRedrawViewsCallback ViewportBoundZoneDisplay
	on UIbeamLongBoundRange changed state do if state == on then registerRedrawViewsCallback ViewportBeamLongBoundRangeDisplay else unregisterRedrawViewsCallback ViewportBeamLongBoundRangeDisplay
	on UIbeamShortBoundRange changed state do if state == on then registerRedrawViewsCallback ViewportBeamShortBoundRangeDisplay else unregisterRedrawViewsCallback ViewportBeamShortBoundRangeDisplay
	on UIbeamLimitSpring changed state do if state == on then registerRedrawViewsCallback ViewportBeamLimitSpringDisplay else unregisterRedrawViewsCallback ViewportBeamLimitSpringDisplay
	on UIbeamLimitDamp changed state do if state == on then registerRedrawViewsCallback ViewportBeamLimitDampDisplay else unregisterRedrawViewsCallback ViewportBeamLimitDampDisplay
	on UIbeamLimitDampRebound changed state do if state == on then registerRedrawViewsCallback ViewportBeamLimitDampReboundDisplay else unregisterRedrawViewsCallback ViewportBeamLimitDampReboundDisplay
	on UIbeamDampFast changed state do if state == on then registerRedrawViewsCallback ViewportBeamDampFastDisplay else unregisterRedrawViewsCallback ViewportBeamDampFastDisplay
	on UIbeamDampReboundFast changed state do if state == on then registerRedrawViewsCallback ViewportBeamDampReboundFastDisplay else unregisterRedrawViewsCallback ViewportBeamDampReboundFastDisplay
	on UIbeamDampVelocitySplit changed state do if state == on then registerRedrawViewsCallback ViewportBeamDampVelocitySplitDisplay else unregisterRedrawViewsCallback ViewportBeamDampVelocitySplitDisplay
	on UIpressure changed state do if state == on then registerRedrawViewsCallback ViewportPressureDisplay else unregisterRedrawViewsCallback ViewportPressureDisplay
	on UIpressurePSI changed state do if state == on then registerRedrawViewsCallback ViewportPressurePSIDisplay else unregisterRedrawViewsCallback ViewportPressurePSIDisplay
	on UIsurface changed state do if state == on then registerRedrawViewsCallback ViewportSurfaceDisplay else unregisterRedrawViewsCallback ViewportSurfaceDisplay
	on UIbeamVolumeCoef changed state do if state == on then registerRedrawViewsCallback ViewportBeamVolumeCoefDisplay else unregisterRedrawViewsCallback ViewportBeamVolumeCoefDisplay
	on UImaxPressure changed state do if state == on then registerRedrawViewsCallback ViewportMaxPressureDisplay else unregisterRedrawViewsCallback ViewportMaxPressureDisplay
	on UImaxPressurePSI changed state do if state == on then registerRedrawViewsCallback ViewportMaxPressurePSIDisplay else unregisterRedrawViewsCallback ViewportMaxPressurePSIDisplay
	on UIspringExpansion changed state do if state == on then registerRedrawViewsCallback ViewportSpringExpansionDisplay else unregisterRedrawViewsCallback ViewportSpringExpansionDisplay
	on UIdampExpansion changed state do if state == on then registerRedrawViewsCallback ViewportDampExpansionDisplay else unregisterRedrawViewsCallback ViewportDampExpansionDisplay
	on UItransitionZone changed state do if state == on then registerRedrawViewsCallback ViewportTransitionZoneDisplay else unregisterRedrawViewsCallback ViewportTransitionZoneDisplay
	
    on RL_Visualize close do
    (
        unregisterRedrawViewsCallback ViewportNodeNameDisplay
        unregisterRedrawViewsCallback ViewportNodeWeightDisplay
        unregisterRedrawViewsCallback ViewportCollisionDisplay
        unregisterRedrawViewsCallback ViewportSelfCollisionDisplay
        unregisterRedrawViewsCallback ViewportNodeGroupDisplay
        unregisterRedrawViewsCallback ViewportFrictionCoefDisplay
        unregisterRedrawViewsCallback ViewportNodeMaterialDisplay
        unregisterRedrawViewsCallback ViewportFixedDisplay
        unregisterRedrawViewsCallback ViewportNodeBreakGroupDisplay
        unregisterRedrawViewsCallback ViewportCouplerLockDisplay
        unregisterRedrawViewsCallback ViewportImportElectricsDisplay
        unregisterRedrawViewsCallback ViewportImportInputsDisplay
        unregisterRedrawViewsCallback ViewportSurfaceCoefDisplay
        unregisterRedrawViewsCallback ViewportNodeVolumeCoefDisplay
        unregisterRedrawViewsCallback ViewportBeamTypeDisplay
        unregisterRedrawViewsCallback ViewportBeamSpringDisplay
        unregisterRedrawViewsCallback ViewportBeamDampDisplay
        unregisterRedrawViewsCallback ViewportBeamStrengthDisplay
        unregisterRedrawViewsCallback ViewportBeamDeformDisplay
        unregisterRedrawViewsCallback ViewportBeamPrecompressionDisplay
        unregisterRedrawViewsCallback ViewportbeamPrecompressionRangeDisplay
        unregisterRedrawViewsCallback ViewportbeamPrecompressionTimeDisplay
        unregisterRedrawViewsCallback ViewportBeamBreakGroupDisplay
        unregisterRedrawViewsCallback ViewportBreakGroupTypeDisplay
        unregisterRedrawViewsCallback ViewportDampCutoffHzDisplay
        unregisterRedrawViewsCallback ViewportDeformLimitDisplay
        unregisterRedrawViewsCallback ViewportDeformLimitExpansionDisplay
        unregisterRedrawViewsCallback ViewportBeamOptionalDisplay
        unregisterRedrawViewsCallback ViewportDeformGroupDisplay
        unregisterRedrawViewsCallback ViewportDeformationTriggerRatioDisplay
        unregisterRedrawViewsCallback ViewportBeamLongBoundDisplay
        unregisterRedrawViewsCallback ViewportBeamShortBoundDisplay
        unregisterRedrawViewsCallback ViewportBoundZoneDisplay
        unregisterRedrawViewsCallback ViewportBeamLongBoundRangeDisplay
        unregisterRedrawViewsCallback ViewportBeamShortBoundRangeDisplay
        unregisterRedrawViewsCallback ViewportBeamLimitSpringDisplay
        unregisterRedrawViewsCallback ViewportBeamLimitDampDisplay
        unregisterRedrawViewsCallback ViewportBeamLimitDampReboundDisplay
        unregisterRedrawViewsCallback ViewportBeamDampFastDisplay
        unregisterRedrawViewsCallback ViewportBeamDampReboundFastDisplay
        unregisterRedrawViewsCallback ViewportBeamDampVelocitySplitDisplay
        unregisterRedrawViewsCallback ViewportPressureDisplay
        unregisterRedrawViewsCallback ViewportPressurePSIDisplay
        unregisterRedrawViewsCallback ViewportSurfaceDisplay
        unregisterRedrawViewsCallback ViewportBeamVolumeCoefDisplay
        unregisterRedrawViewsCallback ViewportMaxPressureDisplay
        unregisterRedrawViewsCallback ViewportMaxPressurePSIDisplay
        unregisterRedrawViewsCallback ViewportSpringExpansionDisplay
        unregisterRedrawViewsCallback ViewportDampExpansionDisplay
        unregisterRedrawViewsCallback ViewportTransitionZoneDisplay
    )
)