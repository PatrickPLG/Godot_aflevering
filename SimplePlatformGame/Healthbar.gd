extends TextureProgress


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = get_tree().root.get_node("World").get_node("Player").health
