extends KinematicBody2D


const Acceleration = 450
const MaxSpeed = 80
const Friction = 0.4
const AirFriction = 0.002
const JumpForce = 200

var Gravity = 360

var isInLight : bool = false
var isOnLadder : bool = false
var motion : Vector2 = Vector2()

onready var sprite = $Sprite
onready var climbingSprite = $SpriteClimb
onready var animationPlayer = $AnimationPlayer
onready var walkingSound = $WalkingSound

func _on_Light_area_entered(_area):
	isInLight = true


func _on_Light_area_exited(_area):
	isInLight = false

func _physics_process(delta):
	
	
	
	var inputX = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	print(inputX)
	
	if isOnLadder:
		
		sprite.visible = false
		climbingSprite.visible = true
		
		if Input.is_action_pressed("ui_up"):
			Gravity = 0
			motion.x = 0
			motion.y = -MaxSpeed
			
		elif Input.is_action_pressed("ui_down"):
			motion.x = 0
			motion.y = MaxSpeed
			
		else:
			motion.y = 0
			
	else:
		climbingSprite.visible = false
		sprite.visible = true
		Gravity = 360
	
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



