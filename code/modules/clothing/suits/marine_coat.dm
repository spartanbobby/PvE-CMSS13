/obj/item/clothing/suit/storage/jacket/marine //BASE ITEM
	name = "marine jacket"
	//This really should not be spawned
	desc = "What the hell is this doing here?"
	icon = 'icons/obj/items/clothing/cm_suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_1.dmi'
	)
	sprite_sheets = list(SPECIES_MONKEY = 'icons/mob/humans/species/monkeys/onmob/suit_monkey_1.dmi')
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_ARMS
	flags_cold_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS|BODY_FLAG_LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROT
	armor_melee = CLOTHING_ARMOR_VERYLOW
	armor_bullet = CLOTHING_ARMOR_VERYLOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_LOW //marginally better against shrapnel.
	armor_bio = CLOTHING_ARMOR_NONE
	armor_rad = CLOTHING_ARMOR_NONE
	armor_internaldamage = CLOTHING_ARMOR_NONE
	allowed = list(
		/obj/item/weapon/gun/,
		/obj/item/storage/fancy/cigarettes,
		/obj/item/tool/lighter,
		/obj/item/weapon/baton,
		/obj/item/restraint/handcuffs,
		/obj/item/device/binoculars,
		/obj/item/attachable/bayonet,
		/obj/item/storage/belt/gun/m4a3,
		/obj/item/storage/belt/gun/m44,
		/obj/item/storage/belt/gun/mateba,
		/obj/item/storage/belt/gun/smartpistol,
		/obj/item/storage/belt/gun/type47,
		/obj/item/device/flashlight,
		/obj/item/device/healthanalyzer,
		/obj/item/device/radio,
		/obj/item/tank/emergency_oxygen,
		/obj/item/tool/crowbar,
		/obj/item/tool/pen,
		/obj/item/storage/large_holster/machete,
	)
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_MEDAL)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK)

	//Buttons
	var/has_buttons = FALSE
	var/buttoned = TRUE
	var/initial_icon_state

/obj/item/clothing/suit/storage/jacket/marine/proc/toggle()
	set name = "Toggle Buttons"
	set category = "Object"
	set src in usr

	if(usr.is_mob_incapacitated())
		return 0

	if(src.buttoned == TRUE)
		src.icon_state = "[initial_icon_state]_o"
		src.buttoned = FALSE
		to_chat(usr, SPAN_INFO("You unbutton \the [src]."))
	else
		src.icon_state = "[initial_icon_state]"
		src.buttoned = TRUE
		to_chat(usr, SPAN_INFO("You button \the [src]."))
	update_clothing_icon()

/obj/item/clothing/suit/storage/jacket/marine/Initialize()
	. = ..()
	if(!(flags_atom & NO_SNOW_TYPE))
		select_gamemode_skin(type)
		initial_icon_state = icon_state
	if(has_buttons)
		verbs += /obj/item/clothing/suit/storage/jacket/marine/proc/toggle

//Marine service & tanker jacket + MP themed variants
/obj/item/clothing/suit/storage/jacket/marine/service
	name = "marine service jacket"
	desc = "A USCMC service jacket, usually officer issue. While technically armored to frag/handgun ammunition, it's best if you don't try your luck."
	has_buttons = TRUE
	icon_state = "coat_officer"

/obj/item/clothing/suit/storage/jacket/marine/pilot
	name = "\improper M70B1 light flak jacket"
	desc = "M70 variant that reduces bulk and protective for ergonomics. Consider this to have the same amount of protection from flak as an officer's service jacket."
	icon_state = "pilot_alt"
	has_buttons = TRUE
	flags_atom = NO_SNOW_TYPE
	initial_icon_state = "pilot_alt"

/obj/item/clothing/suit/storage/jacket/marine/RO
	name = "quartermaster jacket"
	desc = "A green jacket worn by USCM personnel. The back has the flag of the United Americas on it."
	icon_state = "RO_jacket"
	icon = 'icons/obj/items/clothing/suits.dmi'
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_0.dmi'
	)
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/jacket/marine/service/mp
	name = "military police service jacket"
	desc = "Marine service jacket in USCMC Military Police scheme. Usually not used due to local standards requiring service armor instead."
	has_buttons = TRUE
	icon_state = "coat_mp"
	flags_atom = NO_SNOW_TYPE
	initial_icon_state = "coat_mp"

