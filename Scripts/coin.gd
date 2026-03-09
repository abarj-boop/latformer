extends Area2D

@onready var player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.add_points()
		player.play("Picked Up")
		await player.animation_finished
		queue_free()
