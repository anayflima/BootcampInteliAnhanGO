extends LineEdit

var template: String = 'Aproveite o jogo AnhanGO, '
onready var response_node: Label = self.get_parent().get_node("Label2")


func _on_LineEdit_text_entered(new_text):
	Global.character_name = new_text 
	response_node.show()
	response_node.text = template + new_text + "!"
