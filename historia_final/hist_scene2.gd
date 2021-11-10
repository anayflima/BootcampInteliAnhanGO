extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://historia_inicial/initial_story_scene_1.tscn")
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene("res://historia_inicial/hist_scene3.tscn")
	pass # Replace with function body.
