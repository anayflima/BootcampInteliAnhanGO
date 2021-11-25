extends Control


func _ready():
	$CanvasLayer/ViewportContainer/Viewport/Node2D/KinematicBody2D/Camera2D.zoom=Vector2(16,16)
	$Node2D/CanvasLayer/menu.visible = false

func _on_lixo1_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")

func _process(delta):
	if $Node2D/CanvasLayer/menu/music.pressed == false:
		if (!$AudioStreamPlayer.playing):
			$AudioStreamPlayer.play()
	$Node2D/CanvasLayer/ProgressBar.value = Global.main_score




func _on_resume_pressed():
	$Node2D/CanvasLayer/menu.visible = false

func _on_exit_pressed():
	get_tree().quit()


func _on_options_pressed():
	if $Node2D/CanvasLayer/menu.visible:
		$Node2D/CanvasLayer/menu.visible = false
	else:
		$Node2D/CanvasLayer/menu.visible = true


func _on_music_toggled(button_pressed):

	$AudioStreamPlayer.stop()
	

