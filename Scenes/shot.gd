extends Node2D

var speed = 300
var direction = 1

func _process(delta: float) -> void:
	position.y += speed * direction * delta
