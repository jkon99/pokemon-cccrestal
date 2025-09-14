	object_const_def
	const ROUTE22_FRANCIS1
	const ROUTE22_TJ1

Route22_MapScripts:
	def_scene_scripts

	def_callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

TrainerFrontrunnerFrancis:
	trainer FRANCIS, FRANCIS1, EVENT_BEAT_FRONTRUNNER_FRANCIS, FrontrunnerFrancisSeenText, FrontrunnerFrancisBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerFrancisAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerFrancisSeenText: 
	text "GOD SAVE THE QUEEN"
	done

FrontrunnerFrancisBeatenText:
	text "Uhhhh let me be"
	line "clear."
	done

FrontrunnerFrancisAfterBattleText:
	text "Gonna go back to"
	line "work now, see you"
	cont "in the evening."
	done

TrainerFrontrunnerTJ:
	trainer TJ, TJ1, EVENT_BEAT_FRONTRUNNER_TJ, FrontrunnerTJSeenText, FrontrunnerTJBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerTJAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerTJSeenText: 
	text "Loser has to"
	line "commit tax fraud!"
	done

FrontrunnerTJBeatenText:
	text "Okay so about that"
	line "bet.."
	done

FrontrunnerTJAfterBattleText:
	text "The IRS probably"
	line "wont notice me"
	cont "anyways, right?"
	done



Route22_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	def_object_events
	object_event 18, 6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerFrancis, -1 ; for some reason was loading brown kris sprite? try sprite_youngster see if same thing
	object_event 25, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerTJ, -1 
