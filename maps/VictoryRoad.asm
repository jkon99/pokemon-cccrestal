	object_const_def
	const VICTORYROAD_RIVAL
	const VICTORYROAD_POKE_BALL1
	const VICTORYROAD_POKE_BALL2
	const VICTORYROAD_POKE_BALL3
	const VICTORYROAD_POKE_BALL4
	const VICTORYROAD_POKE_BALL5
	const VICTORYROAD_ALEX1
	const VICTORYROAD_ASH1
	const VICTORYROAD_CONNOR1
	;const VICTORYROAD_FRANCIS1
	const VICTORYROAD_GENNA1
	const VICTORYROAD_LEX1
	const VICTORYROAD_NAHOM1
	const VICTORYROAD_NANDO1
	const VICTORYROAD_QASIM1
	const VICTORYROAD_QUINN1
	;const VICTORYROAD_TJ1


VictoryRoad_MapScripts:
	def_scene_scripts
	scene_script VictoryRoadNoop1Scene, SCENE_VICTORYROAD_RIVAL_BATTLE
	scene_script VictoryRoadNoop2Scene, SCENE_VICTORYROAD_NOOP

	def_callbacks

VictoryRoadNoop1Scene:
	end

VictoryRoadNoop2Scene:
	end

VictoryRoadRivalLeft:
	moveobject VICTORYROAD_RIVAL, 18, 11
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_RIVAL
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleApproachMovement1
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleExitMovement1
	disappear VICTORYROAD_RIVAL
	setscene SCENE_VICTORYROAD_NOOP
	playmapmusic
	end

VictoryRoadRivalRight:
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	appear VICTORYROAD_RIVAL
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleApproachMovement2
	scall VictoryRoadRivalNext
	applymovement VICTORYROAD_RIVAL, VictoryRoadRivalBattleExitMovement2
	disappear VICTORYROAD_RIVAL
	setscene SCENE_VICTORYROAD_NOOP
	playmapmusic
	end

VictoryRoadRivalNext:
	turnobject PLAYER, DOWN
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext VictoryRoadRivalBeforeText
	waitbutton
	closetext
	setevent EVENT_RIVAL_VICTORY_ROAD
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .GotTotodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .GotChikorita
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotTotodile:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.GotChikorita:
	winlosstext VictoryRoadRivalDefeatText, VictoryRoadRivalVictoryText
	setlasttalked VICTORYROAD_RIVAL
	loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .AfterBattle

.AfterBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext VictoryRoadRivalAfterText
	waitbutton
	closetext
	end

VictoryRoadTMEarthquake:
	itemball TM_EARTHQUAKE

VictoryRoadMaxRevive:
	itemball MAX_REVIVE

VictoryRoadFullRestore:
	itemball FULL_RESTORE

VictoryRoadFullHeal:
	itemball FULL_HEAL

VictoryRoadHPUp:
	itemball HP_UP

VictoryRoadHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_VICTORY_ROAD_HIDDEN_MAX_POTION

VictoryRoadHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VICTORY_ROAD_HIDDEN_FULL_HEAL

VictoryRoadRivalBattleApproachMovement1:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleApproachMovement2:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

VictoryRoadRivalBattleExitMovement1:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

VictoryRoadRivalBattleExitMovement2:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step_end

VictoryRoadRivalBeforeText:
	text "Hold it."

	para "…Are you going to"
	line "take the #MON"
	cont "LEAGUE challenge?"

	para "…Don't make me"
	line "laugh."

	para "You're so much"
	line "weaker than I am."

	para "I'm not like I was"
	line "before."

	para "I now have the"
	line "best and strongest"

	para "#MON with me."
	line "I'm invincible!"

	para "<PLAYER>!"
	line "I challenge you!"
	done

VictoryRoadRivalDefeatText:
	text "…I couldn't win…"

	para "I gave it every-"
	line "thing I had…"

	para "What you possess,"
	line "and what I lack…"

	para "I'm beginning to"
	line "understand what"

	para "that dragon master"
	line "said to me…"
	done

