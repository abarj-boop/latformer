extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.lose_life()
		print(Global.lives)
		if Global.lives > 0:
			body.respawn()
			
		else:
			body.no_lives()
		
