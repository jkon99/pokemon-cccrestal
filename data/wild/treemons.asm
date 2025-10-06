TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_None
	dw TreeMonSet_Canyon
	dw TreeMonSet_Town
	dw TreeMonSet_Route
	dw TreeMonSet_Kanto
	dw TreeMonSet_Lake
	dw TreeMonSet_Forest
	dw TreeMonSet_Rock
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_None ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_None:
; no encounter data

TreeMonSet_Canyon:
; common
	db 50, SPEAROW,    13
	db 15, SPEAROW,    13
	db 15, SPEAROW,    13
	db 10, AIPOM,      13
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    13
	db 15, HERACROSS,  13
	db 15, HERACROSS,  15
	db 10, AIPOM,      13
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Town:
; common
	db 50, SPEAROW,    10
	db 15, EKANS,      10
	db 15, SPEAROW,    10
	db 10, AIPOM,      13
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1
; rare
	db 50, SPEAROW,    13
	db 15, HERACROSS,  13
	db 15, HERACROSS,  15
	db 10, AIPOM,      13
	db  5, AIPOM,      15
	db  5, AIPOM,      15
	db -1

TreeMonSet_Route:
; common
	db 50, HOOTHOOT,   13
	db 15, SPINARAK,   13
	db 15, LEDYBA,     13
	db 10, EXEGGCUTE,  13
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1
; rare
	db 50, HOOTHOOT,   13
	db 15, PINECO,     13
	db 15, PINECO,     15
	db 10, EXEGGCUTE,  13
	db  5, EXEGGCUTE,  15
	db  5, EXEGGCUTE,  15
	db -1

TreeMonSet_Kanto:
; common
	db 50, HOOTHOOT,   40
	db 15, EKANS,      40
	db 15, HOOTHOOT,   40
	db 10, EXEGGCUTE,  40
	db  5, EXEGGCUTE,  40
	db  5, EXEGGCUTE,  40
	db -1
; rare
	db 50, HOOTHOOT,   40
	db 15, PINECO,     40
	db 15, PINECO,     40
	db 10, EXEGGCUTE,  40
	db  5, EXEGGCUTE,  40
	db  5, EXEGGCUTE,  40
	db -1

TreeMonSet_Lake:
; common
	db 50, HOOTHOOT,   20
	db 15, VENONAT,    20
	db 15, HOOTHOOT,   20
	db 10, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db -1
; rare
	db 50, HOOTHOOT,   20
	db 15, PINECO,     20
	db 15, PINECO,     20
	db 10, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db  5, EXEGGCUTE,  20
	db -1

TreeMonSet_Forest:
; common
	db 50, HOOTHOOT,   15
	db 15, PINECO,     15
	db 15, PINECO,     15
	db 10, NOCTOWL,    15
	db  5, BUTTERFREE, 15
	db  5, BEEDRILL,   15
	db -1
; rare
	db 50, HOOTHOOT,   15
	db 15, CATERPIE,   15
	db 15, WEEDLE,     15
	db 10, HOOTHOOT,   15
	db  5, METAPOD,    15
	db  5, KAKUNA,     15
	db -1

TreeMonSet_Rock: ; fixed from 90% to 80%
	db 80, KRABBY,     15
	db 20, SHUCKLE,    15
	db -1
