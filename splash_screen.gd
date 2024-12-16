extends Node2D
#the splash screen advertisement doesn't actually work
#I just thought it would be funny if it looked like a sketchy website with a sketchy advertisement
#the background was a screenshot from my engineering teacher's (Mr.Trinh) Canvas page

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://mainLevel.tscn")
