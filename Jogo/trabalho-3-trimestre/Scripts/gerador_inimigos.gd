extends Node2D

@export var cenas_inimigos: Array[PackedScene]

func _ready():
	$Timer.start()

func _on_timer_timeout():
	var cena = cenas_inimigos.pick_random()
	if cena == null:
		return

	var inimigo = cena.instantiate()
	inimigo.global_position = Vector2(randf_range(0, 2016), randf_range(0, 832))
	get_parent().add_child(inimigo)
