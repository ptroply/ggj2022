extends KinematicBody2D

const Acceleration = 450
const MaxSpeed = 78
const Friction = 0.4
const AirFriction = 0.004
const Gravity = 360
const JumpForce = 180

var motion = Vector2.ZERO

onready var sprite = $Sprite

func _physics_process(delta):
	
	var inputX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if inputX != 0:
		motion.x += inputX * Acceleration * delta
		motion.x = clamp(motion.x, -MaxSpeed, MaxSpeed)
		sprite.flip_h = inputX < 0
	
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
