extends Control

export var PlayerBASE: PackedScene

#get our PauseMenu scene as an object
onready var pause_menu = $PauseMenu
var game_paused = false #boolean for status of pause 

onready var time_constant = 100
onready var counter = 0
onready var game_time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide() #make sure pause menu is not visible when the game starts
	pass # Replace with function body.

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#update time
	counter = (counter + 1) % time_constant
	if(counter == 0 and game_paused == false): #every *time constant* cycles of process, the in-game time is increased by one unit
		game_time += 1
		print(game_time)
#
#		#track player mouse movement
#		var position = get_global_mouse_position()
#		var offset = get_local_mouse_position()
#
#		if (Input.is_action_pressed("mouse_click")):
#			#var base = PlayerBASE.instance()
#			  #base.initialize(position, position)
#			#add_child(base)
#			pass
	
	#Pause Menu Code
	if(Input.is_action_just_pressed("pause")):
		print("Here")
		pauseMenu()
	
		
#PauseMenu() function only shows and hides menu, doesn't pause game right now: revisit once global time is implemented
func pauseMenu(): #should trigger every time the "pause" event takes place (i.e. every time "Esc" is pressed)
	if game_paused:
		pause_menu.hide()
	else:
		pause_menu.show()
		
	game_paused = !game_paused
		
		
