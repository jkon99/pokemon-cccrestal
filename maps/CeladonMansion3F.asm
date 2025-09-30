	object_const_def
	;const CELADONMANSION3F_COOLTRAINER_M
	const CELADONMANSION3F_GYM_GUIDE
	const CELADONMANSION3F_SUPER_NERD
	const CELADONMANSION3F_FISHER
	const CELADONMANSION3F_JON

CeladonMansion3F_MapScripts:
	def_scene_scripts

	def_callbacks

; might add back swap out diploma printing guy instead for my trainer?

;GameFreakGameDesignerScript:
;	faceplayer
;	opentext
;	writetext GameFreakGameDesignerText
;	readvar VAR_DEXCAUGHT
;	ifgreater NUM_POKEMON - 2 - 1, .CompletedPokedex ; ignore Mew and Celebi
;	waitbutton
;	closetext
;	end

;.CompletedPokedex:
;	promptbutton
;	writetext GameFreakGameDesignerCompletedPokedexText
;	playsound SFX_DEX_FANFARE_230_PLUS
;	waitsfx
;	writetext GameFreakGameDesignerPauseForDiplomaText
;	promptbutton
;	special Diploma
;	writetext GameFreakGameDesignerAfterDiplomaText
;	waitbutton
;	closetext
;	setevent EVENT_ENABLE_DIPLOMA_PRINTING
;	end

GameFreakGraphicArtistScript:
	faceplayer
	opentext
	checkevent EVENT_ENABLE_DIPLOMA_PRINTING
	iftrue .CanPrintDiploma
	writetext GameFreakGraphicArtistText
	waitbutton
	closetext
	end

.CanPrintDiploma:
	writetext GameFreakGraphicArtistPrintDiplomaText
	yesorno
	iffalse .Refused
	special PrintDiploma
	closetext
	end

.Refused:
	writetext GameFreakGraphicArtistRefusedText
	waitbutton
	closetext
	end

.CancelPrinting: ; unreferenced
	writetext GameFreakGraphicArtistErrorText
	waitbutton
	closetext
	end

GameFreakProgrammerScript:
	jumptextfaceplayer GameFreakProgrammerText

GameFreakCharacterDesignerScript:
	jumptextfaceplayer GameFreakCharacterDesignerText

CeladonMansion3FDevRoomSign:
	jumptext CeladonMansion3FDevRoomSignText

CeladonMansion3FDrawing:
	jumptext CeladonMansion3FDrawingText

CeladonMansion3FGameProgram:
	jumptext CeladonMansion3FGameProgramText

CeladonMansion3FReferenceMaterial:
	jumptext CeladonMansion3FReferenceMaterialText

;GameFreakGameDesignerText:
;	text "Is that right?"

;	para "I'm the GAME"
;	line "DESIGNER!"

;	para "Filling up your"
;	line "#DEX is tough,"
;	cont "but don't give up!"
;	done

;GameFreakGameDesignerCompletedPokedexText:
;	text "Wow! Excellent!"
;	line "You completed your"
;	cont "#DEX!"

;	para "Congratulations!"
;	done

;GameFreakGameDesignerPauseForDiplomaText:
;	text "…"
;	done

;GameFreakGameDesignerAfterDiplomaText:
;	text "The GRAPHIC ARTIST"
;	line "will print out a"
;	cont "DIPLOMA for you."

;	para "You should go show"
;	line "it off."
;	done

GameFreakGraphicArtistText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "I drew you!"
	done

GameFreakGraphicArtistPrintDiplomaText:
	text "I'm the GRAPHIC"
	line "ARTIST."

	para "Oh, you completed"
	line "your #DEX?"

	para "Want me to print"
	line "out your DIPLOMA?"
	done

GameFreakGraphicArtistRefusedText:
	text "Give me a shout if"
	line "you want your"
	cont "DIPLOMA printed."
	done

GameFreakGraphicArtistErrorText:
	text "Something's wrong."
	line "I'll have to can-"
	cont "cel printing."
	done

