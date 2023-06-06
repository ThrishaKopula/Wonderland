extends TextureButton

var SHINE_TIME = .5

onready var tween = get_node("Tween")

onready var icon = get_node(".")

func _ready():
	
	var mat_override = icon.material.duplicate()
	icon.set_material(mat_override)
	icon.material.set_shader_param("onoff",0)
	
	shineBitch()
	
	pass
	
func shineBitch():
	tween.interpolate_property(	icon.material, "shader_param/shine_progress", 
	1.0, 0.0, SHINE_TIME, Tween.TRANS_SINE, Tween.EASE_IN)
	tween.interpolate_property(	icon.material, "shader_param/shine_size", 
	0.13, 0.01, SHINE_TIME * 0.75, Tween.TRANS_CUBIC, Tween.EASE_IN, 
	SHINE_TIME * .25)

	tween.interpolate_property(	icon.material, "shader_param/shine_progress", 
	0.0, 1.0, SHINE_TIME, Tween.TRANS_SINE, Tween.EASE_OUT, SHINE_TIME)
	tween.interpolate_property(	icon.material, "shader_param/shine_size", 
	null, 0.13, SHINE_TIME * 0.75, Tween.TRANS_CUBIC, Tween.EASE_OUT, 
	SHINE_TIME * .25 + SHINE_TIME)
	tween.start()
	pass

func _on_Button_mouse_entered():

	icon.material.set_shader_param("onoff",1)

	pass # Replace with function body.


func _on_Button_mouse_exited():

	icon.material.set_shader_param("onoff",0)

	pass # Replace with function body.



func _on_J2_pressed():
	pass # Replace with function body.


func _on_Q2_pressed():
	pass # Replace with function body.


func _on_K2_pressed():
	pass # Replace with function body.
