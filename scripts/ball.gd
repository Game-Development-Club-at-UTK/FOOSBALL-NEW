extends RigidBody2D


# Called when the node enters the scene tree for the first time.
#var velocity = Vector2(500, -500)
var player_goals = 0
var opponent_goals = 0
var ball_radius = 40.0
var trappedThisFrame = false #if the ball collided with a player on this frame
func _ready() -> void:
	$CollisionShape2D.shape.radius = ball_radius

func _physics_process(delta):
	
	var collision_info = move_and_collide(linear_velocity * delta)
	if collision_info: # This just detects if there is a collision.
		linear_velocity = linear_velocity.bounce(collision_info.get_normal())
		#when hitting a player or opponenet
		if collision_info.get_collider() == $"../Player" or collision_info.get_collider() == $"../Opponent":
			$"../since_last_touch".start() #reset touch timer
			linear_velocity += collision_info.get_collider().velocity #inherit player/opponenet velocity
			if position.y < (ball_radius * 2) or position.y > $"..".screen_size.y - (ball_radius * 2): #if we are trapped against a wall
				self.linear_velocity = self.global_position - collision_info.get_collider().global_position
				
	
	linear_velocity = linear_velocity.normalized() * 400 #lock velocity to be consistent


# This code will execute when the player concedes a goal.
func _on_player_goal_body_entered(body: Node2D) -> void:
	opponent_goals += 1
	print(opponent_goals)

func _on_enemy_goal_body_entered(body: Node2D) -> void:
	player_goals += 1
	print(player_goals)
