extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = $Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.linear_velocity.y = 150


func _on_timer_timeout() -> void:
	self.queue_free()
