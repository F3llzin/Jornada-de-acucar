extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -280.0
@onready var animation = $anim as AnimatedSprite2D
@onready var pular = $pular as AudioStreamPlayer
@onready var remote_transform = $RemoteTransform2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pulando = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		pulando = true
		pular.play()
	elif is_on_floor():
		pulando = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
		if !pulando:
			animation.play("run")
	elif pulando:
		animation.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("idle")

	move_and_slide()


func _on_hurt_box_body_entered(body):
	if body.is_in_group("inimigos"):
		queue_free()
func seguir_camera(camera_2d):
	var caminho_camera = camera_2d.get_path()
	remote_transform.remote_path = caminho_camera
