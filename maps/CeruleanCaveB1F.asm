	object_const_def
	const CERULEANCAVEB1F_MEWTWO

	; make water have collision

CeruleanCaveB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, CeruleanCaveB1FMewtwoCallback

CeruleanCaveB1FMewtwoCallback:
	checkevent EVENT_FOUGHT_MEWTWO
	iftrue .NoAppear
	appear CERULEANCAVEB1F_MEWTWO

.NoAppear:
	disappear CERULEANCAVEB1F_MEWTWO
	endcallback

CeruleanCaveB1FMewtwoScript:
	faceplayer
	opentext
	writetext MewtwoText
	; play mewtwo sound, and initiate battle
	cry MEWTWO
	pause 15
	closetext
	setevent EVENT_FOUGHT_MEWTWO
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MEWTWO, 70
	startbattle
	disappear CERULEANCAVEB1F_MEWTWO
	reloadmapafterbattle
	end

MewtwoText:
	text "Mew!"
	done


CeruleanCaveB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5, 5, CERULEAN_CAVE_1F, 1


	def_coord_events

	def_bg_events
	

	def_object_events
	object_event  22,  10, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanCaveB1FMewtwoScript, EVENT_FOUGHT_MEWTWO ; mewtwo encounter, make disappear after defeat, might put in event instead of -1
	
