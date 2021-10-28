extends KinematicBody2D

signal add_points(points)
signal death

export (int) var speed = 500
export (float) var speed_increase = 0.15
export (float) var rotation_speed = 1.5

var velocity = Vector2()
var rotation_dir = 0
var health = 100.0
var shield = 100.0
var boost = 1.0

func get_input():
	velocity = Vector2()
	
	# control by tilting phone on mobile
	var acc = Input.get_accelerometer().x
	if abs(acc) > 0:
		rotation_dir = clamp(acc/2, -1.5, 1.5);
		return
	
	# keyboard controls
	if Input.is_action_pressed('right'):
		rotation_dir = lerp(rotation_dir, 1.25, 0.1)
	elif Input.is_action_pressed('left'):
		rotation_dir = lerp(rotation_dir, -1.25, 0.1)
	else:
		rotation_dir = lerp(rotation_dir, 0, 0.25)


func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	
	boost = max(1.0, boost-0.01)
	speed += speed_increase
	velocity = Vector2(0, -speed*boost).rotated(rotation)
	move_and_slide(velocity)
	
	if get_slide_count():
		# 2D particles disabled due to bug on Chrome (https://github.com/godotengine/godot/issues/16281)
		#$HitEffect.emitting = true
		$HitEffect.global_position = get_slide_collision(0).position
		
		if shield > 0:
			shield -= 10
		else:
			$ShieldSprite.hide()
			health -= 10
	else:
		$HitEffect.emitting = false
	
	if health <= 0:
		emit_signal("death")


func _on_ItemCollectArea_area_entered(area):
	if area.is_in_group("score"):
		$ItemCollectAudioPlayer.play()
		emit_signal("add_points", 100)
		
	if area.is_in_group("shield"):
		shield = 100.0
		$AnimationPlayer.play("shield_activate")
		$ShieldAudioPlayer.play()
		$ShieldSprite.show()
		
	if area.is_in_group("boost"):
		boost = 2.0
		emit_signal("add_points", 500)
		$ItemCollectAudioPlayer.play()
		
	area.queue_free()
