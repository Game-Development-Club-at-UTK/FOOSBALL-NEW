extends StaticBody2D

var velocity = Vector2(0,0)
var max_speed = 500
var acceleration = 60
var friction = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# ignore this comment this is just for the github presentation.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("s") or Input.is_action_pressed("w"): # if either input is hit 
		position.y += 500 * delta * (Input.get_action_strength("s") - Input.get_action_strength("w"))


func _physics_process(delta):
	move_and_collide(velocity * delta) # Keeps the player from leaving the borders.
	
