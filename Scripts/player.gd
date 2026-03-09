extends CharacterBody2D


@onready var animated: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -350.0

func _physics_process(delta: float) -> void:
	if Global.is_hurt or Global.is_deaf:
		move_and_slide()
	else:
	# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("Left", "Right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		
		#Flips Sprite directionally
		if direction > 0:
			animated.flip_h = false
		elif direction < 0:
			animated.flip_h = true
		
		#Animations
		if is_on_floor():
			if direction == 0:
				animated.play("Idle")
			else:
				animated.play("Run")
		else:
			animated.play("Jump")

		move_and_slide()

func lose_life():
	Global.lives -= 1
	if Global.lives > 0:
		Global.is_hurt = true
		Engine.time_scale = 2
		velocity.x = -100  
		velocity.y = -50 
		animated.play("Hit")
		
		await  animated.animation_finished
		Engine.time_scale = 1
		Global.is_hurt = false
	else:
		Global.is_deaf = true
		no_lives()

func respawn():
	global_position = %"Checkpoint Manager".last_location

func no_lives():
	velocity.x = 0  
	velocity.y = 0 
	animated.play("Death")
	
	await animated.animation_finished
	get_tree().quit()
