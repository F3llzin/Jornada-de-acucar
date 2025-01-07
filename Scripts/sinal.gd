extends Node2D
@onready var texture = $texture
@onready var sinal = $sinal

@export var lines : Array[String] = [
	"eu amo",
	"muito você",
	"você mesmo,",
	"Radielen❤"
]

func _unhandled_input(event):
	if sinal.get_overlapping_bodies().size() > 0:
		if event.is_action_pressed("interacao") && !DialogoGerenciador.msg_ativada:
			texture.hide()
			DialogoGerenciador.comecar_msg(global_position, lines)
		else:
			if DialogoGerenciador.caixa_dialogo != null:
				DialogoGerenciador.msg_ativada = false


func _on_sinal_body_entered(_body):
	texture.show()
	


func _on_sinal_body_exited(_body):
	texture.hide()
	if is_instance_valid(DialogoGerenciador.caixa_dialogo):
		DialogoGerenciador.caixa_dialogo.queue_free()
		DialogoGerenciador.current_line = 0
