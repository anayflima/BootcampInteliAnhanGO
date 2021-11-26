extends CanvasLayer

signal restart_game
var old_score = 0
var high_score = 0
var count = 0

func _ready():
	load_highscore()
	$GameOverLabel.hide()
	$RestartButton.hide()
	$HighScoreCaption.hide()
	$HighScoreLabel.hide()

#contagem para adição no main_score, com uma função recursiva
func update_score(score):
	count += score - old_score
	if count >= 300:
		Global.main_score += 1
		count = 0
	old_score = score
	$ScoreLabel.text = str(score)

func game_over():
	$GameOverLabel.show()
	$RestartButton.show()
	$HighScoreCaption.show()
	$HighScoreLabel.show()
	$GetOutButton.hide()
	#substitui o high score
	if int($ScoreLabel.text) > high_score:
		high_score = int($ScoreLabel.text)
		save_highscore()
		
	$HighScoreLabel.text = String(high_score)


func _on_RestartButton_pressed():
	old_score = 0 
	emit_signal("restart_game")
	

func _on_GetOutButton_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")


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
		
	if (Global.first_high_score_trash):
		var dir = Directory.new()
		dir.remove("user://data.bin")
		Global.first_high_score_trash = false
	
	f.open("user://data.bin", File.READ)
	high_score = int(f.get_as_text())
	f.close()
