--
-- Shield
--


armor:register_armor("aftools:shield_muskegirl", {
	description = "Muskegirl Schild",
	inventory_image = "coralie_schild.png",
	groups = {armor_shield=1, armor_heal=12, armor_use=100},
	armor_groups = {fleshy=15},
	damage_groups = {cracky=2, snappy=1, level=3},
	reciprocate_damage = true,
	on_damage = function(player, index, stack)
		play_sound_effect(player, "default_glass_footstep")
	end,
	on_destroy = function(player, index, stack)
		play_sound_effect(player, "default_break_glass")
	end,
})
