extends Node
export (PackedScene) var ScoreItem
export (PackedScene) var MeteorItem
export (PackedScene) var ShieldItem
export (PackedScene) var BoostItem

var score = 0
var screen_max = 0


func _ready():
	$HUD.old_score = 0
	$HUD/Popup.popup()
	randomize()
	get_tree().paused = false
	on_screen_resize()
	get_tree().get_root().connect("size_changed", self, "on_screen_resize")


func on_screen_resize():
	screen_max = max(get_viewport().size.x, get_viewport().size.y)
	
	$Ship/Camera2D.zoom = Vector2(1.0,1.0) * (1600/get_viewport().size.y)
	$Ship/Camera2D.on_screen_resize()


func _process(delta):
	
	var ship_pos = $Ship.position
#	$Background.position  = 0.80 * $Ship.position
#	$Background2.position = 0.85 * $Ship.position
#	$Background3.position = 0.90 * $Ship.position
	$Sprite.position = 0.8 * $Ship.position
	# delete objects when they are far enough from the ship
	for node in get_children():
		if node.is_in_group("items"):
			var d = (node.position-ship_pos).length()
			
			if d > screen_max*2:
				node.queue_free()


func _on_Ship_add_points(s):
	score += s
#	Global.main_score += s
	$HUD.update_score(score)
	$SpawnTimer.start()


func spawn(item):
	var inst = item.instance()
	add_child(inst)
	
	# randomized position in front of the ship
	var pos = $Ship.position + Vector2(0,-1.5*screen_max).rotated($Ship.rotation+rand_range(-0.4, 0.4))
	inst.position = pos


func _on_SpawnTimer_timeout():
	score += 5
	$HUD.update_score(score)
	
	$SpawnTimer.wait_time = max($SpawnTimer.wait_time-0.01, 0.33)

	spawn(ScoreItem)
	spawn(MeteorItem)
	spawn(MeteorItem)
	
	if randi() % 100 < 5:
		spawn(ShieldItem)
		
	if randi() % 100 < 3:
		spawn(BoostItem)


func _on_Ship_death():
	$HUD.game_over()
	$Ship.hide()
	get_tree().paused = true
	$HUD.pause_mode = PAUSE_MODE_PROCESS


func _on_HUD_restart_game():
	get_tree().reload_current_scene()
