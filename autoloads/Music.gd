extends Node

var background_music = load("res://autoloads/background_music.ogg")
var music_playing = true
var playback_position

# Called when the node enters the scene tree for the first time.
func _ready():
	$Music.stream = background_music
	print("musica")

func play_music():
	print("play")
	$Music.play()
	
func resume_music():
	if (music_playing):
		playback_position = $Music.get_playback_position()
		$Music.stop()
		music_playing = false
	else:
		$Music.play()
		$Music.seek(playback_position)
		music_playing = true
	print("parar")
	#$Music.stream = background_music
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
