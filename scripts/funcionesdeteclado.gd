extends VehicleBody3D
@export var max_health: float = 100.0
var current_health: float
@export var health_bar: ProgressBar
#Barra de vida
signal died
func _ready():
	current_health = max_health
	if health_bar:
		health_bar.max_value = max_health
		health_bar.value = current_health

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		$llantaDI.steering = deg_to_rad(30)
		$llantaDD.steering = deg_to_rad(30)
	elif Input.is_action_pressed("ui_right"):
		$llantaDD.steering = deg_to_rad(-30)
		$llantaDI.steering = deg_to_rad(-30)
	else:
		$llantaDD.steering = deg_to_rad(0)
		$llantaDI.steering = deg_to_rad(0)
	if Input.is_action_pressed("ui_up"):
		$llantaTD.engine_force = 500
		$llantaTI.engine_force = 500
		$llantaDD.engine_force = 800
		$llantaDI.engine_force = 800
	elif Input.is_action_pressed("ui_down"):
		$llantaTD.engine_force = -500
		$llantaTI.engine_force = -500
		$llantaDD.engine_force = -800
		$llantaDI.engine_force = -800
	else:
		$llantaTD.engine_force = 0
		$llantaTI.engine_force = 0
		$llantaDD.engine_force = 0
		$llantaDI.engine_force = 0

func take_damage(amount: float):
	if current_health <= 0:
		return

	current_health -= amount
	print("Vida restante: ", current_health)

	if health_bar:
		health_bar.value = current_health

	if current_health <= 0:
		emit_signal("died")
		print("¡Vehículo destruido!")
		queue_free()
