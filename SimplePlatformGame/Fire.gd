#WorldComplete.gd
extends Area2D
#var health = get_node("/root/World/Player").health
#onready var health = get_parent().get_node("/root/World/Player").health
#var health = 100
var timer = null
var can_damage = true

export var damage = 15

onready var getPlayer = $"../Player"

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(0.2)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func _physics_process(delta):
	#pass
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player" and can_damage:
			getPlayer.hit(damage)
			
			can_damage = false
			timer.start()

func on_timeout_complete():
	can_damage = true
