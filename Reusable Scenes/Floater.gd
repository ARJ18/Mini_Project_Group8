extends Node2D

const IDLE_DURATION = 1.0

export var move_to = Vector2(840,506)

export var move_from = Vector2(597,506)

export var speed = 3.0

var follow = Vector2.ZERO

onready var platform = $Platform
onready var tween = $MotionTween

func _ready():
	_init_tween()
	
func _init_tween():
	var duration = move_to.length() / float(speed)
	tween.interpolate_property(self,"follow",move_from,move_to,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,IDLE_DURATION)
	tween.interpolate_property(self,"follow",move_to,move_from,duration,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,duration + IDLE_DURATION *2)
	tween.start()

func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow,0.075)

func set_to(to):
	move_to = to
	
func set_from(from):
	move_from = from
