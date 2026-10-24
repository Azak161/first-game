extends Node
var current_level: int = 1
var points: int = 0
var lives: int = 3

func change_points(amount: int) -> void:
	points += amount
	Events.points_changed.emit(points)

func change_lives(amount: int) -> void:
	lives += amount
	Events.lives_changed.emit(lives)
