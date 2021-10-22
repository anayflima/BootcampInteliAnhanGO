extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	$button_pingpong.visible = false
	
func _process(delta):
	var x = $KinematicBody2D.position.x
	var y = $KinematicBody2D.position.y
	if x > 172 && x < 1002 && y > 1012 && y < 1534:
		$button_pingpong.visible = true
	if !(x > 172 && x < 1002 && y > 1012 && y < 1534):
		$button_pingpong.visible = false