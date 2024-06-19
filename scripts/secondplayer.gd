extends CharacterBody2D

const UP = Vector2(0,-1)
const GRAVITY = 30
const MAX_SPEED = 250
const ACCELERATION = 50
const JUMP_HEIGHT = -1000

var velocity2 = Vector2(0,0)


func _physics_process(_delta):
	if Global.goingup == false:
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
		
