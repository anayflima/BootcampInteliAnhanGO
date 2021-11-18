extends Node2D

var count = 0

func _ready():
	$pause/Button.visible = false
	Global.game_score = 0
	$Popup.popup()
	
	

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		Global.save_score(Global.main_score)
		get_tree().change_scene("res://MiniMap/MiniMap.tscn")

func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")

