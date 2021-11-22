extends KinematicBody2D


func _ready():
	pass

func set_paddle_position(x, y):
	if y <= 50:
		y = 51
	if y >= 793 - 250:
		y = 792 - 250
	self.position = Vector2(x,y)
