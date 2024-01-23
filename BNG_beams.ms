global RL_Beams, RL_BeamsEdit, RL_HydrosEdit

-- declare beam attributes default value
global BNGbeamTypeDef = "|NORMAL"
global BNGbeamSpringDef = "4300000"
global BNGbeamDampDef = "580"
global BNGbeamStrengthDef = "FLT_MAX"
global BNGbeamDeformDef = "220000"
global BNGbeamPrecompressionDef = "1"
global BNGbeamPrecompressionRangeDef = "0"
global BNGbeamPrecompressionTimeDef = "0"
global BNGbreakGroupTypeDef = "0"
global BNGdampCutoffHzDef = "0"
global BNGdeformLimitDef = "0"
global BNGdeformLimitExpansionDef = "0"
global BNGoptionalDef = false
global BNGdeformGroupDef = ""
global BNGdeformationTriggerRatioDef = "0"
global BNGbeamLongBoundDef = "1" -- duplicated attribute 2
global BNGbeamShortBoundDef = "1"
global BNGboundZoneDef = "1"
global BNGbeamLongBoundRangeDef = "0"
global BNGbeamShortBoundRangeDef = "0"
global BNGbeamLimitSpringDef = "1"
global BNGbeamLimitDampDef = "1"
global BNGbeamLimitDampReboundDef = "beamLimitDamp"
global BNGbeamDampReboundDef = "beamDamp"
global BNGbeamDampFastDef = "beamDamp"
global BNGbeamDampReboundFastDef = "beamDampRebound"
global BNGbeamDampVelocitySplitDef = "FLT_MAX"
global BNGsbBeamLongBoundDef = "1" -- duplicated attribute 2
global BNGpressureDef = "1"
global BNGpressurePSIDef = "1"
global BNGsurfaceDef = "1"
global BNGpbVolumeCoefDef = "1" -- duplicated attribute 1
global BNGmaxPressureDef = "FLT-MAX"
global BNGmaxPressurePSIDef = "FLT-MAX"
global BNGspringExpansionDef = "beamSpring"
global BNGdampExpansionDef = "beamDamp"
global BNGtransitionZoneDef = "0"
global BNGabBeamLongBoundDef = "FLT-MAX" -- duplicated attribute 2

-- declare hydros attributes default value
global BNGinputSourceDef = "steering_input"
global BNGfactorDef = "0"
global BNGoutLimitDef = "1"
global BNGinLimitDef = "1"
global BNGinputFactorDef = "1"
global BNGinputCenterDef = "0"
global BNGinRateDef = "1"
global BNGoutRateDef = "1"
global BNGsteeringWheelLockDef = "450"

