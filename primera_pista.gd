extends Node3D
var Point :=0

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if not body is StaticBody3D and Point == 10:
		$Control.visible = true
		get_tree().paused = true
		print ('fin')
	pass # Replace with function body.
