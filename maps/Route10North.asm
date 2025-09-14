	object_const_def
	;const ROUTE10NORTH_ZAPDOS

Route10North_MapScripts:
	def_scene_scripts

	def_callbacks
	;callback MAPCALLBACK_OBJECTS, Route10NorthZapdosCallback
/*
Route10NorthZapdosCallback:
	checkevent EVENT_OPENED_MT_SILVER 
	iffalse .Hide
	checkevent EVENT_FOUGHT_ZAPDOS
	iftrue .Hide
	appear ROUTE10NORTH_ZAPDOS
	endcallback

.Hide:
	disappear ROUTE10NORTH_ZAPDOS
	endcallback */

PowerPlantSign:
	jumptext PowerPlantSignText

Route10PokecenterSign:
	;setevent EVENT_OPENED_MT_SILVER ;test
	jumpstd PokecenterSignScript

PowerPlantSignText:
	text "KANTO POWER PLANT"
	done
/*
Route10NorthZapdosScript: ; works but sprite is kris instead of bird
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
	disappear ROUTE10NORTH_ZAPDOS
	reloadmapafterbattle
	end

ZapdosText:
	text "Gyaoo!"
	done */

Route10North_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  1, ROUTE_10_POKECENTER_1F, 1
	warp_event  3,  9, POWER_PLANT, 1
	warp_event  12, 9, LEGENDS_CAVE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, PowerPlantSign
	bg_event 12,  1, BGEVENT_READ, Route10PokecenterSign
	

	;def_object_events
	;object_event 14, 15, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route10NorthZapdosScript, EVENT_TEMP   ; zapdos spawns after mt silver accessible, put in legends cave
