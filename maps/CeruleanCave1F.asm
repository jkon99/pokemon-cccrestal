	object_const_def
	const CERULEANCAVE1F_MEW

CeruleanCave1F_MapScripts:
	def_scene_scripts

	def_callbacks


CeruleanCave1FMewScript: 
	faceplayer
	opentext
	writetext MewText
	cry MEW
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEW
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEW, 70
	startbattle
	disappear CERULEANCAVE1F_MEW
	reloadmapafterbattle
	end

MewText:
	text "Mew!"
	done


CeruleanCave1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 5, CERULEAN_CAVE_B1F, 1   
	warp_event  27, 15, CERULEAN_CITY, 7

	def_coord_events

	def_bg_events
	

	def_object_events
	object_event  5, 10, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCave1FMewScript, EVENT_FOUGHT_MEW ; wont spawn but mewtwo does
	
	
