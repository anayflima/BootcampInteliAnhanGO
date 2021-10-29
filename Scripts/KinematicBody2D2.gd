extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
		if Input.is_action_just_pressed("ui_down"):
			position.y +=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