-- create beam attributes
beamAttrib = attributes beam
(
    parameters main rollout:params
    (
		/* BNGid1 type: #string default:""
		BNGid2 type: #string default:"" */
		BNGbeamType type: #string default:BNGbeamTypeDef
		dd type: #integer ui:UIbeamType default:1
		BNGbeamSpring type: #string ui:UIbeamSpring default:BNGbeamSpringDef
		BNGbeamDamp type: #string ui:UIbeamDamp default:BNGbeamDampDef
		BNGbeamStrength type: #string ui:UIbeamStrength default:BNGbeamStrengthDef
		BNGbeamDeform type: #string ui:UIbeamDeform default:BNGbeamDeformDef
		BNGbeamPrecompression type: #string ui:UIbeamPrecompression default:BNGbeamPrecompressionDef
		BNGbeamPrecompressionRange type: #string ui:UIbeamPrecompressionRange default:BNGbeamPrecompressionRangeDef
		BNGbeamPrecompressionTime type: #string ui:UIbeamPrecompressionTime default:BNGbeamPrecompressionTimeDef
		BNGbreakGroup type: #string ui:UIbreakGroup default:BNGbreakGroupDef
		BNGbreakGroupType type: #string ui:UIbreakGroupType default:BNGbreakGroupTypeDef
		BNGdampCutoffHz type: #string ui:UIdampCutoffHz default:BNGdampCutoffHzDef
		BNGdeformLimit type: #string UI:UIdeformLimit default:BNGdeformLimitDef
		BNGdeformLimitExpansion type: #string UI:UIdeformLimitExpansion default:BNGdeformLimitExpansionDef
		BNGoptional type: #boolean UI:UIoptional default:BNGoptionalDef
		BNGdeformGroup type: #string ui:UIdeformGroup default:BNGdeformGroupDef
		BNGdeformationTriggerRatio type: #string UI:UIdeformationTriggerRatio default:BNGdeformationTriggerRatioDef
		BNGbeamLongBound type: #string ui:UIbeamLongBound default:BNGbeamLongBoundDef
		BNGbeamShortBound type: #string ui:UIbeamShortBound default:BNGbeamShortBoundDef
		BNGboundZone type: #string ui:UIboundZone default:BNGboundZoneDef
		BNGbeamLongBoundRange type: #string ui:UIbeamLongBoundRange default:BNGbeamLongBoundRangeDef
		BNGbeamShortBoundRange type: #string ui:UIbeamShortBoundRange default:BNGbeamSHortBoundRangeDef
		BNGbeamLimitSpring type: #string ui:UIbeamLimitSpring default:BNGbeamLimitSpringDef
		BNGbeamLimitDamp type: #string ui:UIbeamLimitDamp default:BNgbeamLimitDampDef
		BNGbeamLimitDampReBound type: #string ui:UIbeamLimitDampRebound default:BNGbeamLimitDampReboundDef
		BNGbeamDampRebound type: #string ui:UIbeamDampRebound default:BNGbeamDampReboundDef
		BNGbeamDampFast type: #string ui:UIbeamDampFast default:BNGbeamDampFastDef
		BNGbeamDampReboundFast type: #string ui:UIbeamDampReboundFast default:BNGbeamDampReboundFastDef
		BNGbeamDampVelocitySplit type: #string ui:UIbeamDampVelocitySplit default:BNGbeamDampVelocitySplitDef
		BNGpressure type: #string ui:UIpressure default:BNGpressureDef
		BNGpressurePSI type: #string ui:UIpressurePSI default:BNGpressurePSIDef
		BNGsurface type: #string ui:UIsurface default:BNGsurfaceDef
		BNGvolumeCoef type: #string ui:UIvolumeCoef default:BNGpbVolumeCoefDef
		BNGmaxPressure type: #string ui:UImaxPressure default:BNGmaxPressureDef
		BNGmaxPressurePSI type: #string ui:UImaxPressurePSI default:BNGmaxPressurePSIDef
		BNGspringExpansion type: #string ui:UIspringExpansion default:BNGspringExpansionDef
		BNGdampExpansion type: #string ui:UIdampExpansion default:BNGdampExpansionDef
		BNGtransitionZone type: #string ui:UItransitionZone default:BNGtransitionZoneDef
    )
    rollout params "Beams"
    (
		/* edittext UIid1 "id1" text:""
		edittext UIid2 "id2" text:"" */
		dropdownlist UIbeamType "beamType" items: #("|NORMAL", "|HYDRO", "|ANISOTROPIC", "|BOUNDED", "|PRESSURED", "|SUPPORT", "|BROKEN", "|LBEAM")
		on UIbeamType selected i do BNGbeamType = UIbeamType.items[i]
		edittext UIbeamSpring "beamSpring"
		edittext UIbeamDamp "beamDamp"
		edittext UIbeamStrength "beamStrength"
		edittext UIbeamDeform "beamDeform"
		edittext UIbeamPrecompression "beamPrecompression"
		edittext UIbeamPrecompressionRange "beamPrecompressionRange"
		edittext UIbeamPrecompressionTime "beamPrecompressionTime" 
		edittext UIbreakGroup "breakGroup"
		edittext UIbreakGroupType "breakGroupType" 
		edittext UIdampCutoffHz "dampCutoffHz" 
		edittext UIdeformLimit "deformLimit" 
		edittext UIdeformLimitExpansion "deformLimitExpansion" 
		checkbox UIoptional "optional"
		edittext UIdeformGroup "deformGroup"
		edittext UIdeformationTriggerRatio "deformationTriggerRatio" 
		edittext UIbeamLongBound "beamLongBound" 
		edittext UIbeamShortBound "beamShortBound" 
		edittext UIboundZone "boundZone" 
		edittext UIbeamLongBoundRange "beamLongBoundRange" 
		edittext UIbeamShortBoundRange "beamShortBoundRange" 
		edittext UIbeamLimitSpring "beamLimitSpring" 
		edittext UIbeamLimitDamp "beamLimitDamp" 
		edittext UIbeamLimitDampRebound "beamLimitDampRebound"
		edittext UIbeamDampRebound "beamDampRebound"
		edittext UIbeamDampFast "beamDampFast"
		edittext UIbeamDampReboundFast "beamDampReboundFast"
		edittext UIbeamDampVelocitySplit "beamDampVelocitySplit"
		edittext UIpressure "pressure" 
		edittext UIpressurePSI "pressurePSI" 
		edittext UIsurface "surface" 
		edittext UIvolumeCoef "volumeCoef" 
		edittext UImaxPressure "maxPressure"
		edittext UImaxPressurePSI "maxPressurePSI"
		edittext UIspringExpansion "springExpansion"
		edittext UIdampExpansion "dampExpansion"
		edittext UItransitionZone "transitionZone" 
    )
)

