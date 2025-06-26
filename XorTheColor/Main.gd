extends Node
var level


func loadlevel():
	for lvl in get_tree().get_nodes_in_group("Levels"):
		lvl.queue_free()
	level=load("res://Levels/Level%s.tscn" %G.level).instantiate()
	add_child(level)
func nextlevel():
	G.level+=1
	loadlevel()
# Called when the node enters the scene tree for the first time.
func _ready():
	loadlevel()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if Input.is_key_pressed(KEY_N):
		nextlevel()
	if Input.is_key_pressed(KEY_R):
		loadlevel()
