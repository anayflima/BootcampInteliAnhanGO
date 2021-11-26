extends Node2D

#onready var scene = load("res://autoloads/Music.tscn")
#onready var MusicController = get_node("/root/autoloads/Music.tscn/MusicController")
#var MusicController = get_tree().get_root().get_node("autoloads/Music.tscn/MusicController")

func _ready():
#	var MusicController = preload("res://autoloads/Music.tscn").instance()
#	add_child(MusicController)
#	MusicController.play_music()
	$AnimatedSprite/AnimationPlayer.play("MenuAnimacao")


func _on_Button_pressed():
	get_tree().change_scene("res://UserInput/UserNameInput.tscn")
