extends Node2D

var screen_size = Vector2(1152, 648)
var player_scored = false
var plr_score = 0
var opp_score = 0

func _ready() -> void:
	start()

func start():
	$Player.position.y = screen_size.y / 4
	$Opponent.position.y = screen_size.y / 4
	$Ball.position.x = screen_size.x / 2
	$Ball.position.y = screen_size.y / 2
	$Ball.velocity = Vector2(0,0)
	var str_goals = "%d - %d"
	$Control/Label.text = str_goals % [plr_score, opp_score]
	# Need to add a visual timer or something here so there is a countdown that the user can see.
	await get_tree().create_timer(3.0).timeout
	if player_scored:
		$Ball.velocity = Vector2(-500, -500)
	else:
		$Ball.velocity = Vector2(500, -500)

func _on_player_goal_body_entered(body: Node2D) -> void:
	opp_score += 1
	player_scored = false
	start()

func _on_enemy_goal_body_entered(body: Node2D) -> void:
	plr_score += 1
	player_scored = true
	start()
