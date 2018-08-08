extends Node

const NULL = Color(0, 0, 0, 0)
const BLACK = Color(0, 0, 0)
const WHITE = Color(1, 1, 1)
const RED = Color(1, 0, 0)
const GREEN = Color(0, 1, 0)

var color
var mode
var size
var drawing
var popup

func _ready():
	if !size:
		size = Vector2(32, 32)
	mode = 0
	color = NULL
	drawing = true
	popup = false
