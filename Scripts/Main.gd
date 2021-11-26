##################################################
#### main author : Domogoj Satrap
#### github : https://github.com/Domogo
##################################################
extends Node2D


var BALL_NODE = preload("../Scenes/Ball.tscn")
var ball 

const DEFAULT_Y = 150

var rng = RandomNumberGenerator.new()

const p1_x = 45
var p1_y = DEFAULT_Y
var p1_score = 0


const p2_x = 990
var p2_y = DEFAULT_Y
var p2_score = 0

var playing = false
var score_event = false
var game_done = false

const SPACE_TO_PLAY = "Aperte espaco para jogar"
const P1_WIN = "Voce venceu"
const P2_WIN = "Voce perdeu"
var message = SPACE_TO_PLAY
var my_random_number = rng.randi_range(100, 200)

func _ready():
	set_ball()
	$t1.set_paddle_position(p1_x, p1_y)
	$t2.set_paddle_position(p2_x, p2_y)
	display_message()
	update_score()
	get_node("cima").visible = false
	get_node("baixo").visible = false
	$Popup.popup()

#começar o jogo
func _input(_event):
	if Input.is_action_just_pressed("ui_accept"):
		play()
	if Input.is_key_pressed(KEY_ESCAPE):
		Global.save_score(Global.main_score)
		get_tree().change_scene("res://MiniMap/MiniMap.tscn")


func _process(delta):
	handle_movement_input(delta)
	$t1.set_paddle_position(p1_x, p1_y)
	$t2.set_paddle_position(p2_x, p2_y)
	check_point_scored()
	handle_score_event()
	handle_game_end()


func play():
	if game_done: # if game was done, reset states to start a fresh game
		game_done = false
		p1_score = 0
		p2_score = 0
		message = SPACE_TO_PLAY
		update_score()
	playing = true
	ball.set_playing(playing)
	
	get_node("TouchScreenButton").visible = false
	get_node("cima").visible = true
	get_node("baixo").visible = true

#detectar ponto

func check_point_scored():
	if ball.position.x <= 0:
		score_event = true
		p2_score += 1
	if ball.position.x >= 1000:
		score_event = true
		p1_score += 1
		Global.main_score += 0.2 
	update_score()
	if p1_score == 5 or p2_score == 5:
		game_done = true

#movimentação e ia do jogador adversário

func handle_movement_input(delta):
	if Input.is_action_pressed("ui_up"):
		p1_y -= 300 * delta
	if Input.is_action_pressed("ui_down"):
		p1_y += 300 * delta
	if abs(ball.position.y - p2_y) > 25:
		if ball.position.y > p2_y :
			p2_y += my_random_number * delta
		else:
			p2_y -= my_random_number * delta


func handle_score_event():
	if score_event:
		remove_ball()
		set_ball()
		reset_paddle_positions()
		display_message()
		playing = false
		score_event = false
		$ScoreSound.play()


func remove_ball():
	remove_child(ball)


func set_ball():
	ball = BALL_NODE.instance()
	add_child(ball)


func reset_paddle_positions():
	p1_y = DEFAULT_Y
	p2_y = DEFAULT_Y


func update_score():
	$Player1Score.text = str(p1_score)
	$Player2Score.text = str(p2_score)

#pontuação vencedora

func handle_game_end():
	if game_done:
		if p1_score == 5:
			message = P1_WIN
		else:
			message = P2_WIN
		display_message()


func display_message():	
	get_node("TouchScreenButton").visible = true


func _on_Button_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")
