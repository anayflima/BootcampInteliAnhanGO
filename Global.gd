extends Node

var character_name = "Ariel"
var unlock_area2 = false
var unlock_area3 = false
var unlock_area4 = false
var unlock_area5 = false
var area_to_unlock = 1
var first = true
var main_score = 0
var unlock_back_in_time = false 

func save_score(score):
	var file = File.new()
	file.open("user://saved_score.dat", File.WRITE)
	file.store_float(score)
	file.close()

func load_score():
	var file = File.new()
	if not file.file_exists("user://saved_score.dat"):
		return 0
	file.open("user://saved_score.dat", File.READ)
	var content = file.get_float()
	var score = content
	file.close()
	return score

# Basketball minigame global variables
var score = 0

# Skate minigame global variables
var game_speed
var game_score
var audio_player = AudioStreamPlayer.new()
var player_global_x = 361
var player_global_y = 463

func _ready():
	add_child(audio_player)
	start()

func play_died_sound():
	audio_player.stream = load("res://MinigameSkate/assets/died.wav")
	audio_player.play()

func play_jump_sound():
	audio_player.stream = load("res://MinigameSkate/assets/jump.wav")
	audio_player.play()


func play_next_level_sound():
	audio_player.stream = load("res://MinigameSkate/assets/new_level.wav")
	audio_player.play()

func start():
	game_score = 0
	game_speed = 400

