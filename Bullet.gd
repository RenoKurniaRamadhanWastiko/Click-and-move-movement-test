extends KinematicBody2D

var target  = Vector2()
var liniear_velcoity = Vector2()
var speed = 0
var mouse_button_pressed = false
var moving =  false
var target_rot = 0

func _ready():
	set_physics_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	liniear_velcoity = Vector2(speed,0).rotated(self.rotation)
	if moving:
		look_at(target)
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and not mouse_button_pressed:
		target = get_global_mouse_position()
		speed = 200
		mouse_button_pressed = true
		moving = true
	elif not Input.is_mouse_button_pressed(BUTTON_LEFT) and mouse_button_pressed:
		mouse_button_pressed = false
	if get_distance(global_position,target) < 20:
		speed = 0
		moving = false
	liniear_velcoity.x = lerp(liniear_velcoity.x,speed,0.05)
	liniear_velcoity = move_and_slide(liniear_velcoity)
	
func get_distance(current, target):
	var distance
	distance = abs(current.x-target.x)+abs(current.y-target.y)
	return distance
