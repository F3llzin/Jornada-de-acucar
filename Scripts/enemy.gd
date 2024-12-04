extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -400.0
var direction = -1
@onready var Detector_parede = $Detector_parede as RayCast2D
@onready var anim = $anim as Sprite2D
@onready var anima__o = $"animação"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if Detector_parede.is_colliding():
		direction = direction * -1
		Detector_parede.scale.x *= -1
	
	if direction == 1:
		anim.flip_h = false
	else: 
		anim.flip_h = true
		
	velocity.x = direction * SPEED * delta
	
	move_and_slide()


func _on_animação_animation_finished(anim_name: StringName):
	if anim_name == "Dano":
		queue_free()
