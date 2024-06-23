extends Area2D

func _ready():
	$Reached.hide()

func _on_body_entered(body):
	if body.name == "Secondplayer" and Global.controllingleft:
		if Global.checkpoint != null:
			Global.checkpoint.unreached()
		Global.checkpoint = self
		$NotReached.hide()
		$Reached.show()

func unreached():
	$NotReached.show()
	$Reached.hide()
