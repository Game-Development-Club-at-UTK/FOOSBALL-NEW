extends CharacterBody2D

#var velocity = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# ignore this comment this is just for the github presentation.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	velocity.x = 0
	if Input.is_action_pressed("s"):
		velocity.y = 500
	elif Input.is_action_pressed("w"):
		velocity.y = -500
	else:
		velocity.y = 0

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta) # Keeps the player from leaving the borders.
	self.position.x = $"../bar sprite player".position.x
