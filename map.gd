extends Node2D

onready var score_label: = $CanvasLayer/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
#	set_mm()
	if (Global.first):
		var dir = Directory.new()
		dir.remove("user://saved_data.dat")
		#$area2/CollisionPolygon2D.disabled = false
		#$area3/CollisionPolygon2D.disabled = false
		#$area4/CollisionPolygon2D.disabled = false
		#$area5/CollisionPolygon2D.disabled = false
		$area2/CollisionPolygon2D.disabled = true
		$area3/CollisionPolygon2D.disabled = true
		$area4/CollisionPolygon2D.disabled = true
		$area5/CollisionPolygon2D.disabled = true
		Global.first = false
	if (Global.first_score):
		var dir = Directory.new()
		dir.remove("user://saved_score.dat")
		Global.first_score = false
	$KinematicBody2D.position = load_data()
	Global.main_score = Global.load_score()
	$button_pingpong.visible = false
	$button_basquete.visible = false
	$button_skate.visible = false
	$button_back_in_time.disabled = true
	
	
func _process(delta):
	var x = $KinematicBody2D.position.x
	var y = $KinematicBody2D.position.y
	if x > 172 && x < 1002 && y > 1012 && y < 1534:
		$button_pingpong.visible = true
		$CanvasLayer/MarginContainer/Panel/label_pingpong.visible = true
		$CanvasLayer/MarginContainer/Panel.visible = true
	if !(x > 172 && x < 1002 && y > 1012 && y < 1534):
		$button_pingpong.visible = false
		$CanvasLayer/MarginContainer/Panel/label_pingpong.visible = false
		$CanvasLayer/MarginContainer/Panel.visible = false
		
		
	if x > 3785 && x < 4585 && y > -2421 && y < 1621:
		$button_basquete.visible = true
		$CanvasLayer/MarginContainerBasquete/Panel/label_basquete.visible = true
		$CanvasLayer/MarginContainerBasquete/Panel.visible = true
	if !(x > 3785 && x < 4585 && y > -2421 && y < -1621):
		$button_basquete.visible = false
		$CanvasLayer/MarginContainerBasquete/Panel/label_basquete.visible = false
		$CanvasLayer/MarginContainerBasquete/Panel.visible = false
	if x > 5364 && x < 6164 && y > -100 && y < 724:
		$button_skate.visible = true
		$CanvasLayer/MarginContainerSkate/Panel/label_skate.visible = true
		$CanvasLayer/MarginContainerSkate/Panel.visible = true
	if !(x > 5364 && x < 6164 && y > -100 && y < 724):
		$button_skate.visible = false
		$CanvasLayer/MarginContainerSkate/Panel/label_skate.visible = false
		$CanvasLayer/MarginContainerSkate/Panel.visible = false
	if x > 5818 && x < 6618 && y > -2727 && y < -1927:
		#$button_back_in_time.visible = true
		$CanvasLayer/MarginContainerBackInTime/Panel/label_backintime.visible = true
		$CanvasLayer/MarginContainerBackInTime/Panel.visible = true
	if !(x > 5818 && x < 6618 && y > -2727 && y < -1927):
		#$button_back_in_time.visible = false
		$CanvasLayer/MarginContainerBackInTime/Panel/label_backintime.visible = false
		$CanvasLayer/MarginContainerBackInTime/Panel.visible = false
	if (Global.unlock_area2):
		$area2/CollisionPolygon2D.disabled = true
		$area2/mist.visible = false
		$button_unlock_area2.disabled = true
	if (Global.unlock_area3):
		$area3/CollisionPolygon2D.disabled = true
		$area3/mist.visible = false
		$button_unlock_area3.disabled = true
	if (Global.unlock_area4):
		$area4/CollisionPolygon2D.disabled = true
		$area4/mist.visible = false
		$button_unlock_area4.disabled = true
	if (Global.unlock_area5):
		$area5/CollisionPolygon2D.disabled = true
		$area5/mist.visible = false
		$button_unlock_area5.disabled = true
	
	if (Global.main_score >= 1):
		$button_back_in_time.disabled = false
	#print(Global.main_score)
	#(str(Global.main_score))
	score_label.text = str(Global.main_score)
	save()
	Global.save_score(Global.main_score)
#
#func set_mm():
#	mm = map.instance()
#	$KinematicBody2D/Camera2D.add_child(mm)

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

func _on_button_basquete_pressed():
	save()
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://basquete/basquete_main.tscn")


func _on_button_pingpong_pressed():
	save()
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://pingpong.tscn")

func _on_button_skate_pressed():
	save()
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MinigameSkate/game.tscn")

func _on_button_unlock_area2_pressed():
	save()
	Global.save_score(Global.main_score)
	Global.area_to_unlock = 2
	get_tree().change_scene("res://map_unlock/Control.tscn")

func _on_button_unlock_area3_pressed():
	save()
	Global.save_score(Global.main_score)
	Global.area_to_unlock = 3
	get_tree().change_scene("res://map_unlock/Control.tscn")

func _on_button_unlock_area4_pressed():
	save()
	Global.save_score(Global.main_score)
	Global.area_to_unlock = 4
	get_tree().change_scene("res://map_unlock/Control.tscn")

func _on_button_unlock_area5_pressed():
	save()
	Global.save_score(Global.main_score)
	Global.area_to_unlock = 5
	get_tree().change_scene("res://map_unlock/Control.tscn")


func _on_button_voltarNoTempo_pressed():
	pass # Replace with function body.

func _on_button_back_in_time_pressed():
	print("EU")
	get_tree().change_scene("res://historia_final/scene1.tscn")

func _on_lixo1_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")

func _on_lixo2_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")

func _on_lixo3_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")

func _on_lixo4_pressed():
	get_tree().change_scene("res://coleta_de_lixo_main.tscn")



