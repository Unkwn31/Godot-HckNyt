extends Node2D

# Variables for movement speed
@export var speed := 200

# Called every frame
func _process(delta):
	var direction := Vector2.ZERO

	# Move left
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1

	# Move right
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Normalize the direction to prevent faster diagonal movement
	direction = direction.normalized()

	# Move the car
	velocity = direction * speed
	move_and_slide()
