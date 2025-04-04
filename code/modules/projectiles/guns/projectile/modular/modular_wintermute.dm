/obj/item/gun/projectile/automatic/modular/wintermute // Frame
	name = "\improper \"Wintermute\"" //Eclipse Edit - added \improper
	desc = "A high end military grade assault rifle, designed as a modern ballistic infantry weapon. Primarily used by and produced for Aegis troops. Uses .20 Rifle magazines. \
			The design was made to be able to fit long magazine alongside the standard ones." //Eclipse Edit - lore compliance
	icon = 'icons/obj/guns/projectile/modular/wintermute.dmi'
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1) // Parts can give better tech
	slot_flags = SLOT_BACK
	load_method = MAGAZINE // So far not modular
	magazine_type = /obj/item/ammo_magazine/srifle // Default magazine, only relevant for spawned AKs, not crafted or printed ones
	matter = list(MATERIAL_PLASTEEL = 5)
	price_tag = 1000 // Same reason as matter, albeit this is where the license points matter
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'

	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = TRUE

	gun_tags = list(GUN_SILENCABLE)
	serial_type = "FS"

	spriteTagBans = PARTMOD_FOLDING_STOCK // Folding stock does not modify handheld sprite

	damage_multiplier = 1.1 // Higher-end and not fully modular, justifies increasing the default multiplier without balance concerns (you can't combo it with a crazy mechanism)
	init_recoil = RIFLE_RECOIL(1) // Mechanism increases by 25%

	required_parts = list(/obj/item/part/gun/modular/mechanism/autorifle/determined = 0, /obj/item/part/gun/modular/barrel = 0, /obj/item/part/gun/modular/grip = 0, /obj/item/part/gun/modular/stock = 0)

/obj/item/gun/projectile/automatic/modular/wintermute/get_initial_name()
	if(grip_type)
		switch(grip_type)
			if("wood") // Begin Eclipse Edit - added \improper to all of these
				return "\improper FS AR [caliber] \"Fall\""
			if("black")
				return "\improper BM AR [caliber] \"Wintersun\""
			if("rubber")
				return "\improper FS AR [caliber] \"Wintermute\""
			if("excelsior")
				return "\improper EX AR [caliber] \"Commute\"" //Eclipse Edit - abbreviated Excelsior
			if("serbian")
				return "\improper SA AR [caliber] \"Mutiny\""
			if("makeshift")
				return "\improper hand-tooled AR [caliber] \"Springloader\""		//Eclipse edit - hand-tooled
	else
		return "\improper AR [caliber] \"Winter\"" //End Eclipse Edit

/obj/item/gun/projectile/automatic/modular/wintermute/finished
	gun_parts = list(/obj/item/part/gun/modular/mechanism/autorifle/determined, /obj/item/part/gun/modular/barrel/srifle, /obj/item/part/gun/modular/grip/rubber, /obj/item/part/gun/modular/stock)
	spawn_blacklisted = TRUE
	spawn_tags = SPAWN_TAG_FS_PROJECTILE
	magazine_type = /obj/item/ammo_magazine/srifle/long // For the rare case the blacklist is ignored
