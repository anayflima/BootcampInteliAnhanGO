extends Control



func _ready():
	$CanvasLayer/ViewportContainer/Viewport/Node2D/KinematicBody2D/Camera2D.zoom=Vector2(16,16)
	$Node2D/CanvasLayer/menu.visible = false
	pass



func _on_lixo1_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")
<<<<<<< HEAD

func _process(delta):
	$Node2D/CanvasLayer/ProgressBar.value = Global.main_score
	

#func _input(event):
#	if event is InputEventScreenTouch or event is InputEventScreenDrag:
#		if $Node2D/CanvasLayer/TouchScreenButton.is_pressed():
#			var move_vector = calculate_move_vector(event.position)
#			emit_signal("use_move_vector", move_vector)
#
#func calculate_move_vector(event_position):
#	var texture_center = $Node2D/CanvasLayer/TouchScreenButton.position + Vector2(81,81)
#	return (event_position - texture_center).normalized()
#


func _on_options_pressed():
	$Node2D/CanvasLayer/menu.visible = true


func _on_resume_pressed():
	$Node2D/CanvasLayer/menu.visible = false

func _on_exit_pressed():
	get_tree().quit()
=======
>>>>>>> 236ee209bb5f7cd8e8744c9e90d2d28dcf03dee7
