extends Line2D

const max_points = 100
const timer = 0.01

onready var target = get_node("../c2x/c2y")

var t = 0.0
func _process(delta: float) -> void:
	t += delta
	if t >= timer:
		t = 0.0
		track()

func track():
	var new_point = target.global_position - global_position
	new_point.y = - new_point.y
	add_point(new_point)
	if points.size() > max_points:
		remove_point(0)
	