VictoryRoadRivalAfterText:
	text "…I haven't given up"
	line "on becoming the"
	cont "greatest trainer…"

	para "I'm going to find"
	line "out why I can't"

	para "win and become"
	line "stronger…"

	para "When I do, I will"
	line "challenge you."

	para "And I'll beat you"
	line "down with all my"
	cont "power."

	para "…Humph! You keep"
	line "at it until then."
	done

VictoryRoadRivalVictoryText:
	text "…Humph!"

	para "When it comes down"
	line "to it, nothing can"
	cont "beat power."

	para "I don't need any-"
	line "thing else."
	done

TrainerFrontrunnerAlex:
	trainer ALEX_, ALEX1, EVENT_BEAT_FRONTRUNNER_ALEX, FrontrunnerAlexSeenText, FrontrunnerAlexBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerAlexAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerAlexSeenText: 
	text "Good luck beating"
	line "my SCARY team!"
	done

FrontrunnerAlexBeatenText:
	text "WHAT! HOW!!!!"
	line "BLEEH!! RAAAH!!"
	done

FrontrunnerAlexAfterBattleText:
	text "I am going to hunt"
	line "you for sport."
	done

TrainerFrontrunnerAsh:
	trainer ASH, ASH1, EVENT_BEAT_FRONTRUNNER_ASH, FrontrunnerAshSeenText, FrontrunnerAshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerAshAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerAshSeenText: 
	text "Time for the"
	line "Ashening!"
	done

FrontrunnerAshBeatenText:
	text "Well fuck me I"
	line "I guess."
	done

FrontrunnerAshAfterBattleText:
	text "Youre lucky Im"
	line "in New Mexico..."
	done

TrainerFrontrunnerConnor:
	trainer CONNOR, CONNOR1, EVENT_BEAT_FRONTRUNNER_CONNOR, FrontrunnerConnorSeenText, FrontrunnerConnorBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerConnorAfterBattleText
	waitbutton
	closetext
	end
/*
FrontrunnerConnorSeenText: 
	text "Moon Prism Power,"
	line "Make Up!"
	done
*/
FrontrunnerConnorSeenText: 
	text "Return to the"
	line "darkness from"
	cont "which you came!"
	done

FrontrunnerConnorBeatenText:
	text "El Psy Kongroo"
	done

FrontrunnerConnorAfterBattleText:
	text "Yare yare daze..."
	done
/*
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
	text "Watch out"
	done

FrontrunnerFrancisBeatenText:
	text "Ooof..."
	done

FrontrunnerFrancisAfterBattleText:
	text "Fuck you Jon."
	line "You made my team"
	cont "suckkkk."
	done
*/
TrainerFrontrunnerGenna:
	trainer GENNA, GENNA1, EVENT_BEAT_FRONTRUNNER_GENNA, FrontrunnerGennaSeenText, FrontrunnerGennaBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerGennaAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerGennaSeenText: 
	text "I came here to"
	line "train a new team."
	
	para "They wont let"
	line "let me down!"
	done

FrontrunnerGennaBeatenText:
	text "GOD!"
	para "DAMN IT!"
	done

FrontrunnerGennaAfterBattleText:
	text "I FORGOT AN ESCAPE"
	line "ROPE. IM SO"
	cont "SCREWED..."
	done

TrainerFrontrunnerLex:
	trainer LEX, LEX1, EVENT_BEAT_FRONTRUNNER_LEX, FrontrunnerLexSeenText, FrontrunnerLexBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerLexAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerLexSeenText: 
	text "Watch out!!!"
	line "Heeeeres Lex!"
	done

FrontrunnerLexBeatenText:
	text "So...you come here"
	line "often?"
	done

FrontrunnerLexAfterBattleText:
	text "Fuck you Jon."
	line "You made my team"
	cont "suckkkk."
	done

TrainerFrontrunnerNahom:
	trainer NAHOM, NAHOM1, EVENT_BEAT_FRONTRUNNER_NAHOM, FrontrunnerNahomSeenText, FrontrunnerNahomBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerNahomAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerNahomSeenText: 
	text "Ok, no more"
	line "Mr.Nice Guy!"
	done

FrontrunnerNahomBeatenText:
	text "Stupid stupid"
	line "STUPID!"
	done

FrontrunnerNahomAfterBattleText:
	text "Arent you like 10?"
	line "Im actually gonna"
	cont "kill myself."
	done

