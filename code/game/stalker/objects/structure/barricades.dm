/obj/structure/barricade/stalker
	icon = 'icons/stalker/decor.dmi'
	var/debriss_type
	var/loot
	var/lootenable = 0
	var/doubleloot = 0

/obj/structure/barricade/stalker/take_damage(damage, leave_debris=1, message)
	health -= damage
	if(health <= 0)
		if(message)
			visible_message(message)
		else
			visible_message("<span class='warning'>\The [src] is smashed apart!</span>")
		if(leave_debris && debriss_type)
			new debriss_type(get_turf(src))
			if(lootenable)
				if(loot)
					var/lootspawn = pickweight(loot)
					if(doubleloot)
						new lootspawn(get_turf(src))
						lootspawn = pickweight(loot)
						new lootspawn(get_turf(src))
						qdel(src)
					else
						new lootspawn(get_turf(src))
						qdel(src)
		qdel(src)

/obj/structure/barricade/stalker/wood
	name = "wooden barricade"
	desc = "������������������ ������� ������."
	eng_desc = "Planks."
	icon_state = "zabitiy_proxod"
	debriss_type = /obj/structure/stalker/doski

/obj/structure/barricade/stalker/box
	name = "wooden box"
	desc = "������������ �����&#255;���� &#255;���. ��� �����, ��� ����� ���� ������."
	icon = 'icons/stalker/decor.dmi'
	icon_state = "yashik"
	debriss_type = /obj/structure/stalker/doski/doski2
	anchored = 1
	proj_pass_rate = 0
	health = 30
	maxhealth = 30
	lootenable = 1
	doubleloot = 1
	loot = list(/obj/item/weapon/reagent_containers/pill/stalker/aptechka/civilian = 30,
					/obj/item/weapon/artifact/meduza = 1,
					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva = 55,
					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/shproti = 40,
					/obj/item/weapon/reagent_containers/food/snacks/stalker/konserva/soup = 50,
					/obj/item/weapon/reagent_containers/food/snacks/stalker/kolbasa = 60,
					/obj/item/weapon/reagent_containers/food/snacks/stalker/baton = 75,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka/kazaki = 35,
					/obj/item/stack/medical/gauze/bint = 80,
					/obj/item/weapon/reagent_containers/hypospray/medipen/stalker/antirad = 10,
					/obj/item/clothing/suit/hooded/kozhanka/banditka = 1,
					/obj/item/ammo_box/stalker/b9x18 = 55,
					/obj/item/ammo_box/stalker/b12x70 = 40,
					/obj/item/weapon/gun/projectile/automatic/pistol/pm = 3)

/obj/structure/stalker/blocks
	name = "blocks"
	icon = 'icons/stalker/decor2.dmi'
	desc = "������� �������� ����."
	eng_desc = "Blocks."
	density = 1
	opacity = 1

/obj/structure/stalker/blocks/block1
	icon_state = "block1"

/obj/structure/stalker/blocks/block1/r
	icon_state = "block1r"

/obj/structure/stalker/blocks/block1/m
	icon_state = "block1m"

/obj/structure/stalker/blocks/block1/l
	icon_state = "block1l"

/obj/structure/stalker/blocks/block2
	icon_state = "block4"

/obj/structure/stalker/blocks/block2/r
	icon_state = "block4r"

/obj/structure/stalker/blocks/block2/m
	icon_state = "block4m"

/obj/structure/stalker/blocks/block2/l
	icon_state = "block4l"

/obj/structure/stalker/blocks/block3
	icon_state = "block3"

/obj/structure/stalker/blocks/block3/r
	icon_state = "block3r"

/obj/structure/stalker/blocks/block3/m
	icon_state = "block3m"

/obj/structure/stalker/blocks/block3/l
	icon_state = "block3l"

/obj/structure/stalker/blocks/vanish
	opacity = 0
	pass_flags = LETPASSTHROW
	var/proj_pass_rate = 50

/obj/structure/stalker/blocks/vanish/block1
	layer = 4.01
	icon_state = "block2"

/obj/structure/stalker/blocks/vanish/block1/r
	icon_state = "block2r"

/obj/structure/stalker/blocks/vanish/block1/m
	icon_state = "block2m"

/obj/structure/stalker/blocks/vanish/block1/l
	icon_state = "block2l"

/obj/structure/stalker/blocks/vanish/block2
	icon_state = "block5"

/obj/structure/stalker/blocks/vanish/block2/r
	icon_state = "block5r"

/obj/structure/stalker/blocks/vanish/block2/m
	icon_state = "block5m"

/obj/structure/stalker/blocks/vanish/block2/l
	icon_state = "block5l"

/obj/structure/stalker/blocks/vanish/block1/CanPass(atom/movable/mover, turf/target, height=0)
//	if(istype(mover) && mover.checkpass(PASSGLASS))
//		world << "[loc] [dir] [mover] [density]0"
//		return 1
	if(get_dir(loc, target) == dir)
		return !density
	if(istype(mover, /obj/item/projectile) && density)
		return prob(30)
	else
		return 1

/obj/structure/stalker/blocks/vanish/block1/CheckExit(atom/movable/O as mob|obj, target)
//	if(istype(O) && O.checkpass(PASSGLASS))
//		return 1
	if(get_dir(O.loc, target) == dir)
		return 0
	return 1

/obj/structure/stalker/blocks/vanish/pipe
	name = "Pipe"
	desc = "��������&#255; �������������&#255; �����."
	eng_desc = "Big pipe."
	icon = 'icons/stalker/decor2.dmi'
	icon_state = "truba1"

/obj/structure/stalker/blocks/vanish/pipe/pipe2
	icon_state = "truba2"
	name = "Pipe"

/obj/structure/stalker/blocks/vanish/pipe/pipe3
	icon_state = "truba3"
	name = "Pipe"

/obj/structure/stalker/blocks/vanish/shlagbaum1
	icon = 'icons/stalker/decor.dmi'
	icon_state = "shlagbaum1"

/obj/structure/stalker/blocks/vanish/shlagbaum1/shlagbaum2
	icon_state = "shlagbaum2"

/obj/structure/stalker/blocks/vanish/sandbags
	name = "sandbags"
	desc = "������&#255; ������ �� ������ � ������"
	eng_desc = "Sangbags."
	icon = 'icons/stalker/structure/sandbags.dmi'
	icon_state = "solo"
