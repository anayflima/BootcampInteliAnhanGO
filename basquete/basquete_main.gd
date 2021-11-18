extends Node2D


var x
var y
var count = 0
var verif = true
var verif_1 = true
var point = true
var radius = 50
var slides = true
var rng = RandomNumberGenerator.new()
var ball_x : int

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	var my_random_number = rng.randi_range(0,4)
	$button_play_again.visible = false
	$botaoJogar.visible = true
	$button_get_out.visible = false
	$Popup.popup()
	if my_random_number == 0 :
		pass
	elif my_random_number == 1:
		$KinematicBody2D.position.x += 100
	elif my_random_number == 2:
		$KinematicBody2D.position.x += 200
	elif my_random_number == 3:
		$KinematicBody2D.position.x += 300
	elif my_random_number == 4:
		$KinematicBody2D.position.x -= 100
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = $KinematicBody2D.position.x
	y = $KinematicBody2D.position.y
	var angle = deg2rad($Node2D/angleslide.value)
	var from = Vector2(42+x,y-51)
	var to = get_point(angle,radius)
	
	
	
	
	#valores de acerto = 60, 275  // 66, 297 // 62, 281
	
	if $KinematicBody2D/bodyball.position.y>13:
		count += 1
	if count == 150:
		$button_play_again.visible = true
		$button_get_out.visible = true

	if ($KinematicBody2D/bodyball.position.y<-335):
		$button_play_again.visible = true
		$button_get_out.visible = true
	if slides :
		if verif:
			$Node2D/forceslide.value += 1
			if $Node2D/forceslide.value == $Node2D/forceslide.max_value :
				verif = false
		if !verif :
			$Node2D/forceslide.value -= 1
			if $Node2D/forceslide.value == $Node2D/forceslide.min_value:
				verif = true
		if verif_1:
			$Node2D/angleslide.value += 1
			
			draw_line_angle(from,to)
			
			if $Node2D/angleslide.value == $Node2D/angleslide.max_value :
				verif_1 = false
		if !verif_1 :
			$Node2D/angleslide.value -= 1
			draw_line_angle(from,to)
			if $Node2D/angleslide.value == $Node2D/angleslide.min_value:
				verif_1 = true
	$pontuacao.text = str(Global.score)
	ball_x = $KinematicBody2D.position.x + $KinematicBody2D/bodyball.position.x
	point()



func _on_Button_pressed():
	var force = $Node2D/forceslide.value
	var angle = $Node2D/angleslide.value
	var offset = Vector2(0,0)
	var impulse = get_impulse(angle,force)
	$KinematicBody2D/bodyball.apply_impulse(offset,impulse)
	$KinematicBody2D/AnimationPlayer.play("jogando")
	$botaoJogar.visible = false
	slides = false
	$Node2D/angleslide.editable = false
	$Node2D/forceslide.editable = false
	$linha.points = []
	
	
	
func get_impulse(angle,size):
	angle = angle*PI/180
	var fx = size * cos(angle)
	var fy = - size * sin(angle)
	
	var out = Vector2(fx,fy)
	
	return out
	
func point():
	if (ball_x>789 && ball_x<839 && $KinematicBody2D/bodyball.position.y>-193 && $KinematicBody2D/bodyball.position.y<-160 && point== true ):
		Global.main_score += 5
		Global.score += 1
		point = false


func _on_button_play_again_pressed():
	get_tree().reload_current_scene()


func _on_button_get_out_pressed():
	Global.save_score(Global.main_score)
	get_tree().change_scene("res://MiniMap/MiniMap.tscn")


func get_point(angle,radius):
	var c = cos(angle)
	var s = sin(angle)
	x = $KinematicBody2D.position.x
	y = $KinematicBody2D.position.y
	var point = Vector2(42+x+c*radius,y-51-s*radius)
	return point

func draw_line_angle(from, to):
	$linha.points = []
	
	$linha.add_point(from)
	$linha.add_point(to)
