extends Camera2D

var MUSIC_MIN_VOLUME = -21.0
var VOLUME_CHANGE_RATE = 42.0
var heaven_target_volume = MUSIC_MIN_VOLUME
var hell_target_volume = 0
var heaven_music = AudioServer.get_bus_index("HeavenMusic")
var hell_music = AudioServer.get_bus_index("HellMusic")

func _ready():
	set_music_mix(heaven_target_volume, hell_target_volume)

func set_music_mix(heaven_db, hell_db):
	AudioServer.set_bus_volume_db(heaven_music, heaven_db)
	AudioServer.set_bus_volume_db(hell_music, hell_db)


func become_left_player():
	try_swap_player($"../Secondplayer", $"../Player", true)

func _process(delta):
	position.y = $"../Player".position.y
	if Input.is_action_just_pressed("switch") and Global.controllingleft == true:
		try_swap_player($"../Player", $"../Secondplayer", false)

	elif Input.is_action_just_pressed("switch") and Global.controllingleft == false:
		become_left_player()
	
	var viewport_size = get_viewport().get_visible_rect().size
	var right_half = get_screen_center_position()
	right_half.y -= viewport_size.y/2
	var left_half = right_half
	left_half.x -= viewport_size.x/2
	$"../HeavenBackground".position = right_half
	$"../HellBackground".position = left_half
	
	var volume_change = VOLUME_CHANGE_RATE * delta
	var heaven_music_actual_volume = AudioServer.get_bus_volume_db(heaven_music)
	var heaven_new_volume = heaven_music_actual_volume
	var hell_music_actual_volume = AudioServer.get_bus_volume_db(hell_music)
	var hell_new_volume = hell_music_actual_volume
	
	if heaven_target_volume > heaven_music_actual_volume:
		heaven_new_volume = min(heaven_target_volume, heaven_music_actual_volume + volume_change)
	elif heaven_target_volume < heaven_music_actual_volume:
		heaven_new_volume = max(heaven_target_volume, heaven_music_actual_volume - volume_change)
		
	if hell_target_volume > hell_music_actual_volume:
		hell_new_volume = min(hell_target_volume, hell_music_actual_volume + volume_change)
	elif hell_target_volume < hell_music_actual_volume:
		hell_new_volume = max(hell_target_volume, hell_music_actual_volume - volume_change)
	set_music_mix(heaven_new_volume, hell_new_volume)
	
	var cannons = $"../Cannons".get_children()
	assert(cannons.size() > 0, "There are no cannons on the object Camera2D/../Cannons!")
	for cannon in cannons:
		cannon.check_player_range($"../Player".global_position)

func try_swap_player(to_become, currently_is, become_left_not_right):
	# test if non-active player would be able to move 0px (aka overlaps with an obstacle)
	if not to_become.test_move(to_become.transform, Vector2()):
		Global.controllingleft = become_left_not_right
		for coin in $"../Coins".get_children():
			coin.collect_if_overlap()
		$"../SwapSFX".play()
		if become_left_not_right:
			hell_target_volume = 0
			heaven_target_volume = MUSIC_MIN_VOLUME
		else:
			heaven_target_volume = 0
			hell_target_volume = MUSIC_MIN_VOLUME
		global_position.x = to_become.global_position.x
		global_position.y = to_become.global_position.y
		to_become.modulate = Color(1, 1, 1, 1)
		currently_is.modulate = Color(1, 1, 1, Global.hidden_opacity)
	else:
		$"../SwapFailedSFX".play()
