extends Area2D

var speed: int = 1000
var direction: Vector2 = Vector2.UP

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	global_position += direction * speed * delta
	


func _on_laser_body_entered(body):
	
	body.hit()
	
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


