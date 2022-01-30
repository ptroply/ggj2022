extends Position2D

var gridSize = Vector2()
var gridPosition = Vector2()

onready var parent = get_parent()

func _ready():
	gridSize = OS.get_screen_size()
	set_as_toplevel(true)
	update_grid_position()

func _physics_process(delta):
	update_grid_position()

func update_grid_position():
	var x = round(parent.position.x / gridSize.x)
	var y = round(parent.position.y / gridSize.y)
	var newGridPosition = Vector2(x, y)
	if gridPosition == newGridPosition:
		return
	
	gridPosition = newGridPosition
	position = gridPosition * gridSize

