extends StaticBody2D

var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# ignore this comment this is just for the github presentation.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("s"):
		position.y += 500 * delta
	if Input.is_action_pressed("w"):
		position.y -= 500 * delta

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta) # Keeps the player from leaving the borders.
	
