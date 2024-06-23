extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Global.level += 1
		get_tree().change_scene_to_file("res://scenes/victory.tscn")
