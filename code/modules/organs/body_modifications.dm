var/global/list/body_modifications = list()
var/global/list/modifications_types = list(
	BP_CHEST = "",  "chest2" = "", BP_HEAD = "",   BP_GROIN = "",
	BP_L_ARM  = "", BP_R_ARM  = "", BP_L_HAND = "", BP_R_HAND = "",
	BP_L_LEG  = "", BP_R_LEG  = "", BP_L_FOOT = "", BP_R_FOOT = "",
	OP_HEART  = "", OP_LUNGS  = "", OP_LIVER  = "", OP_EYES   = "",
	BP_BRAIN  = ""
)

/proc/generate_body_modification_lists()
	for(var/mod_type in typesof(/datum/body_modification))
		var/datum/body_modification/BM = new mod_type()
		if(!BM.id)
			continue
		body_modifications[BM.id] = BM
		var/class = ""
		if(BM.allowed_species && BM.allowed_species.len)
			class = " limited [BM.allowed_species.Join(" ")]"
		for(var/part in BM.body_parts)
			modifications_types[part] += "<div style = 'padding:2px' onclick=\"set('body_modification', '[BM.id]');\" class='block[class]'><b>[BM.name]</b><br>[BM.desc]</div>"

/proc/get_default_modificaton(var/nature = MODIFICATION_ORGANIC)
	switch(nature)
		if(MODIFICATION_ORGANIC)
			return body_modifications["nothing"]
		if(MODIFICATION_SILICON)
			return body_modifications["robotize_organ"]
		if(MODIFICATION_REMOVED)
			return body_modifications["amputated"]

/datum/body_modification
	var/name = ""
	var/short_name = ""
	var/id = ""								// For savefile. Must be unique.
	var/desc = ""							// Description.
	var/list/body_parts = list(				// For sorting'n'selection optimization.
		BP_CHEST, "chest2", BP_HEAD, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG,\
		BP_L_FOOT, BP_R_FOOT, OP_HEART, OP_LUNGS, OP_LIVER, BP_BRAIN, OP_EYES)
	var/list/allowed_species = list(SPECIES_HUMAN)// Species restriction.
	var/replace_limb = null					// To draw usual limb or not.
	var/mob_icon = ""
	var/icon/icon = 'icons/mob/human_races/body_modification.dmi'
	var/nature = MODIFICATION_ORGANIC
	var/hascolor = FALSE
	var/allow_nt = TRUE
	var/list/department_specific = ALL_DEPARTMENTS

/datum/body_modification/proc/get_mob_icon(organ, color="#ffffff", gender = MALE, species)	//Use in setup character only
	return new/icon('icons/mob/human.dmi', "blank")

/datum/body_modification/proc/is_allowed(organ = "", datum/preferences/P, mob/living/carbon/human/H)
	if(!organ || !(organ in body_parts))
		//usr << "[name] isn't useable for [organ]"
		return FALSE
	var/parent_organ
	for(var/organ_parent in organ_structure)
		var/list/organ_data = organ_structure[organ_parent]
		if(organ in organ_data["children"])
			parent_organ = organ_parent

	if(parent_organ)
		var/datum/body_modification/parent = P.get_modification(parent_organ)
		if(parent.nature > nature)
			to_chat(usr, "[name] can't be attached to [parent.name]")
			return FALSE

	if(department_specific.len)
		if(H && H.mind)
			var/department = H.mind.assigned_job.department
			if(!department)
				return FALSE
			else if(!department_specific.Find(department))
				to_chat(usr, "This body-mod ([name]) does not match your chosen department.") // Something for help devs see what that incompatible body mod is
				return FALSE
		else if(P)
			var/datum/job/J
			if(ASSISTANT_TITLE in P.job_low)
				J = SSjob.GetJob(ASSISTANT_TITLE)
			else
				J = SSjob.GetJob(P.job_high)
			if(!J || !department_specific.Find(J.department))
				to_chat(usr, "This body-mod ([name]) does not match your highest-priority department.") // Something for help devs see what that incompatible body mod is
				return FALSE

	return TRUE

/datum/body_modification/proc/create_organ(var/mob/living/carbon/holder, var/organ, var/color)
	return null

/datum/body_modification/none
	name = "Unmodified organ"
	id = "nothing"
	short_name = "Nothing"
	desc = "Normal organ."
	allowed_species = null

/datum/body_modification/none/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	if(istype(OD))
		return OD.create_organ(holder,OD)
	else if(ispath(OD))
		return new OD(holder)
	else
		return null


/datum/body_modification/limb/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	if(replace_limb)
		return new replace_limb(holder,OD)
	else
		return new OD.default_type(holder,OD)

/datum/body_modification/limb/amputation
	name = "Removed"
	short_name = "Removed"
	id = "amputated"
	desc = "Organ was removed."
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT)
	replace_limb = 1
	nature = MODIFICATION_REMOVED

