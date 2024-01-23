struct BNGslot (type, default, description, coreSlot, nodeOffset, nodeMove)

global RL_SlotsEdit

if ClassOf BNGslotsEnable == UndefinedClass and ClassOf slts == UndefinedClass and ClassOf sltsprv == UndefinedClass do
(
    global BNGslotsEnable = false
    global slts = #(), sltsprv = #()
)

rollout RL_SlotsEdit "Slots Edit" width:300 height:450
(
	label lbl_1 "Label"  visible:false
	checkbox UIslotsEnable "Enable" checked:BNGslotsEnable
	edittext UItype "type"  width:245 align:#right text:""
	edittext UIdefault "default"  width:257 align:#right text:""
	edittext UIdescription "description"  align:#right text:""
	checkbox UIcoreSlot "coreSlot"  checked:false
	label lbl_2 "nodeOffset"  align:#left
	spinner UIoffsetX "X"  across:3 align:#left type:#float range:[0,100,0]
	spinner UIoffsetY "Y"  align:#center type:#float range:[0,100,0]
	spinner UIoffsetZ "Z"  align:#right type:#float range:[0,100,0]
	label lbl_3 "nodeMove"  align:#left
	spinner UImoveX "X"  across:3 align:#left type:#float range:[0,100,0]
	spinner UImoveY "Y"  align:#center type:#float range:[0,100,0]
	spinner UImoveZ "Z"  align:#right type:#float range:[0,100,0]
	label lbl_4 "Label"  visible:false
/* 	edittext UIpreview "" multiLine:true readOnly:true width:274 height:274 text:""  */
	button UIcreateSlot "Create SLOT"  width:135 across:2 align:#left
	button UIreset "Reset All"  width:135 align:#right
	/* label UIamount "Number of slots: 0" */
	listbox UIslotsList "Slots"  items:sltsprv

	on RL_SlotsEdit open do
	(
		UIslotsEnable.checked = BNGslotsEnable
		UIslotsList.items = sltsprv
	)

	on UIslotsEnable changed state do if state == on then BNGslotsEnable = true else BNGslotsEnable = false
	
	on UIcreateSlot pressed do
	(
		slt = BNGslot type:UItype.text default:UIdefault.text description:UIdescription.text coreslot:UIcoreSlot.state nodeOffset:[UIoffsetX.value,UIoffsetY.value,UIoffsetZ.value] nodeMove:[UIMoveX.value,UIMoveY.value,UIMoveZ.value]
		append sltsprv (slt.type as string + " - " + slt.default as string + " - " + slt.description as string)
		append slts slt
		/* UIamount.text = "Number of slots: " + slts.count as string */
		UIslotsList.items = sltsprv
	)

	on UIreset pressed do 
	(
		sltsprv = #()
		slts = #()
		/* UIamount.text = "Number of slots: 0" */
		UIslotsList.items = #()
	)

	on UIslotsList rightclick i do
	(
		deleteItem sltsprv i
		deleteItem slts i
		/* UIamount.text = "Number of slots: " + slts.count as string */
		UIslotsList.items = sltsprv
	)
)
