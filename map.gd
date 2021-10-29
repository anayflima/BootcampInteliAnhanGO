
extends Node2D





# Called when the node enters the scene tree for the first time.
func _ready():
	$button_pingpong.visible = false
	$button_basquete.visible = false
	$StaticBody2D/CollisionPolygon2D.disabled = false
	
func _process(delta):
	var x = $KinematicBody2D.position.x
	var y = $KinematicBody2D.position.y
	if x > 172 && x < 1002 && y > 1012 && y < 1534:
		$button_pingpong.visible = true
	if !(x > 172 && x < 1002 && y > 1012 && y < 1534):
		$button_pingpong.visible = false
	if x > 2900 && x < 3700 && y > -400 && y < 400:
		$button_basquete.visible = true
	if !(x > 2950 && x < 3750 && y > -400 && y < 400):
		$button_basquete.visible = false
	if x > 5364 && x < 6164 && y > -100 && y < 724:
		$button_skate.visible = true
	if !(x > 5364 && x < 6164 && y > -100 && y < 724):
		$button_skate.visible = false
	
	if (Global.unlock_area2):
		$StaticBody2D/CollisionPolygon2D.disabled = true

func _on_button_basquete_pressed():
	get_tree().change_scene("res://basquete/basquete_main.tscn")


func _on_button_pingpong_pressed():
	get_tree().change_scene("res://pingpong.tscn")
	


func _on_button_unlock_area2_pressed():
	get_tree().change_scene("res://map_unlock/Control.tscn")


func _on_button_skate_pressed():
	get_tree().change_scene("res://MinigameSkate/game.tscn")
