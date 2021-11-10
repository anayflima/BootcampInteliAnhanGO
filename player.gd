extends KinematicBody2D

export var speed =   30
const tileSize = 16.0
var current_scene = null

var initposition = Vector2(0,0)
#var direcao = Vector2(0,0)
var percent_moved_to_next_tile = 0.0
var velocidade = Vector2.ZERO
var moving: bool = false

func _ready():
	initposition = position #pega a posição do player
	
func _physics_process(delta):
	var vetor_entrada = Vector2.ZERO
	vetor_entrada.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	vetor_entrada.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	velocidade = vetor_entrada
#	if vetor_entrada != Vector2.ZERO:
#		initposition = position #atualiza a sposição e faz ele se mexer
#		moving = true
	if (vetor_entrada == Vector2.ZERO):
		$AnimationPlayer.stop()
	else:
		if (vetor_entrada.x > 0):
			$AnimationPlayer.play("move_right")
		elif (vetor_entrada.x < 0):
			$AnimationPlayer.play("move_left")
		elif (vetor_entrada.y > 0):
			$AnimationPlayer.play("move_down")
		elif (vetor_entrada.y < 0):
			$AnimationPlayer.play("move_up")
	move_and_slide(velocidade*500)