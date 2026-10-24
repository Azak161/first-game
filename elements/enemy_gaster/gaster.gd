extends CharacterBody2D

const BULLET_SCENE = preload("res://elements/enemy_bulled/enemy_bullet.tscn")

@onready var raycast_left := $RayCastLeft
@onready var raycast_right := $RayCastRight

func _physics_process(delta):
	move_and_slide()
	
	if raycast_left.is_colliding() or raycast_right.is_colliding():
		print("ЛУЧ КОСНУЛСЯ СТЕНЫ!")
		if get_parent() and get_parent().has_method("change_direction"):
			get_parent().change_direction()

func destroy():
	
	Globals.change_points(10) 
	Events.enemy_died.emit()
	queue_free()
	
func shot():
	var bullet = BULLET_SCENE.instantiate()
	bullet.global_position = global_position + Vector2(0, 20)
	get_tree().current_scene.add_child(bullet)
