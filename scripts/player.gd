extends CharacterBody2D

const UP = Vector2(0,-1)
const GRAVITY = 30
const MAX_SPEED = 250
const ACCELERATION = 50
const JUMP_HEIGHT = -1000

var velocity2 = Vector2(0,0)

@export var is_left_not_right = true
var other_player
var POSITION_OFFSET = 580

func _ready():
	if is_left_not_right:
		other_player = $"../Player"
	else:
		other_player = $"../Secondplayer"
		POSITION_OFFSET = -POSITION_OFFSET
		modulate = Color(1, 1, 1, Global.hidden_opacity)


func _physics_process(_delta):
	if Global.controllingleft == is_left_not_right:
		velocity.y += GRAVITY
		var friction = false
		
		if Input.is_action_pressed("right"):
			velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)


		elif Input.is_action_pressed("left"):
			velocity.x = min(velocity.x + ACCELERATION, -MAX_SPEED)

			
		else:
			friction = true
			
			
		if is_on_floor():
			if friction == true:
				velocity.x = lerp(velocity.x,0.0,0.2)
			if Input.is_action_just_pressed("jump"):
				velocity.y = JUMP_HEIGHT
			
		
		move_and_slide()
		var other_pos = position
		other_pos.x += POSITION_OFFSET
		other_player.position = other_pos
		other_player.velocity = velocity
		$"../SafetyNet".position.y = min($"../SafetyNet".position.y, position.y + 600)
		
