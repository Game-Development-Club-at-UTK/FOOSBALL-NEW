extends Button


func _process(delta: float) -> void:
	if button_pressed:
		get_tree().change_scene_to_file("res://scenes/player.tscn")
