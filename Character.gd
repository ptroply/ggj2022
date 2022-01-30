extends Node2D

var p: Vector2
var c: Vector2
var inLight: bool = false

onready var player = $Player
onready var shadow = $Shadow


func _process(_delta):
	
	p = player.global_position
	c = shadow.global_position
	
	if p.distance_to(c) < 50:
		shadow.Acceleration = 0
	else:
		shadow.Acceleration = 450
		
	
	if inLight:
		shadow.visible = true
	else:
		shadow.visible = false
	
#	if shadow.Acceleration == 0 && c.y < p.y:
#		shadow.global_position.y = p.y


func _on_Light1_area_entered(_area):
	inLight = true

func _on_Light1_area_exited(_area):
	inLight = false
