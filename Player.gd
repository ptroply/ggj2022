extends KinematicBody2D

export var location : Vector2 = Vector2()

const Acceleration = 450
const MaxSpeed = 80
const Friction = 0.4
const AirFriction = 0.002
const Gravity = 360
const JumpForce = 200

var motion : Vector2 = Vector2()

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _physics_process(delta):
	
	var inputX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputX != 0:
		animationPlayer.play("walk")
		motion.x += inputX * Acceleration * delta
		motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)
		sprite.flip_h = inputX < 0
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
