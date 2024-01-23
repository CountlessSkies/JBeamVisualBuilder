struct BNGglows (glows_dummyMaterial, glows_simpleFunction, glows_off, glows_on, glows_on_intense)

global RL_GlowMaps

if ClassOf BNGglowsEnable == UndefinedClass and ClassOf glows == UndefinedClass and ClassOf glowsprv == UndefinedClass and ClassOf fnc == UndefinedClass do
(
    global BNGglowsEnable = false
    global fnc = #(), glows = #(), glowsprv = #()
)

try(destroydialog RL_glowMaps)catch()
try(destroydialog RL_glowMaps)catch()
rollout RL_GlowMaps "glowMaps" width:300 height:570
(
	checkbox glows_enable "Enable"  checked:true
	edittext glows_dummyMaterial "dummyMaterial"  text:""
	edittext glows_simpleFunction "simpleFunction"  width:272 align:#right text:""
	listbox functions_list ""  items:#()
	button functions_set "Set"  across:3 width:88 align:#left
	button functions_add "Add"  width:88 align:#center
	button functions_reset "Reset"  width:88 align:#right
	label lbl_1 "Label"  visible:false
	edittext glows_off "off"  width:216 align:#right text:""
	edittext glows_on "on"  width:214 align:#right text:""
	edittext glows_on_intense "on_intense"  width:255 align:#right text:""
	label lbl_2 "Label"  visible:false
	button glows_create "Create"  across:2 width:135
	button glows_reset "Reset"  width:135
	listbox glows_list "glowMap list"  items:#()
	label lbl_3 "Label"  visible:false

    on RL_GlowMaps open do
	(
        glows_enable.checked = BNGglowsEnable
		glows_list.items = glowsprv
		functions_list.items = fnc
	)

    on glows_enable changed state do if state == on then BNGglowsEnable = true else BNGglowsEnable = false

    on functions_add pressed do if glows_simpleFunction.text != "" do
    (
        append fnc glows_simpleFunction.text
		fnc = sort (makeUniqueArray fnc)
		functions_list.items = fnc
    )

    on functions_set pressed do if glows_simpleFunction.text != "" do
    (
        fnc = #()
        append fnc glows_simpleFunction.text
		functions_list.items = fnc
    )

    on functions_reset pressed do
    (
        fnc = #()
		functions_list.items = fnc
    )

	on functions_list rightclick i do
	(
		deleteItem fnc i
		functions_list.items = fnc
	)

	on glows_create pressed do
	(
		glow = BNGglows glows_dummyMaterial:glows_DummyMaterial.text glows_off:glows_off.text glows_on:glows_on.text glows_on_intense:glows_on_intense.text
        glow.glows_simpleFunction = functions_list.items
		append glowsprv (glow.glows_dummyMaterial)
		append glows glow
		glows_list.items = glowsprv
	)

	on glows_reset pressed do 
	(
		glowsprv = #()
		glows = #()
		glows_list.items = #()
	)

	on glows_list rightclick i do
	(
		deleteItem glowsprv i
		deleteItem glows i
		glows_list.items = glowsprv
	)
)

