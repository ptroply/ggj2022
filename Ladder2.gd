extends Area2D


func _on_Ladder2_body_entered(body):
	if body.name == "Player":
		get_node("../Character/Player").isOnLadder = true


func _on_Ladder2_body_exited(body):
	if body.name == "Player":
		get_node("../Character/Player").isOnLadder = false
