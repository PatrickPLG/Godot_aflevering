#WorldComplete.gd
extends Area2D

var health = 100

# warning-ignore:unused_argument
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			health = health - 1
			print(health)
