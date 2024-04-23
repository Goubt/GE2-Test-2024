@tool
extends Node3D

@export var length: int = 10
@export var frequency: float = 1.0
@export var start_angle: float = 0.0
@export var base_size: float = 1.0
@export var multiplier: float = 5.0


func _process(delta):
	for i in range(length):
		var angle = sin(i * frequency + start_angle)
		print(angle)
		var size = remap(angle, 0, 1, base_size, base_size * multiplier)
		var box_size = Vector3(size, size, size)
		var position = Vector3(0-size/2, 0-size/2,i *size)
		DebugDraw3D.draw_box(position, Quaternion(), box_size, Color.BLUE)
	pass

func _ready():
	if not Engine.is_editor_hint():
		pass
	
	



