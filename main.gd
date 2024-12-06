extends Node2D

var peer = ENetMultiplayerPeer.new()
@export var player_scene: PackedScene

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_host_button_button_up() -> void:
	peer.create_server(1234) # TODO: You must handled errors returned from this
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(addPlayer) # connect signal callback for new player
	addPlayer() # local instance of player
	$CanvasLayer.visible = false

func _on_join_button_button_up() -> void:
	peer.create_client("127.0.0.1", 1234) # TODO: You must handled errors returned from this
	multiplayer.multiplayer_peer = peer
	$CanvasLayer.visible = false


func addPlayer(id = 1):
	var player = player_scene.instantiate()
	player.name = str(id)
	call_deferred("add_child", player)
	
