	object_const_def
	const CIANWOODCAVE_POKE_BALL1

CianwoodCave_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodCavePsychic:
	itemball TM_PSYCHIC_M

CianwoodCave_MapEvents:
	db 0, 0 ; filler
	; based on whirlisland cave map
	def_warp_events
	warp_event 11,  5, CIANWOOD_CITY, 8
	warp_event  5,  5, ROUTE_47, 1

	; encounters for fossil pokemon (added)
	; for some reason encounters are giving dark cave, turns out was because I didnt set day+night encounters just morning. should be fine now
	; add 1 trainer
	def_coord_events

	def_bg_events

	def_object_events
	object_event  6,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CianwoodCavePsychic, EVENT_ROUTE_47_PSYCHIC ; works here but not in route47
