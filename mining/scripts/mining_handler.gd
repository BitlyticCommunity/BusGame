extends Node2D


@export var mining_map : MiningMap


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("primary_fire"):
		mining_map.mine_tile(get_global_mouse_position())
