extends Node2D




var velocity = Vector2()


func init(pos, anim):
	if randf() > 0.5:
		$AnimationPlayer.play("big")
	else:
		$AnimationPlayer.play("small")

	position.x = pos.x
	position.y = pos.y

func stop():
	Global.game_speed = 0


func _process(delta):
	position.x += Global.game_speed * -1 * delta 
