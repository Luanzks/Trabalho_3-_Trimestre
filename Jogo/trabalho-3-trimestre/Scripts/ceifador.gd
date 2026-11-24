extends Area2D

const SPEED = 60.0

func _ready():
	body_entered.connect(_on_body_entered)

func _physics_process(delta):
	var jogador = get_tree().get_first_node_in_group("jogador")
	if jogador:
		var direcao = (jogador.global_position - global_position).normalized()
		global_position += direcao * SPEED * delta

func _on_body_entered(body):
	if body.is_in_group("jogador"):
		body.levar_dano()
