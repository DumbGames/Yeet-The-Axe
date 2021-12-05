extends Area2D




func _on_Water_body_entered(body):
	if body.name == "Player":
		body.die()
	if body.is_in_group("mobs"):
		body.queue_free()
