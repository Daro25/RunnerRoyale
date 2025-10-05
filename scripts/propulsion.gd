extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body is RigidBody3D or body is VehicleBody3D:
		var carr: RigidBody3D = body
		var rotationG : Vector3 = self.global_transform.basis.z.normalized()
		var fuerza := 4000
		carr.apply_central_force(rotationG*fuerza)
		print(rotationG)
	pass # Replace with function body.


func _on_body_exited(body: Node3D) -> void:
	if body is RigidBody3D or body is VehicleBody3D:
		var carr: RigidBody3D = body
		var rotationG : Vector3 = self.global_transform.basis.z.normalized()
		var fuerza := 4000
		carr.apply_central_force(rotationG*fuerza)
		print(rotationG)
	pass # Replace with function body.
