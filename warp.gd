extends Area

export (String, FILE) var destination = ""

func _on_Area_body_entered(body):
	get_tree().change_scene(destination)