/obj/item/clothing/suit/storage/jacket/marine/service/warden
	name = "military warden service jacket"
	desc = "A marine service jacket adopted for use by Military Wardens on board USCM ships. Ironically most ships require their MP departments to use full armor, making these barely used by on duty Wardens. The jacket of choice for looking all night at a set of monitors, while cigarette butts pile around you."
	has_buttons = TRUE
	icon_state = "coat_warden"
	flags_atom = NO_SNOW_TYPE
	initial_icon_state = "coat_warden"

/obj/item/clothing/suit/storage/jacket/marine/service/cmp
	name = "chief military police service jacket"
	desc = "A marine service jacket adopted for use by Military Police personnel on board USCM ships. Ironically most ships require their MP departments to use full armor, making these barely used by on duty MPs. Very popular among those who want to inexplicably smell like donuts."
	has_buttons = TRUE
	icon_state = "coat_cmp"
	flags_atom = NO_SNOW_TYPE
	initial_icon_state = "coat_cmp"

/obj/item/clothing/suit/storage/jacket/marine/service/tanker
	name = "tanker jacket"
	desc = "A comfortable jacket provided to anyone expected to operate near or inside heavy machinery. Special material within the arms jams up any machinery it gets caught up in, protecting the wearer from injury."
	has_buttons = TRUE
	flags_atom = NO_SNOW_TYPE
	icon_state = "jacket_tanker"
	initial_icon_state = "jacket_tanker"

/obj/item/clothing/suit/storage/jacket/marine/chef
	name = "mess technician jacket"
	desc = "Smells like vanilla. Signifies prestige and power, if a little flashy."
	icon_state = "chef_jacket"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/jacket/marine/dress
	name = "marine formal service jacket"
	desc = "Smells like vanilla. Signifies prestige and power, if a little flashy."
	icon_state = "coat_formal"
	initial_icon_state = "coat_formal"
	armor_melee = CLOTHING_ARMOR_LOW
	armor_bullet = CLOTHING_ARMOR_LOW
	armor_laser = CLOTHING_ARMOR_NONE
	armor_energy = CLOTHING_ARMOR_NONE
	armor_bomb = CLOTHING_ARMOR_NONE
	armor_bio = CLOTHING_ARMOR_LOW
	armor_rad = CLOTHING_ARMOR_LOW
	armor_internaldamage = CLOTHING_ARMOR_LOW
	flags_atom = NO_SNOW_TYPE
	has_buttons = TRUE

/obj/item/clothing/suit/storage/jacket/marine/dress/officer
	name = "marine officer dress jacket"
	desc = "Dress Jacket worn by Commanding Officers of the USCM."
	icon_state = "co_jacket"
	has_buttons = FALSE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_DECOR, ACCESSORY_SLOT_MEDAL)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMBAND)

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/bomber
	name = "commanding officer bomber jacket"
	desc = "A bomber jacket resembling those worn by airmen of old. A classic, stylish choice for those in the higher ranks."
	has_buttons = TRUE
	icon_state = "co_bomber"
	initial_icon_state = "co_bomber"

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/white
	name = "commanding officer white dress jacket"
	desc = "A white dress tunic for hot-weather parades. Bright, unstained, and immaculate with gold accents."
	icon_state = "co_formal_white"

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/black
	name = "commanding officer gray dress jacket"
	desc = "A gray dress tunic for those occasions that mandate darker, more subdued colors. Combines sleek and subdued with gold accents."
	icon_state = "co_formal_black"

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/suit
	name = "commanding officer dress blue coat"
	desc = "A Navy regulation dress blues coat for high-ranking officers. For those who wish for style and authority."
	icon_state = "co_suit"

/obj/item/clothing/suit/storage/jacket/marine/dress/officer/falcon
	name = "commanding officer falcon jacket"
	desc = "A refurbished jacket liner tailor made for a senior officer. This liner has become more of a proper piece of attire, with a new layer of fabric, wrist cuffs, front pockets, and a custom embroidered falcon on the back. This jacket will keep its wearer warm no matter the circumstance, from a cool Sunday drive to chilly autumn's eve."
	icon_state = "co_falcon"

