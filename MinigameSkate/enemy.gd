extends Node2D


var velocity = Vector2()

func init(pos):
	position.y = pos

func stop():
	$AnimationPlayer.stop()
	Global.game_speed = 0

func _ready():
	$AnimationPlayer.play("flying")


func _process(delta):
	position.x += Global.game_speed * -1 * delta
