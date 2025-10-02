extends SpringArm3D

@export var mouse_sensitivity := 0.5
var rotation_x := 0.0
var rotation_y := 0.0

#func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation_y -= -event.relative.x * mouse_sensitivity
		rotation_x -= -event.relative.y * mouse_sensitivity

		# Limitar rotación vertical para no dar vuelta completa
		#rotation_x = clamp(rotation_x, -30, 10)
		rotation_x = clamp(rotation_x, deg_to_rad(-90), deg_to_rad(45))

		rotation_degrees = Vector3(rotation_x, rotation_y, 0)
