extends Node2D

export (int, 0, 10) var trans_type = Tween.TRANS_BACK

const t = 0.6
const delay = 0.2

onready var c = $Line2D/c
onready var c2x = $Panel/c2x
onready var c2y = $Panel/c2x/c2y
onready var line = $Panel/Line2D

func prepare() -> void:
	motion_in()

func _ready() -> void:
	prepare()


func _on_Tween_tween_all_completed() -> void:
	motion_out()


func _on_Tween2_tween_all_completed() -> void:
	motion_in()

func motion_in():
	$Tween.interpolate_property(c, "position", Vector2(0, 128), Vector2(), t, trans_type, Tween.EASE_OUT, delay)
	$Tween.interpolate_property(c2x, "position", Vector2(0, 0), Vector2(128, 0), t, Tween.TRANS_LINEAR, Tween.EASE_OUT, delay)
	$Tween.interpolate_property(c2y, "position", Vector2(0, 0), Vector2(0, 128), t, trans_type, Tween.EASE_OUT, delay)
	$Tween.start()

func motion_out():
	$Tween2.interpolate_property(c, "position", Vector2(), Vector2(0, 128), t, trans_type, Tween.EASE_IN, delay)
	$Tween2.interpolate_property(c2x, "position", Vector2(128, 0), Vector2(0, 0), t, Tween.TRANS_LINEAR, Tween.EASE_IN, delay)
	$Tween2.interpolate_property(c2y, "position", Vector2(0, 128), Vector2(0, 0), t, trans_type, Tween.EASE_IN, delay)
	$Tween2.start()
