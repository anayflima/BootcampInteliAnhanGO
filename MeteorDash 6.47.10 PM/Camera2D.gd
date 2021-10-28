extends Camera2D

var rotTarget = 0.33
var rotLast = 0.0

func _ready():
	on_screen_resize()
	self.rotating = true
	get_tree().get_root().connect("size_changed", self, "on_screen_resize")
	
	
func on_screen_resize():
	self.position.y = -get_viewport().size.y * 0.33 * self.zoom.x


func _process(delta):
	var speed = rotLast - get_parent().rotation
	rotLast = get_parent().rotation
	
	# angle changes between -180 and 180. Correct speed
	# if rotation rolled over
	if speed > PI:
		speed -= 2*PI
	if speed < -PI:
		speed += 2*PI
	
	# rotate camera relative to parent for turn effect
	var target = speed * 10.0
	
	var d = self.rotation - target
	self.rotation = clamp(self.rotation - d * delta, -rotTarget, rotTarget)