/obj/structure/closet/secure_closet/personal/scientist
	name = "scientist's locker"
	req_access = list(access_rd)
	access_occupy = list(access_tox_storage)
	icon_state = "science"

/obj/structure/closet/secure_closet/personal/scientist/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/purple/scientist(src)
	else
		new /obj/item/storage/backpack/satchel/purple/scientist(src)
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/science(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/device/radio/headset/headset_sci(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/regular/goggles/clear(src)

/obj/structure/closet/secure_closet/personal/psychiartist
	name = "psychiartist's locker"
	req_access = list(access_rd)
	access_occupy = list(access_psychiatrist)
	icon_state = "science"

/obj/structure/closet/secure_closet/personal/psychiartist/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/purple/scientist(src)
	else
		new /obj/item/storage/backpack/satchel/purple/scientist(src)
	new /obj/item/clothing/under/rank/psych(src)
	new /obj/item/device/radio/headset/headset_sci(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/clothing/glasses/regular/hipster(src)

/obj/structure/closet/secure_closet/reinforced/RD
	name = "Chief Science Officer's locker"
	req_access = list(access_rd)
	icon_state = "rd"

/obj/structure/closet/secure_closet/reinforced/RD/populate_contents()
	new /obj/item/storage/backpack/satchel/leather/withwallet(src)
	new /obj/item/clothing/suit/bio_suit(src)
	new /obj/item/clothing/head/bio_hood(src)
	new /obj/item/clothing/under/rank/expedition_overseer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/color/white(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/device/radio/headset/heads/rd(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/device/flash(src)
	new /obj/item/paper/monitorkey(src)
	new /obj/item/clothing/glasses/regular/goggles/clear(src)
