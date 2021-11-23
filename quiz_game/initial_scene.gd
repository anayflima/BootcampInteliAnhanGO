extends CanvasLayer

const CHAR_READ_RATE = 0.03
onready var textbox_container = $TextboxContainer
onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

onready var text_label: = $TextboxContainer/MarginContainer/HBoxContainer/Label

var character_name = Global.character_name

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	#queue_text("Há muito tempo, contava-se a lenda de um espírito protetor das florestas, rios e animais, denominado Anhangá, um ser metamorfo e capaz de criar ilusões. Ele comumente se revelava como um veado branco, iluminado, que defendia e punia os que faziam mal à selva. Com o passar dos anos, a cidade foi tomando conta da floresta e, por conta do desmatamento, o Anhangá ressurgiu...")
	queue_text("Anhangá: {name}, o caminho até aqui não foi fácil, por isso meus parabéns! Você está cada vez mais próximo de retornar ao passado, mas antes, preciso que vença mais um desafio. Sei que para chegar até aqui você visitou o Parque do Povo e conseguiu alguns códigos.. Espero que tenha aproveitado o passeio para conhecer mais sobre o parque e sua estrutura. O desafio de agora vai depender desses conhecimentos adquiridos. Você precisa responder três questões e, assim, conseguir mais pontos para voltar no tempo.. Por isso, atenção!".format({"name": character_name}))


func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.percent_visible = 1.0
				$Tween.stop_all()
				end_symbol.text = "v"
				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
				hide_textbox()

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.percent_visible = 0.0
	change_state(State.READING)
	show_textbox()
	$Tween.interpolate_property(label, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

func _on_Tween_tween_completed(object, key):
	end_symbol.text = "v"
	change_state(State.FINISHED)
	text_label.text = "Muito bem {name}! Você sabia que o Parque do Povo oferece estruturas como aparelhos de ginástica de baixo impacto, parquinho infantil e ciclovia? Você se exercitou bastante nas fases anteriores, aproveite essas e outras atividades disponíveis no parque e movimente-se!".format({"name": character_name})

func _on_Button2_pressed():
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://quiz_game/initial_scene2.tscn")
