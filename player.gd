extends KinematicBody2D

export var mov_speed = 400.0
onready var _animated_sprite = $AnimatedSprite
var screen_size = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size



func _process(delta):
	
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		_animated_sprite.flip_h = true
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.flip_h = false
		direction.x += 1
	if direction.length() > 1:
		direction = direction.normalized()
	
	position += direction*mov_speed*delta
	position.x = clamp(position.x,0,screen_size.x)
	position.y = clamp(position.y,0,screen_size.y)
	
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.stop()
