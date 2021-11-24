extends Node2D


func _ready():
	if OS.get_name() == "Android" or OS.get_name() == "HTML5":
		visible = true

