
/area/lv295
	icon_state = "lv-626"
	can_build_special = TRUE
	powernet_name = "ground"
	minimap_color = MINIMAP_AREA_COLONY

//parent types

/area/lv295/indoors
	name = "Johnsons Jackpot - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_METAL
	soundscape_playlist = SCAPE_PL_LV522_INDOORS
	ambience_exterior = AMBIENCE_BIGRED
	soundscape_playlist = SCAPE_PL_THUNDER
	soundscape_interval = 50



/area/lv295/outdoors
	name = "Johnsons Jackpot - Outdoors"
	icon_state = "cliff_blocked" //because this is a PARENT TYPE and you should not be using it and should also be changing the icon!!!
	ceiling = CEILING_NONE
	soundscape_playlist = SCAPE_PL_LV522_OUTDOORS
	ambience_exterior = AMBIENCE_BIGRED
	soundscape_playlist = SCAPE_PL_THUNDER
	soundscape_interval = 50

/area/lv295/oob
	name = "LV295 - Out Of Bounds"
	icon_state = "unknown"
	ceiling = CEILING_MAX
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

/area/lv295/station
	name = "LV295 - Orbital Station"
	icon_state = "blue"
	ceiling = CEILING_DEEP_UNDERGROUND_METAL

//
