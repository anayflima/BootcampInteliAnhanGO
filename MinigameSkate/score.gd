extends Label

var is_scoring = true
var count = 0

func _ready():
	pass 
	
func _physics_process(delta):
	if is_scoring:
		text = str(Global.game_score).pad_zeros(5)


func _on_player_game_over():
	is_scoring = false

func _on_Timer2_timeout():
	if is_scoring:
		Global.game_score += 1
		count+=1
		if count >= 10:
			Global.main_score += 0.1
			count = 0
			
		if (Global.game_score > 0 and Global.game_score % 100 == 0):
			Global.play_next_level_sound()
			Global.game_speed += 100
 
