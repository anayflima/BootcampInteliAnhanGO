extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$pause/Button.visible = false

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		Global.save_score(Global.main_score)
		get_tree().change_scene("res://MiniMap/MiniMap.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")
