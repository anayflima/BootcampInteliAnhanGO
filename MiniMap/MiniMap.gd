extends Control


func _ready():
	$CanvasLayer/ViewportContainer/Viewport/Node2D/KinematicBody2D/Camera2D.zoom=Vector2(8,8)
	pass


func _on_lixo1_pressed():
	print("lixo1")
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")
