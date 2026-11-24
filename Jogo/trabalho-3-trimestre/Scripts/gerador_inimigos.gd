extends Node2D

@export var cenas_inimigos: Array[PackedScene]

func _ready():
	$Timer.start()

func _on_timer_timeout():
	var inimigo = cenas_inimigos.pick_random().instantiate()
	inimigo.global_position = Vector2(randf_range(0, 2016), randf_range(0, 832))
	get_parent().add_child(inimigo)
	print("Inimigo criado em: ", inimigo.global_position)
