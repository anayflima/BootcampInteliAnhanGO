extends CanvasLayer

var character_name = Global.character_name
onready var correct_label: = $TextboxContainer/MarginContainer/HBoxContainer/Label

func _ready():
	$TextboxContainer.hide()
	$TextboxContainer2.hide()
	$Anhanga.hide()

func _process(delta):
	pass

func _on_option1_pressed():
	$TextboxContainer2.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option3.disabled = true
	$option4.disabled = true
	$option1.modulate = Color(255,0,0,0.4)

func _on_option2_pressed():
	$TextboxContainer2.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option3.disabled = true
	$option4.disabled = true
	$option2.modulate = Color(255,0,0,0.4)

func _on_option3_pressed():
	$TextboxContainer2.show()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option3.disabled = true
	$option4.disabled = true
	$option3.modulate = Color(255,0,0,0.4)

func _on_option4_pressed():
	$TextboxContainer.show()
	$TextboxContainer2.hide()
	$Anhanga.show()
	$option1.disabled = true
	$option2.disabled = true
	$option3.disabled = true
	$option4.disabled = true
	$option4.modulate = Color(0,255,0,0.4)
	correct_label.text = "Muito bem {name}! Você sabia que o Parque do Povo oferece estruturas como aparelhos de ginástica de baixo impacto, parquinho infantil e ciclovia? Você se exercitou bastante nas fases anteriores, aproveite essas e outras atividades disponíveis no parque e movimente-se!".format({"name": character_name})
	if (Global.first_question):
		Global.quiz_score += 5
		Global.main_score += 5
		print("deu 1")
		Global.first_question = false
	
	
func _on_Button2_pressed():
	Global.quiz_score = 0
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")

func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://quiz_game/question2.tscn")