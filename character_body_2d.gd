extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0
var gameOver = false
var normalTexture = load("res://Hazmat Character-2.png.png")
var jumpTexture = load("res://Hazmat Character-1.png.png")


func _physics_process(delta: float) -> void:
	if gameOver == false:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			$Sprite2D.texture = jumpTexture
		else: $Sprite2D.texture = normalTexture

		# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("MoveLeft", "MoveRight")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
		
		for i in get_slide_collision_count():
				var collision = get_slide_collision(i)
				if collision.get_collider().is_in_group("DeadlyItems") == true:
					gameOver = true
					velocity.x = 0
					velocity.y = 0
					get_tree().change_scene_to_file("res://deathScreen.tscn")
					return
