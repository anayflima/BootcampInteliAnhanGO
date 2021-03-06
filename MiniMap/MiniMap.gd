extends Control

var background_music = load("res://autoloads/background_music.ogg")

func _ready():
	$CanvasLayer/ViewportContainer/Viewport/Node2D/KinematicBody2D/Camera2D.zoom=Vector2(16,16)
	$Node2D/CanvasLayer/menu.visible = false

func _on_lixo1_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")

func _process(delta):
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
	Global.resume_music()

func _on_Button_pressed():
	get_tree().change_scene("res://historia_inicial/scene7_3.tscn")
