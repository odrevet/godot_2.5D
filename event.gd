extends CollisionShape

var TextBox = preload("res://textBox.tscn")


func _on_Area_body_entered(body):
	var textBox = TextBox.instance()
	textBox.get_node("MarginContainer").show()
	textBox.set_text("HI")
