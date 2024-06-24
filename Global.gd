extends Node

var controllingleft = true
var hidden_opacity = 0.3
var coins = 0
var checkpoint = null
var start_location
var danger_net_offset = 1000
var newly_collected_coins = []
var level = 1

func return_to_checkpoint():
	$"../World/PlayerDiedSFX".play()
	var hellplayer = $"../World/Secondplayer"
	if checkpoint == null:
		hellplayer.position = start_location
	else:
		hellplayer.position = checkpoint.position
		hellplayer.position.y -= 70
	$"../World/Camera2D".force_become_left_player()
	hellplayer.velocity = Vector2()
	$"../World/DangerNet".position.y = hellplayer.position.y + Global.danger_net_offset
	# reset coins collected since reaching checkpoint
	coins -= newly_collected_coins.size()
	for coin in newly_collected_coins:
		coin.visible = true
	newly_collected_coins = []

func reach_checkpoint(chkpoint):
	checkpoint = chkpoint
	# coins become "locked-in"
	newly_collected_coins = []

func coin_collected(coin):
	$"../World/CoinCollectSFX".play()
	newly_collected_coins.push_back(coin)
	coin.visible = false
	coins += 1
