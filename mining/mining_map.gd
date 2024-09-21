class_name MiningMap
extends Node2D


@export var stone_layer : MiningLayer
@export var ore_layer : MiningLayer


func mine_tile(pos: Vector2):
	stone_layer.remove_tile(pos)
	
	var custom_data = ore_layer.get_cell_tile_data(ore_layer.local_to_map(pos))
	
	if !custom_data:
		return
	
	var ore_type : int = custom_data.get_custom_data("ore_type")
	
	var ore : Ore = OreType.registry[ore_type]
	
	print(ore.ore_name)
	
	ore_layer.remove_tile(pos)
