@tool
extends Node


func get_color(col,a) -> Color:
	var red=0
	var green=0
	var blue=0
	if(col&1):
		red=1
	if(col&2):
		green=1
	if(col&4):
		blue=1
	return Color(red,green,blue,a)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
