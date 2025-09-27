	object_const_def
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUIDE
	const VIRIDIANGYM_COOLTRAINERM
	const VIRIDIANGYM_COOLTRAINERF

ViridianGym_MapScripts:
	def_scene_scripts

	def_callbacks

ViridianGymBlueScript: ; added getting Psych Up tm
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .RematchBlue
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	sjump .AfterBattle
.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end
.AfterBattle:
	checkevent EVENT_GOT_TM09_PSYCHUP ; maybe do a check to see if no room
	iftrue .AfterTM
	writetext LeaderBluePsychUpText
	promptbutton
	verbosegiveitem TM_PSYCH_UP
	iffalse .AfterTM
	setevent EVENT_GOT_TM09_PSYCHUP

.AfterTM:
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.RematchBlue:
	writetext BlueText_Rematch
	yesorno
	iffalse .BlueRefuse
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE2
	startbattle
	reloadmapafterbattle
	opentext
	writetext BlueText_RematchEnd
	waitbutton
	closetext
	end

.BlueRefuse:
	writetext BlueText_RematchEnd
	waitbutton
	closetext
	end

BlueText_Rematch: 
	text "Care for a" 
	line "rematch?"
	done

BlueText_RematchEnd:
	text "Oh well..."
	done

ViridianGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuideWinScript
	writetext ViridianGymGuideText
	waitbutton
	closetext
	end

.ViridianGymGuideWinScript:
	writetext ViridianGymGuideWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd GymStatue2Script

LeaderBlueBeforeText:
	text "BLUE: Yo! Finally"
	line "got here, huh?"

	para "I wasn't in the"
	line "mood at CINNABAR,"

	para "but now I'm ready"
	line "to battle you."

	para "…"

	para "You're telling me"
	line "you conquered all"
	cont "the GYMS in JOHTO?"

	para "Heh! JOHTO's GYMS"
	line "must be pretty"
	cont "pathetic then."

	para "Hey, don't worry"
	line "about it."

	para "I'll know if you"
	line "are good or not by"

	para "battling you right"
	line "now."

	para "Ready, JOHTO"
	line "CHAMP?"
	done

LeaderBlueWinText:
	text "BLUE: What?"

	para "How the heck did I"
	line "lose to you?"

	para "…"

	para "Tch, all right…"
	line "Here, take this--"
	cont "it's EARTHBADGE."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> received"
	line "EARTHBADGE."
	done

LeaderBlueAfterText:
	text "BLUE: …"

	para "All right, I was"
	line "wrong. You're the"

	para "real deal. You are"
	line "a good trainer."

	para "But I'm going to"
	line "beat you someday."

	para "Don't you forget"
	line "it!"
	done

LeaderBluePsychUpText:
	text "Also, take this"
	line "good TM"
	
	para "Psych up is a"
	line "move that copies"
	cont "enemy stats."

	para "A perceptive"
	line "trainer will use"
	cont "it well!"
	done

LeaderBlueEpilogueText:
	text "BLUE: Listen, you."

	para "You'd better not"
	line "lose until I beat"
	cont "you. Got it?"
	done

ViridianGymGuideText:
	text "Yo, CHAMP in"
	line "making!"

	para "How's it going?"
	line "Looks like you're"
	cont "on a roll."

	para "The GYM LEADER is"
	line "a guy who battled"

	para "the CHAMPION three"
	line "years ago."

	para "He's no pushover."

	para "Give it everything"
	line "you've got!"
	done

ViridianGymGuideWinText:
	text "Man, you are truly"
	line "tough…"

	para "That was a heck of"
	line "an inspirational"

	para "battle. It brought"
	line "tears to my eyes."
	done

CooltrainerKevin: 
trainer COOLTRAINERM, KEVIN, EVENT_BEAT_COOLTRAINERKEVIN2, CooltrainerKevinSeenText, CooltrainerKevinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerKevinAfterBattleText
	waitbutton
	closetext
	end

CooltrainerKevinSeenText:
	text "We meet again..."
	done

CooltrainerKevinBeatenText:
	text "Dont remember me"
	line "huh..."
	done

CooltrainerKevinAfterBattleText:
	text "Back on the"
	line "grind..."
	done

CooltrainerQuinn:
trainer COOLTRAINERF, QUINN, EVENT_BEAT_COOLTRAINERQUINN2, CooltrainerQuinnSeenText, CooltrainerQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerQuinnAfterBattleText
	waitbutton
	closetext
	end

CooltrainerQuinnSeenText:
	text "You gotta get"
	line "through me first!"
	done

CooltrainerQuinnBeatenText:
	text "Oops..."
	done

CooltrainerQuinnAfterBattleText:
	text "Blue is so"
	line "dreamy..."
	done


ViridianGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	def_object_events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuideScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, CooltrainerKevin, EVENT_VIRIDIAN_GYM_BLUE ; new, reused from trainer in other area
	object_event  2, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, CooltrainerQuinn, EVENT_VIRIDIAN_GYM_BLUE ; new, reused from trainer in other area
