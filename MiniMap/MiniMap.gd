extends Control

signal use_move_vector

func _ready():
	$CanvasLayer/ViewportContainer/Viewport/Node2D/KinematicBody2D/Camera2D.zoom=Vector2(16,16)
	pass


func _on_lixo1_pressed():
	print("lixo1")
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")


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
