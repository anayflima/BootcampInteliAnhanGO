extends LineEdit

var correct_answer: String = 'Parabéns! O código está correto!'
var wrong_answer: String = 'O código está incorreto. Tente novamente!'
onready var response_node: Label = self.get_parent().get_node("Label2")


func _on_LineEdit_text_entered(new_text):
	Global.character_name = new_text 
	response_node.show()
	print(Global.area_to_unlock)
	if Global.area_to_unlock == 2 && new_text == "1234":
		Global.unlock_area2 = true
		response_node.text = correct_answer
	elif Global.area_to_unlock == 3 && new_text == "123":
		Global.unlock_area3 = true
		response_node.text = correct_answer
	elif Global.area_to_unlock == 4 && new_text == "12":
		Global.unlock_area4 = true
		response_node.text = correct_answer
	elif Global.area_to_unlock == 5 && new_text == "1":
		Global.unlock_area5 = true
		response_node.text = correct_answer
	else:
		response_node.text = wrong_answer