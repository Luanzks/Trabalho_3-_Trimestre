extends CanvasLayer

var blocos = []

func _ready():
	add_to_group("hud")

	var caixa = HBoxContainer.new()
	caixa.position = Vector2(10, 10)
	add_child(caixa)

	for i in 3:
		var bloco = ColorRect.new()
		bloco.custom_minimum_size = Vector2(20, 20)
		bloco.color = Color.RED
		caixa.add_child(bloco)
		blocos.append(bloco)

func atualizar(vidas):
	for i in blocos.size():
		blocos[i].visible = i < vidas
