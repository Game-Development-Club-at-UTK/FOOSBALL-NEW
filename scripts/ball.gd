extends RigidBody2D


# Called when the node enters the scene tree for the first time.
var velocity = Vector2(500, -500)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info: # This just detects if there is a collision.
		velocity = velocity.bounce(collision_info.get_normal())
