extends CanvasLayer

var character_name = Global.character_name
onready var wrong_label: = $TextboxContainer2/MarginContainer/HBoxContainer/Label

func _ready():
	$TextboxContainer.hide()
	$TextboxContainer2.hide()
	$Anhanga.hide()

func _process(delta):
	pass

func _on_option1_pressed():
	$TextboxContainer.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option1.modulate = Color(0,255,0,0.4)

func _on_option2_pressed():
	$TextboxContainer2.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option2.modulate = Color(255,0,0,0.4)
	wrong_label.text = "Poxaa {name}! \nVisite o parque para saber mais sobre o destino que o parque dá para o lixo.".format({"name": character_name})


func _on_Button2_pressed():
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://quiz_game/question3.tscn")
