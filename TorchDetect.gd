extends Area2D

onready var unLitTorch = get_node("UnlitTorch")
onready var litTorch = get_node("LitTorch")
onready var light = get_node("../Light")
onready var torchSound = $TorchSound


func _on_TorchDetect_body_entered(body):
	if body.name == "Player":
		
		torchSound.play()
		
		litTorch.visible = true
		unLitTorch.visible = false
		
		light.get_node("CollisionPolygon2D").set_deferred("disabled", false)
		light.get_node("ShadowPlatform2/CollisionShade2D").set_deferred("disabled", false)
		light.visible = true
		
#		ladder.visible = true
#		ladder.get_node("ClimbLadder").set_deferred("disabled", false)
#
#		ladder2.visible = false
#		ladder2.get_node("ClimbLadder").set_deferred("disabled", true)
#
#		ladderBtn.visible = true
#		ladderBtn.get_node("PushBtn").set_deferred("disabled", false)
#
#		visible = false
#		get_node("PushBtn").set_deferred("disabled", true)
