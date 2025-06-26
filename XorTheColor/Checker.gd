extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var xfields=get_tree().get_nodes_in_group("Fields")
	var players=get_tree().get_nodes_in_group("Players")
	for xfield in xfields:
		if !xfield.fine:
			return
	for player in players:
		if player.moving or player.moved:
			return
	print("Fine.")
	$"../../".nextlevel()
	
