extends KinematicBody2D


func _ready():
	pass

func set_paddle_position(x, y):
	if y <= 55:
		y = 56
	if y >= 800 - 250:
		y = 799 - 250
	self.position = Vector2(x, y)
