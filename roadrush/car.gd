extends Node2D  # Or another appropriate node type

# Variables for movement speed and boundaries
@export var speed := 200
@export var left_limit := 300
@export var right_limit := 880

@export var top_limit := 200
@export var bottom_limit := 500

func _process(delta):
	var direction := Vector2.ZERO

	# Horizontal movement
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Vertical movement
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1

	# Normalize direction to prevent faster diagonal movement
	direction = direction.normalized()

	# Apply movement
	position += direction * speed * delta

	# Clamp the position to stay within the boundaries
	position.x = clamp(position.x, left_limit, right_limit)
	position.y = clamp(position.y, top_limit, bottom_limit)
