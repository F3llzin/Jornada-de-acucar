extends Area2D
@onready var coleta = $coleta as AudioStreamPlayer


func _on_body_entered(_body):
	$anim.play("collected")
	coleta.play()

func _on_anim_animation_finished():
	queue_free()
	
