extends Area2D

onready var exit = get_node("../Exit")
onready var btn = $PushBtn
onready var unlockSound = $UnlockSound

func _on_ExitBtn_body_entered(body):
	
	if body.name == "Shadow":
		
		unlockSound.play()
		
		exit.get_node("LockedDoor").visible = false
		exit.get_node("CollisionShape2D").set_deferred("disabled", false)
	
		visible = false;
		btn.set_deferred("disabled", true)
