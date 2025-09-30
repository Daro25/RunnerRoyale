extends VehicleBody3D
@export var max_health: float = 100.0
var current_health: float

@export var health_bar: ProgressBar

func _input(event):
	if event.is_action_pressed("correr"):
		print("correr occurred!")
		$llantaTD.engine_force = 80
		$llantaTI.engine_force = 80
		$llantaDD.engine_force = 80
		$llantaDI.engine_force = 80
	if event.is_action_pressed("Reversa"):
		print("Reversa occurred!")
		$llantaTD.engine_force = -80
		$llantaTI.engine_force = -80
		$llantaDD.engine_force = -80
		$llantaDI.engine_force = -80
	if event.is_action_pressed("Izquierda"):
		print("Izquierda occurred!")
		$llantaDI.steering = deg_to_rad(30)
	if event.is_action_pressed("Derecha"):
		$llantaDD.steering = deg_to_rad(-30)
		print("Derecha occurred!")
	if event.is_action_pressed("salto"):
		print("salto occurred!")
	if event.is_action_pressed("Remolcar"):
		print("Remolcar occurred!")
	if event.is_action_pressed("Reparar"):
		print("Reparar occurred!")
	if event.is_action_pressed("Disparar"):
		print("Disparar occurred!")

#Barra de vida
signal died
func _ready():
	current_health = max_health
	if health_bar:
		health_bar.max_value = max_health
		health_bar.value = current_health

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
