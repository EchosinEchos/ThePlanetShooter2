tool
extends Control

export(int) var endSize:int = 150 setget change_end_size
export(int) var startSize:int = 350 setget change_start_size

var height:int = ProjectSettings.get_setting("display/window/size/height")
var width:int = ProjectSettings.get_setting("display/window/size/width")

var alreadyPressed:bool = false
var startPos:Vector2 = Vector2.ZERO

const ball_scene = preload("res://Scene/Ball.tscn")
var ball_texture:Texture = preload("res://Image/Ball/Astéroid.svg")

export(float) var d_to_v:float = 0.0001


func change_start_size(size):
	startSize = size
	if is_inside_tree():
		$startRect.rect_position = Vector2(0, height - size - endSize)
		$startRect.rect_size = Vector2(width, size+endSize)
	
func change_end_size(size):
	endSize = size
	if is_inside_tree():
		$endRect.rect_position = Vector2(0, height - size)
		$endRect.rect_size = Vector2(width, size)
		change_start_size(startSize)
		
func _ready():
	startSize = $startRect.rect_size[1]
	endSize = $endRect.rect_size[1]
		
		
func _draw():
	if alreadyPressed:
		draw_circle(startPos, 12, Color.white)
		#draw_circle(get_viewport().get_mouse_position(), 32, Color.white)
		draw_line(startPos, get_viewport().get_mouse_position(), Color.white, 4)
		#draw_texture_rect(ball_texture, Rect2(get_viewport().get_mouse_position()-Vector2(25,25), Vector2(50,50)), false)
		
		
func _input(event):
	
	
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT :
			if event.pressed :
				if event.position.y > height - endSize - startSize:
					alreadyPressed = true
					startPos = event.position
					$Ball_Sprite.visible = true
					$Ball_Sprite.position = event.position
			else :
				$Ball_Sprite.visible = false
				if alreadyPressed:
					update()
					alreadyPressed = false
					if event.position.y > height - endSize and event.position.y < height and event.position != startPos:
						var nw_ball = ball_scene.instance()
						
						nw_ball.position = event.position
						var dir:Vector2 = startPos - event.position
						nw_ball.v = dir.normalized() * dir.length() * 0.15
						print(nw_ball.v)
						
						get_tree().get_root().add_child(nw_ball)
						$Fire.emitting = false
						print("Lauch")
					
					
	elif alreadyPressed == true:
		if event is InputEventMouseMotion:
			update()
			$Ball_Sprite.position = event.position
			$Fire.emitting = (event.position.y > height - endSize)
