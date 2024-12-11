extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Singleton.value > Singleton.highScore:
		Singleton.highScore = Singleton.value
	$Label.text = "High Score: " + str(Singleton.highScore)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	Singleton.value = 0
	get_tree().change_scene_to_file("res://mainLevel.tscn")
