extends KinematicBody2D

export (PackedScene) var Bullet
export (int) var move_speed
export (int) var bulletspeed
var canshoot = true
var screensize

func _ready():
	screensize = get_viewport_rect().size
	yield(get_tree(), "idle_frame")
	get_tree().call_group("monsters", "set_player", self)
	
func _physics_process(delta):
	var move_vec = Vector2()
	if Input.is_action_pressed("move_up"):
		move_vec.y -= 1
	if Input.is_action_pressed("move_down"):
		move_vec.y += 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("shoot"):
		if canshoot:
			canshoot = false
			shoot()
	elif Input.is_action_just_pressed("shoot"):
		if canshoot:
			canshoot = false
			shoot()
	move_vec = move_vec.normalized()
	move_and_slide(move_vec * move_speed)
	position.x = clamp(position.x,0,screensize.x)
func shoot():
	var bullet = Bullet.instance()
	add_child(bullet)
	var bulletvector = Vector2()
	$ShootSound.play()
	bulletvector.y = -1
	bullet.apply_impulse(Vector2(bullet.position.x,bullet.position.y),(bulletvector * bulletspeed))
	
	
	
	
	
func _on_ShootTimer_timeout():
	canshoot = true # Replace with function body.
