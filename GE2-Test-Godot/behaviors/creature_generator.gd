@tool
extends Node3D

@export var length: int = 10
@export var frequency: float = 1.0
@export var start_angle: float = 0.0
@export var base_size: float = 1.0
@export var multiplier: float = 5.0

func _process(delta):
	var yAxis = 0
	for i in range(length):
		var angle = sin(i/PI)
		var size = remap(angle, 0, 1, base_size, base_size * multiplier)
		var box_size = Vector3(size, size, size)
		var position = Vector3(0-size/2, 0-size/2,yAxis)
		DebugDraw3D.draw_box(position, Quaternion(), box_size, Color.BLUE)
		yAxis = yAxis + size
	pass

func _ready():
	if not Engine.is_editor_hint():		
		pass
	if not Engine.is_editor_hint():
		var head_scene = preload("res://behaviors/head.tscn")
		var body_scene = preload("res://behaviors/body.tscn")
		var yAxis = 0

		for i in range(length):
			var segment
			var angle = sin(i/PI)
			var size = remap(angle, 0, 1, base_size, base_size * multiplier)
			var box_size = Vector3(size, size, size)
			yAxis = yAxis + size
			var position = Vector3(0, 0,yAxis)
			
			
			if i == 0:
				segment = head_scene.instantiate()
			else:
				segment = body_scene.instantiate()
				
			segment.size = Vector3(size, size, size)
			segment.transform.origin = position
			
			add_child(segment)


