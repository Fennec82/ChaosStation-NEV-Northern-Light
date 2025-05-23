/datum/job/ihc
	title = "Aegis Commander"
	flag = CC
	head_position = 1
	department = DEPARTMENT_SECURITY
	department_flag = IRONHAMMER | COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain"
	selection_color = "#97b0be"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_NEOHONGO = 100)

	outfit_type = /decl/hierarchy/outfit/job/security/ihc

	wl_config_heads = TRUE		//Eclipse edit.
	wl_config_sec = TRUE		//Eclipse edit.

	access = list(
		access_security, access_eva, access_sec_doors, access_brig, access_armory, access_medspec,
		access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
		access_moebius, access_engine, access_mining, access_construction, access_mailsorting,
		access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway,
		access_external_airlocks, access_change_sec, access_moebius_consoles, access_armory_consoles, access_sec_consoles
	)

	stat_modifiers = list(
		STAT_ROB = 40,
		STAT_TGH = 30,
		STAT_VIG = 40,
	)

	perks = list(PERK_SURVIVOR,
				 PERK_CODESPEAK_COP)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

	description = "You are the head of the Aegis Security division contracted to protect and serve aboard the NEV Northern Light. The company contracting you out, Aegis Security serves as both an internal security force, and as a guard for expeditions out with the ship.<br>\
	<br>\
	Your goal is to keep everyone aboard the ship as safe as possible, and to eliminate any threats to safety."

	duties = "		Coordinate operatives in the field, assigning them to threats and distress calls as needed.<br>\
		Allocate department funds for necessary supplies, equipment, armor, weapons, upgrades, etc. Spend your money as required to ensure your troops are at peak combat performance<br>\
		Plan assaults on entrenched threats, ensure each operative knows their roles and carries them out precisely.<br>\
		Oversee performance of the operatives under your command, and punish any that are insubordinate or incompetent<br>\
		Advise the captain on threats to ship security, and counsel him towards choices that will minimise exposure to threats."

	loyalties = "		As Security, your first loyalty is to the safety and security of the ship and to keep the peace, and you are often the primary tool in keeping order on the ship.<br>\
		<br>\
		Your second loyalty is to the prortection and safety of the Command Heirarchy. You're the sword and shield of Command, and one of your utmost duties is to protect Command, oftentimes this and your first loyalty are one and the same.<br>\
		<br>\
		Your third loyalty is to the crew. As the strongest armed force on the ship, any violent actions commited against the ship fall to you to protect against, external or otherwise."

/obj/landmark/join/start/ihc
	name = "Aegis Commander"
	icon_state = "player-blue-officer"
	join_tag = /datum/job/ihc


/datum/job/gunserg
	title = "Aegis Gunnery Sergeant"
	flag = GUNSERG
	department = DEPARTMENT_SECURITY
	department_flag = IRONHAMMER
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Aegis Commander"
	selection_color = "#a7bbc6"
	department_account_access = TRUE
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_NEOHONGO = 100)

	wl_config_sec = TRUE		//Eclipse edit.

	outfit_type = /decl/hierarchy/outfit/job/security/gunserg

	access = list(
		access_security, access_moebius, access_medspec, access_engine, access_mailsorting,
		access_eva, access_sec_doors, access_brig, access_armory, access_maint_tunnels, access_morgue,
		access_external_airlocks, access_moebius_consoles, access_armory_consoles, access_sec_consoles
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 25,
		STAT_VIG = 25,
	)

	perks = list(PERK_SURVIVOR,
				 PERK_CODESPEAK_COP)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the Second-in-Command of the local Aegis Security regiment, and the defacto leader if the commander isn't around. <br>\
	Within Aegis you largely hold a desk job, your duties will rarely take you outside of the Aegis security wing, and you are not expected to interact with civilians. You have enough to deal with as is, and are probably the hardest working member of Aegis.<br>\
	<br>\
	You have several core duties:<br>\
		1. As second in command, any of the commander's duties may be delegated to you, if they decide to do so. This means that at any time, you may be expected to handle funding, paperwork, disciplinary matters, planning combat tactics, or even carrying out executions. If there's no commander, these duties fall naturally to you. If there is a commander on site though, you shouldn't make these kind of decisions without consulting them.<br>\
		<br>\
		2. You serve as the Aegis quartermaster. And as such, it is your job to maintain the armoury, and stocks of other equipment. You should keep track of its contents, and who has what. Make sure weapons and equipment are returned at the end of a shift, and procure new armaments from the Union or from scavengers as necessary to keep supplies up and respond to new threat	s.<br>\
		<br>\
		3. You are the defacto warden, and if there are any prisoners being kept in the Aegis brig, it is your responsibility to ensure they are fed, treated appropriately with regard to their legal rights, and ensure they have access to medical care. If necessary you may need to suppress riots or escape attempts within the brig too.<br>\
		<br>\
		4. In times of peace, prepare for war. To this end, you are also the onsite military instructor. If the ship is in a lull and there are no outstanding threats, you should take the initiative to order training drills. Allow junior operatives to train and learn with less conventional weapons and tactics, give lessons on aiming, trigger discipline, hand to hand combat. Conduct drills on threat response, squad tactics, and EVA manoeuvres.<br>\ "

	loyalties = "You're a military man through and through. As such, your first loyalty is to the Commander, and thusly to the chain of command"

