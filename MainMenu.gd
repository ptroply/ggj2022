extends Control


func _ready():
	$VBoxContainer/StartBtn.grab_focus()


func _on_StartBtn_pressed():
	get_tree().change_scene("res://Level.tscn")


func _on_HowToPlayBtn_pressed():
	pass # Replace with function body.


func _on_QuitBtn_pressed():
	get_tree().quit()
