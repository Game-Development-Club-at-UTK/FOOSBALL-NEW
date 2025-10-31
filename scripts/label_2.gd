extends Label

func _process(delta: float) -> void:
	self.text = str($"../../since_last_touch".time_left)