/obj/item/clothing/suit/storage/jacket/marine/dress/general
	name = "general's jacket"
	desc = "A black trench coat with gold metallic trim. Flashy, highly protective, and over-the-top. Fit for a king - or, in this case, a General. Has quite a few pockets."
	icon = 'icons/obj/items/clothing/suits.dmi'
	icon_state = "general_jacket"
	item_icons = list(
		WEAR_JACKET = 'icons/mob/humans/onmob/suit_0.dmi'
	)
	item_state = "general_jacket"
	has_buttons = FALSE
	storage_slots = 4
	armor_melee = CLOTHING_ARMOR_HIGHPLUS
	armor_bullet = CLOTHING_ARMOR_HIGHPLUS
	armor_bomb = CLOTHING_ARMOR_VERYHIGH
	flags_armor_protection = BODY_FLAG_CHEST|BODY_FLAG_GROIN|BODY_FLAG_ARMS
	w_class = SIZE_MEDIUM

/obj/item/clothing/suit/storage/jacket/marine/dress/general/executive
	name = "director's jacket"
	desc = "A black trench coat with gold metallic trim. Flashy, highly protective, and over-the-top. Fit for a king - or, in this case, a Director. Has quite a few pockets."
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/dress/bridge_coat
	name = "bridge coat"
	desc = "A heavy synthetic woolen coat issued to USCM Officers. Based on a classical design this coat is quite nice on cold nights in the Air conditioned CIC or a miserable cold night on a barren world. This one is a Dressy Blue for a Commanding officer."
	has_buttons = FALSE
	item_state = "bridge_coat"
	icon_state = "bridge_coat"
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/jacket/marine/dress/bridge_coat_grey
	name = "bridge coat"
	desc = "A heavy synthetic woolen coat issued to USCM Officers. Based on a classical design this coat is quite nice on cold nights in the Air conditioned CIC or a miserable cold night on a barren world. This one is Black."
	has_buttons = FALSE
	item_state = "bridge_coat_grey"
	icon_state = "bridge_coat_grey"
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_MEDAL)

/obj/item/clothing/suit/storage/jacket/marine/service/aso
	name = "auxiliary support officer jacket"
	desc = "A comfortable vest for officers who are expected to work long hours staring at rows of numbers and inspecting equipment from knives to torpedos to entire dropships."
	icon_state = "aso_jacket"
	blood_overlay_type = "coat"
	flags_armor_protection = BODY_FLAG_CHEST
	has_buttons = FALSE


//=========================//PROVOST\\================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/jacket/marine/provost
	name = "\improper Provost Jacket"
	desc = "A crisp jacket with the Provost sigil."
	icon_state = "provost_jacket"
	flags_atom = NO_SNOW_TYPE|NO_NAME_OVERRIDE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMBAND, ACCESSORY_SLOT_RANK, ACCESSORY_SLOT_DECOR)

/obj/item/clothing/suit/storage/jacket/marine/provost/chief
	name = "\improper Provost Command Jacket"
	desc = "A crisp jacket with the Provost sigil."
	icon_state = "provostci_jacket"

/obj/item/clothing/suit/storage/jacket/marine/provost/coat
	name = "\improper Provost Coat"
	desc = "The crisp coat of a Provost Officer."
	icon_state = "provost_coat"

/obj/item/clothing/suit/storage/jacket/marine/provost/coat/marshal
	name = "\improper Provost Marshal Coat"
	icon_state = "provost_coat_marshal"


//=========================//DRESS BLUES\\================================\\
//=======================================================================\\

/obj/item/clothing/suit/storage/jacket/marine/dress/blues
	name = "marine enlisted dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. You're wearing history, Marine. Don't let your ancestors down."
	icon = 'icons/mob/humans/onmob/contained/marinedressblues.dmi'
	icon_state = "e_jacket"
	item_state = "e_jacket"
	has_buttons = FALSE
	item_state_slots = null
	contained_sprite = TRUE

/obj/item/clothing/suit/storage/jacket/marine/dress/blues/nco
	name = "marine NCO dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. Features the adornments of a decorated non-commissioned officer. Heritage, embodied."
	icon_state = "nco_jacket"
	item_state = "nco_jacket"

