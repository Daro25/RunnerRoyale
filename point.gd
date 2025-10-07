extends Area3D
var padre : Node3D
func _ready():
	padre = get_parent()
func _on_body_entered(body: Node3D) -> void:
	padre.Point +=1
	print(padre.Point)
	self.queue_free()
	pass # Replace with function body.