/obj/landmark/join/start/gunserg
	name = "Aegis Gunnery Sergeant"
	icon_state = "player-blue"
	join_tag = /datum/job/gunserg


/datum/job/inspector
	title = "Aegis Inspector"
	flag = INSPECTOR
	department = DEPARTMENT_SECURITY
	department_flag = IRONHAMMER
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Aegis Commander"
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_NEOHONGO = 100)

	wl_config_sec = TRUE		//Eclipse edit.

	outfit_type = /decl/hierarchy/outfit/job/security/inspector

	access = list(access_security, access_moebius, access_medspec, access_engine, access_mailsorting, access_eva, access_sec_doors, access_forensics_lockers, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_moebius_consoles, access_armory_consoles, access_sec_consoles)

	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 25,
	)

	perks = list(PERK_SURVIVOR,
				 PERK_CODESPEAK_COP)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/audio,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the ship's detective, here to take care of the cases that aren't always what they seem, and suspects that aren't always caught red handed or ready to confess.<br>\
	The inspector's job is to interrogate suspects, gather witness statements,  harvest evidence and reach a conclusion about the nature and culprit of a crime.<br>\
	<br>\
	You are a higher ranking Aegis operative, and you can give commands to operatives to aid you in your duties.  But this doesn't mean you should be commanding assaults. You're not any kind of tactical commander<br>\
	<br>\
	When there are no outstanding cases, your job is to go look for them. Mingle with civilians, interact and converse, sniff out leads about potential criminal activity. The Aegis budget can often include stipends to pay informers for any useful info"

	duties = "		Interview suspects and witnesses after a crime. Record important details of their statements, and look for inconsistencies.<br>\
		Gather evidence and bring it back for processing<br>\
		Send out operatives to bring suspects in for questioning<br>\
		Interact with civilians and be on the lookout for criminal activity"

	loyalties = "		As a detective, your loyalty is firstly, to the truth. Seek to uncover the true events of any crime.<br>\
		<br>\
		Secondly, you are loyal to Aegis and to the commander. Follow the chain of command."

/obj/landmark/join/start/inspector
	name = "Aegis Inspector"
	icon_state = "player-blue"
	join_tag = /datum/job/inspector


/datum/job/medspec
	title = "Aegis Medical Specialist"
	flag = MEDSPEC
	department = DEPARTMENT_SECURITY
	department_flag = IRONHAMMER
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Aegis Commander"
	selection_color = "#a7bbc6"
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_NEOHONGO = 100)

	wl_config_sec = TRUE		//Eclipse edit.

	outfit_type = /decl/hierarchy/outfit/job/security/medspec

	access = list(access_security, access_moebius, access_medspec, access_engine, access_mailsorting, access_eva, access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_medical_equip, access_moebius_consoles, access_armory_consoles, access_sec_consoles)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_TGH = 5,
		STAT_VIG = 15,
	)

	perks = list(PERK_SURVIVOR,
				 PERK_CODESPEAK_COP)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "You are a highly trained specialist within Aegis. You were probably a medical student or inexperienced doctor when you joined Aegis, and you thusly have a combination of medical and military training. You are not quite as knowledgeable as a civilian career doctor, not quite as much of a fighter as a dedicated Aegis operative, but strike a balance inbetween. Balance is the nature of your existence.<br>\
	<br>\
	Within Aegis, you have three roles to undertake. All of your roles can be delegated to others when needed - Lazarus Medical for roles 1 and 2, the Aegis Inspector for role 3. But you are often the best positioned to carry out these tasks, especially when time is short<br>\
	<br>\
	1. Field Medic. <br>\
	You may be expected to serve on the backlines in a combat situation, treating and stabilising the wounded, making the call as to whether they can return to combat or leave by medivac. You may need to perform emergency trauma surgery in undesireable conditions. <br>\
	You are allowed to be armed, but remember that saving lives, not taking them, is your first duty. Don't be afraid to send patients to Lazarus medical for proper specialist care.<br>\
	<br>\
	2. Prison Doctor.<br>\
	During quiet times, when inmates are serving in the brig, you will often be required to treat prisoners, criminal suspects, and the condemned. Suicide attempts are common in prison, and you will often be treating a patient against their will, who is attempting to escape. When serving in this role, stay on guard, work closely with the gunnery sergeant, and keep control of the situation<br>\
	<br>\
	3. Forensic Specialist.<br>\
	Solving crimes often requires scientific analysis, and expert rulings from a trusted source within Aegis. You will often be expected to analyze blood, chemicals and fingerprints, conduct autopsies, and submit your findings to help track down elusive culprits. In this task, you will work closely with the inspector, and if necessary, he often has the talents to perform these tasks. But his time is better spent questioning and interrogating people"

