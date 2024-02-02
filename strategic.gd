extends Control

export var PlayerBASE: PackedScene
export(Array, NodePath) var Bases := []
export(int) var funds = 1000000
#get our PauseMenu scene as an object
onready var pause_menu = $"World Map/PauseMenu"
var game_paused = false #boolean for status of pause 
onready var time_constant = 50
onready var counter = 0
onready var game_time = 0
signal time_passed
# Called when the node enters the scene tree for the first time.
func _ready():
	#emit_signal("time_passed")
	pause_menu.hide() #make sure paused menu is not visible when the game starts
	pass # Replace with function body.
	#Bases.append(GET)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	counter = (counter + 1) % time_constant
	if(counter == 0 and game_paused == false): #every *time constant* cycles of process, the in-game time is increased by one unit
		if(game_time >=24):
			game_time = 0
			emit_signal("time_passed")
		else:
			game_time += 1
		var hourUI = get_node("UI_Elements/SideOptions/HOURS")
		hourUI.text = String(game_time)+":00HRS"
	
	
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
		
		

