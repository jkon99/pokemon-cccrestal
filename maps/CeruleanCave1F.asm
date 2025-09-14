	object_const_def

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks


CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 5, CERULEAN_CAVE_B1F, 1   ; fix collision on entrance, and make map brighter
	warp_event  27, 15, CERULEAN_CITY, 7

	def_coord_events

	def_bg_events
	

	def_object_events
	
	
