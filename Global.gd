extends Node

#desbloqueios de área

var character_name = "Ariel"
var unlock_area2 = false
var unlock_area3 = false
var unlock_area4 = false
var unlock_area5 = false
var area_to_unlock = 1
var first = true
var first_score = true
var first_high_score_skate = true
var first_high_score_trash = true
var main_score = 0
var unlock_back_in_time = false 
var first_question = true
var second_question = true
var third_question = true
var quiz_score = 0
var button_music = false

var initial_score = 90 # 90 para teste. Para jogo real a pontuacao começa com 0

#salvar pontuação

func save_score(score):
	var file = File.new()
	file.open("user://saved_score.dat", File.WRITE)
	file.store_float(score)
	file.close()

func load_score():
	var file = File.new()
	if not file.file_exists("user://saved_score.dat"):
		return initial_score
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
	var MusicController = preload("res://autoloads/Music.tscn").instance()
	add_child(MusicController)
	MusicController.play_music()
	add_child(audio_player)
	start()

func resume_music():
#	var MusicController = preload("res://autoloads/Music.tscn").instance()
#	add_child(MusicController)
	print("parar")
	#$Music.stream = background_music
	$MusicController.resume_music()

func play_died_sound():
	audio_player.stream = load("res://MinigameSkate/assets/died.wav")
	audio_player.play()

func play_jump_sound():
	#audio_player.stream = load("res://MinigameSkate/assets/jump.wav")
	audio_player.play()


func play_next_level_sound():
	audio_player.stream = load("res://MinigameSkate/assets/new_level.wav")
	audio_player.play()

func start():
	game_score = 0
	game_speed = 400

