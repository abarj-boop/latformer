extends Area2D

@onready var animated: AnimatedSprite2D = $".."

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.velocity.y > 0:
				die()
				body.velocity.y = -360
			# Player touches from side or ground -> player dies
		else:
			Global.remove_points()
			body.lose_life()
			print(Global.lives)

func die():
	animated.play("Death")
	Global.points += 1
	
	await animated.animation_finished
	queue_free()
	