-- create hyro attributes
hydroAttrib = attributes hydro
(
	parameters main rollout:params
	(
		BNGinputSource type: #string ui:UIinputSource default:BNGinputSourceDef
		BNGfactor type: #string ui:UIfactor default:BNGfactorDef
		BNGoutLimit type: #string ui:UIoutLimit default:BNGoutLimitDef
		BNGinLimit type: #string ui:UIinLimit default:BNGinLimitDef
		BNGinputFactor type: #string ui:UIinputFactor default:BNGinputFactorDef
		BNGinputCenter type: #string ui:UIinputCenter default:BNGinputCenterDef
		BNGinRate type: #string ui:UIinRate default:BNGinRateDef
		BNGoutRate type: #string ui:UIoutRate default:BNGoutRateDef
		BNGsteeringWheelLock type: #string ui:UIsteeringWheelLock default:BNGsteeringWheelLockDef
	)
	rollout params "Hydros"
	(
		edittext UIinputSource "inputSource"
		edittext UIfactor "factor" 
		edittext UIoutLimit "outLimit" 
		edittext UIinLimit "inLimit" 
		edittext UIinputFactor "inputFactor" 
		edittext UIinputCenter "inputCenter" 
		edittext UIinRate "inRate" 
		edittext UIoutRate "outRate" 
		edittext UIsteeringWheelLock "steeringWheelLock"
	)
)

