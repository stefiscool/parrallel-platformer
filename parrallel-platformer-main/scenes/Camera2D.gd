extends Camera2D




func _process(_delta):
	if Input.is_action_just_pressed("switch") and Global.goingup == true:
		Global.goingup = false
		$".".reparent($"../../Secondplayer")
		global_position.x = $"../../Secondplayer".global_position.x
		global_position.y = $"../../Secondplayer".global_position.y



	elif Input.is_action_just_pressed("switch") and Global.goingup == false:
		Global.goingup = true
		$".".reparent($"../../Player")
		global_position.x = $"../../Player".global_position.x
		global_position.y = $"../../Player".global_position.y
		
