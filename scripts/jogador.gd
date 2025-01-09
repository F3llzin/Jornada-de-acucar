extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -280.0
var knockback = Vector2.ZERO
@onready var animation = $anim as AnimatedSprite2D
@onready var pular = $pular as AudioStreamPlayer
@onready var remote_transform = $RemoteTransform2D
@onready var ray_direita = $Ray_direita
@onready var ray_esquerda = $Ray_esquerda
var direction
var direcao

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var pulando = false
var is_hurted = false

signal jogador_morreu

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
	direction = Input.get_axis("ui_left", "ui_right")
	direcao = Input.get_axis("mov._direita", "mov._esquerda")
	
	if direction:
		velocity.x = direction * SPEED
		animation.scale.x = direction
	
	elif direcao:
		velocity.x = direcao * SPEED
		animation.scale.x = direcao
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if knockback != Vector2.ZERO:
		velocity = knockback

	_set_state()
	move_and_slide()

	for platforms in get_slide_collision_count():
		var colisao = get_slide_collision(platforms)
		if colisao.get_collider().has_method("colidiu_com"):
			colisao.get_collider().colidiu_com(colisao, self)


func _on_hurt_box_body_entered(_body):
		if ray_direita.is_colliding():
			tomar_dano(Vector2(-200, -200))
		elif ray_esquerda.is_colliding():
			tomar_dano(Vector2(200, -200))
		
func seguir_camera(camera_2d):
	var caminho_camera = camera_2d.get_path()
	remote_transform.remote_path = caminho_camera
	
func tomar_dano(knockback_force = Vector2.ZERO, duration = 0.25):
	if Global.vida_jogador > 0:
		Global.vida_jogador -= 1
	else:
		queue_free()
		emit_signal("jogador_morreu")
	if knockback_force != Vector2.ZERO:
		knockback = knockback_force 
		
		var knockback_tween = get_tree().create_tween()
		knockback_tween.parallel().tween_property(self, "knockback", Vector2.ZERO, duration)
		animation.modulate = Color(1,0,0,1)
		knockback_tween.parallel().tween_property(animation, "modulate", Color(1,1,1,1), duration)
		
	is_hurted = true
	await get_tree().create_timer(.3).timeout
	is_hurted = false
		
func _set_state():
	var state = "idle"
	
	if !is_on_floor():
		state = "jump"
	elif direction != 0:
		state = "run"
	elif direcao != 0:
		state = "run"
	if is_hurted:
		state = "hurt"
	
	if animation.name != state:
		animation.play(state)
		


func _on_cabeca_colisor_body_entered(body):
	if body.has_method("quebrar_sprite"):
		body.hit -= 1
		if body.hit < 0:
			body.quebrar_sprite()
		else:
			body.anim.play("hit")
			body.criar_coletavel()
