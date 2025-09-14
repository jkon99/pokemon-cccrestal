;EXPORT LoadUsedSpritesGFX

	object_const_def
	;const ROUTE47_POKE_BALL1
	;const ROUTE47_POKE_BALL2
	;const ROUTE47_MEW
	const ROUTE47_COOLTRAINERSTEVE
	const ROUTE47_BEAUTYBRENDA

/* Route47_MapScripts: ; test when spawning directly in see that sprites work right
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .ForceSpriteLoad

.ForceSpriteLoad:
	callasm LoadUsedSpritesGFX
	endcallback*/

Route47_MapScripts: 
	def_scene_scripts

	def_callbacks
	;callback MAPCALLBACK_TILES, .ForceSpriteLoad ; attempt to fix sprite
/*	callback MAPCALLBACK_OBJECTS, Route47MewCallback

.ForceSpriteLoad: ;try use this to fix sprite load
	;setevent EVENT_TEMP
    callasm LoadUsedSpritesGFX
	;clearevent EVENT_TEMP
  ; test: play sound to prove it runs
	;playsound SFX_ITEM
	endcallback  */
/*
Route47MewCallback:
	checkevent EVENT_OPENED_MT_SILVER 
	iffalse .Hide
	checkevent EVENT_FOUGHT_MEW 
	iftrue .Hide
	appear ROUTE47_MEW 
	;callasm LoadUsedSpritesGFX
	endcallback

.Hide:
	disappear ROUTE47_MEW
	endcallback */

;Route47Psychic:
;	itemball TM_PSYCHIC_M

;Route47RareCandy: ; not spawning?
;	itemball RARE_CANDY
/*
Route47MewScript: 
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
	disappear ROUTE47_MEW
	reloadmapafterbattle
	end

MewText:
	text "Mew!"
	done */

CooltrainerSteve: 
trainer COOLTRAINERM, STEVE, EVENT_BEAT_COOLTRAINERM_STEVE, CooltrainerSteveSeenText, CooltrainerSteveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerSteveAfterBattleText
	waitbutton
	closetext
	end

CooltrainerSteveSeenText:
	text "Beast mode!"
	done

CooltrainerSteveBeatenText:
	text "Maybe next time..."
	done

CooltrainerSteveAfterBattleText:
	text "The air here is"
	line "refreshing!"
	done

BeautyBrenda:
trainer BEAUTY, BRENDA, EVENT_BEAT_BEAUTY_BRENDA, CooltrainerBeautySeenText, CooltrainerBeautyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerBeautyAfterBattleText
	waitbutton
	closetext
	end

CooltrainerBeautySeenText:
	text "Ugh my hair is a"
	line "mess out here!"
	done

CooltrainerBeautyBeatenText:
	text "Back to the salon"
	line "for me..."
	done

CooltrainerBeautyAfterBattleText:
	text "I heard theres a"
	line "really cute "
	cont "#MON here!"
	done

Route47HiddenRareCandy: 
	hiddenitem RARE_CANDY, EVENT_ROUTE_47_RARE_CANDY

/*
Route47SignText:
	text "ROUTE 47"
	line "MOUNTAIN RD. AHEAD"
	done */

; encounters for kanto starters (added)
; encounters work unlike cianwood cave...
; FOR SOME REASON MEW SPAWNED AFTER GYM 7, NOT INTENDED. for some reason when left and re-entered it disappeared, then re-appeared after coming back again, seems to go back and forth...
; might have NPC block ledge instead....


Route47_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 53, 7, CIANWOOD_CAVE, 2
	warp_event 7, 7, LEGENDS_CAVE, 1

	def_coord_events

	def_bg_events
	bg_event  32, 8, BGEVENT_ITEM, Route47HiddenRareCandy
	;bg_event  53, 7, BGEVENT_READ, Route47Sign

	;mew spawn at 4,4 when checking EVENT_OPENED_MT_SILVER, SPRITE_MONSTER
	; add two trainers, Cool Trainer M Steve, Beauty Brenda

	def_object_events
	;object_event  52, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47Psychic, EVENT_ROUTE_47_PSYCHIC ; add to cianwood cave?
	;object_event  32, 8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route47RareCandy, EVENT_ROUTE_47_RARE_CANDY ; might make hidden
	;object_event  6, 6, SPRITE_MONSTER, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route47MewScript, EVENT_TEMP   ; temp event seems to have fixed them popping up right, but not right sprite. may have to add to legends cave...
	object_event  45,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, CooltrainerSteve, -1 ; new trainer unused, try different sprites see what shows up right here, cause so far showing protag sprite
	object_event  15, 9, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, BeautyBrenda, -1 ; new trainer


; issues to fix : not loading correct sprites for objects, even when entering normally


