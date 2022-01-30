extends Node2D


onready var victoryMusic = $VictoryMusic

func _ready():
	victoryMusic.play()
	
func _process(delta):
	BackgroundMusic.stop()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().quit()
