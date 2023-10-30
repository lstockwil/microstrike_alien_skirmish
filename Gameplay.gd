extends Node2D

var laser_scene:PackedScene = preload("res://laser.tscn")
var drone_scene: PackedScene = preload("res://Drone.tscn")
var rotation_speed = 2	
var active_timers :int = 0

func _ready():
#	 $Drone.hide()
	 start_drone_timer(3)
	 


func _process(delta):
	pass
	


func _on_PLayer_laser(pos, direction):
	create_laser(pos,direction)

func _on_Drone_Timer_timeout():
	active_timers-=1 
	if active_timers >= 0 :
		spawn_drone()
	
	
	
func spawn_drone():
	var new_drone = drone_scene.instance()
	
	new_drone.position.x = randi() % 1024
	new_drone.position.y = randi() % 600
	$Drone.add_child(new_drone)
	
	# Connect the signal from the new drone instance
	new_drone.connect("laser", self, "_on_Drone_laser")
	

func _on_Drone_laser(pos,direction):
	create_laser(pos,direction)
	
	

func create_laser(pos,direction):
	var laser = laser_scene.instance() 
	laser.position = pos 
	laser.rotation_degrees = rad2deg(direction.angle()) + 90
#	laser.global_position = $Player/LaserStartPositions.global_position
	laser.direction = direction
	$Laser.add_child(laser)

func start_drone_timer(n:int):
	for i in range(n):
		$Drone_Timer.start()
		active_timers += 1
