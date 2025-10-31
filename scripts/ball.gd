extends RigidBody2D


# Called when the node enters the scene tree for the first time.
var velocity = Vector2(500, -500)
var player_goals = 0
var opponent_goals = 0

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	var metadata
	if collision_info: # This just detects if there is a collision.
		velocity = velocity.bounce(collision_info.get_normal())
		metadata = collision_info.get_collider().get_meta_list()
		
		# Doing this because the player and opponent have a metadata variable called "timer resetter"
		# And they're the only ones with ANY metadata variables.
		if(metadata.size() != 0):
			$"../since_last_touch".start()

# This code will execute when the player concedes a goal.
func _on_player_goal_body_entered(body: Node2D) -> void:
	opponent_goals += 1
	print(opponent_goals)

func _on_enemy_goal_body_entered(body: Node2D) -> void:
	player_goals += 1
	print(player_goals)
