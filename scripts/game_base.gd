extends Node2D

var screen_size = Vector2(1152, 648)
var player_scored = false
var plr_score = 0
var opp_score = 0
var timer

# THIS IS CALLED WHEN THE GAME STARTS.
func _ready() -> void:
	timer = $since_last_touch
	start()

func start():
	# SET SPRITE POSITIONS AND BALL VELOCITY.
	$Player.position.y = screen_size.y / 4
	$Opponent.position.y = screen_size.y / 4
	$Ball.position.x = screen_size.x / 2
	$Ball.position.y = screen_size.y / 2
	$Ball.velocity = Vector2(0,0)
	
	# GET THE SCORE LABEL SET UP
	var str_goals = "%d - %d"
	$Control/Label.text = str_goals % [plr_score, opp_score]
	
	# Need to add a visual timer or something here so there is a countdown that the user can see.
	timer.stop()
	await get_tree().create_timer(3.0).timeout
	if player_scored:
		$Ball.velocity = Vector2(-500, -500)
	else:
		$Ball.velocity = Vector2(500, -500)
		
	timer.start()

##func _process(delta: float) -> void:
#	if timer.timeout:
#		print("NO ONE HAS TOUCHED BALL\n")
#		start()
		

func _on_player_goal_body_entered(body: Node2D) -> void:
	opp_score += 1
	player_scored = false
	start()

func _on_enemy_goal_body_entered(body: Node2D) -> void:
	plr_score += 1
	player_scored = true
	start()


func _on_since_last_touch_timeout() -> void:
	start() # Replace with function body.
