extends Node2D


#onready var map = preload("res://minimap.tscn")
#
#var mm

# Called when the node enters the scene tree for the first time.
func _ready():
#	set_mm()
	$KinematicBody2D.position = load_data()
	$button_pingpong.visible = false
	$button_basquete.visible = false
	$StaticBody2D/CollisionPolygon2D.disabled = true
	
	
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
		$StaticBody2D/mist.visible = false
	save()
#
#func set_mm():
#	mm = map.instance()
#	$KinematicBody2D/Camera2D.add_child(mm)
	

func _on_button_basquete_pressed():
	save()
	get_tree().change_scene("res://basquete/basquete_main.tscn")


func _on_button_pingpong_pressed():
	save()
	get_tree().change_scene("res://pingpong.tscn")
	


func _on_button_unlock_area2_pressed():
	save()
	get_tree().change_scene("res://map_unlock/Control.tscn")


func _on_button_skate_pressed():
	save()
	get_tree().change_scene("res://MinigameSkate/game.tscn")

func save():
	var saved_position = {
		"player_x" : $KinematicBody2D.position.x,
		"player_y" : $KinematicBody2D.position.y
	}
	var file = File.new()
	file.open("user://saved_data.dat", File.WRITE)
	file.store_line(to_json(saved_position))
	file.close()
	

func load_data():
	var file = File.new()
	if not file.file_exists("user://saved_data.dat"):
		var player_position = Vector2(0,0)
		player_position.y = 463
		player_position.x= 361
		return player_position
	file.open("user://saved_data.dat", File.READ)
	var content = parse_json(file.get_line())
	var player_position = Vector2(0,0)
	for i in content.keys():
		if i == "player_x":
			player_position.x = content.get(i)
		if i == "player_y":
			player_position.y = content.get(i)
	file.close()
	return player_position
