extends VehicleBody3D
func _input(event):
	if event.is_action_pressed("correr"):
		print("correr occurred!")
		$llantaTD.engine_force = 80
		$llantaTI.engine_force = 80
		$llantaDD.engine_force = 80
		$llantaDI.engine_force = 80
	if event.is_action_pressed("Reversa"):
		print("Reversa occurred!")
		$llantaTD.engine_force = -10
		$llantaTI.engine_force = -10
	if event.is_action_pressed("Izquierda"):
		print("Izquierda occurred!")
		$llantaDI.steering = deg_to_rad(-30)
	if event.is_action_pressed("Derecha"):
		$llantaDD.steering = deg_to_rad(30)
		print("Derecha occurred!")
	if event.is_action_pressed("salto"):
		print("salto occurred!")
	if event.is_action_pressed("Remolcar"):
		print("Remolcar occurred!")
	if event.is_action_pressed("Reparar"):
		print("Reparar occurred!")
	if event.is_action_pressed("Disparar"):
		print("Disparar occurred!")
	
