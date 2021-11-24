extends TextureButton



func _ready():
	pass 




func _on_player_game_over():
	visible = true


func _on_Button_pressed():
	get_tree().reload_current_scene()
	Global.start()
