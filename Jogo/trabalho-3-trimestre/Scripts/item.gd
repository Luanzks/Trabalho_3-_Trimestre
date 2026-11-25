extends Area2D

@export var textura: Texture2D

func _ready():
	add_to_group("item")
	$Sprite2D.texture = textura
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("jogador"):
		get_tree().call_group("hud", "adicionar_ponto")
		queue_free()
