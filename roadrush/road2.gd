extends Node2D

# Variables for road speed and length
@export var speed := 200
@export var road_length := 600  # Height of your road texture
@export var top_limit := 0      # Adjust if needed to confine the road

# References to the road sprites
@onready var road1 := $Road1
@onready var road2 := $Road2

func _ready():
	if road1 and road2:
		# Initial positions of the road sprites
		road1.position.y = top_limit
		road2.position.y = top_limit - road_length
	else:
		print("Error: Road1 or Road2 node is missing.")

func _process(delta):
	if road1 and road2:
		# Move the roads down
		road1.position.y += speed * delta
		road2.position.y += speed * delta

		# Check if road1 has moved off-screen
		if road1.position.y >= top_limit + road_length:
			road1.position.y = road2.position.y - road_length

		# Check if road2 has moved off-screen
		if road2.position.y >= top_limit + road_length:
			road2.position.y = road1.position.y - road_length
	else:
		print("Error: Road1 or Road2 node is missing.")