/datum/body_modification/limb/amputation/create_organ()
	return null

/datum/body_modification/limb/prosthesis
	name = "Unbranded prosthesis"
	id = "prosthesis_basic"
	desc = "Simple, brutal and reliable prosthesis"
	body_parts = list(BP_HEAD, BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_HAND, BP_R_HAND, \
		BP_L_LEG, BP_R_LEG, BP_L_FOOT, BP_R_FOOT) //
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/unbranded/unbranded_alt1.dmi'
	nature = MODIFICATION_SILICON
	allow_nt = FALSE
	var/prosthetic_model

/datum/body_modification/limb/prosthesis/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	var/obj/item/organ/external/robotic/placeholder
	if(replace_limb)
		placeholder = new replace_limb(holder,OD)
	else
		placeholder = new OD.default_type(holder,OD)

	placeholder.overlays.Cut()
	placeholder.name = organ_tag_to_name[OD.organ_tag]
	placeholder.force_icon = icon
	placeholder.icon = icon
	placeholder.desc = desc
	placeholder.model = prosthetic_model
	placeholder.mob_icon = null
	placeholder.update_icon()
	return placeholder

/datum/body_modification/limb/prosthesis/New()
	/*var/obj/item/organ/external/robotic/R = replace_limb
	name = initial(R.name)
	icon = initial(R.force_icon)
	desc = initial(R.desc)*/
	short_name = "P: [name]"
	name = "Prosthesis: [name]"

/datum/body_modification/limb/prosthesis/get_mob_icon(organ, color, gender, species)
	return new/icon(icon, "[organ][gender == FEMALE ? "_f" : "_m"]")

/datum/body_modification/limb/prosthesis/bishop
	id = "prosthesis_bishop"
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_main.dmi'
	name = "Bishop"
	desc = "Prosthesis with white polymer casing with blue holo-displays."
	prosthetic_model = "bishop"
/datum/body_modification/limb/prosthesis/asters
	id = "prosthesis_asters"
	replace_limb = /obj/item/organ/external/robotic/asters
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN, BP_HEAD)
	icon = 'icons/mob/human_races/cyberlimbs/asters.dmi'

/datum/body_modification/limb/prosthesis/serbian
	id = "prosthesis_serbian"
	replace_limb = /obj/item/organ/external/robotic/serbian
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN, BP_HEAD)
	icon = 'icons/mob/human_races/cyberlimbs/serbian.dmi'
/datum/body_modification/limb/prosthesis/hesphaistos
	id = "prosthesis_hesphaistos"
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_main.dmi'
	name = "Hesphaistos"
	desc = "Prosthesis with militaristic black and green casing with gold stripes."
	prosthetic_model = "hesphaistos"

/datum/body_modification/limb/prosthesis/zenghu
	id = "prosthesis_zenghu"
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/zenghu/zenghu_main.dmi'
	name = "Zeng-Hu"
	desc = "Prosthesis with rubbery fleshtone covering with visible seams."
	prosthetic_model = "zenghu"

/datum/body_modification/limb/prosthesis/xion
	id = "prosthesis_xion"
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/xion/xion_main.dmi'
	name = "Xion"
	desc = "Prosthesis with minimalist black and red casing."
	prosthetic_model = "xion"

/datum/body_modification/limb/prosthesis/moebius
	id = "prosthesis_lazarus"
	replace_limb = /obj/item/organ/external/robotic/moebius
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN, BP_HEAD)
	department_specific = list(DEPARTMENT_MEDICAL, DEPARTMENT_SCIENCE)
	icon = 'icons/mob/human_races/cyberlimbs/moebius.dmi'

/datum/body_modification/limb/prosthesis/makeshift
	id = "prosthesis_makeshift"
	replace_limb = /obj/item/organ/external/robotic/makeshift
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN)
	icon = 'icons/mob/human_races/cyberlimbs/ghetto.dmi'

/datum/body_modification/limb/mutation/New()
	short_name = "M: [name]"
	name = "Mutation: [name]"

////Organ Modules////
/datum/body_modification/limb/organ_module
	replace_limb = null
	allow_nt = FALSE
	var/module_type = null

/datum/body_modification/limb/organ_module/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	var/obj/item/organ/external/E = ..()
	if(module_type)
		var/obj/item/organ_module/OM = new module_type()
		OM.install(E)
	return E

////Internals////
/datum/body_modification/organ/create_organ(var/mob/living/carbon/holder, var/organ, var/color)
	if(replace_limb)
		return new replace_limb(holder)
	else
		return new organ(holder)

/datum/body_modification/organ/none
	name = "Unmodified organ"
	id = "nothing"
	short_name = "Nothing"
	desc = "Normal organ."
	body_parts = list(OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT)

