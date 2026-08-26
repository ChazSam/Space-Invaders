extends Node2D

var speed = 300
var direction = 1

@onready var visible_notifier = $VisibleNotifier

func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _process(delta: float) -> void:
	global_position.y += speed * direction * delta

func _on_screen_exited():
	queue_free()
