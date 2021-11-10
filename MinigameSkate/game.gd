extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$pause/Button.visible = false

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://map.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://map.tscn")
