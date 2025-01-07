extends MarginContainer

@onready var text = $label_margin/text
@onready var timer = $Timer

const largura_max = 256

var texto = ""
var letter_index = 0
var tempo_letra = 0.07
var tempo_espaco = 0.05
var tempo_pontuacao = 0.2

signal text_display_finished()

func display_text(text_to_display: String):
	texto = text_to_display
	text.text = text_to_display
	
	await resized
	
	custom_minimum_size.x = min(size.x, largura_max)
	
	if size.x > largura_max:
		text.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
		
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	text.text = ""
	display_letter()
	
func display_letter():
	if letter_index < texto.length():
		text.text += texto[letter_index]
		match texto[letter_index - 1]:
			"!", "?", ",", ".":
				timer.start(tempo_pontuacao)
			" ":
				timer.start(tempo_espaco)
			_:
				timer.start(tempo_letra)
		letter_index += 1
			
func _on_timer_timeout():
	display_letter()
