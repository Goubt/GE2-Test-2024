@tool
extends Node3D

@export var length: int = 10
@export var frequency: float = 1.0
@export var start_angle: float = 0.0
@export var base_size: float = 1.0
@export var multiplier: float = 1.0


func _process(delta):
	for i in range(length):
		var t = remap(i, 0, length, 0, 1)
		var angle = start_angle + sin(t * frequency * 2 * PI) * 360
		var size = remap(t, 0, 1, base_size, base_size * multiplier)
		var box_size = Vector3(size, size, size)
		var position = Vector3(0, 0, i * size)
		DebugDraw3D.draw_box(position, Quaternion(), box_size, Color.BLUE)
	pass

func remap(value, from_min, from_max, to_min, to_max):
	return (value - from_min) / (from_max - from_min) * (to_max - to_min) + to_min
	
func _ready():
	if not Engine.is_editor_hint():
		pass
	
	



