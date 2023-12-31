extends Button
export var baseOptions : NodePath
export var baseButton : NodePath
var gameplay_scene = preload("res://Gameplay.tscn").instance()
#var buttons = ["../../BaseList/Button","../../BaseList/Button2"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	var base0 = get_node("../../../World Map/BASES/PlayerBase")
	var base1 = get_node("../../../World Map/BASES/PlayerBase2")
	var targets = $"../../fighterList/Label"
	targets.text = ""
	for n in base0.RadarList.size():
		targets.text = targets.text + base0.RadarList[n].name +"\n"
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	


func _on_bases_pressed():
	var baseList = get_node(baseOptions)
	if baseList.is_visible() :
		baseList.visible = false
	else :
		baseList.visible = true
	
	var main = get_node("../../..")

	var base0 = get_node("../../../World Map/BASES/PlayerBase")
	var base1 = get_node("../../../World Map/BASES/PlayerBase2")
	
	var button0 = get_node("../../BaseList/btn_baselist/Button")
	var button1 = get_node("../../BaseList/btn_baselist/Button2")
	button0.BASE_SELECTED = base0
	button1.BASE_SELECTED = base1
	button0.text = base0.get("baseName")
	button1.text = base1.get("baseName")


func _on_intercept_pressed():
	get_tree().root.add_child(gameplay_scene)
	var intercept = $"../../fighterList"
	if intercept.is_visible() :
		intercept.visible = false
	else :
		intercept.visible = true
