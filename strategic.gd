extends Control

export var PlayerBASE: PackedScene
export(Array, NodePath) var Bases := []

#get our PauseMenu scene as an object
onready var pause_menu = $PauseMenu
var game_paused = false #boolean for status of pause 

# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide() #make sure paused menu is not visible when the game starts
	pass # Replace with function body.
	#Bases.append(GET)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#track player mouse movement
	var position = get_global_mouse_position()
	var offset = get_local_mouse_position()
	
	if (Input.is_action_pressed("mouse_click")):
		#var base = PlayerBASE.instance()
		  #base.initialize(position, position)
		#add_child(base)
		pass
	
	#Pause Menu Code
	if(Input.is_action_just_pressed("pause")):
		pauseMenu()
		
func pauseMenu(): #should trigger every time the "pause" event takes place (i.e. every time "Esc" is pressed)
	if game_paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	game_paused = !game_paused
		
		
