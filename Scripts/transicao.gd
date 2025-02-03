extends CanvasLayer
@onready var color = $color


func mudar_cena(path, delay = 1.0):
	var transicao_cena = get_tree().create_tween()
	transicao_cena.tween_property(color, "treshold", 1.0, 0.5).set_delay(delay)
	await transicao_cena.finished
	assert(get_tree().change_scene_to_file(path) == OK)

func mostrar_nova_cena():
	var transicao_mostrar = get_tree().create_tween()
	transicao_mostrar.tween_property(color, "treshold", 0.0, 0.5).from(1.0)

func _ready():
	mostrar_nova_cena()
