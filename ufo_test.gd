extends Node2D
var angle = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#update the radar angle by .02 degrees every frame
	angle = angle + .02
	if(angle > 360):
		angle = 0
	set_rotation(angle)
