extends Button


func _on_pressed():
	if Global.level == 2:
		get_tree().change_scene_to_file("res://scenes/world2.tscn")
	if Global.level == 3:
		get_tree().change_scene_to_file("res://scenes/world3.tscn")
	if Global.level == 4:
		get_tree().change_scene_to_file("res://scenes/totalvictory.tscn")
