extends Node2D

#var bubble_text = "Em 1920, numa floresta de São Paulo encontrava-se*personagem*"
var character_name = "Ariel"
var bubble_text = "Há muito tempo, contava-se a lenda de um espírito protetor\n das florestas, rios e animais, denominado Anhangá. \n Ele comumente se revelava como um veado branco, iluminado, que \n defendia e punia os que faziam mal a selva, por meio da criação de ilusões.\n Com o passar dos anos, a cidade foi tomando conta da floresta \n e, por conta do desmatamento, o Anhangá ressurgiu."
#var bubble_text = "Em 1920, numa floresta de São Paulo, encontrava-se {name},\n que era conhecido entre os exploradores como 'Devasta',\n pelo seu costume e prazer em devastar a fauna e a flora local. \n Certo dia, ao derrubar o último pau-brasil de sua cidade,\n foi surpreendido por algo intrigante...".format({"name": character_name})
#var bubble_text = "Você não pode desmatar a floresta!".format({"name": character_name})
#var bubble_text = "Você não pode desmatar a floresta!".format({"name": character_name})
var can_shrink = false
var shrink =  true
var bubble_text_length = 0
var bubble_text_index = 0
var current_text = ""

onready var lbltext = get_node("VBoxContainer/Label")
onready var ninerect = get_node("VBoxContainer/Label/NinePatchRect")

onready var timer = get_node("Timer")

var do_close = false

func _ready():
	bubble_text_length = bubble_text.length()
	timer.start(1)
	pass # Replace with function body.



func _on_Timer_timeout():
	if(!do_close):
		current_text += bubble_text[bubble_text_index]
		lbltext.text = current_text
		
		if(bubble_text_index < bubble_text_length -1):
			timer.start(0.04)
			bubble_text_index += 1
		else:
			if(!do_close):
				do_close = true
				timer.start(1)
	if(Input.is_action_just_pressed("ui_accept")):
		queue_free()
		#remove_child()
#	else:
#		if (shrink):
#			if(bubble_text_length > 0):
#				current_text.erase(bubble_text_length -1,1)
#				lbltext.text = current_text
#				bubble_text_length -= bubble_text_length -1
#				if(can_shrink):
#					ninerect.rect_size -= Vector2(6,0)
#					ninerect.rect_position += Vector2(3,0)
#			if(bubble_text_length > 0):
#				current_text.erase(bubble_text_length -1,1)
#				lbltext.text = current_text
#				bubble_text_length -= 1
#				if(can_shrink):
#					ninerect.rect_size -= Vector2(6,0)
#					ninerect.rect_position += Vector2(3,0)
#
#				timer.start(0.001)
#			else:
#				queue_free()
	
	pass # Replace with function body.