global RL_Materials
global ssBuffer2 = StringStream "", strmFile2 = stringStream ""
if vPath == undefined do global vPath = ""
global myFilePath2 = ""

rollout RL_Materials "Materials" width:480 height:550
(
	label lbl_1 "Label"  visible:false
	/* edittext part "part"  width:429 align:#right text:""
	edittext name "name"  width:435 align:#right text:""
	edittext mapTo "mapTo"  width:441 align:#right text:""
	edittext class "class"  width:431 align:#right text:"Material" */
	label lbl_2 "Path:"  align:#left
	edittext vehicles_path "/vehicles/" text:vPath
	label lbl_3 "Label"  visible:false
	/* edittext preview_text ""  height:284 text:"" */
    dotNetControl netpreview "System.Windows.Forms.Textbox" height:365 align:#center
	label lbl_4 "Label"  visible:false
	edittext filePath ""  across:2 width:348 align:#left text:""
	button browse "Browse"  offset:[0,-2] width:100 align:#right
	button preview "Preview"  across:2 width:224 align:#left
	button generate "Generate"  width:224 align:#right

    on RL_Materials open do
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

    on vehicles_path changed txt do vPath = vehicles_path.text

    on preview pressed do
    (
        vPath = vehicles_path.text
        createMaterial vPath ssBuffer2
		netPreview.text = ssBuffer2 as string
		ssBuffer2 = stringStream ""
    )

    on browse pressed do
    (
        myFilePath2 = getSaveFileName caption:"Choose where to save Json file" types:"Json materials(*.materials.json)|*.materials.json"
		if myFilePath2 != undefined do
        (
            filePath.text = myFilePath2
            if doesFileExist myFilePath2 == false do
            (
                myFile = createfile myFilePath2
                close myFile
            )
        )
    )

    on generate pressed do
	(
		if doesFileExist myFilePath2 == true do
		(
			vPath = vehicles_path.text
            strmFile2 = openfile myFilePath2 mode:"w"
			createMaterial vPath strmFile2
			close strmFile2
		)
	)
)