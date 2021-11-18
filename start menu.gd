extends Node2D


func _ready():
	$AnimatedSprite/AnimationPlayer.play("MenuAnimacao")


func _on_Button_pressed():
	get_tree().change_scene("res://UserInput/UserNameInput.tscn")
