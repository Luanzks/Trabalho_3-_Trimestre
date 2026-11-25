extends Node2D

var cena_item = preload("res://Cenas/item.tscn")
var texturas = [
	preload("res://Sprites/Doces/Doce Azul.png"),
	preload("res://Sprites/Doces/Doce Cone.png"),
	preload("res://Sprites/Doces/Doce Vermelho.png"),
	preload("res://Sprites/Doces/Morcego de Chocolate.png.png"),
	preload("res://Sprites/Doces/Pirulito-1.png.png"),
]

func _ready():
	print("Gerador de itens pronto")
	$Timer.timeout.connect(_on_timer_timeout)
	$Timer.start(3.0)

func _on_timer_timeout():
	print("Tentando criar item")
	if get_tree().get_nodes_in_group("item").size() >= 10:
		return

	var item = cena_item.instantiate()
	item.textura = texturas.pick_random()
	get_parent().add_child(item)
	item.global_position = Vector2(randf_range(0, 2016), randf_range(0, 832))
	print("Item criado em: ", item.global_position)
