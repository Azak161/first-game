extends CanvasLayer


func _on_button_pressed() -> void:
	Globals.points = 0
	Globals.lives = 3
	Globals.current_level = 1 
	
	get_tree().reload_current_scene()
