extends Node2D

@onready var hearts = get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_hearts()

func update_hearts():
	for i in range(hearts.size()):
		hearts[i].visible = i >= (hearts.size() - Global.lives)