/datum/body_modification/organ/none/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	if(istype(OD))
		return OD.create_organ(holder,OD)
	else if(ispath(OD))
		return new OD(holder)
	else
		return null

/datum/body_modification/organ/assisted
	name = "Assisted organ"
	short_name = "P: assisted"
	id = "assisted"
	desc = "Assisted organ."
	body_parts = list(OP_HEART, OP_LUNGS, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_STOMACH, BP_BRAIN, OP_LIVER, OP_EYES)
	allow_nt = FALSE

/datum/body_modification/organ/assisted/create_organ(var/mob/living/carbon/holder, var/O, var/color)
	var/obj/item/organ/I = ..(holder,O,color)
	I.nature = MODIFICATION_ASSISTED
	I.name = "assisted [I.name]"
	I.min_bruised_damage = 15
	I.min_broken_damage = 35
	if(istype(I, /obj/item/organ/internal/appendix))
		return I
	I.icon_state = "[I.icon_state]_assisted"
	return I


/datum/body_modification/organ/robotize_organ
	name = "Robotic organ"
	short_name = "P: prosthesis"
	id = "robotize_organ"
	desc = "Robotic organ."
	body_parts = list(OP_HEART, OP_LUNGS, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_STOMACH, BP_BRAIN, OP_LIVER, OP_EYES)
	nature = MODIFICATION_SILICON
	allow_nt = FALSE

/datum/body_modification/organ/robotize_organ/create_organ(var/mob/living/carbon/holder, O, color)
	var/obj/item/organ/I = ..(holder,O,color)
	I.nature = MODIFICATION_SILICON
	if(istype(I, /obj/item/organ/internal/appendix))
		return null
	if(istype(I, /obj/item/organ/internal/eyes))
		var/obj/item/organ/internal/eyes/E = I
		E.robo_color = iscolor(color) ? color : "#FFFFFF"
	I.name = "robotic [I.name]"
	I.icon_state = "[I.icon_state]_robotic"
	//else // Pointless , doesn't show up in surgery UI
	//	I.color = "#808080"
	return I

////Eyes////

/datum/body_modification/organ/oneeye
	name = "One eye (left)"
	short_name = "M: One eye (l)"
	id = "missed_eye"
	desc = "One of your eyes was missed."
	body_parts = list(BP_EYES)
	hascolor = TRUE
	replace_limb = /obj/item/organ/internal/eyes/oneeye

/datum/body_modification/organ/oneeye/get_mob_icon(organ, color, gender, species)
	var/datum/species/S = all_species[species]
	var/icon/I = new/icon(S.faceicobase, "eye_l")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/oneeye/create_organ(var/mob/living/carbon/human/holder, var/organ, var/color)
	var/obj/item/organ/internal/eyes/E = ..(holder,organ,color)
	E.eyes_color = color
	return E

/datum/body_modification/organ/oneeye/right
	name = "One eye (right)"
	short_name = "M: One eye (r)"
	id = "missed_eye_right"
	replace_limb = /obj/item/organ/internal/eyes/oneeye/right

/datum/body_modification/organ/oneeye/right/get_mob_icon(organ, color, gender, species)
	var/datum/species/S = all_species[species]
	var/icon/I = new/icon(S.faceicobase, "eye_r")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/heterochromia
	name = "Heterochromia"
	short_name = "M: Heterochromia"
	id = "mutation_heterochromia"
	desc = "Special color for left eye."
	body_parts = list(BP_EYES)
	hascolor = TRUE

/datum/body_modification/organ/heterochromia/get_mob_icon(organ, color, gender, species)
	var/datum/species/S = all_species[species]
	var/icon/I = new/icon(S.faceicobase, "eye_l")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/heterochromia/create_organ(var/mob/living/carbon/holder, organ_type, color)
	var/obj/item/organ/internal/eyes/heterohromia/E = new(holder,organ_type,color)
	E.second_color = color
	return E


// Special heads
/datum/body_modification/limb/prosthesis/tvhead
	name = "Unbranded TV-head"
	id = "tvhead"
	desc = "A knock-off unbranded tv-shaped head."
	body_parts = list(BP_HEAD)
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/unbranded/unbranded_monitor.dmi'
	nature = MODIFICATION_SILICON
	allow_nt = FALSE

// Synth brains

/datum/body_modification/organ/brain/posibrain
	name = "Positronic brain"
	id = "carbonposibrain"
	short_name = "Positronic brain"
	desc = "An artificial mind, typically used in silicon beings. This particular model is designed to be used in humanoid chassis."
	body_parts = list(BP_BRAIN)
	replace_limb = /obj/item/organ/internal/brain/synth
	nature = MODIFICATION_SILICON
	allow_nt = FALSE
