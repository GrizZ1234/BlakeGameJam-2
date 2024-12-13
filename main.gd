extends Node2D
var rng = RandomNumberGenerator.new()
var platform = preload("res://moving_rect.tscn") 
var laser = preload("res://laser.tscn")
var count = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if count % 100 == 0:
		count = 1
		Singleton.add_value()
	$CharacterBody2D/Label.text = "Score: " + str(Singleton.value)

func _on_spawn_interval_timeout() -> void:
	var randomXPos = rng.randi_range(-300,300)
	var platformInst = platform.instantiate()
	platformInst.position = Vector2(randomXPos,-450)
	self.add_child(platformInst)
	$SpawnInterval.wait_time = rng.randf_range(1.25,1.65)


func _on_laser_spawn_interval_timeout() -> void:
	var randomXPos = rng.randi_range(-500,500)
	var laserInst = laser.instantiate()
	laserInst.position = Vector2(randomXPos,800)
	self.add_child(laserInst)
	#$LaserSpawnInterval.wait_time*=0.5
	#print($LaserSpawnInterval.wait_time)
