extends StaticBody2D

var RANGE_FOR_MUSIC = 600

func check_player_range(global_player_pos):
	var animator:AnimationPlayer = $Cannonball/AnimationPlayer
	var gp = global_position
	if global_player_pos.y + RANGE_FOR_MUSIC > global_position.y and global_player_pos.y - RANGE_FOR_MUSIC < global_position.y:
		if not animator.is_playing():
			animator.play()
	else:
		if animator.is_playing():
			animator.stop()
