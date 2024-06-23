extends Label

var total_coins = 0

func _ready():
	total_coins = $"../../../Coins".get_child_count()

func _process(_delta):
	text = "Coins: %s / %s" % [str(Global.coins), total_coins]
