extends Node2D

var count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$pause/Button.visible = false
	Global.game_score = 0
	$label_skate.visible = true
	

func _process(delta):
	if Input.is_key_pressed(KEY_ESCAPE):
		Global.save_score(Global.main_score)
		get_tree().change_scene("res://MiniMap/MiniMap.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
	count += 1
	if count == 150:
		$label_skate.visible = false

func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")
