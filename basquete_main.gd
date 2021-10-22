extends Node2D


var x
var y
var count = 0
var verif = true
var verif_1 = true
var point = true

# Called when the node enters the scene tree for the first time.
func _ready():
	var initial_x = $bodyball.position.x
	var initial_y = $bodyball.position.y
	$button_play_again.visible = false
	$button_get_out.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x = $bodyball.position.x
	y = $bodyball.position.y
	if y>321:
		count += 1
	if count == 150:
		$button_play_again.visible = true
		$button_get_out.visible = true

	if (y<-118):
		$button_play_again.visible = true
		$button_get_out.visible = true
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
		if $Node2D/angleslide.value == $Node2D/angleslide.max_value :
			verif_1 = false
	if !verif_1 :
		$Node2D/angleslide.value -= 1
		if $Node2D/angleslide.value == $Node2D/angleslide.min_value:
			verif_1 = true
	$DisplayMessage2.text = str(Globals.score)
	point()



func _on_Button_pressed():
	var force = $Node2D/forceslide.value
	var angle = $Node2D/angleslide.value
	var offset = Vector2(0,0)
	var impulse = get_impulse(angle,force)
	$bodyball.apply_impulse(offset,impulse)
	
func get_impulse(angle,size):
	angle = angle*PI/180
	var fx = size * cos(angle)
	var fy = - size * sin(angle)
	
	var out = Vector2(fx,fy)
	
	return out
	
func point():
	if (x>320 && x<324 && y>89 && point== true ):
		Globals.score += 1
		point = false


func _on_button_play_again_pressed():
	get_tree().reload_current_scene()


func _on_button_get_out_pressed():
	get_tree().change_scene("res://map.tscn")