-- rollout beam attribute edit
rollout RL_BeamsEdit "Beams Attribute Edit" width:300 height:910
(
	label lbl_1 "Label"  visible:false
	dropdownList UIbeamType "beamType"  items:#("|NORMAL", "|HYDRO", "|ANISOTROPIC", "|BOUNDED", "|PRESSURED", "|PRESSURED", "|SUPPORT", "|BROKEN", "|LBEAM")
	edittext UIbeamSpring "beamSpring" text:BNGbeamSpringDef align:#right width:198
	edittext UIbeamDamp "beamDamp" text:BNGbeamDampDef align:#right width:195
	edittext UIbeamStrength "beamStrength" text:BNGbeamStrengthDef align:#right width:210
	edittext UIbeamDeform "beamDeform" text:BNGbeamDeformDef align:#right width:203
	edittext UIbeamPrecompression "beamPrecompression" text:BNGbeamPrecompressionDef align:#right width:243
	edittext UIbeamPrecompressionRange "beamPrecompressionRange" text:BNGbeamPrecompressionRangeDef
	edittext UIbeamPrecompressionTime "beamPrecompressionTime" text:BNGbeamPrecompressionTimeDef align:#right width:265
	edittext UIbreakGroup "breakGroup" text:BNGbreakGroupDef align:#right width:198
	edittext UIbreakGroupType "breakGroupType" text:BNGbreakGroupTypeDef align:#right width:222
	edittext UIdampCutoffHz "dampCutoffHz" text:BNGdampCutoffHzDef align:#right width:211
	edittext UIdeformLimit "deformLimit" text:BNGdeformLimitDef align:#right width:197
	edittext UIdeformLimitExpansion "deformLimitExpansion" text:BNGdeformLimitExpansionDef align:#right width:246
	checkbox UIoptional "optional" checked:BNGoptionalDef offset:[134,0]
	edittext UIdeformGroup "deformGroup" text:BNGdeformGroupDef align:#right width:205
	edittext UIdeformationTriggerRatio "deformationTriggerRatio" text:BNGdeformationTriggerRatioDef align:#right width:259
	edittext UIbeamLongBound "beamLongBound" text:BNGbeamLongBoundDef align:#right width:221
	edittext UIbeamShortBound "beamShortBound" text:BNGbeamShortBoundDef align:#right width:224
	edittext UIboundZone "boundZone" text:BNGboundZoneDef align:#right width:196
	edittext UIbeamLongBoundRange "beamLongBoundRange" text:BNGbeamLongBoundRangeDef align:#right width:252
	edittext UIbeamShortBoundRange "beamShortBoundRange" text:BNGbeamShortBoundRangeDef align:#right width:255
	edittext UIbeamLimitSpring "beamLimitSpring" text:BNGbeamLimitSpringDef align:#right width:219
	edittext UIbeamLimitDamp "beamLimitDamp" text:BNGbeamLimitDampDef align:#right width:216
	edittext UIbeamLimitDampRebound "beamLimitDampRebound" text:BNGbeamLimitDampReboundDef align:#right width:259
	edittext UIbeamDampRebound "beamDampRebound" text:BNGbeamDampReboundDef align:#right width:238
	edittext UIbeamDampFast "beamDampFast" text:BNGbeamDampFastDef align:#right width:216
	edittext UIbeamDampReboundFast "beamDampReboundFast" text:BNGbeamDampReboundFastDef align:#right width:259
	edittext UIbeamDampVelocitySplit "beamDampVelocitySplit" text:BNGbeamDampVelocitySplitDef align:#right width:252
	edittext UIpressure "pressure" text:BNGpressureDef align:#right width:184
	edittext UIpressurePSI "pressurePSI" text:BNGpressurePSIDef align:#right width:200
	edittext UIsurface "surface" text:BNGsurfaceDef align:#right width:178
	edittext UIvolumeCoef "volumeCoef" text:BNGpBVolumeCoefDef align:#right width:199
	edittext UImaxPressure "maxPressure" text:BNGmaxPressureDef align:#right width:204
	edittext UImaxPressurePSI "maxPressurePSI" text:BNGmaxPressurePSIDef align:#right width:220
	edittext UIspringExpansion "springExpansion" text:BNGspringExpansionDef align:#right width:220
	edittext UIdampExpansion "dampExpansion" text:BNGdampExpansionDef align:#right width:217
	edittext UItransitionZone "transitionZone" text:BNGtransitionZoneDef align:#right width:211
	edittext UIhubTreadBeam "hubTreadBeam"  width:214 align:#right text:BNGhubTreadBeamDef
	edittext hubPeripheryBeam "hubPeripheryBeam"  width:232 align:#right text:BNGhubPeripheryBeamDef
	edittext hubSideBeam "hubSideBeam"  width:206 align:#right text:BNGhubSideBeamDef
	edittext UIwheelTreadBeam "wheelTreadBeam"  width:224 align:#right text:BNGwheelTreadBeamDef
	edittext UIwheelTreadReinfBeam "wheelTreadReinfBeam"  width:249 align:#right text:BNGwheelTreadReinfBeamDef
	edittext UIwheelPeripheryBeam "wheelPeripheryBeam"  width:242 align:#right text:BNGwheelPeripheryBeamDef
	edittext UIwheelSideBeam "wheelSideBeam"  width:216 align:#right text:BNGwheelSideBeamDef
	edittext UIwheelSideBeamExpansion "wheelSideBeamExpansion"  width:265 align:#right text:BNGwheelSideBeamExpansionDef
	edittext UIwheelSideReinfBeam "wheelSideReinfBeam"  width:241 align:#right text:BNGwheelSideReinfBeamDef
	edittext UIwheelSideReinfBeamExpansion "whSideReinfBeamExpansion" width:276 align:#right text:BNGwheelSideReinfBeamExpansionDef
	edittext UIwheelReinfBeam "wheelReinfBeam"  width:221 align:#right text:BNGwheelReinfBeamDef
	label lbl_2 "Label"  visible:false
	button UIreset "Reset"  width:274 align:#center

	on UIbeamType selected i do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamType = UIbeamType.items[i]
	on UIbeamSpring changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamSpring = UIbeamSpring.text
	on UIbeamDamp changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDamp = UIbeamDamp.text			
	on UIbeamStrength changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamStrength = UIbeamStrength.text
	on UIbeamDeform changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDeform = UIbeamDeform.text
	on UIbeamPrecompression changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamPrecompression = UIbeamPrecompression.text
	on UIbeamPrecompressionRange changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamPrecompressionRange = UIbeamPrecompressionRange.text
	on UIbeamPrecompressionTime changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamPrecompressionTime = UIbeamPrecompressionTime.text
	on UIbreakGroup changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbreakGroup = UIbreakGroup.text
	on UIbreakGroupType changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbreakGroupType = UIbreakGroupType.text
	on UIdampCutoffHz changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdampCutoffHz = UIdampCutoffHz.text
	on UIdeformLimit changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdeformLimit = UIdeformLimit.text
	on UIdeformLimitExpansion changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdeformLimitExpansion = UIdeformLimitExpansion.text
	on UIoptional changed state do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGoptional = UIoptional.checked
	on UIdeformGroup changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdeformGroup = UIdeformGroup.text
	on UIdeformationTriggerRatio changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdeformationTriggerRatio = UIdeformationTriggerRatio.text
	on UIbeamLongBound changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamLongBound = UIbeamLongBound.text
	on UIbeamShortBound changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamShortBound = UIbeamShortBound.text
	on UIboundZone changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGboundZone = UIboundZone.text
	on UIbeamLongBoundRange changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamLongBoundRange = UIbeamLongBoundRange.text
	on UIbeamShortBoundRange changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamShortBoundRange = UIbeamShortBoundRange.text
	on UIbeamLimitSpring changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamLimitSpring = UIbeamLimitSpring.text
	on UIbeamLimitDamp changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamLimitDamp = UIbeamLimitDamp.text
	on UIbeamLimitDampRebound changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamLimitDampRebound = UIbeamLimitDampRebound.text
	on UIbeamDampRebound changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDampRebound = UIbeamDampRebound.text
	on UIbeamDampFast changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDampFast = UIbeamDampFast.text
	on UIbeamDampReboundFast changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDampReboundFast = UIbeamDampReboundFast.text
	on UIbeamDampVelocitySplit changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGbeamDampVelocitySplit = UIbeamDampVelocitySplit.text
	on UIpressure changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGpressure = UIpressure.text
	on UIpressurePSI changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGpressurePSI = UIpressurePSI.text
	on UIsurface changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGsurface = UIsurface.text
	on UIvolumeCoef changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGvolumeCoef = UIvolumeCoef.text
	on UImaxPressure changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGmaxPressure = UImaxPressure.text
	on UImaxPressurePSI changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGmaxPressurePSI = UImaxPressurePSI.text
	on UIspringExpansion changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGspringExpansion = UIspringExpansion.text
	on UIdampExpansion changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGdampExpansion = UIdampExpansion.text
	on UItransitionZone changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGtransitionZone = UItransitionZone.text
	on UIhubTreadBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGhubTreadBeam = UIhubTreadBeam.text
	on UIhubPeripheryBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGhubPeripheryBeam = UIhubPeripheryBeam.text
	on UIhubSideBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGhubSideBeam = UIhubSideBeam.text
	on UIwheelTreadBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelTreadBeam = UIwheelTreadBeam.text
	on UIwheelTreadReinfBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelTreadReinfBeam = UIwheelTreadReinfBeam.text
	on UIwheelPeripheryBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelPeripheryBeam = UIwheelPeripheryBeam.text
	on UIwheelSideBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelSideBeam = UIwheelSideBeam.text
	on UIwheelSideBeamExpansion changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelSideBeamExpansion = UIwheelSideBeamExpansion.text
	on UIwheelSideReinfBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelSideReinfBeam = UIwheelSideReinfBeam.text
	on UIwheelSideReinfBeamExpansion changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelSideReinfBeamExpansion = UIwheelSideReinfBeamExpansion.text
	on UIwheelReinfBeam changed txt do for obj in getCurrentSelection() where ClassOf obj == SplineShape do obj.BNGwheelReinfBeam = UIwheelReinfBeam.text

	on UIreset pressed do
	(
		UIbeamType.selection = 1
		UIbeamSpring.text = BNGbeamSpringDef
		UIbeamDamp.text = BNGbeamDampDef
		UIbeamStrength.text = BNGbeamStrengthDef
		UIbeamDeform.text = BNGbeamDeformDef
		UIbeamPrecompression.text = BNGbeamPrecompressionDef
		UIbeamPrecompressionRange.text = BNGbeamPrecompressionRangeDef
		UIbeamPrecompressionTime.text = BNGbeamPrecompressionTimeDef
		UIbreakGroup.text = BNGbreakGroupDef
		UIbreakGroupType.text = BNGbreakGroupTypeDef
		UIdampCutoffHz.text = BNGdampCutoffHzDef
		UIdeformLimit.text = BNGdeformLimitDef
		UIdeformLimitExpansion.text = BNGdeformLimitExpansionDef
		UIoptional.state = BNGoptionalDef
		UIdeformGroup.text = BNGdeformGroupDef
		UIdeformationTriggerRatio.text = BNGdeformationTriggerRatioDef
		UIbeamLongBound.text = BNGbeamLongBoundDef
		UIbeamShortBound.text = BNGbeamShortBoundDef
		UIboundZone.text = BNGboundZoneDef
		UIbeamLongBoundRange.text = BNGbeamLongBoundRangeDef
		UIbeamShortBoundRange.text = BNGbeamShortBoundRangeDef
		UIbeamLimitSpring.text = BNGbeamLimitSpringDef
		UIbeamLimitDamp.text = BNGbeamLimitDampDef
		UIbeamLimitDampRebound.text = BNGbeamLimitDampReboundDef
		UIbeamDampFast.text = BNGbeamDampFastDef
		UIbeamDampReboundFast.text = BNGbeamDampReboundFastDef
		UIbeamDampVelocitySplit.text = BNGbeamDampVelocitySplitDef
		UIpressure.text = BNGpressureDef
		UIpressurePSI.text = BNGpressurePSIDef
		UIsurface.text = BNGsurfaceDef
		UIvolumeCoef.text = BNGpBVolumeCoefDef
		UImaxPressure.text = BNGmaxPressureDef
		UImaxPressurePSI.text = BNGmaxPressurePSIDef
		UIspringExpansion.text = BNGspringExpansionDef
		UIdampExpansion.text = BNGdampExpansionDef
		UItransitionZone.text = BNGtransitionZoneDef
		UIhubTreadBeam.text = BNGhubTreadBeamDef
		UIhubPeripheryBeam.text  = BNGhubPeripheryBeamDef
		UIhubSideBeam.text = BNGhubPeripheryBeamDef
		UIwheelTreadBeam.text = BNGhubPeripheryBeamDef
		UIwheelTreadReinfBeam.text = BNGhubPeripheryBeamDef
		UIwheelPeripheryBeam.text = BNGhubPeripheryBeamDef
		UIwheelSideBeam.text = BNGhubPeripheryBeamDef
		UIwheelSideBeamExpansion.text = BNGhubPeripheryBeamDef
		UIwheelSideReinfBeam.text = BNGhubPeripheryBeamDef
		UIwheelSideReinfBeamExpansion.text = BNGhubPeripheryBeamDef
		UIwheelReinfBeam.text = BNGhubPeripheryBeamDef

		for obj in getCurrentSelection() where ClassOf obj == SplineShape do
		(
			obj.BNGbeamType = BNGbeamTypeDef
			obj.BNGbeamSpring = BNGbeamSpringDef
			obj.BNGbeamDamp = BNGbeamDampDef
			obj.BNGbeamStrength = BNGbeamStrengthDef
			obj.BNGbeamDeform = BNGbeamDeformDef
			obj.BNGbeamPrecompression = BNGbeamPrecompressionDef
			obj.BNGbeamPrecompressionRange = BNGbeamPrecompressionRangeDef
			obj.BNGbeamPrecompressionTime = BNGbeamPrecompressionTimeDef
			obj.BNGbreakGroup = BNGbreakGroupDef
			obj.BNGbreakGroupType = BNGbreakGroupTypeDef
			obj.BNGdampCutoffHz = BNGdampCutoffHzDef
			obj.BNGdeformLimit = BNGdeformLimitDef
			obj.BNGdeformLimitExpansion = BNGdeformLimitExpansionDef
			obj.BNGoptional = BNGoptionalDef
			obj.BNGdeformGroup = BNGdeformGroupDef
			obj.BNGdeformationTriggerRatio = BNGdeformationTriggerRatioDef
			obj.BNGbeamLongBound = BNGbeamLongBoundDef
			obj.BNGbeamShortBound = BNGbeamShortBoundDef
			obj.BNGboundZone = BNGboundZoneDef
			obj.BNGbeamLongBoundRange = BNGbeamLongBoundRangeDef
			obj.BNGbeamShortBoundRange = BNGbeamShortBoundRangeDef
			obj.BNGbeamLimitSpring = BNGbeamLimitSpringDef
			obj.BNGbeamLimitDamp = BNGbeamLimitDampDef
			obj.BNGbeamLimitDampRebound = BNGbeamLimitDampReboundDef
			obj.BNGbeamDampFast = BNGbeamDampFastDef
			obj.BNGbeamDampReboundFast = BNGbeamDampReboundFastDef
			obj.BNGbeamDampVelocitySplit = BNGbeamDampVelocitySplitDef
			obj.BNGpressure = BNGpressureDef
			obj.BNGpressurePSI = BNGpressurePSIDef
			obj.BNGsurface = BNGsurfaceDef
			obj.BNGvolumeCoef = BNGpBVolumeCoefDef
			obj.BNGmaxPressure = BNGmaxPressureDef
			obj.BNGmaxPressurePSI = BNGmaxPressurePSIDef
			obj.BNGspringExpansion = BNGspringExpansionDef
			obj.BNGdampExpansion = BNGdampExpansionDef
			obj.BNGtransitionZone = BNGtransitionZoneDef
			obj.BNGhubTreadBeam = BNGhubTreadBeamDef
			obj.BNGhubPeripheryBeam  = BNGhubPeripheryBeamDef
			obj.BNGhubSideBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelTreadBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelTreadReinfBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelPeripheryBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelSideBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelSideBeamExpansion = BNGhubPeripheryBeamDef
			obj.BNGwheelSideReinfBeam = BNGhubPeripheryBeamDef
			obj.BNGwheelSideReinfBeamExpansion = BNGhubPeripheryBeamDef
			obj.BNGwheelReinfBeam = BNGhubPeripheryBeamDef
			)
		)
	)

