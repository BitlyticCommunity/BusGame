class_name OreType

enum {
	NONE,
	GOLD,
	DIAMOND,
	PINK
}


static var registry := {
	GOLD: load("res://mining/resources/ore/gold.tres"),
	DIAMOND: load("res://mining/resources/ore/diamond.tres"),
	PINK: load("res://mining/resources/ore/pink.tres"),
}
