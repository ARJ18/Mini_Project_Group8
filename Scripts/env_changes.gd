extends Node

signal change_brightness(value)

func change_vsync(value):
	OS.vsync_enabled = value
	
