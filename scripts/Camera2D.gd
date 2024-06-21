extends Camera2D




func _process(_delta):
	position.y = $"../Player".position.y
	if Input.is_action_just_pressed("switch") and Global.controllingleft == true:
		Global.controllingleft = false
		global_position.x = $"../Player".global_position.x
		global_position.y = $"../Player".global_position.y
		$"../Player".modulate = Color(1, 1, 1, 1)
		$"../Secondplayer".modulate = Color(1, 1, 1, Global.hidden_opacity)

	elif Input.is_action_just_pressed("switch") and Global.controllingleft == false:
		Global.controllingleft = true
		global_position.x = $"../Secondplayer".global_position.x
		global_position.y = $"../Secondplayer".global_position.y
		$"../Secondplayer".modulate = Color(1, 1, 1, 1)
		$"../Player".modulate = Color(1, 1, 1, Global.hidden_opacity)
	
	var viewport_size = get_viewport().get_visible_rect().size
	var right_half = get_screen_center_position()
	right_half.y -= viewport_size.y/2
	var left_half = right_half
	left_half.x -= viewport_size.x/2
	$"../HeavenBackground".position = right_half
	$"../HellBackground".position = left_half
