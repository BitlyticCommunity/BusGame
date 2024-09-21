class_name MiningLayer
extends TileMapLayer


var stone_tiles : Array[Vector2i] = []


func _ready():
	stone_tiles = get_used_cells()


func remove_tile(global_pos: Vector2):
	var map_pos := local_to_map(global_pos)
	
	set_cells_terrain_connect([map_pos], 0, -1)
