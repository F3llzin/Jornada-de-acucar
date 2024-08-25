extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true

func _on_button_voltar_pressed():
	get_tree().paused = false
	visible = false


func _on_button_inicio_pressed():
	get_tree().paused = false
	visible = false
	get_tree().change_scene_to_file("res://Telainicio.tscn")


func _on_button_sair_pressed():
	get_tree().quit()
