; Used by BattleTowerText

BTTrainerClassGenders:
; entries correspond to trainer classes
	table_width 1
	db MALE   ; FALKNER
	db FEMALE ; WHITNEY
	db MALE ; BUGSY fixed to be male
	db MALE   ; MORTY
	db MALE   ; PRYCE
	db FEMALE ; JASMINE
	db MALE   ; CHUCK
	db FEMALE ; CLAIR
	db MALE   ; RIVAL1
	db MALE   ; POKEMON_PROF
	db MALE ; WILL
	db MALE   ; CAL
	db MALE   ; BRUNO
	db FEMALE ; KAREN
	db MALE   ; KOGA
	db MALE   ; CHAMPION
	db MALE   ; BROCK
	db FEMALE ; MISTY
	db MALE   ; LT_SURGE
	db MALE   ; SCIENTIST
	db FEMALE ; ERIKA
	db MALE   ; YOUNGSTER
	db MALE   ; SCHOOLBOY
	db MALE   ; BIRD_KEEPER
	db FEMALE ; LASS
	db FEMALE ; JANINE
	db MALE   ; COOLTRAINERM
	db FEMALE ; COOLTRAINERF
	db FEMALE ; BEAUTY
	db MALE   ; POKEMANIAC
	db MALE   ; GRUNTM
	db MALE   ; GENTLEMAN
	db FEMALE ; SKIER
	db FEMALE ; TEACHER
	db FEMALE ; SABRINA
	db MALE   ; BUG_CATCHER
	db MALE   ; FISHER
	db MALE   ; SWIMMERM
	db FEMALE ; SWIMMERF
	db MALE   ; SAILOR
	db MALE   ; SUPER_NERD
	db MALE   ; RIVAL2
	db MALE   ; GUITARIST
	db MALE   ; HIKER
	db MALE   ; BIKER
	db MALE   ; BLAINE
	db MALE   ; BURGLAR
	db MALE   ; FIREBREATHER
	db MALE   ; JUGGLER
	db MALE   ; BLACKBELT_T
	db MALE   ; EXECUTIVEM
	db MALE   ; PSYCHIC_T
	db FEMALE ; PICNICKER
	db MALE   ; CAMPER
	db FEMALE ; EXECUTIVEF
	db MALE   ; SAGE
	db FEMALE ; MEDIUM
	db MALE   ; BOARDER
	db MALE   ; POKEFANM
	db FEMALE ; KIMONO_GIRL
	db FEMALE ; TWINS
	db FEMALE ; POKEFANF
	db MALE   ; RED
	db MALE   ; BLUE
	db MALE   ; OFFICER
	db FEMALE ; GRUNTF ; 
/*	db MALE       ; mysticalman
	db MALE		; JON
	db MALE		; ALEX
	db FEMALE		; ASH
	db MALE		; CONNOR
	db MALE		; FRANCIS
	db FEMALE		; GENNA
	db FEMALE		; LEX
	db MALE		; NAHOM
	db MALE		; NANDO
	db MALE		; QASIM
	db FEMALE		; QUINN
	db FEMALE		; TJ */
	assert_table_length NUM_TRAINER_CLASSES -13 ; exclude MYSTICALMAN
	; assert_table_length NUM_TRAINER_CLASSES - 1, but set it to -13 unless you end up gendering eusine and new trainers
