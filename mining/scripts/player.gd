class_name Player
extends CharacterBody2D


@export var speed := 75.0

@export_group("Jumping Variables")
@export var jump_force := 185.0
@export var climb_factor := 0.5
@export var fall_factor := 0.75

var gravity : float


func _ready():
	gravity = ProjectSettings.get("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	var horizontal_input : float = Input.get_axis("move_left", "move_right")
	
	velocity.x = horizontal_input * speed
	
	
	if !is_on_floor():
		_handle_aerial(delta)
	elif Input.is_action_just_pressed("move_jump"):
		velocity.y -= jump_force
	
	if velocity.x && is_on_floor():
		$Sprite.flip_h = velocity.x < 0
	
	move_and_slide()


func _handle_aerial(delta: float):
	if velocity.y < 0:
		if Input.is_action_pressed("move_jump"):
			velocity.y += gravity * climb_factor * delta
		else:
			velocity.y *= 0.5
			velocity.y += gravity * fall_factor * delta
	else:
		velocity.y += gravity * fall_factor * delta
