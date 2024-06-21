extends Area2D



func _on_body_entered(body):
	if body.name == "Player" and Global.controllingleft == false:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	if body.name == "Secondplayer" and Global.controllingleft == true:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
