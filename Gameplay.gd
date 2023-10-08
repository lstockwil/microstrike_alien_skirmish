extends Node2D

var laser_scene:PackedScene = preload("res://Laser/laser.tscn")
var drone_scene: PackedScene = preload("res://Drone/Drone.tscn")

func _ready():
#	 $Drone.hide()
	 $Drone_Timer.start()

func _process(delta):
	pass


func _on_PLayer_laser(pos, direction):
	var laser = laser_scene.instance() 
	laser.position = pos 
	laser.rotation_degrees = rad2deg(direction.angle()) + 90
	laser.global_position = $Player/LaserStartPositions.global_position
	laser.direction = direction
	$Laser.add_child(laser)

func _on_Drone_Timer_timeout():
	spawn_drone()
	
func spawn_drone():
	var new_drone = drone_scene.instance()
	var screen_size = get_viewport_rect().size
	new_drone.position.x = screen_size.x
	new_drone.position.y = screen_size.y / 2
	$Drone.add_child(new_drone)
	
	# Connect the signal from the new drone instance
	new_drone.connect("laser", self, "_on_Drone_laser")
	

func _on_Drone_laser(pos,direction):
	var drone_laser = laser_scene.instance()
	drone_laser.position = pos
	drone_laser.rotation_degrees = rad2deg(direction.angle()) + 90
	drone_laser.global_position = Globals.drone_laser_pos
	drone_laser.direction = direction
	$Laser.add_child(drone_laser)
	
	
	
