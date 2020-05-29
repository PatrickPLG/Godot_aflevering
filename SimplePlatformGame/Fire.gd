#WorldComplete.gd
extends Area2D
onready var health = get_node("../Player").health
var timer = null
var can_damage = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.2)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _physics_process(delta):
	pass
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and can_damage:
			health = health - 5
			print(health)
			can_damage = false
			timer.start()

func on_timeout_complete():
	can_damage = true
