extends CanvasLayer
@onready var cor = $cor


func mudar_cena(path, delay = 1.0):
	var transicao_scene = get_tree().create_tween()
	transicao_scene.tween_property(cor, "treshold", 1.0, 0.5).set_delay(delay)
	await transicao_scene.finished
	assert(get_tree().change_scene_to_file(path) == OK)

func mostrar_nova_cena():
	var transicao_mostrar = get_tree().create_tween()
	transicao_mostrar.tween_property(cor, "treshold", 0.0, 0.5).from(1.0)

func _ready():
	mostrar_nova_cena()
