extends Area2D


func _on_body_entered(_body):
	$anim.play("collected")

func _on_anim_animation_finished():
	queue_free()
	
