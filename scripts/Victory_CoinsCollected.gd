extends Label

func _ready():
	text = "Collected: " + str(Global.coins)
