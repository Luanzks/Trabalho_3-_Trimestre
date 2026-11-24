extends CharacterBody2D

const SPEED = 120.0
var vidas = 3
var invencivel := false
func _ready():
	add_to_group("jogador")
func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	# Lendo entrada do usuário
	if Input.is_action_pressed('Esquerda'):
		velocity.x = -1 * SPEED
	if Input.is_action_pressed('Direita'):
		velocity.x = 1 * SPEED
	if Input.is_action_pressed('Frente'):
		velocity.y = -1 * SPEED
	if Input.is_action_pressed('Tras'):
		velocity.y = 1 * SPEED

	move_and_slide()

	# Bateu em algum inimigo?
	for i in get_slide_collision_count():
		var colisao = get_slide_collision(i)
		if colisao.get_collider().is_in_group("inimigo"):
			levar_dano()

	# escolhendo animação
	if velocity == Vector2.ZERO:
		$"Animação".play("idle")
	else:
		$"Animação".play("walk")

	# direção da animação (direita/esquerda)
	if velocity.x < 0.0:
		$"Animação".flip_h = true
	else:
		$"Animação".flip_h = false



func levar_dano():
	if invencivel:
		return

	vidas -= 1
	get_tree().call_group("hud", "atualizar", vidas)
	print("Vidas: ", vidas)

	if vidas <= 0:
		get_tree().reload_current_scene()
		return

	invencivel = true
	await get_tree().create_timer(1.0).timeout
	invencivel = false
