extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
#mouse scroll wheel inputs
	if event.is_action_pressed("mouse_up"):
		zoom.x += .25
		zoom.y += .25
	if event.is_action_pressed("mouse_down"):
		zoom.x -= .25
		zoom.y -= .25
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var vec = get_position()

# camera keyboard movements
	if (Input.is_action_pressed("up")):
		vec.y = vec.y -2.5
		set_position(vec)
	if (Input.is_action_pressed("down")):
		vec.y = vec.y +2.5
		set_position(vec)
	if (Input.is_action_pressed("right")):
		vec.x = vec.x +2.5
		set_position(vec)
	if (Input.is_action_pressed("left")):
		vec.x = vec.x -2.5
		set_position(vec)
