/datum/job/cmo
	title = "Lazarus Biolab Officer"
	flag = CMO
	head_position = 1
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL | COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Lazarus Expedition Overseer and the Lazarus Foundation"
	selection_color = "#94a87f"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	wl_config_heads = TRUE		//Eclipse edit.

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce, access_moebius_consoles,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_change_medbay
	)

	ideal_character_age = 50

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/reports)

	description = "You are the head of the Medical Bay on the NEV Northern Light and provide medical services to the crew.<br>\
You are here to keep everyone alive and ideally, at work. You should make choices that preserve life as much as possible.<br>\

The handling of the medbay is your domain, although remember that both medical and science are branches of Lazarus Foundation, so your colleagues have free access to your resources, and vice versa. And remember, you still answer to the expedition overseer."

	duties = "Organise the doctors under your command to help save lives. Assign patients, and check on their progress periodically<br>\
Dispatch your paramedics to distress calls, and corpse recoveries as needed<br>\
Use department funds to purchase medical supplies and equipment as needed<br>\
Advise the captain on medical issues that concern the crew<br>\
Advise the crew on ethical issues<br>\
In times of crisis, lock down the medbay to protect those within, from outside threats."

	loyalties = "As a doctor, your first loyalty is to your conscience. You swore an oath to save lives and do no harm. It falls on you to be the ethical and moral core of the crew. You should speak up for prisoners, captured lifeforms, and test subjects. Nobody else will.<br>\

Your second loyalty is to your career with Lazarus, and to your coworkers in both Medical and Research. Help out your scientific colleagues, and aid in their pursuit of knowledge."

/obj/landmark/join/start/cmo
	name = "Lazarus Biolab Officer"
	icon_state = "player-green-officer"
	join_tag = /datum/job/cmo


/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 5
	spawn_positions = 5
	supervisors = "Lazarus Biolab Officer"
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	alt_titles = list("Surgeon", "Nurse", "Medical Intern")
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

	access = list(
		access_moebius, access_medical_equip, access_maint_tunnels, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)

	description = "You are a highly educated professional doctor, working a placement aboard the NEV Northern Light to treat the injured.<br>\
	Your tasks will primarily keep you inside medbay, the place needs to have a doctor onsite at all times to treat incoming wounded. As a general rule, you should not leave medbay if you're the only one in it, make sure someone is covering for you if you go elsewhere.<br>\
	As a doctor, a broad range of medical procedures fall under your potential purview. You are not expected to be able to perform all of these yourself, being a specialist is fine. <br>\
	<br>\
	-Diagnostics: Figuring out what's wrong and how to fix it as quickly as possible. <br>\
	-General Treatment: Administering bandages, medicine, casts and placing people in a cryocell as necessary<br>\
	-Surgery: Opening the body under general anaesthetic to treat broken bones, organ damage and internal bleeding<br>\
	-Virology: The study and manipulation of viruses<br>\
	<br>\
Divide responsibilities among your colleagues to ensure each patient gets the treatment they need<br>\
You also have full access to chemistry, and can utilize  it if medical is short staffed. But if there is a dedicated chemist on staff, they take priority and the lab belongs to them<br>\
<br>\
Character Expectations:<br>\
You are a real doctor, and as such you are expected to hold a lot of qualifications. You've most likely completed many years of medical study, and hold a PHD in one or more medical fields.<br>\
You are expected to be knowledgeable and competent in at least basic treatment, you may have a specialty though."


	loyalties = "As a doctor, your first loyalty is to your conscience. You swore an oath to save lives and do no harm. It falls on you to be the ethical and moral core of the crew. You should speak up for prisoners, captured lifeforms, and test subjects. Nobody else will.<br>\

Your second loyalty is to your career with Lazarus, and to your coworkers in both Medical and Research. Help out your scientific colleagues, and aid in their pursuit of knowledge."

/obj/landmark/join/start/doctor
	name = "Medical Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor



/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Lazarus Biolab Officer"
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist

	access = list(
		access_moebius, access_medical_equip, access_maint_tunnels, access_morgue, access_surgery, access_chemistry, access_virology, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_COG = 10,
		STAT_MEC = 10,
		STAT_BIO = 30
	)

	perks = list(/datum/perk/selfmedicated/chemist)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "The chemist is a man of medicine, as much as of science. You mix up colorful liquids to make other, equally colorful, but more useful liquids.<br>\
	<br>\
	Your primary responsibility is working as a pharmacist. Prepare medicines for use by the medical staff, so that they can capably treat a broad variety of conditions. It's good to keep a stock of bicaridine, dexalin, peridaxon, and alkysine.<br>\
	<br>\
	Your secondary responsibility is as a chemical manufacturer for Lazarus generally. You may be requested to make non-medical chemicals for your colleagues in science, or even for other medical staff. Anyone within moebius should be freely and quickly provided with anything they request. Don't question why, it's above your paygrade.<br>\
	<br>\
	Your third duty is to run a chemical sales outlet. You may get requests from other crewmembers to make acid, chemical grenades, smoke, cleaning products, napalm, or perhaps even just to make medicines. You are fully licensed to sell any and all chemicals to those outside moebius. Sell being the operative word here. If someone isn't an employee of Moebius corp, charge them for their chemicals.<br>\
	<br>\
	Its worth noting that you don't always have everything you need on hand. Some recipes will require external ingredients. Bicaridine, most notably, requires the roach toxin blattedin, so you should gather up roach corpses to hack apart for their chemicals. Pay assistants to do this if necessary"

	duties = "		Mix medicines for doctors<br>\
		Fill chemical requests for Lazarus staff<br>\
		Sell chemicals and chem grenades to outsiders"

	loyalties = "Your loyalty is to your career with Lazarus Foundation, and to your coworkers in both branches of Lazarus. Help out your scientific colleagues, and aid in their pursuit of knowledge."


