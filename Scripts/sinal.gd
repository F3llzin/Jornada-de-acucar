extends Node2D
@onready var texture = $texture
@onready var sinal = $sinal

const lines : Array[String] = [
	"esse cu de burro é dificil pra caralho"
]

func _unhandled_input(event):
	if sinal.get_overlapping_bodies().size() > 0:
		#texture.show()
		if event.is_action_pressed("interacao") && !DialogoGerenciador.msg_ativada:
			texture.hide()
			DialogoGerenciador.comecar_msg(global_position, lines)
		else:
			#texture.hide()
			if DialogoGerenciador.caixa_dialogo != null:
				DialogoGerenciador.caixa_dialogo.queue_free()
				DialogoGerenciador.msg_ativada = false


func _on_sinal_body_entered(_body):
	texture.show()
	


func _on_sinal_body_exited(_body):
	texture.hide()
