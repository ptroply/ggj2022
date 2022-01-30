extends Area2D


onready var ladder = get_node("../Ladder")
onready var ladder2 = get_node("../Ladder2")
onready var ladderBtn = get_node("../LadderBtn")
onready var ladderSound = $LadderSound
onready var buttonBell = $ButtonBell


func _on_LadderBtn2_body_entered(body):
	
	buttonBell.play()
	ladderSound.play()
	
	ladder.visible = true
	ladder.get_node("ClimbLadder").set_deferred("disabled", false)
	
	visible = false
	get_node("PushBtn").set_deferred("disabled", true)

