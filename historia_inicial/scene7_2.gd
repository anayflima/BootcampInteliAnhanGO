extends CanvasLayer

const CHAR_READ_RATE = 0.03
onready var textbox_container = $TextboxContainer2
onready var start_symbol = $TextboxContainer2/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer2/MarginContainer/HBoxContainer/End
onready var label = $TextboxContainer2/MarginContainer/HBoxContainer/Label

var character_name = Global.character_name

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

onready var text_label := $TextboxContainer2/MarginContainer/HBoxContainer/Label

func _ready():
	text_label.text = "{name}: Então eu devo ir para o Parque do Povo real para encontrar os códigos?".format({"name": character_name})
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("{name}: Então eu devo ir para o Parque do Povo real para encontrar os códigos?".format({"name": character_name}))

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

func _on_Button2_pressed():
	get_tree().change_scene("res://historia_inicial/scene7_1.tscn")

func _on_Button_pressed():
	get_tree().change_scene("res://historia_inicial/scene7_3.tscn")
