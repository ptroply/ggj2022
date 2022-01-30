extends Node2D

var p: Vector2
var c: Vector2

onready var player = get_node("Player")
onready var shadow = get_node("Shadow")

func _process(_delta):
	
	print(shadow.isInLight)
	
	p = player.global_position
	c = shadow.global_position
	
	if shadow.isInLight && p.distance_to(c) < 50:
		shadow.Acceleration = 0
	else:
		shadow.Acceleration = 450
		
	if !shadow.isInLight:
		shadow.visible = false
	
	if shadow.isInLight && player.isInLight:
		shadow.visible = true
	
	if !shadow.isInLight && !player.isInLight:
		var time_in_seconds = 1
		yield(get_tree().create_timer(time_in_seconds), "timeout")
		if !shadow.isInLight && !player.isInLight:
			shadow.global_position = p
	
	
#	if shadow.Acceleration == 0 && c.y < p.y:
#		shadow.global_position.y = p.y


#func _on_Light1_area_entered(_area):
#	inLight = true
#
#func _on_Light1_area_exited(_area):
#	inLight = false