/obj/landmark/join/start/chemist
	name = "Pharmacist"
	icon_state = "player-green"
	join_tag = /datum/job/chemist


/datum/job/psychiatrist
	title = "Psychiatrist"
	flag = PSYCHIATRIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	wage = WAGE_PROFESSIONAL
	supervisors = "the Lazarus Biolab Officer"
	selection_color = "#a8b69a"
	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 15,
		STAT_VIG = 15
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)


/obj/landmark/join/start/psychiatrist
	name = "Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist


/datum/job/paramedic
	title = "Paramedic"
	flag = PARAMEDIC
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Lazarus Biolab Officer"
	selection_color = "#a8b69a"
	wage = WAGE_LABOUR_HAZARD
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_paramedic,
		access_eva, access_maint_tunnels, access_external_airlocks, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "You are a Lazarus Paramedic, The hero of the hour! While doctors largely spend their time cloistered away in medbay, your job is to be out there on the frontlines. You work in the field, sometimes treating people on the spot, sometimes bringing them back to medical for specialist treatment. <br>\
	You have significant medical training, but typically you are not a doctor, and will most likely lack a medical degree. The actual doctors have seniority, and you should follow their orders, especially concerning treatment and diagnosis of a patient<br>\
	<br>\
	You need to be ready to run at a moment's notice, and as such you should take careful care of your gear. Pack as many medicines, treatments, rollerbeds and other equipment as you can. Be sure to bring along some kind of heavy tool for breaching sealed areas.<br>\
	<br>\
	When the wounded are inside medbay, you will often act as a porter, transporting patients to and from various specialist treatment rooms. If your labour can save time for a doctor, get to it.<br>\
	<br>\
	Once your duty to the living is dispensed, your secondary duty is to the dead. You are the designated corpse recovery staff, and you will often need to retrieve bodies from where they died, bring them back and store them in the morgue. This gives a reduction in that player's respawn time.<br>\
	<br>\
	This is the most dangerous part of your job, and recovery should only be attempted if you can reasonably do so without endangering yourself. If there are hostile creatures preventing recovery, call Security to deal with them.<br>\
	<br>\
	Character Expectations:<br>\
	Being a paramedic is a physically demanding job, your character must be fit and strong. No fat bodies allowed<br>\
	EVA training is expected, you should be confident in a medical Voidsuit, and optionally in driving an odysseus mech<br>\
	Remember that you should use violence only as a last resort to defend yourself or your patient"

	duties = "	Respond to distress calls, extract wounded people from dangerous situations, stabilize them at the scene, and take them to medbay for farther treatment as necessary<br>\
	Watch the crew monitor for signs of injuries or deaths and respond accordingly.<br>\
	Tour around departments checking up on the health of the crew. Administer first aid on scene as required<br>\
	During quieter times, retrieve the corpses of the dead from around the ship<br>\
	Run errands for the medbay staff, act as their hands outside of the medbay"

	loyalties = "As a medical specialist, your first loyalty is to save lives, you swore an oath to do no harm. When in any dangerous situation, do your best to ensure as many as possible come out of it alive. A martyr complex is not uncommon in paramedics<br>\
	<br>\
	Your second loyalty is to your immediate superior, the Lazarus Biolab Officer. Follow their instructions and policies."

/obj/landmark/join/start/paramedic
	name = "Trauma Team" //Eclipse Edit - Repolacing Paramedic with Trauma Team
	icon_state = "player-green"
	join_tag = /datum/job/paramedic

/datum/job/bioengineer
	title = "Bio-Engineer"
	flag = BIOENGINEER
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Lazarus Biolab Officer"
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)

	outfit_type = /decl/hierarchy/outfit/job/medical/bioengineer

	access = list(
		access_moebius, access_medical_equip, access_maint_tunnels, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics
	)

	stat_modifiers = list(
		STAT_BIO = 35,
		STAT_COG = 20,
		STAT_MEC = 15
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)


	description = "You are a visionary. Your work lies on the bleeding edge of the medical sciences.<br>\
					Primarily, your goal is to perfect the human form via biological enhancement. \
					Your medical expertise compels you to aid your fellow doctors, but only in the direst of circumstances.\
					<br>\
					As a bio-engineer, you have two avenues to explore: genetics and visceral research.<br>\
					<br>\
						-Genetics: Using the Chrysalis Pod and its associated tools to develop new and powerful mutations. <br>\
						-Visceral Research: Creating new organs or upgrading existing ones using the organ fabricator.<br>\
						<br>\
					You have full access to the Lazarus medical facilities, and can utilize them if medical is short staffed. \
					If there are dedicated doctors or chemists on staff, they take priority and their respective work areas belongs to them.<br>\
					<br>\
					Character Expectations:<br>\
					You may be a doctor, but your research comes first.<br>\
					While you have priority in Visceral Research and Genetics, you are expected to provide doctors with organ replacements if necessary."

	loyalties = "As a medical researcher, your first loyalty is to progress. Your placement on the crew of the Northern Light is the result of Lazarus' desire for knowledge and your own morbid curiosity.<br>\
Your second loyalty is to your career with Lazarus, and to your coworkers in both branches of the corporation. Help out your scientific colleagues, and aid in their pursuit of knowledge."

/obj/landmark/join/start/bioengineer
	name = "Lazarus Bio-Engineer"
	icon_state = "player-green"
	join_tag = /datum/job/bioengineer
