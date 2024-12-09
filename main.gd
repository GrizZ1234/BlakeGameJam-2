extends Node2D
var rng = RandomNumberGenerator.new()
var platform = preload("res://moving_rect.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_interval_timeout() -> void:
	var randomXPos = rng.randi_range(-300,300)
	var platformInst = platform.instantiate()
	platformInst.position = Vector2(randomXPos,-450)
	self.add_child(platformInst)
	$SpawnInterval.wait_time = rng.randf_range(1.25,1.65)
