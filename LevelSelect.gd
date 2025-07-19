extends CenterContainer

const level_folder_path = "res://levels/"

@onready var v_box_container = $ScrollContainer/MarginContainer/VBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_levels()
	#for i in 20: 
		#var button := Button.new()
		#button.text = str(i)
		#v_box_container.add_child(button)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func fill_levels():
	var i = 0
	var level_paths = DirAccess.get_files_at(level_folder_path)
	for level_path in level_paths:
		var hbox := HBoxContainer.new()
		var button := Button.new()
		button.text = level_path.replace(".tscn", " ").to_upper().replace("_", " ")
		button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var label := Label.new()
		label.text = "High Score: " + "%.2f" % Highscores.highscores[i]
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	
		i += 1
		hbox.add_child(button)
		hbox.add_child(label)
		v_box_container.add_child(hbox)
		
		button.pressed.connect(func():
			get_tree().change_scene_to_file(level_folder_path + level_path))
	
