global RL_Variables

struct BNGvar (var_name, var_type, var_unit, var_category, var_default, var_min, var_max, var_title, var_description, var_subCategory, var_stepDis, var_minDis, var_maxDis)

if BNGvarsEnable == undefined and vars == undefined and varsprv == undefined do
(
    global BNGvarsEnable = false
    global vars = #(), varsprv = #()
)

rollout RL_Variables "Variables" width:300 height:520
(
	checkbox var_enable "Enable" checked:BNGvarsEnable
    edittext var_name "name"  width:239 align:#right text:"$"
	edittext var_type "type"  width:235 align:#right text:"range" readOnly:true
	edittext var_unit "unit"  width:231 align:#right text:""
	edittext var_category "category"  width:256 align:#right text:""
	spinner var_default "default"  type:#float range:[0,100,1]
	spinner var_min "min"  type:#float range:[0,100,1]
	spinner var_max "max"  type:#float range:[0,100,1]
	edittext var_title "title"  type:#string text:"" align:#right width:231
	edittext var_description "description"  width:265 align:#right text:""
	label lbl_1 "Optional arguments"  align:#right
	edittext var_subCategory "subCategory"  text:""
	spinner var_stepDis "stepDis" type:#float range:[0,100,0]
	spinner var_minDis "minDis" type:#float range:[0,100,0]
	spinner var_maxDis "maxDis" type:#float range:[0,100,0]
	button var_create "Create"  across:2 width:135 align:#left
	button var_reset "Reset"  width:135 align:#right
	listbox var_list "variables list"  items:#()

	on RL_Variables open do
	(
        var_enable.checked = BNGvarsEnable
		var_list.items = varsprv
	)

    on var_enable changed state do if state == on then BNGvarsEnable = true else BNGvarsEnable = false

	on var_create pressed do
	(
		var = BNGvar var_name:var_name.text var_type:var_type.text var_unit:var_unit.text var_category:var_category.text var_default:var_default.value var_min:var_min.value var_max:var_max.value var_title:var_title.text var_description:var_description.text var_subCategory:var_subCategory.text var_stepDis:var_stepDis.value var_minDis:var_minDis.value var_maxDis:var_maxDis.value
		append varsprv (var.var_name)
		append vars var
		var_list.items = varsprv
	)

	on var_reset pressed do 
	(
		varsprv = #()
		vars = #()
		var_list.items = #()
	)

	on var_list rightclick i do
	(
		deleteItem varsprv i
		deleteItem vars i
		var_list.items = varsprv
	)
)