GameFreakProgrammerText:
	text "Who, me? I'm the"
	line "PROGRAMMER."

	para "Play the slot"
	line "machines!"
	done

GameFreakCharacterDesignerText:
	text "Aren't the TWINS"
	line "adorable?"

	para "JASMINE's pretty"
	line "too."

	para "Oh, I love them!"
	done

CeladonMansion3FDevRoomSignText:
	text "GAME FREAK"
	line "DEVELOPMENT ROOM"
	done

CeladonMansion3FDrawingText:
	text "It's a detailed"
	line "drawing of a"
	cont "pretty girl."
	done

CeladonMansion3FGameProgramText:
	text "It's the game"
	line "program. Messing"

	para "with it could put"
	line "a bug in the game!"
	done

CeladonMansion3FReferenceMaterialText:
	text "It's crammed with"
	line "reference materi-"
	cont "als. There's even"
	cont "a # DOLL."
	done

DeveloperJonScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_DEVELOPER_JON
	iftrue .JonRematch
	writetext Jon_Intro
	yesorno
	iffalse .JonRefuse
	writetext Jon_Fight
	waitbutton
	closetext
	winlosstext Jon_BetterTrainer, 0
	loadtrainer JON, JON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DEVELOPER_JON
	opentext
	writetext Jon_Beat
	waitbutton
	closetext
	verbosegiveitem GS_BALL
	setevent EVENT_GOT_GS_BALL_FROM_GOLDENROD_POKEMON_CENTER
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	;setflag ENGINE_FOREST_IS_RESTLESS ; to fix gs ball event
	;clearevent EVENT_ILEX_FOREST_LASS ; to fix gs ball event
	;setevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS ; to fix gs ball event
	end
.JonRematch:
	writetext Jon_Rematch
	yesorno
	iffalse .JonRefuse
	writetext Jon_Fight
	waitbutton
	closetext
	winlosstext Jon_BetterTrainer, 0
	loadtrainer JON, JON1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_DEVELOPER_JON
	opentext
	writetext Jon_Beat
	waitbutton
	closetext
	end
.JonRefuse:
	writetext Jon_Refuse
	waitbutton
	closetext
	end


Jon_Intro:
	text "Hey! I am JON!"
	line "The developer of"
	cont "this hack!"

	para "Some of my friends"
	line "call me KAZ."

	para "Anyways, I am"
	line "not much to talk."
	cont "How about..."

	para "A battle!"
	line "What do ya say?"
	done

Jon_Rematch:
	text "Hello again!"
	line "Care for another"
	cont "battle?"
	done

Jon_Refuse:
	text "Ahh...maybe"
	line "another time."
	done

Jon_Fight:
	text "Thats the spirit!"
	line "No holding back!"
	done

Jon_BetterTrainer:
	text "Dang, Ive been"
	line "beat..."
	done

Jon_Beat:
	text "You won fair"
	line "and square. You"
	cont "can have this!"
	done



CeladonMansion3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, CELADON_MANSION_ROOF, 1
	warp_event  1,  0, CELADON_MANSION_2F, 2
	warp_event  6,  0, CELADON_MANSION_2F, 3
	warp_event  7,  0, CELADON_MANSION_ROOF, 2

	def_coord_events

	def_bg_events
	bg_event  5,  8, BGEVENT_UP, CeladonMansion3FDevRoomSign
	bg_event  4,  3, BGEVENT_UP, CeladonMansion3FDrawing
	bg_event  1,  6, BGEVENT_UP, CeladonMansion3FGameProgram
	bg_event  1,  3, BGEVENT_UP, CeladonMansion3FReferenceMaterial

	def_object_events
	;object_event  3,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakGameDesignerScript, -1
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakGraphicArtistScript, -1
	object_event  0,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GameFreakProgrammerScript, -1
	object_event  0,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GameFreakCharacterDesignerScript, -1
	object_event  3,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DeveloperJonScript, -1 ;graphics glitches some reason?