/obj/item/clothing/suit/storage/jacket/marine/dress/blues/officer
	name = "marine officer dress blues jacket"
	desc = "The jacket of the legendary Marine dress blues, virtually unchanged since the 19th century. Features the sleek dark design of the uniform worn by a commissioned officer."
	icon_state = "o_jacket"
	item_state = "o_jacket"

//==================Combat Correspondent==================\\

/obj/item/clothing/suit/storage/jacket/marine/reporter
	name = "combat correspondent jacket"
	desc = "A jacket for the most fashionable war correspondents."
	icon_state = "cc_brown"
	item_state = "cc_brown"
	flags_atom = NO_SNOW_TYPE
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/reporter/green
	icon_state = "cc_green"
	item_state = "cc_green"


/obj/item/clothing/suit/storage/jacket/marine/reporter/black
	icon_state = "cc_black"
	item_state = "cc_black"

/obj/item/clothing/suit/storage/jacket/marine/reporter/blue
	icon_state = "cc_blue"
	item_state = "cc_blue"


//==================Corporate Liaison==================\\

/obj/item/clothing/suit/storage/jacket/marine/vest
	name = "brown vest"
	desc = "A casual brown vest."
	icon_state = "vest_brown"
	item_state = "vest_brown"
	flags_atom = NO_SNOW_TYPE
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/vest/tan
	name = "tan vest"
	desc = "A casual tan vest."
	icon_state = "vest_tan"
	item_state = "vest_tan"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/vest/grey
	name = "grey vest"
	desc = "A casual grey vest."
	icon_state = "vest_grey"
	item_state = "vest_grey"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate
	name = "khaki suit jacket"
	desc = "A khaki suit jacket."
	icon_state = "corporate_ivy"
	item_state = "corporate_ivy"
	flags_atom = NO_SNOW_TYPE
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate/formal
	name = "formal suit jacket"
	desc = "An ivory suit jacket; a Weyland-Yutani corporate badge is attached to the right lapel."
	icon_state = "corporate_formal"
	item_state = "corporate_formal"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate/black
	name = "black suit jacket"
	desc = "A black suit jacket."
	icon_state = "corporate_black"
	item_state = "corporate_black"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate/brown
	name = "brown suit jacket"
	desc = "A brown suit jacket."
	icon_state = "corporate_brown"
	item_state = "corporate_brown"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate/blue
	name = "blue suit jacket"
	desc = "A blue suit jacket."
	icon_state = "corporate_blue"
	item_state = "corporate_blue"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/corporate/grey
	name = "grey suit jacket"
	desc = "A grey suit jacket."
	icon_state = "corporate_grey"
	item_state = "corporate_grey"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/bomber
	name = "khaki bomber jacket"
	desc = "A khaki bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_khaki"
	item_state = "jacket_khaki"
	flags_atom = NO_SNOW_TYPE
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/bomber/red
	name = "red bomber jacket"
	desc = "A reddish-brown bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_red"
	item_state = "jacket_red"
	has_buttons = FALSE

/obj/item/clothing/suit/storage/jacket/marine/bomber/grey
	name = "grey bomber jacket"
	desc = "A blue-grey bomber jacket popular among stationeers and blue-collar workers everywhere."
	icon_state = "jacket_grey"
	item_state = "jacket_grey"
	has_buttons = FALSE

//==================UPP==================\\

/obj/item/clothing/suit/storage/jacket/marine/upp
	name = "\improper UPP service uniform jacket"
	desc = "A UPP service uniform jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality."
	icon_state = "upp_coat_service"
	flags_atom = NO_SNOW_TYPE

/obj/item/clothing/suit/storage/jacket/marine/upp/mss
	name = "\improper MSS uniform jacket"
	desc = "A Ministry of Space Security service jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality."
	icon_state = "upp_coat_mss"

/obj/item/clothing/suit/storage/jacket/marine/upp/coldweather
	name = "\improper UL2 coldweather service jacket"
	desc = "A standard issue coldweather UPP military service jacket featuring small dispersed para-aramid inserts providing the barest of defensive functionality, and a Personal Light Unit rig."
	icon_state = "upp_coat_officer"
