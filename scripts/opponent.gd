extends CharacterBody2D

#var velocity = Vector2(0,0)
var mov_vel = 300
var behind = false
var y_ball_pos = 0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# ignore this comment this is just for the github presentation.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	behind = position.x < $"../Ball".position.x
	y_ball_pos = $"../Ball".position.y
	# Moves depending where the ball is. If the ball is behind, it moves the opposite way to avoid scoring an own goal.
	if y_ball_pos >= position.y and not behind or y_ball_pos < position.y and behind:
		velocity.y = mov_vel
	elif y_ball_pos < position.y and not behind or y_ball_pos >= position.y and behind:
		velocity.y = -mov_vel

func _physics_process(delta: float) -> void:
	move_and_collide(velocity * delta) # Keeps the player from leaving the borders.
	self.position.x = $"../bar sprite opponent".position.x
