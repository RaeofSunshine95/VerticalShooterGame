extends RigidBody2D

var canhit = true
var screensize
func _ready():
	$BulletTimer.start()
	screensize = get_viewport_rect().size
func _process(delta):
	if position.y > screensize.y:
		canhit = false
		print(canhit)
func _on_BulletTimer_timeout():
	queue_free()
