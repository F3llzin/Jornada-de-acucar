extends Area2D


func _on_body_entered(body):
	set_physics_process(false)
	body.death_fall_zone()
	set_physics_process(true)
