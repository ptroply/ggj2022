extends Area2D

onready var ladder = get_node("../Ladder")
onready var ladder2 = get_node("../Ladder2")
onready var ladderBtn2 = get_node("../LadderBtn2")
onready var ladderSound = $LadderSound
onready var buttonBell = $ButtonBell


func _on_LadderBtn_body_entered(body):
	buttonBell.play()
	ladderSound.play()
	
	ladder2.visible = true
	ladder2.get_node("ClimbLadder").set_deferred("disabled", false)
	
	visible = false
	get_node("PushBtn").set_deferred("disabled", true)
