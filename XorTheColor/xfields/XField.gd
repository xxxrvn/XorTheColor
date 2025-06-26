@tool
class_name XFields extends Area2D

var fine:bool=false
enum COL {BLACK=0,RED=1,GREEN=2,BLUE=4,YELLOW=3,LILA=5,CYAN=6,WHITE=7}
@export var col:COL

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fine:
		$Sprite2D.texture.stroke_color=Color.WHITE
	else:
		$Sprite2D.texture.stroke_color=Color.BLACK
	$Sprite2D.texture.fill_color=(F.get_color(col,1.0)*4.+Color.BLACK)/5.
	if not Engine.is_editor_hint():
		var areas=get_overlapping_areas()
		for area in areas:
			if area is Juwel:
				fine=(area.col==col)
				