/obj/landmark/join/start/medspec
	name = "Aegis Medical Specialist"
	icon_state = "player-blue"
	join_tag = /datum/job/medspec


/datum/job/ihoper
	title = "Aegis Operative"
	flag = IHOPER
	department = DEPARTMENT_SECURITY
	department_flag = IRONHAMMER
	faction = "NEV Northern Light"
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Aegis Commander"
	alt_titles = list("Aegis Cadet")
	selection_color = "#a7bbc6"
	wage = WAGE_LABOUR_HAZARD
	also_known_languages = list(LANGUAGE_NEOHONGO = 100)

	wl_config_sec = TRUE		//Eclipse edit.

	outfit_type = /decl/hierarchy/outfit/job/security/ihoper

	access = list(
		access_security, access_moebius, access_engine, access_mailsorting,access_eva,
		access_sec_doors, access_brig, access_maint_tunnels, access_morgue, access_external_airlocks, access_moebius_consoles, access_armory_consoles, access_sec_consoles
	)

	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 20,
		STAT_VIG = 25,
	)

	perks = list(PERK_SURVIVOR,
				 PERK_CODESPEAK_COP)

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

	description = "You are the boots on the ground, the rifle in the window, the long arm of the law. You are the hand of Aegis, and the frontline against criminals, terrorists, and hostile lifeforms.<br>\
	<br>\
	You are a professional soldier and a hardened mercenary, no stranger to violence. You are required to employ your talents in order to bring an end to threats and conflict situations. As a consummate professional, you're often expected to put your pride aside, and work with others. Tactics and teamwork are vital.<br>\
	<br>\
	You are paid to act, not to think. When in doubt, follow orders, and leave the hard choices to someone else. Trust in your chain of command. Remember that you are the lowest rank in Aegis, and you report to everyone else in your organisation. The Inspector, Medspec, gunnery sergeant and Commander, are all your superior officers, their orders should be obeyed.<br>\
	<br>\
	When there are no standing orders, your ongoing task is to patrol the ship and be on the lookout for threats. Check in at departments, ask if there are any concerns, break up fights and do your best to prevent trouble before it spirals out of control. Wipe out roaches and other dangerous creatures wherever you encounter them.<br>\
	<br>\
	You have almost-total access to the ship in order to carry out your duties and reach threats quickly. Do not abuse this. It does not mean you can walk into anywhere you like, many areas are full of sensitive machinery and entering unnanounced can be harmful to your health. Do not steal from departments either. If it's not in the Aegis wing, it doesn't belong to you. Stealing from the Union is a good way to get shot in the back"

	duties = "		Patrol the ship, provide a security presence, and look for trouble<br>\
		Subdue and arrest criminals, terrorists, and other threats<br>\
		Exterminate monsters, giant vermin and hostile xenos<br>\
		Follow orders from the chain of command<br>\
		Obey the law. You are not above it"

	loyalties = "		As a soldier, your first loyalty is to the chain of command, which ends with the Aegis Commander. Their orders are supreme over all, even if they're currently leading a mutiny against the captain.<br>\
		<br>\
		Your second loyalty is to your fellow Aegis brothers in arms. As long as the company takes care of you, you should follow orders. But if you start being sent on suicide missions and treated as expendable fodder, that should change.<br>\
		<br>\
		Your third loyalty is to humanity. You are still human under all that armour. If you're being ordered to slaughter civilians en masse, it may be time to start thinking for yourself."

/obj/landmark/join/start/ihoper
	name = "Aegis Operative"
	icon_state = "player-blue"
	join_tag = /datum/job/ihoper

