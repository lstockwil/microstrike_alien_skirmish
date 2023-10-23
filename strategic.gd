extends Control

export var PlayerBASE: PackedScene

signal time_passed()

#get our PauseMenu scene as an object
onready var pause_menu = $PauseMenu

export onready var time_label = $TimeLabel

export onready var game_paused = false #boolean for status of pause 
export onready var time_constant = 100
export onready var counter = 0
export onready var game_time = 0

export onready var day = 0
export onready var month = 0
export onready var year = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pause_menu.hide() #make sure pause menu is not visible when the game starts
	#Align the center text
	_on_time_passed()
	
	time_label.show()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#update time
	counter = (counter + 1) % time_constant
	if(counter == 0 and game_paused == false): #every *time constant* cycles of process, the in-game time is increased by one unit
		game_time += 1
		emit_signal("time_passed")
		
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
		#print("Here")
		pauseMenu() 
	time_label.show()
		

func _on_time_passed():
	var cur_hour = game_time
	print(cur_hour)
	var cur_month = cur_hour / 720 #get how many months have passed
	cur_hour = cur_hour % 720
	var cur_day = cur_hour / 24 #get how many extra days have passed
	cur_hour = cur_hour % 24
	
	
	time_label.text =  "Month: " + str(cur_month) + "\nDay: " + str(cur_day) + "\nHour: " + str(cur_hour)
	#print(time_label.text)
#	time_label_text = text
	#time_label.show()
	pass

#PauseMenu() function only shows and hides menu, doesn't pause game right now: revisit once global time is implemented
func pauseMenu(): #should trigger every time the "pause" event takes place (i.e. every time "Esc" is pressed)
	if game_paused:
		pause_menu.hide()
	else:
		pause_menu.show()
		
	game_paused = !game_paused

