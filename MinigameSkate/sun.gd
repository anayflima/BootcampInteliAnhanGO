extends Sprite


var stop = false


func _ready():
	global_position.x = 1000



func _process(delta):

	if (global_position.x < -300):
		global_position.x = 700
	
	if not stop:
		position.x -= 50 * delta


func _on_player_game_over():
	stop = true
