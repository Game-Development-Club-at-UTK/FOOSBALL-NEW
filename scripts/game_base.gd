extends Node2D

var screen_size = Vector2(1152, 648)
var player_scored = false
var plr_score = 0
var opp_score = 0
var timer

#jack changelog 
# - changed project icon
# - rounded off timer
# - adjusted player sprite scale to an integer number (scaled sprites look ugly)
# - set player and opponent to characterBody2D, adjusted position/velocity controls accordingly
# - set ball to inherit player/opponent velocity
# - locked ball velocity to a constant magnitude
# - set ball to characterBody2D for easier controll
# - set screen size to the size of the background, so adjusting position/size of the background shifts all game objects
# - locked player and opponent positions to bar sprites
# - locked bar positions relative to the background
# - locked goal positions relative to the background
# - locked world borders relative to the background
# - locked score and timer labels relative to the background

# THIS IS CALLED WHEN THE GAME STARTS.
func _ready() -> void:
	timer = $since_last_touch
	screen_size = $Background.get_rect().size * $Background.scale #lock "screen size" to the field sprite
	start()

func start():
	# SET WORLD BORDERS
	$Borders/TOP_BORDER.position = Vector2(0,0)
	$Borders/LEFT_BORDER.position = Vector2(0,0)
	$Borders/RIGHT_BORDER.position = screen_size
	$Borders/BOTTOM_BORDER.position = screen_size
	
	# SET SPRITE POSITIONS AND BALL VELOCITY.
	$Player.position.y = screen_size.y / 2
	$Opponent.position.y = screen_size.y / 2
	$Ball.position.x = screen_size.x / 2
	$Ball.position.y = screen_size.y / 2
	$Ball.velocity = Vector2(0,0)
	$Goals/Player_Goal.position = Vector2(16, screen_size.y / 2)
	$Goals/Enemy_Goal.position = Vector2(screen_size.x - 16, screen_size.y / 2)
	$"bar sprite player".position.x = screen_size.x / 8
	$"bar sprite opponent".position.x = screen_size.x - (screen_size.x / 8)
	
	# SET UI POSITIONS
	$Control/Label.position = Vector2(screen_size.x / 2 - $Control/Label.size.x / 2, 0)
	$Control/Label2.position = Vector2(screen_size.x / 2 - $Control/Label2.size.x / 2, screen_size.y - $Control/Label.size.y / 2)
	
	
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
