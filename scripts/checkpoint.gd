extends Area2D

func _ready():
	$Reached.hide()

func _on_body_entered(body):
	if body.name == "Secondplayer" and Global.controllingleft and Global.checkpoint != self:
		if Global.checkpoint != null:
			Global.checkpoint.unreached()
		Global.reach_checkpoint(self)
		$NotReached.hide()
		$Reached.show()

func unreached():
	$NotReached.show()
	$Reached.hide()
