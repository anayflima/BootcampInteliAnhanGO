extends CanvasLayer

signal restart_game

var high_score = 0

func _ready():
	load_highscore()
	$GameOverLabel.hide()
	$RestartButton.hide()
	$HighScoreCaption.hide()
	$HighScoreLabel.hide()
	$GetOutButton.hide()
	
func update_score(score):
	Global.main_score = score
	$ScoreLabel.text = str(score)

func game_over():
	$GameOverLabel.show()
	$RestartButton.show()
	$HighScoreCaption.show()
	$HighScoreLabel.show()
	$GetOutButton.show()
	
	if int($ScoreLabel.text) > high_score:
		high_score = int($ScoreLabel.text)
		save_highscore()
		
	$HighScoreLabel.text = String(high_score)


func _on_RestartButton_pressed():
	emit_signal("restart_game")

func _on_GetOutButton_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://map.tscn")

func save_highscore():
	var f = File.new()
	f.open("user://data.bin", File.WRITE)
	f.store_string($ScoreLabel.text)
	f.close()


func load_highscore():
	var f = File.new()
	
	if not f.file_exists("user://data.bin"):
		high_score = 0
		return
	
	f.open("user://data.bin", File.READ)
	high_score = int(f.get_as_text())
	f.close()
