/datum/storyevent/roleset/borer
	id = "borer"
	name = "cortical borers"
	role_id = ROLE_BORER
	weight = 0.4


	base_quantity = 2
	scaling_threshold = 15

/datum/storyevent/roleset/blitz
	id = "blitz"
	name = "blitzshell infiltration"
	role_id = ROLE_BLITZ
	weight = 0.6
	tags = list(TAG_COMBAT)

	req_crew = 10
	req_sec = 2

	base_quantity = 1
	scaling_threshold = 15


/datum/storyevent/roleset/contractor
	id = "contractor"
	name = "contractor"
	role_id = ROLE_CONTRACTOR
	weight = 1.2
	scaling_threshold = 10


/*
	Inquisitor
*/
/datum/storyevent/roleset/inquisitor
	id = "inquisitor"
	name = "inquisitor"
	role_id = ROLE_INQUISITOR
	weight = 0.15
	event_pools = list(EVENT_LEVEL_ROLESET = -30) //This is an antitag, it has a negative cost to allow more antags to exist


//Weighting is based on the total number of active antags and disciples.
//Antags who are also disciples get counted twice, this is intentional
/datum/storyevent/roleset/inquisitor/get_special_weight(var/new_weight)
	var/c_count = 0
	for(var/mob/M in disciples)
		if(M.client &&  M.stat != DEAD && ishuman(M))
			c_count++

	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(A.owner && A.is_active() && !A.is_dead())
			a_count++

	if (!a_count && !c_count)
		return 0 //Can't spawn without at least one antag and one disciple

	return new_weight * max(a_count+c_count, 1)


//Requires at least one antag to serve as a target
//Also requires the candidate to have a cruciform, that is handled seperately in antagonist/station/inquisitor.dm
/datum/storyevent/roleset/inquisitor/can_trigger(var/severity, var/report)


	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(A.owner && A.is_active() && !A.is_dead())
			a_count++
			break

	if (!a_count)
		if (report) to_chat(report, SPAN_NOTICE("Failure: No antags which can serve as target"))
		return FALSE //Can't spawn without at least one antag


	return ..()





/*
/datum/storyevent/roleset/malf
	id = "malf"
	name = "malfunctioning AI"
	role_id = ROLE_MALFUNCTION
	req_crew = 20
	occurrences_max = 1
	tags = list(TAG_DESTRUCTIVE, TAG_NEGATIVE)
*/
// // // BEGIN ECLIPSE EDITS // // //
//Copypaste from Hivemind code.
/datum/storyevent/roleset/malf/can_trigger()
	var/crew = 0
	var/engis = 0
	var/sec = 0
	var/command = 0

	//Let's get a list of active players first, and run through that.
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind && M.stat != DEAD && (ishuman(M) || isrobot(M) || isAI(M)))
			var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
			if(job)
				crew++
				if(job in list(JOBS_ENGINEERING))		//Engi?
					engis++
				if(job in list(JOBS_SECURITY))		//Sec?
					sec++
				if(job in list(JOBS_COMMAND))		//Head of staff?
					command++
	if(crew < 15)			//Because one's not enough, and two's too few.
		return FALSE
	else if(crew >= 15 && crew < 21)		//Debatable...
		if(!sec || !command || !engis)
			return FALSE		//Without someone who can actually deal with the threat, it's too difficult for the crew.

	//We have enough to be able to start, so we'll call the other stuff.
	return ..()

// // // END ECLIPSE EDITS // // //


/datum/storyevent/roleset/marshal
	id = "marshal"
	name = "marshal"
	role_id = ROLE_MARSHAL
	weight = 0.2
	req_crew = 10
	event_pools = list(EVENT_LEVEL_ROLESET = -30) //This is an antitag, it has a negative cost to allow more antags to exist

/datum/storyevent/roleset/marshal/can_trigger(var/severity, var/report)
	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(!A.is_dead())
			a_count++
			break

	if (a_count == 0)
		if (report) to_chat(report, SPAN_NOTICE("Failure: No antags which can serve as target"))
		return FALSE //Can't spawn without at least one antag

	return ..()

/datum/storyevent/roleset/marshal/get_special_weight(var/new_weight)
	var/a_count = 0
	for(var/datum/antagonist/A in GLOB.current_antags)
		if(A.owner && A.is_active() && !A.is_dead())
			a_count++

	if (a_count == 0)
		return 0 //Can't spawn without at least one antag

	return new_weight * max(a_count, 1)


/datum/storyevent/roleset/carrion
	id = "carrion"
	name = "carrion"
	role_id = ROLE_CARRION

	base_quantity = 2
	scaling_threshold = 15
