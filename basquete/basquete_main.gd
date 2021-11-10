extends Node2D


var x
var y
var count = 0
var verif = true
var verif_1 = true
var point = true
var radius = 50
var slides = true


# Called when the node enters the scene tree for the first time.
func _ready():
	$button_play_again.visible = false
	$botaoJogar.visible = true
	$button_get_out.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = $KinematicBody2D/bodyball.position.x
	y = $KinematicBody2D/bodyball.position.y
	var angle = deg2rad($Node2D/angleslide.value)
	var from = Vector2(15+x,y)
	var to = get_point(angle,radius)
	
	
	#valores de acerto = 60, 275  // 66, 297 // 62, 281
	
	if y>348:
		count += 1
	if count == 150:
		$button_play_again.visible = true
		$button_get_out.visible = true

	if (y<-10):
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
	if (x>776 && x<814 && y>132 && y<163 && point== true ):
		Global.score += 1
		point = false


func _on_button_play_again_pressed():
	get_tree().reload_current_scene()


func _on_button_get_out_pressed():
	get_tree().change_scene("res://map.tscn")


func get_point(angle,radius):
	var c = cos(angle)
	var s = sin(angle)
	x = $KinematicBody2D/bodyball.position.x
	y = $KinematicBody2D/bodyball.position.y
	var point = Vector2(15+x+c*radius,y-s*radius)
	return point

func draw_line_angle(from, to):
	$linha.points = []
	
	$linha.add_point(from)
	$linha.add_point(to)
