extends KinematicBody2D

export var PlayerBASE: PackedScene

signal laser(pos,direction)

onready var global_vars = "/root"

var speed: int = 500
var can_laser: bool = true


func _ready():
	#Connect the signal emitted when time passing (in the strategic.gd) to the given fucntion in this classs
	var primary = get_node(".")
	#primary.connect("time_passed", self, "on_time_passed")

func _on_time_passed():
		var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		var velocity = direction * speed
		move_and_slide(velocity)
		global_vars.player_pos = $Player.global_position

		#track player mouse movement
		var position = get_global_mouse_position()
		var offset = get_local_mouse_position()

		if (Input.is_action_pressed("mouse_click")):
			#var base = PlayerBASE.instance()
			  #base.initialize(position, position)
			#add_child(base)
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#rotate player
	look_at(get_global_mouse_position())
	var player_direction = (get_global_mouse_position() -position).normalized()
	if Input.is_action_pressed("Shoot_laser") and can_laser:
		var laserPosition = $LaserStartPositions
		can_laser = false
		$Laser_timer.start()
		emit_signal("laser", laserPosition.global_position, player_direction)
			
func _on_Timer_timeout():
	can_laser = true



	
