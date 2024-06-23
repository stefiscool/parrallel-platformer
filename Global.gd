extends Node

var controllingleft = true
var hidden_opacity = 0.3
var coins = 0
var checkpoint = null
var safety_net_offset = 800

func return_to_checkpoint():
	$"../World/PlayerDiedSFX".play()
	var hellplayer = $"../World/Secondplayer"
	hellplayer.position = checkpoint.position
	hellplayer.position.y -= 70
	hellplayer.velocity = Vector2()
	$"../World/SafetyNet".position.y = hellplayer.position.y + Global.safety_net_offset
