extends CanvasLayer

var blocos = []
var pontos = 0
var label_pontos: Label

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

	label_pontos = Label.new()
	label_pontos.text = "Pontos: 0"
	add_child(label_pontos)
	label_pontos.set_anchors_and_offsets_preset(Control.PRESET_TOP_RIGHT)
	label_pontos.grow_horizontal = Control.GROW_DIRECTION_BEGIN
	label_pontos.offset_right = -10
	label_pontos.offset_top = 10

func atualizar(vidas):
	for i in blocos.size():
		blocos[i].visible = i < vidas

func adicionar_ponto():
	pontos += 1
	label_pontos.text = "Pontos: " + str(pontos)
