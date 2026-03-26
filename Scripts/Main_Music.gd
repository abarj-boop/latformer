extends AudioStreamPlayer2D

var life = Global.lives

@onready var music: AudioStreamPlayer2D = $"."

func _process(delta: float) -> void:
	if life == 0:
		music.stream_paused = false
	
