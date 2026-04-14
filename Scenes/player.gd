class_name Player extends CharacterBody2D

@export var move_speed = 350

@onready var shot = preload("res://Space-Invaders/Scenes/shot.tscn")
@onready var input_component: InputComponent = $InputComponent

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_axis("move_left","move_right")
	velocity = transform.x * input_dir * move_speed * delta * 100
	move_and_slide()

	if Input.is_action_just_pressed("shoot"):
		var rocket = shot.instantiate()
		rocket.direction = -1
		add_child(rocket)
