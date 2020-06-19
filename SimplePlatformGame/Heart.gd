extends Area2D

var timer = null
var can_heal = true

export var regenerate = 25

onready var getPlayer = $"../Player"

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.2)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and can_heal:
			getPlayer.heal(regenerate)
			can_heal = false
			timer.start()

func on_timeout_complete():
	can_heal = true