-- rollout hydros attribute edit
rollout RL_HydrosEdit "Hydros Attribute Edit" width:300 height:300
(
	label lbl_2 "Label"  visible:false
	edittext UIinputSource "inputSource" text:BNGinputSourceDef align:#right width:241
	edittext UIfactor "factor" text:BNGfactorDef align:#right width:213
	edittext UIoutLimit "outLimit"text:BNGoutLimitDef align:#right width:221
	edittext UIinLimit "inLimit"text:BNGinLimitDef align:#right width:213
	edittext UIinputFactor "inputFactor"text:BNGinputFactorDef align:#right width:239
	edittext UIinputCenter "inputCenter"text:BNGinputCenterDef align:#right width:241
	edittext UIinRate "inRate"text:BNGinRateDef align:#right width:215
	edittext UIoutRate "outRate"text:BNGoutRateDef align:#right width:223
	edittext UIsteeringWheelLock "steeringWheelLock" text:BNGsteeringWheelLockDef
	label lbl_1 "Label"  visible:false
	button UIreset "Reset"  width:274 align:#center

	on UIinputSource changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGinputSource = UIinputSource.text
	on UIfactor changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGfactor = UIfactor.text
	on UIoutLimit changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGoutLimit = UIoutLimit.text
	on UIinLimit changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGinLimit = UIinLimit.text
	on UIinputFactor changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGinputFactor = UIinputFactor.text
	on UIinputCenter changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGinputCenter = UIinputCenter.text
	on UIinRate changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGinRate = UIinRate.text
	on UIoutRate changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGoutRate = UIoutRate.text
	on UIsteeringWheelLock changed txt do for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do obj.BNGsteeringWheelLock = UIsteeringWheelLock.text
	on UIreset pressed do
	(
		UIinputSource.text = BNGinputSourceDef
		UIfactor.text = BNGfactorDef
		UIoutLimit.text = BNGoutLimitDef
		UIinLimit.text = BNGinLimitDef
		UIinputFactor.text = BNGinputFactorDef
		UIinputCenter.text = BNGinputCenterDef
		UIinRate.text = BNGinRateDef
		UIoutRate.text = BNGoutRateDef
		UIsteeringWheelLock.text = BNGsteeringWheelLockDef

		for obj in getCurrentSelection() where isProperty obj "BNGinputSource" == true do
		(
			obj.BNGinputSource = BNGinputSourceDef
			obj.BNGfactor = BNGfactorDef
			obj.BNGoutLimit = BNGoutLimitDef
			obj.BNGinLimit = BNGinLimitDef
			obj.BNGinputFactor = BNGinputFactorDef
			obj.BNGinputCenter = BNGinputCenterDef
			obj.BNGinRate = BNGinRateDef
			obj.BNGoutRate = BNGoutRateDef
			obj.BNGsteeringWheelLock = BNGsteeringWheelLockDef
		)
	)
)
