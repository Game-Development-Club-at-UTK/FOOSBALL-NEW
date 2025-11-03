extends Label

func _process(delta: float) -> void:
	self.text = str(snappedf($"../../since_last_touch".time_left, .1))
