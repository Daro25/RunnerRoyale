extends CharacterBody3D


var SPEED = 10
var JUMP_VELOCITY = 4.5
var angulo := 0.0
var isJump := false
var timerJump := 0.0
var stop := false
var inCar := true
@onready var animPlayer = $AnimationPlayer
func _physics_process(delta: float) -> void:
	if inCar :
		visible = false
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * 
	Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if direction.x != 0:
			angulo += deg_to_rad(
				sign(-direction.x)*5
			)
			$Armature.rotation.y = angulo
			$camaraPoss.rotation.y = angulo
		var Componentes : Vector2 = _polar_to_rect(angulo)
		velocity.x = -direction.z * SPEED * Componentes.y
		velocity.z = -direction.z * SPEED * Componentes.x
		if not animPlayer.is_playing():
			if isChiste:
				SPEED = 5
				JUMP_VELOCITY = 2
				animPlayer.play("RunStile")
			else:
				SPEED = 10
				JUMP_VELOCITY = 4.5
				animPlayer.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		if animPlayer.is_playing() and not isJump:
			animPlayer.play("Jump")
			animPlayer.stop()
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		isJump = true
		timerJump = 0.0
		if not direction:
			animPlayer.play("Jump")  # si no tienes JumpStart, usa Jump directo

	if isJump:
		timerJump += delta
		if timerJump >= 0.6 and velocity.y == 0 and timerJump < 1 and not direction:   # solo una vez
			velocity.y = JUMP_VELOCITY
		elif velocity.y == 0 and timerJump < 1 and direction:
			velocity.y = JUMP_VELOCITY +2
		if timerJump >= 2.0:
			isJump = false
			timerJump = 0.0
			animPlayer.stop()
	move_and_slide()
var isChiste := false
func _input(event):
	if event.shift_pressed: isChiste = true
	else: isChiste = false
	
	
func _polar_to_rect(angle:float) ->Vector2:
	var x = cos(angle)
	var y = sin(angle)
	return Vector2(x,y)


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('movil'): 
		inCar = true
		
	pass # Replace with function body.
