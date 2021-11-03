extends KinematicBody2D

export var speedMagnitude = 25
export var rotationMagnitude = 0.3

var velocityVec
var rotation_speed

func _ready():
	velocityVec = Vector2(rand_range(-speedMagnitude, speedMagnitude),
						  rand_range(-speedMagnitude, speedMagnitude))
	rotation_speed = rand_range(-rotationMagnitude, rotationMagnitude)
	
	var scale = rand_range(0.4, 1)
	apply_scale(Vector2(scale, scale))

func _physics_process(delta):
	rotation += rotation_speed * delta
	move_and_slide(velocityVec)
