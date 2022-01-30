extends Area2D

onready var openSound = $OpenSound

func _on_Exit_body_entered(body):
	
	if body.name == "Player":
		openSound.play()
		get_tree().change_scene("res://Victory.tscn")
