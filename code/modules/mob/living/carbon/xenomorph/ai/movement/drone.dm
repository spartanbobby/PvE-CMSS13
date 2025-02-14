#define BLACKLIST_TURF_TIMEOUT (180 SECONDS)

/datum/xeno_ai_movement/drone
	var/last_home_turf
	var/list/blacklisted_turfs = list()

/datum/xeno_ai_movement/drone/Destroy(force, ...)
	. = ..()
	blacklisted_turfs = null

//drones expand the hive
/datum/xeno_ai_movement/drone/ai_move_idle(delta_time)
	var/mob/living/carbon/xenomorph/idle_xeno = parent

	if(idle_xeno.throwing)
		return

	if(idle_xeno.resting)
		return

	if(home_turf)
		if(get_dist(home_turf, idle_xeno) > max_distance_from_home)
			home_turf = null
			return

		if(get_dist(home_turf, idle_xeno) <= 0)
			var/datum/action/xeno_action/onclick/plant_weeds/plant_weed_action = get_xeno_action_by_type(parent, /datum/action/xeno_action/onclick/plant_weeds)
			INVOKE_ASYNC(plant_weed_action, TYPE_PROC_REF(/datum/action/xeno_action/onclick/plant_weeds, use_ability_wrapper))
			home_turf = null
			return

		if(!idle_xeno.move_to_next_turf(home_turf, home_locate_range))
			home_turf = null
			return

		return

	if(next_home_search > world.time)
		return

	var/turf/current_turf = get_turf(idle_xeno.loc)
	next_home_search = world.time + home_search_delay
	if(!current_turf.weeds && current_turf.is_weedable() >= FULLY_WEEDABLE)
		home_turf = current_turf
	else
		var/shortest_distance
		for(var/turf/potential_home as anything in RANGE_TURFS(home_locate_range, current_turf))

			var/area/found_area = get_area(potential_home)
			if(found_area.flags_area & AREA_NOTUNNEL)
				continue

			if(found_area.flags_area & AREA_UNWEEDABLE)
				continue

			if(!found_area.can_build_special)
				continue

			if(potential_home in blacklisted_turfs)
				continue

			if(potential_home.weeds)
				continue

			if(potential_home.is_weedable() < FULLY_WEEDABLE)
				continue

			if(locate(/obj/effect/alien/weeds/node) in range(3, potential_home))
				continue

			if(potential_home.density)
				continue

			var/blocked = FALSE
			for(var/atom/potential_blocker as anything in potential_home)
				if(potential_blocker.can_block_movement)
					blocked = TRUE
					break

			if(blocked)
				continue

			for(var/obj/structure/struct in potential_home)
				if(struct.density && !(struct.flags_atom & ON_BORDER))
					continue

			if(shortest_distance && get_dist(idle_xeno, potential_home) > shortest_distance)
				continue

			shortest_distance = get_dist(idle_xeno, potential_home)
			home_turf = potential_home

	if(!home_turf)
		if(!idle_xeno.resting)
			idle_xeno.lay_down()
		return

	if(home_turf == last_home_turf)
		blacklisted_turfs += home_turf
		addtimer(CALLBACK(src, PROC_REF(unblacklist_turf), home_turf), BLACKLIST_TURF_TIMEOUT)

	last_home_turf = home_turf

/datum/xeno_ai_movement/drone/proc/unblacklist_turf(turf/unblacklisting_turf)
	blacklisted_turfs -= unblacklisting_turf
