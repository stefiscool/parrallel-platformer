extends Area2D

var overlaps_player = false

func _on_body_entered(body):
	if body.name == "Player":
		overlaps_player = true
		# right active, collect right away
		if not Global.controllingleft:
			collect_if_overlap()


func _on_body_exited(body):
	if body.name == "Player":
		overlaps_player = false

func collect_if_overlap():
	if overlaps_player and not Global.controllingleft:
		find_parent("World").get_node("CoinCollectSFX").play()
		Global.coins += 1
		queue_free()
