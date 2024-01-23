powertrainAttrib = attributes powertrain
(
    parameters main rollout:params
    (
        BNGtype type:#string ui:UItype default:"electricMotor"
        BNGinputName type:#string ui:UIinputName default:"dummy"
        BNGinputIndex type:#integer ui:UIinputIndex default:0
        BNGrpm type:#stringTab default:""
        BNGtorque type:#stringTab default:""
        BNGmaxRPM type:#string ui:UImaxRPM default:"16000"
        BNGmaxRegenPower type:#string ui:UImaxRegenPower default:"150"
        BNGmaxRegenTorque type:#string ui:UImaxRegenTorque default:"100"
        BNGinertia type:#string ui:UIinertia default:"0.10"
        BNGfriction type:#string ui:UIfriction default:"2"
        BNGdynamicFriction type:#string ui:UIdynamicFriction default:"0.0005"
        BNGelectricalEfficiency type:#string ui:UIelectricalEfficiency default:"0.95"
        BNGtorqueReactionNodes type:#stringTab default:""
        BNGenergyStorage type:#string ui:UIenergyStorage default:"mainBattery"
        BNGelectricsThrottleFactorName type:#string ui:UIelectricsThrottleFactorName default:"throttleFactorRear"
        /* BNGwaterDamage
        BNGengineBlock */
        BNGbreakTriggerBeam type:#string ui:UIbreakTriggerBeam default:"rear_motor"
        BNGuiName type:#string ui:UIuiName default:"Rear Motor"
        BNGsoundConfig type:#string ui:UIsoundConfig default:"soundConfigRear"
        BNGscSampleName type:#string ui:UIscSampleName default:"ElectricMotor"
        BNGscMainGain type:#string ui:UIscMainGain default:"-4.5"
    )
    rollout params "Powertrain"
    (
        edittext UItype "type"
        edittext UIinputName "inputName"
        spinner UIinputIndex "inputIndex"
        edittext UImaxRPM "maxRPM"
        edittext UImaxRegenPower "maxRegenPower"
        edittext UImaxRegenTorque "maxRegenTorque"
        edittext UIinertia "inertia"
        edittext UIfriction "friction"
        edittext UIdynamicFriction "dynamicFriction"
        edittext UIelectricalEfficiency "electricalEfficiency"
        edittext UIenergyStorage "energyStorage"
        edittext UIelectricsThrottleFactorName "electricsThrottleFactorName"
        edittext UIbreakTriggerBeam "breakTriggerBeam"
        edittext UIuiName "uiName"
        edittext UIsoundConfig "soundConfig"
        edittext UIscSampleName "sampleName"
        edittext UIscMainGain "mainGain"
    )
)

try(destroydialog RL_Powertrain)catch()
rollout RL_Powertrain "Powertrain" width:300 height:800
(
	label lbl_1 "Label"  visible:false
	button create "Create Powertrain"  width:282.0 usePercentageWidth:true percentageWidth:94.0
	edittext type "type"  width:161 align:#right text:"electricMotor"
	edittext inputName "inputName"  width:190 align:#right text:"dummy"
	spinner spn_1 "Spinner"  type:#integer range:[0,100,1]
	edittext maxRPM "maxRPM"  width:180 align:#right text:"16000"
	edittext maxRegenPower "maxRegenPower"  width:220 align:#right text:"150"
	edittext maxRegenTorque "maxRegenTorque"  width:224 align:#right text:"100"
	edittext inertia "inertia"  width:169 align:#right text:"0.10"
	edittext friction "friction"  width:172 align:#right text:"2"
	edittext dynamicFriction "dynamicFriction"  width:213 align:#right text:"0.0005"
	edittext electricalEfficiency "electricalEfficiency"  width:227 align:#right text:"0.95"
	edittext torqueReactionNodes "torqueReactionNodes"  width:244 align:#right text:""
	listbox torqueReactionNodesList ""  height:6 items:#()
	edittext energyStorage "energyStorage"  width:211 align:#right text:"mainBattery"
	edittext electricsThrottleFactorName "electricsThrottleFactorName"  text:"throttleFactorRear"
	edittext breakTriggerBeam "breakTriggerBeam"  width:226 align:#right text:"rear_Motor"
	edittext uiName "uiName"  width:174 align:#right text:"Rear Motor"
	edittext soundConfig "soundConfig"  width:199 align:#right text:"soundConfigRear"
	edittext sampleName "sampleName"  width:199 align:#right text:"ElectricMotor"
	edittext mainGain "mainGain"  width:182 align:#right text:"-4.5"
	combobox cbo_1 "Combobox"  across:2 width:132.0 usePercentageWidth:true percentageWidth:44.0 align:#left items:#()
	combobox cbo_1_copy "Combobox"  width:132.0 usePercentageWidth:true percentageWidth:44.0 align:#right items:#()
)
