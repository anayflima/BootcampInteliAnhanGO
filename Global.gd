extends Node

var character_name = "Ariel"
var score = 0
var unlock_area2 = false
var unlock_area3 = false
var unlock_area4 = false
var unlock_area5 = false
var area_to_unlock = 1
var first = true

var game_speed
var game_score
var audio_player = AudioStreamPlayer.new()
var player_global_x = 361
var player_global_y = 463

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(audio_player)
	start()

func play_died_sound():
	audio_player.stream = load("res://assets/died.wav")
	audio_player.play()

func play_jump_sound():
	audio_player.stream = load("res://assets/jump.wav")
	audio_player.play()


func play_next_level_sound():
	audio_player.stream = load("res://assets/new_level.wav")
	audio_player.play()

func start():
	game_score = 0
	game_speed = 400

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
