extends Sprite2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://Scenes/Win.tscn")
