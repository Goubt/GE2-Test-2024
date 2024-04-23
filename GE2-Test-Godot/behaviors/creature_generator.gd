@tool
extends Node3D

@export var length: int = 10
@export var frequency: float = 1.0
@export var start_angle: float = 0.0
@export var base_size: float = 1.0
@export var multiplier: float = 1.0

var worm_segments := []

func _process(delta):
	for i in range(length):
		var t = remap(i, 0, length, 0, 1)
		var angle = start_angle + sin(t * frequency * 2 * PI) * 360
		var size = remap(t, 0, 1, base_size, base_size * multiplier)
		var position = Vector3(0, 0, i * size)
		var segment = position
		worm_segments.append(segment)
		
		if i > 0:
			var previous_segment = worm_segments[i - 1]
			var joint = segment.position
			worm_segments.append(joint)
	draw_gizmo()
	pass

func remap(value, from_min, from_max, to_min, to_max):
	return (value - from_min) / (from_max - from_min) * (to_max - to_min) + to_min
	
func draw_gizmo():
	for i in range(worm_segments.size() - 1):
		DebugDraw3D.draw_line(worm_segments[i], worm_segments[i + 1], Color.BLUE)
		
func _ready():
	if not Engine.is_editor_hint():
		var head_scene = preload("res://behaviors/head.tscn")
		var body_scene = preload("res://behaviors/body.tscn")
		
		for i in range(length):
			var t = remap(i, 0, length, 0, 1)
			var angle = start_angle + sin(t * frequency * 2 * PI) * 360
			var size = remap(t, 0, 1, base_size, base_size * multiplier)
			var position = Vector3(0, 0, i * size)
			
			var segment
			
			if i == 0:
				segment = head_scene.instance()
			else:
				segment = body_scene.instance()
			
			segment.size = Vector3(size, size, size)
			segment.rotation_degrees = Vector3(0, angle, 0)
			segment.translation = position
			
			add_child(segment)
	
	



