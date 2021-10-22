extends Node2D

export var bubble: PackedScene

var text_array = ["Ah, como eu adoro desmatar a floresta"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var initial_bubble = bubble.instance()
	if(Input.is_action_just_pressed("ui_accept")):
		#remove_child(initial_bubble)
		var new_bubble = bubble.instance()
		new_bubble.bubble_text = text_array[0]
		new_bubble.global_position = Vector2(300,100)
		new_bubble.can_shrink = false
		add_child(new_bubble)


func _on_Button_pressed():
	get_tree().change_scene("res://historia_inicial/hist_scene2.tscn")
