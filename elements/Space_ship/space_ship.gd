extends CharacterBody2D
const ROCKED_SCENE = preload("res://elements/rocked/rocked.tscn")
const SPEED = 300.0
func _physics_process(delta: float):
	if Input.is_action_just_pressed("ui_accept"):
		shot()
		
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	velocity.x = direction * SPEED
	
	move_and_slide()
func shot():
	var rocked = ROCKED_SCENE.instantiate()
	rocked.global_position = global_position + Vector2(0, -20)
	add_child(rocked)
	
func take_damage():
	print("ИГРОК ПОЛУЧИЛ УРОН!")
	Globals.change_lives(-1) 
