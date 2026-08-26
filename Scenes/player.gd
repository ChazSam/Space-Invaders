class_name Player extends CharacterBody2D

@export var move_speed = 350

@onready var shot = preload("res://Space-Invaders/Scenes/shot.tscn")

#@onready var input_component: InputComponent = $InputComponent
var rocket_container

func _ready() -> void:
	rocket_container = get_node("RocketContainer")

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_axis("move_left","move_right")
	velocity = transform.x * input_dir * move_speed * delta * 100
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	
	global_position = global_position.clamp(Vector2(0,0), screen_size)

func _process(delta:float):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():

	var rocket_instance = shot.instantiate()
	rocket_instance.direction = -1
	
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.y -= 40
