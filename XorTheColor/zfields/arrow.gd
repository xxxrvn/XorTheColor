@tool
class_name Arrow extends Area2D
enum DIR {RIGHT=0,LEFT=2,UP=1,DOWN=3}
@export var dir:DIR=DIR.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_rotation=-dir*45./2.*PI+45.*PI