TrainerFrontrunnerNando:
	trainer NANDO, NANDO1, EVENT_BEAT_FRONTRUNNER_NANDO, FrontrunnerNandoSeenText, FrontrunnerNandoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerNandoAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerNandoSeenText: 
	text "Hey, have you"
	line "ever considered"
	para "joining the DSA?"
	done

FrontrunnerNandoBeatenText:
	text "I shouldve gone"
	line "to the meeting"
	para "instead..."
	done

FrontrunnerNandoAfterBattleText:
	text "Were still taking"
	line "new members!"
	done

TrainerFrontrunnerQasim:
	trainer QASIM, QASIM1, EVENT_BEAT_FRONTRUNNER_QASIM, FrontrunnerQasimSeenText, FrontrunnerQasimBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerQasimAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerQasimSeenText: 
	text "Booyah you finally"
	line "came. Get ready"
	cont "for ur boi, QASIM!"
	done

FrontrunnerQasimBeatenText:
	text "Ah dang it, Im"
	line "going back to"
	cont "the remakes..."
	done

FrontrunnerQasimAfterBattleText:
	text "My work is done."
	line "Time to be "
	cont "splatin it." 
	done

TrainerFrontrunnerQuinn:
	trainer QUINN_, QUINN1, EVENT_BEAT_FRONTRUNNER_QUINN, FrontrunnerQuinnSeenText, FrontrunnerQuinnBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext FrontrunnerQuinnAfterBattleText
	waitbutton
	closetext
	end

FrontrunnerQuinnSeenText: 
	text "I told my #MON"
	line "if they win Ill"
	cont "get them all Wawa."
	done

FrontrunnerQuinnBeatenText:
	text "FUCK this Im going"
	line "to Olive Garden."
	done

FrontrunnerQuinnAfterBattleText:
	text "Hey man can I bum"
	line "20 bucks for an"
	cont "uber..."
	done


VictoryRoad_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 67, VICTORY_ROAD_GATE, 5
	warp_event  1, 49, VICTORY_ROAD, 3
	warp_event  1, 35, VICTORY_ROAD, 2
	warp_event 13, 31, VICTORY_ROAD, 5
	warp_event 13, 17, VICTORY_ROAD, 4
	warp_event 17, 33, VICTORY_ROAD, 7
	warp_event 17, 19, VICTORY_ROAD, 6
	warp_event  0, 11, VICTORY_ROAD, 9
	warp_event  0, 27, VICTORY_ROAD, 8
	warp_event 13,  5, ROUTE_23, 3

	def_coord_events
	coord_event 12,  8, SCENE_VICTORYROAD_RIVAL_BATTLE, VictoryRoadRivalLeft
	coord_event 13,  8, SCENE_VICTORYROAD_RIVAL_BATTLE, VictoryRoadRivalRight

	def_bg_events
	bg_event  3, 29, BGEVENT_ITEM, VictoryRoadHiddenMaxPotion
	bg_event  3, 65, BGEVENT_ITEM, VictoryRoadHiddenFullHeal

	def_object_events
	object_event 18, 13, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_VICTORY_ROAD
	object_event  3, 28, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadTMEarthquake, EVENT_VICTORY_ROAD_TM_EARTHQUAKE
	object_event 12, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadMaxRevive, EVENT_VICTORY_ROAD_MAX_REVIVE
	object_event 18, 29, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullRestore, EVENT_VICTORY_ROAD_FULL_RESTORE
	object_event 15, 48, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadFullHeal, EVENT_VICTORY_ROAD_FULL_HEAL
	object_event  7, 38, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, VictoryRoadHPUp, EVENT_VICTORY_ROAD_HP_UP
	object_event  5, 65, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerAlex, -1 ;new
	object_event 12, 52, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerAsh, -1
	object_event  4, 51, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerConnor, -1
	;object_event 18, 55, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerFrontrunnerFrancis, -1 ;no room
	object_event  8, 36, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerGenna, -1
	object_event 14, 34, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerLex, -1
	object_event  6, 27, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerNahom, -1
	object_event 11, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerNando, -1
	object_event  4, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerQasim, -1
	object_event  2, 12, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerQuinn, -1
	;object_event 25, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerFrontrunnerTJ, -1 
	; might change colors for new trainers


