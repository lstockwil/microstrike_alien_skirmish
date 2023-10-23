extends Resource
class_name Production
export(String) var item_produce
export(int) var Engineers
export(int) var ProduceTime

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init(var itemName,var EngiAllocation,var time):
	item_produce = itemName
	Engineers = Engineers
	ProduceTime = time
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
