extends Area2D

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.velocity.y > 0:
				die()
				body.velocity.y = -360
			# Player touches from side or ground -> player dies
		else:
			body.lose_life()

func die():
	animated.play("Death")
	Global.points += 1
	await get_tree().create_timer(0.6).timeout
	queue_free()
