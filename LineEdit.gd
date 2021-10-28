extends LineEdit

var correct_answer: String = 'Parabéns! O código está correto!'
var wrong_answer: String = 'O código está incorreto. Tente novamente!'
onready var response_node: Label = self.get_parent().get_node("Label2")


func _on_LineEdit_text_entered(new_text):
	Global.character_name = new_text 
	response_node.show()
	if new_text == "1234":
		Global.unlock_area2 = true
		response_node.text = correct_answer
		print(Global.unlock_area2)
	else:
		response_node.text = wrong_answer