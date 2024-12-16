extends RigidBody2D
var count = 0
var lv = -100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count += 1
	if count % 100 == 0: lv *= 1.75
	self.linear_velocity.y = lv

func _on_laser_timeout_timeout() -> void:
	self.queue_free()
