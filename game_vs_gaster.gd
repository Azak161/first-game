extends Node2D
func _ready() -> void:
	Events.enemy_died.connect(check_victory_game_over)
	
	Events.lives_changed.connect(check_lives_game_over)

func check_lives_game_over(current_lives: int) -> void:
	
	if current_lives <= 0:
		trigger_game_over()
func check_victory_game_over() -> void:
	
	
	await get_tree().process_frame
	
	var enemy_group_node = get_node("EnemyGroup") 
	
	if enemy_group_node:
		var living_enemies = []
		for child in enemy_group_node.get_children():
			if child is CharacterBody2D:
				living_enemies.append(child)
		
	
		if living_enemies.size() == 0:
			print("уровень пройден!")
			Globals.current_level +=1
			get_tree().reload_current_scene()
			
func trigger_game_over() -> void:
	const GAME_OVER_SCENE = preload("res://ui/game_over/game_over.tscn")
	if not has_node("GameOver"):
		var game_over = GAME_OVER_SCENE.instantiate()
		add_child(game_over)
