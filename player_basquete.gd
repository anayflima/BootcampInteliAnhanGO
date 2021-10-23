extends KinematicBody2D



# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		position.x += 10
		
