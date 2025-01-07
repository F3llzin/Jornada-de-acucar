extends Node

@onready var cena_dialogo = preload("res://dialogo.tscn")
var linhas_msg: Array[String] = []
var current_line = 0
var caixa_dialogo
var caixa_dialogo_posicao = Vector2.ZERO
var msg_ativada = false
var pode_antecipar_msg = false

func comecar_msg(position: Vector2, lines: Array[String]):
	if msg_ativada:
		return
	linhas_msg = lines
	caixa_dialogo_posicao = position
	mostrar_texto()
	msg_ativada = true
	
func mostrar_texto():
	caixa_dialogo = cena_dialogo.instantiate()
	caixa_dialogo.text_display_finished.connect(_on_all_text_displayed)
	get_tree().root.add_child(caixa_dialogo)
	caixa_dialogo.global_position = caixa_dialogo_posicao
	caixa_dialogo.display_text(linhas_msg[current_line])
	pode_antecipar_msg = false
	
func _on_all_text_displayed():
	pode_antecipar_msg = true
	
func _unhandled_input(event):
	if event.is_action_pressed("mnsg_antecipada") && msg_ativada && pode_antecipar_msg:
		caixa_dialogo.queue_free()
		current_line += 1
		if current_line >= linhas_msg.size():
			msg_ativada = false
			current_line = 0
			return
		mostrar_texto()
