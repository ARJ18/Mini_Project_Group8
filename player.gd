extends KinematicBody2D

onready var _animated_sprite = $AnimatedSprite
var motion = Vector2(0,0)
const SPEED = 500
const GRAVITY = 500
const JUMP=5000
const UP = Vector2(0,-1)
const WORLD_LIMIT = 5000



func _physics_process(_delta):
	apply_gravity()
	move()
	jump()
	animate()
	move_and_slide(motion,UP)
	
	
func apply_gravity():#applies gravity
	if position.y > WORLD_LIMIT:
		get_tree().quit()
	if is_on_floor() and motion.y>0 :
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY


func move():#controls movement of the player
	if Input.is_action_pressed("ui_left") and Input.is_action_pressed("ui_right"):
		motion.x = 0
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
		_animated_sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		_animated_sprite.flip_h = false
	else:
		motion.x = 0


func jump():#makes the player jump
	if Input.is_action_pressed("jump") and is_on_floor():
			motion.y -= JUMP	
		
func animate():
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.stop()
