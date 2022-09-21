extends CollisionShape

func _on_Area_body_entered(body):
	var textBox = get_parent().get_parent().get_node("textBox")
	textBox.get_node("MarginContainer").show()
	textBox.set_text("HI")
