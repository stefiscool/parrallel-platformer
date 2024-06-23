extends CharacterBody2D

const UP = Vector2(0,-1)
const GRAVITY = 28
const MAX_SPEED = 250
const ACCELERATION = 50
#const JUMP_HEIGHT = -1000
const HELL_JUMP_POWER = -840 # hell player can jump 4 tiles
const HEAVEN_JUMP_POWER = -1100 # heaven player can jump 7 tiles

@export var is_left_not_right = true
var other_player
var POSITION_OFFSET = 580

func _ready():
	if is_left_not_right:
		other_player = $"../Player"
		Global.start_location = position
	else:
		other_player = $"../Secondplayer"
		POSITION_OFFSET = -POSITION_OFFSET
		modulate = Color(1, 1, 1, Global.hidden_opacity)


func _physics_process(delta):
	if Global.controllingleft == is_left_not_right:
		velocity.y += GRAVITY
		var friction = false
		
		if Input.is_action_pressed("right"):
			velocity.x = min(velocity.x + ACCELERATION, MAX_SPEED)
			$ColorRect.scale.x = -abs($ColorRect.scale.x)
			other_player.get_node("ColorRect").scale.x = -abs(other_player.get_node("ColorRect").scale.x)


		elif Input.is_action_pressed("left"):
			velocity.x = max(velocity.x - ACCELERATION, -MAX_SPEED)
			$ColorRect.scale.x = abs($ColorRect.scale.x)
			other_player.get_node("ColorRect").scale.x = abs(other_player.get_node("ColorRect").scale.x)

			
		else:
			friction = true
			
			
		if is_on_floor():
			if friction == true:
				velocity.x = lerp(velocity.x,0.0,0.2)
			if Input.is_action_just_pressed("jump"):
				if is_left_not_right:
					velocity.y = HELL_JUMP_POWER
				else:
					velocity.y = HEAVEN_JUMP_POWER
				if Global.controllingleft:
					$"../HellJumpSFX".play()
				else:
					$"../HeavenJumpSFX".play()
		
		move_and_slide()
		var other_pos = position
		other_pos.x += POSITION_OFFSET
		other_player.position = other_pos
		other_player.velocity = velocity
		var net = $"../DangerNet"
		net.position.y = min(net.position.y, position.y + Global.danger_net_offset)
		
