extends Area2D
@onready var coleta = $coleta as AudioStreamPlayer
var valor_coletavel = 1

func _on_body_entered(_body):
	$anim.play("collected")
	await $collision.call_deferred("queue_free")
	coleta.play()
	Global.moeda += valor_coletavel

func _on_anim_animation_finished():
	queue_free()
	
