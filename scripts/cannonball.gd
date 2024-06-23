extends Area2D



func _on_body_entered(body):
	if visible:
		if body.name == "Player" and Global.controllingleft == false:
			#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
			Global.return_to_checkpoint()
		elif body.name == "Secondplayer" and Global.controllingleft == true:
			#get_tree().change_scene_to_file("res://scenes/game_over.tscn")
			Global.return_to_checkpoint()
		elif body.name == "TileMap":
			# cannonball hit wall and is destroyed
			# animation resets visible to true
			find_parent("World").get_node("CannonBallDestroyedSFX").play()
			visible = false
