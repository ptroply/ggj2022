extends Area2D

onready var player = get_node("../Character/Player")

func _on_Ladder_body_entered(body):
	if body.name == "Player":
		player.isOnLadder = true


func _on_Ladder_body_exited(body):
	if body.name == "Player":
		player.isOnLadder = false
