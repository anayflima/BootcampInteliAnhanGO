extends CanvasLayer

var character_name = Global.character_name
onready var correct_label: = $TextboxContainer/MarginContainer/HBoxContainer/Label
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
	correct_label.text = "Booooa {name}! O parque possui sete roteiros botânicos e estão distribuídos por todo parque. Como você sabe o desmatamento é um grande desrespeito com a natureza, por isso, é muito legal ter um pedacinho de cada bioma brasileiro dentro da cidade não é mesmo? Valoriza a natureza no nosso dia-a-dia.".format({"name": character_name})
	if (Global.third_question):
		Global.quiz_score += 5
		Global.main_score += 5
		print("deu 3")
		Global.third_question = false

func _on_option2_pressed():
	$TextboxContainer2.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option2.modulate = Color(255,0,0,0.4)
	wrong_label.text = "É {name}... acho que você vai precisar ir ao parque um pouco mais. Vá até lá e volte para responder essa pergunta novamente.".format({"name": character_name})


func _on_Button2_pressed():
	Global.quiz_score = 0
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")

func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://quiz_game/final_scene.tscn")
