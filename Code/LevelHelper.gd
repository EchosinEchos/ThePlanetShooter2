extends Node

class_name LevelHelper, "res://Useless/wrench.svg"

#export(bool) var create_rand_level_at_start :bool = true
export(int, 1, 4) var difficulty:int = 2


var objectif_scene:PackedScene = preload("res://Scene/Objectif.tscn")
var planete_scene:PackedScene = preload("res://Scene/Planete.tscn")

var rng : RandomNumberGenerator = RandomNumberGenerator.new()

var height:int = ProjectSettings.get_setting("display/window/size/height")
var width:int = ProjectSettings.get_setting("display/window/size/width")

var c_tree:SceneTree
var tree_node:Node


var planeteTexture:Array

func _ready():
	rng.randomize()	
	c_tree = get_tree()
	tree_node = c_tree.get_root()
	planeteTexture = Util.loadTexture("res://Image/Planete/")
		
		
	GameHelper.connect("win", self, "win_lvl")
	GameHelper.connect("nextLevel", self, "nextLevel")
	GameHelper.connect("replayLevel", self, "replayLevel")
	GameHelper.connect("play", self, "play")

func clear_lvl():
	c_tree.call_group("gravity_attracted", "queue_free")
	c_tree.call_group("gravity_attractor", "queue_free")
	c_tree.call_group("goal", "queue_free")

func buildRandomLevel():
	var copyTexture = planeteTexture.duplicate()
	copyTexture.shuffle()
	
	var n_obj : StaticBody2D = objectif_scene.instance()
	n_obj.position = Vector2(rng.randi_range(100, width-100), 150)
	n_obj.radius = 100
	self.call_deferred("add_child", n_obj)
	
	var yoff:int = 250
	for i in range(1, rng.randi_range(1, difficulty)+1):
		var n_plan:gravity_attractor = planete_scene.instance()
		var n_rad: int = rng.randi_range(50, difficulty*75)
		yoff += n_rad/2 + rng.randi_range(50,200)
		n_plan.radius = n_rad/2
		n_plan.position = Vector2(rng.randi_range(n_rad/2, width-n_rad/2), yoff)
		n_plan.mass = n_rad * n_rad * 0.5 / 4
		
		if copyTexture.size() <1:
			copyTexture = planeteTexture.duplicate()
			copyTexture.shuffle()
		n_plan.get_node("Sprite").texture = copyTexture.pop_back()
		
		self.call_deferred("add_child", n_plan)
		yoff += n_rad/2



func win_lvl():
	SceneParameters.stage += 1

		
		
func nextLevel():
	if(SceneParameters.Level_Type == SceneParameters.LevelTypeEnum.Infinity):
		clear_lvl()
		buildRandomLevel()

func replayLevel():
	if(SceneParameters.Level_Type == SceneParameters.LevelTypeEnum.Infinity):
		GameHelper.nb_ball_launched = 0;
		GameHelper.score = 0;
		
		
func play():
	if(SceneParameters.Level_Type == SceneParameters.LevelTypeEnum.Infinity):
		print("Playing infinity")
		buildRandomLevel()

