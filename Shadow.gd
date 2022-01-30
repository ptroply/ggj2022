extends KinematicBody2D


const MaxSpeed = 80
const Friction = 0.4
const AirFriction = 0.002
const JumpForce = 200

var isInLight : bool
var Acceleration = 450
var Gravity : int = 360
var motion : Vector2 = Vector2()

onready var sprite = $ShadowSprite
onready var animationPlayer = $AnimationPlayer
onready var shadowSound = $ShadowSound

#onready var shadowBox = $ShadowShape2D
#onready var shadowBox2 = $Area2D/ShadowShape

func _on_Light_area_entered(_area):
	isInLight = true


func _on_Light_area_exited(_area):
	isInLight = false


func _on_Player_ready():
	isInLight = false
	visible = false

func _physics_process(delta):
#	if visible == false:
#		shadowBox.set_disabled(true) 
##		shadowBox2.set_disabled(true)
#	else:
#		shadowBox.set_disabled(false) 
##		shadowBox2.set_disabled(false)
	
	
	var inputX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputX != 0:
		motion.x += inputX * Acceleration * delta
		motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)
		sprite.flip_h = inputX < 0
		animationPlayer.play("walk")
	else:
		animationPlayer.stop()
	
	motion.y += Gravity * delta
	
	if is_on_floor():
		if inputX == 0:
			motion.x = lerp(motion.x, 0, Friction)
		
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JumpForce
	else:
		if Input.is_action_just_released("ui_up") and motion.y < -JumpForce/2:
			motion.y = -JumpForce/2
		
		if inputX == 0:
			motion.x = lerp(motion.x, 0, AirFriction)
	
	motion = move_and_slide(motion, Vector2.UP)



