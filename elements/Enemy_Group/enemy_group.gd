extends Node2D

const ROW_STEP = 15.0

var direction = 1
var speed := 20.0
var block_timer: Timer
var shoot_timer: Timer

func _ready():
	block_timer = Timer.new()
	block_timer.one_shot = true
	block_timer.wait_time = 0.5
	add_child(block_timer)
	
	shoot_timer = Timer.new()
	shoot_timer.one_shot = false
	var new_wait_time = 1.5 - (Globals.current_level - 1) * 0.2
	shoot_timer.wait_time = clamp(new_wait_time, 0.3, 1.5)
	add_child(shoot_timer)
	
	shoot_timer.timeout.connect(_on_shoot_timer_timeout)
	shoot_timer.start()
	print("Текущий уровень: ", Globals.current_level, " | Скорость стрельбы врагов: ", shoot_timer.wait_time)

func _process(delta: float):
	global_position.x += direction * speed * delta

func change_direction():
	if block_timer.time_left > 0:
		return
		
	if direction == 1:
		direction = -1
	else:
		direction = 1
		
	global_position.y += ROW_STEP
	block_timer.start(0.5)
	
func _on_shoot_timer_timeout():

	var enemies = get_children()
	var living_enemies = []
	
	for child in enemies:
		
		if child is CharacterBody2D:
			
			living_enemies.append(child)
			
	if living_enemies.size() > 0:
		
		var random_enemy = living_enemies.pick_random()
		
		
		if random_enemy.has_method("shot"):
			
			random_enemy.shot()
				
