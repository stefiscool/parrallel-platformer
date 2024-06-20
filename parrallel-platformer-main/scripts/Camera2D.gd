extends Camera2D




func _process(_delta):
	if Input.is_action_just_pressed("switch") and Global.controllingleft == true:
		Global.controllingleft = false
		$".".reparent($"../../Secondplayer")
		global_position.x = $"../../Secondplayer".global_position.x
		global_position.y = $"../../Secondplayer".global_position.y
		$"../../Secondplayer".modulate = Color(1, 1, 1, 1)
		$"../../Player".modulate = Color(1, 1, 1, Global.hidden_opacity)



	elif Input.is_action_just_pressed("switch") and Global.controllingleft == false:
		Global.controllingleft = true
		$".".reparent($"../../Player")
		global_position.x = $"../../Player".global_position.x
		global_position.y = $"../../Player".global_position.y
		$"../../Player".modulate = Color(1, 1, 1, 1)
		$"../../Secondplayer".modulate = Color(1, 1, 1, Global.hidden_opacity)
		
