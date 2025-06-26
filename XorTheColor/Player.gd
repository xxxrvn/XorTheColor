@tool
class_name Player extends Area2D
var hover:bool=false
var moving:bool=false
var moved:bool=false
var sw_start=null
var sw_end=null
var steptime:float=0
var nextpos:Vector2
enum DIR {RIGHT=0,LEFT=2,UP=1,DOWN=3}
enum COL {BLACK=0,RED=1,GREEN=2,BLUE=4,YELLOW=3,LILA=5,CYAN=6,WHITE=7}

var movdir:DIR=DIR.RIGHT
@export var col:COL
#@export_enum("BLACK:0","RED:1","GREEN:2","BLUE:4","YELLOW:3","LILA:5","CYAN:6","WHITE:7") var col: int

signal swipes(dir:DIR)
# Called when the node enters the scene tree for the first time.
func _ready():
	if not Engine.is_editor_hint():
		mouse_entered.connect(menter)
		mouse_exited.connect(mexit)
		swipes.connect(swiped)

func menter():
	hover=true
func mexit():
	hover=false

func swiped(dir:DIR):
	var players=get_tree().get_nodes_in_group("Players")
	for player in players:
		if player.moving:
			return
	moving=true
	movdir=dir
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not Engine.is_editor_hint():
		if moved:
			var areas=get_overlapping_areas()
			for area in areas:
				if area is Juwel:
					area.col^=col
				if area is Arrow:
					movdir=area.dir
				if area is Stopper:
					moving=false
			moved=false
		steptime+=delta
		if steptime>=0.05:
			steptime=0
			step()
	$Sprite2D.texture.fill_color=F.get_color(col,0.5)
	$Sprite2D.texture.stroke_color=F.get_color(col,1.0)
	
	

func step():
	if moving:
		match(movdir):
			DIR.RIGHT:
				nextpos=global_position+Vector2(32,0)
			DIR.LEFT:
				nextpos=global_position+Vector2(-32,0)
			DIR.DOWN:
				nextpos=global_position+Vector2(0,32)
			DIR.UP:
				nextpos=global_position+Vector2(0,-32)
		var ppoint=PhysicsPointQueryParameters2D.new()
		ppoint.collide_with_areas = true 
		ppoint.position=nextpos
		var internext = get_world_2d().direct_space_state.intersect_point(ppoint)
		for it in internext:
			if it["collider"] is Block:
				moving=false
			if it["collider"] is Player:
				moving=false
			if it["collider"] is BounceBlock:
				movdir=(movdir+2)%4
				return
		if moving:
			moved=true
			global_position=nextpos
			

func _input(event):
	if not Engine.is_editor_hint():
		if event is InputEventMouseButton and event.pressed and hover:
			sw_start=get_global_mouse_position()
		if event is InputEventMouseButton and !event.pressed and sw_start:
			sw_end=get_global_mouse_position()
			var swipe=sw_end-sw_start
			sw_start=null
			if abs(swipe.x)>32 or abs(swipe.y)>32:
				if abs(swipe.x)>abs(swipe.y):
					if swipe.x>0:
						swipes.emit(DIR.RIGHT)
					else:
						swipes.emit(DIR.LEFT)
				else:
					if swipe.y>0:
						swipes.emit(DIR.DOWN)
					else:
						swipes.emit(DIR.UP)
			
		
		
