	object_const_def
	;const CIANWOODCAVE_POKE_BALL1
	const LEGENDS_MEW
	const LEGENDS_ZAPDOS
	const LEGENDS_MOLTRES

LegendsCave_MapScripts: ; for some reason entering map it loads as "cerulean cave"
	def_scene_scripts

	def_callbacks
	;callback MAPCALLBACK_TILES, .ForceSpriteLoad
	callback MAPCALLBACK_OBJECTS, LegendsCaveMewCallback
	callback MAPCALLBACK_OBJECTS, LegendsCaveZapdosCallback
	callback MAPCALLBACK_OBJECTS, LegendsCaveMoltresCallback

;.ForceSpriteLoad:
	;playsound SFX_WARPTO
	;endcallback

LegendsCaveMewCallback:
	checkevent EVENT_OPENED_MT_SILVER 
	iffalse .Hide
	checkevent EVENT_FOUGHT_MEW 
	iftrue .Hide
	appear LEGENDS_MEW 
	;callasm LoadUsedSpritesGFX
	endcallback

.Hide:
	disappear LEGENDS_MEW
	endcallback

LegendsCaveZapdosCallback:
	checkevent EVENT_OPENED_MT_SILVER 
	iffalse .Hide
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .Hide
	appear LEGENDS_ZAPDOS
	endcallback

.Hide:
	disappear LEGENDS_ZAPDOS
	endcallback

LegendsCaveMoltresCallback:
 	checkevent EVENT_OPENED_MT_SILVER 
	iffalse .Hide
	checkevent EVENT_FOUGHT_MOLTRES
	iftrue .Hide
	appear LEGENDS_MOLTRES
	endcallback

.Hide:
	disappear LEGENDS_MOLTRES
	endcallback

LegendsMewScript: 
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
	disappear LEGENDS_MEW
	reloadmapafterbattle
	end

MewText:
	text "Mew!"
	done

LegendsZapdosScript: 
	faceplayer
	opentext
	writetext ZapdosText
	cry ZAPDOS
	pause 15
	closetext
	setevent EVENT_FOUGHT_ZAPDOS
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon ZAPDOS, 60
	startbattle
	disappear LEGENDS_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Gyaoo!"
	done

LegendsMoltresScript: 
	faceplayer
	opentext
	writetext MoltresText
	cry MOLTRES
	pause 15
	closetext
	setevent EVENT_FOUGHT_MOLTRES
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon MOLTRES, 60
	startbattle
	disappear LEGENDS_MOLTRES
	reloadmapafterbattle
	end

MoltresText:
	text "Gyaoo!"
	done


LegendsCave_MapEvents:
	db 0, 0 ; filler
	def_warp_events ; fixed
	warp_event 7,  9, ROUTE_47, 2
	warp_event  21,  9, ROUTE_10_NORTH, 3
	warp_event  13,  21, CINNABAR_ISLAND, 2

	
	def_coord_events

	def_bg_events

	def_object_events
	object_event  6, 5, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LegendsMewScript, EVENT_FOUGHT_MEW
	object_event 20, 5, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, LegendsZapdosScript, EVENT_FOUGHT_ZAPDOS
	object_event 12, 17, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LegendsMoltresScript, EVENT_FOUGHT_MOLTRES
