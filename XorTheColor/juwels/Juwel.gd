@tool
class_name Juwel extends Area2D
enum COL {BLACK=0,RED=1,GREEN=2,BLUE=4,YELLOW=3,LILA=5,CYAN=6,WHITE=7}
@export var col:COL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2D.texture.fill_color=F.get_color(col,1.0)
	$Sprite2D.texture.stroke_color=Color(0.5,0.5,0.5,1.0)
