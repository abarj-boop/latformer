extends Node

var lives = 5
var points = 0
var is_hurt = false
var is_deaf = false

func add_points():
	points += 1

func remove_points():
	points -= 1
