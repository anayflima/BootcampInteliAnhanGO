extends KinematicBody2D

export var speed =   4
const tileSize = 16.0


var initposition = Vector2(0,0)
var direcao = Vector2(0,0)
var percent_moved_to_next_tile = 0.0

var moving: bool = false

func _ready():
	initposition = position #pega a posição do player
	
func _physics_process(delta):
	if moving == false:
		process_player_input() # pega qualquer movimento do player
	elif direcao != Vector2.ZERO: # se tiver alguma direção
		move(delta)
	else:
		moving = false # caso esteja só parado

func process_player_input():
	
	direcao.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direcao.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	if direcao != Vector2.ZERO:
		initposition = position #atualiza a posição e faz ele se mexer
		moving = true
		
func move(delta): 
	percent_moved_to_next_tile += speed * delta  # apenas atualiza a tile para que ele não fique parado no meio de uma, usando 16 aqui
	if percent_moved_to_next_tile >= 1.0 :
		position = initposition + (tileSize * direcao)
		percent_moved_to_next_tile = 0.0
		moving = false
	else:
		position = initposition + (tileSize * direcao * percent_moved_to_next_tile)
		
