extends Area

export (String, FILE) var destination = ""

func _ready():
	pass 

func _process(delta):
	pass


func _on_Area_body_entered(body):
	get_tree().change_scene("res://level_2.tscn")
