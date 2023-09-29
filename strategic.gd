extends Control

export var PlayerBASE: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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

